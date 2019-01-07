var ex = require('./ex.js');
ex.hello();

var ge = require('./ge.js');
var geInstance = new ge(); //필요시 new를 통해 사용
geInstance.run();