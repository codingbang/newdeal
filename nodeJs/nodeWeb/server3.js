var http = require('http');
var fs = require('fs');

var server = http.createServer(function(req, res) {
 fs.access('test.png', function(err) { //이름 없는 이름 cat1.jpg 테이스 한후에
 if ( err ) {
   res.statusCode = 404;
   res.end();
   return;
  }
  fs.readFile('test.png', function(err, data) {   
   res.end(data);
  });
  
 });
 
}).listen(3333);
