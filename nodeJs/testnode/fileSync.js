var fs = require('fs');
   var content = fs.readFileSync("read.txt","utf8");
   console.log(content);
   console.log("read file ....")