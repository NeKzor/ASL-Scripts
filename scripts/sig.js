const sig = process.argv[2].split(' ');
const res = [[], []];

for (const b of sig) {
    if (b === '??') {
        res[0].push('00');
        res[1].push('?');
    } else {
        res[0].push(b.length === 1 ? '0' + b : b);
        res[1].push('x');
    }
}

console.log('\x1b[32m%s %s\x1b[0m', '\\x' + res[0].join('\\x'), res[1].join(''));
