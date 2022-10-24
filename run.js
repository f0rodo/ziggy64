const fs = require('fs')
const m = new WebAssembly.Module(fs.readFileSync(process.argv[2]))

function consoleLog (instance, location, size) { // Location is BigInt so handle that (cause slice doesn't exist)
  
  let memoryBuf =  new Uint8Array(instance.exports.memory.buffer);
  const message = [];
  for (let idx = 0n; idx <= size; idx++) {
    message.push(memoryBuf[location + idx]);
  }
  const buffer = new Uint8Array(message);
  const decoder = new TextDecoder();
  const string = decoder.decode(buffer);
  console.log(string);
}

let instance;
const env = {
  inc(x) { return x+1 },
  consoleLog: (location, size) => consoleLog(instance, location, size)
}
instance = new WebAssembly.Instance(m, {env})
console.log(instance.exports.add(1,2))
console.log(instance.exports.sub(1,2))

