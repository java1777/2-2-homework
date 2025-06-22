const fs = require('fs');
const path = require('path');
const readline = require('readline');

const GAME_FOLDER = 'treasure_hunt';
const FILES = {
  'map.txt': "Xaritani o'rganing va yo'lingizni toping!",
  'clue1.txt': "Siz to'g'ri yo'ldasiz! Lekin quyosh botadigan tomonni unutmang!",
  'clue2.txt': "Jangchi yuragiga ega bo'ling! Xazina yaqin!",
  'treasure.txt': "Tabriklaymiz! Siz xazinani topdingiz!"
};

function startGame() {
  console.log("=== Xazina Ovlash O'yini ===");
  console.log("Sizga berilgan ko'rsatmalarga amal qilib, xazinani toping!");
  console.log('---------------------------');
  
  setupGameEnvironment();
  
  playGame();
}

function setupGameEnvironment() {
  const gameDir = path.join(__dirname, GAME_FOLDER);
  
  if (!fs.existsSync(gameDir)) {
    fs.mkdirSync(gameDir);
    console.log(`"${GAME_FOLDER}" papkasi yaratildi.`);
  }
  
  Object.entries(FILES).forEach(([filename, content]) => {
    const filePath = path.join(gameDir, filename);
    fs.writeFileSync(filePath, content, 'utf8');
  });
}

function playGame() {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });
  
  const gameDir = path.join(__dirname, GAME_FOLDER);
  let currentStep = 0;
  const fileNames = Object.keys(FILES);
  
  console.log("map.txt faylini ochib, birinchi ko'rsatmani o'qing.");
  console.log("Har bir bosqichda keyingi fayl nomini kiriting.");
  
  function askForNextFile() {
    if (currentStep >= fileNames.length) {
      rl.close();
      return;
    }
    
    const currentFile = fileNames[currentStep];
    const filePath = path.join(gameDir, currentFile);
    
    rl.question(`\nKeyingi fayl nomini kiriting (${currentFile}): `, (answer) => {
      if (answer.trim().toLowerCase() === currentFile.toLowerCase()) {
        const content = fs.readFileSync(filePath, 'utf8');
        console.log(`\n${content}`);
        
        if (currentFile === 'treasure.txt') {
          console.log("=== O'YIN TUGADI ===");
          console.log("Tabriklaymiz qutlaymiz siz xazinani muvaffaqiyatli topdingiz!");
          rl.close();
        } else {
          currentStep++;
          askForNextFile();
        }
      } else {
        console.log("Noto'g'ri fayl nomi! Qayta urinib ko'ring.");
        askForNextFile();
      }
    });
  }
  
  askForNextFile();
  
  rl.on('close', () => {
    console.log("O'yin uchun ot dushi rahmat!");
    process.exit(0);
  });
}

startGame();