const { build } = await import('vite');
try {
  await build();
  console.log('BUILD SUCCESS');
} catch (e) {
  console.error('BUILD ERROR:');
  console.error(e.message);
  console.error(e.stack);
  if (e.errors) {
    e.errors.forEach((err, i) => {
      console.error(`Error ${i}:`, err.message || err);
      if (err.file) console.error('  File:', err.file);
      if (err.loc) console.error('  Loc:', JSON.stringify(err.loc));
    });
  }
  if (e.plugin) console.error('Plugin:', e.plugin);
}
