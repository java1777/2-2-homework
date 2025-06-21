const os = require('os');

const osName = os.type();
console.log(`Operatsion sistema: ${osName}`);

const userInfo = os.userInfo();
console.log('Foydalanuvchi malumoti:', {
  username: userInfo.username,
  homeDir: userInfo.homedir,
  shell: userInfo.shell
});

const totalMemMB = Math.round(os.totalmem() / (1024 * 1024));
const freeMemMB = Math.round(os.freemem() / (1024 * 1024));
console.log(`RAM hajmi: ${totalMemMB} MB (Bo'sh: ${freeMemMB} MB)`);

const uptime = os.uptime();
console.log(`Ish vaqti: ${uptime} sekund`);
