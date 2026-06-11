import { build } from 'vite';
import { writeFileSync } from 'fs';

const logFile = '_vite_full_log.txt';
let output = '';

const originalWrite = process.stdout.write.bind(process.stdout);
process.stdout.write = (chunk, encoding, cb) => {
  output += chunk;
  return originalWrite(chunk, encoding, cb);
};

const originalErrWrite = process.stderr.write.bind(process.stderr);
process.stderr.write = (chunk, encoding, cb) => {
  output += '[STDERR] ' + chunk;
  return originalErrWrite(chunk, encoding, cb);
};

try {
  await build();
  output += '\n=== BUILD SUCCESS ===\n';
} catch (e) {
  output += '\n=== BUILD FAILED ===\n';
  output += 'Error type: ' + e.constructor.name + '\n';
  output += 'Error message: ' + e.message + '\n';
  output += 'Error stack: ' + e.stack + '\n';
  if (e.errors) {
    output += 'Errors count: ' + e.errors.length + '\n';
    e.errors.forEach((err, i) => {
      output += '--- Error ' + i + ' ---\n';
      output += JSON.stringify(err, null, 2) + '\n';
    });
  }
  if (e.plugin) output += 'Plugin: ' + e.plugin + '\n';
  if (e.id) output += 'ID: ' + e.id + '\n';
  if (e.loc) output += 'Loc: ' + JSON.stringify(e.loc) + '\n';
  if (e.frame) output += 'Frame:\n' + e.frame + '\n';
} finally {
  writeFileSync(logFile, output);
  console.log('Full log written to', logFile);
}
