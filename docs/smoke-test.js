const BASE='./vendor/ffmpeg';
const statusEl=document.getElementById('status');
const blobURLs=[];

function report(message){
  statusEl.textContent+=`\n${message}`;
  console.log(message);
}

async function textBlob(url,transform){
  const response=await fetch(url,{cache:'no-store'});
  if(!response.ok)throw new Error(`Runtime file missing (${response.status}): ${url}`);
  let source=await response.text();
  if(transform)source=transform(source);
  const blobURL=URL.createObjectURL(new Blob([source],{type:'text/javascript'}));
  blobURLs.push(blobURL);
  return blobURL;
}

async function wasmBlob(url){
  const response=await fetch(url,{cache:'no-store'});
  if(!response.ok)throw new Error(`Runtime file missing (${response.status}): ${url}`);
  const blobURL=URL.createObjectURL(new Blob([await response.arrayBuffer()],{type:'application/wasm'}));
  blobURLs.push(blobURL);
  return blobURL;
}

function patchMainWorker(source){
  const forms=['new URL(e.p+e.u(814),e.b)','new URL(e.p + e.u(814), e.b)'];
  for(const form of forms){
    if(source.includes(form))return source.replace(form,'r.workerLoadURL');
  }
  throw new Error('FFmpeg loader layout changed; runtime versions need updating.');
}

async function run(){
  let ffmpeg;
  try{
    statusEl.textContent='Loading bundled FFmpeg runtime…';
    const mainURL=await textBlob(`${BASE}/ffmpeg.js`,patchMainWorker);
    await import(mainURL);
    if(!globalThis.FFmpegWASM?.FFmpeg)throw new Error('FFmpegWASM did not initialize');

    const workerLoadURL=await textBlob(`${BASE}/814.ffmpeg.js`);
    const coreURL=await textBlob(`${BASE}/ffmpeg-core.js`);
    const wasmURL=await wasmBlob(`${BASE}/ffmpeg-core.wasm`);

    ffmpeg=new globalThis.FFmpegWASM.FFmpeg();
    ffmpeg.on('log',({message})=>{if(message)console.log(`[ffmpeg] ${message}`);});
    await ffmpeg.load({workerLoadURL,coreURL,wasmURL});
    report('Runtime loaded. Encoding 64×64 H.264 MP4…');

    const output='smoke-test.mp4';
    const rc=await ffmpeg.exec([
      '-f','lavfi',
      '-i','color=c=black:s=64x64:r=5:d=0.4',
      '-an',
      '-c:v','libx264',
      '-preset','ultrafast',
      '-pix_fmt','yuv420p',
      '-movflags','+faststart',
      output
    ]);
    if(rc!==0)throw new Error(`FFmpeg exited with code ${rc}`);

    const data=await ffmpeg.readFile(output);
    if(!(data instanceof Uint8Array)||data.byteLength<500){
      throw new Error(`Encoded output is unexpectedly small: ${data?.byteLength||0} bytes`);
    }
    const signature=String.fromCharCode(...data.slice(4,8));
    if(signature!=='ftyp')throw new Error(`Encoded output is not an MP4 (signature: ${signature})`);

    await ffmpeg.deleteFile(output);
    document.body.dataset.result='pass';
    statusEl.textContent=`PASS: FFmpeg loaded and encoded a valid MP4 (${data.byteLength} bytes).`;
    console.log(statusEl.textContent);
  }catch(error){
    document.body.dataset.result='fail';
    statusEl.textContent=`FAIL: ${error?.stack||error}`;
    console.error(error);
  }finally{
    try{ffmpeg?.terminate();}catch(_){ }
    for(const url of blobURLs)URL.revokeObjectURL(url);
  }
}

run();
