const url = require('url');

const sampleUrl = 'https://example.com:8080/path/name?search=query&sort=asc#section1';

const parsedUrl = new url.URL(sampleUrl);

console.log('Host:', parsedUrl.host);

console.log('Pathname:', parsedUrl.pathname);

console.log('Query params:');
parsedUrl.searchParams.forEach((value, key) => {
  console.log(`  ${key}: ${value}`);
});

console.log('Hash:', parsedUrl.hash);