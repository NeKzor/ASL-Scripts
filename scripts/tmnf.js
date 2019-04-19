const fs = require('fs');

const tmnf = {
    path: 'C:\\Program Files (x86)\\TmNationsForever\\GameData\\Tracks\\Campaigns\\Nations',
    uid: {
        offset: 0x77,
        length: 27,
    }
};

for (const series of ['White', 'Green', 'Blue', 'Red', 'Black']) {
    const folder = `${tmnf.path}\\${series}`;
    fs.readdirSync(folder).forEach(file => {
        const idx = file.indexOf('.Challenge.Gbx');
        if (idx != -1) {
            const buffer = fs.readFileSync(`${folder}\\${file}`).toString('ascii');
            const uid = buffer.substr(tmnf.uid.offset, tmnf.uid.length);
            const map = file.substring(0, idx);
            console.log(`{ "${uid}", "${map}" },`);
        }
    });
}
