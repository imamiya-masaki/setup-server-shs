const fs = require('fs');
const readline = require('readline');
const rs = fs.createReadStream('./input/nginx.txt');
//writestreamを作成
const ws = fs.createWriteStream('./output/nginx_output.txt');

const rl = readline.createInterface({
//読み込みたいストリームの設定
    input: rs,
//書き出したいストリームの設定
    output: ws
});

rl.on('line', (lineString) => {
//wsに一行ずつ書き込む
lines = lineString.split('');
for(let i = 0; i<lines.length; i++) {
    switch(lines[i]) {
        case '\"':
            lines[i] = "\\\""
            break
        case "\\":
            lines[i] = "\\\\\\"
            break
        case "\$":
            lines[i] = "\\\$"
            break
    }
}
console.log('check', lines.join(''), lineString);
ws.write(`sudo echo "${lines.join('')}" >> $BAK_FILE_NAME` + '\n');
});
rl.on('close', () => {
console.log("END!");
});

//　これでできたやつをsetup_nginx.shにコピペする