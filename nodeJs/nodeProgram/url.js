var url = require('url');

var urlStr = 'http://api.flickr.com/services/feeds/photos_public.gne?tags=raccoon&tagmode=any&format=json&jsoncallback=?';
var key = '3a167b364799b7ff01545215585606';
var urlStr2 = 'https://biz.epost.go.kr/KpostPortal/openapi?regkey='+key+'&target=postNew&query=강남';
var parsed = url.parse(urlStr2, true);
console.log(parsed);

console.log('protocol : ', parsed.protocol);
console.log('host : ', parsed.host);
console.log('query : ', parsed.query);