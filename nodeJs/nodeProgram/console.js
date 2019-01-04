var initval = 3;
var obj = {name:'node',how:'world'};
//console.log('intval:' + initval); +는 연산자여서 [object Object] 이런식으로 나옴
console.log('obj :'+ obj);
console.log('obj :', obj);

function sayHello(who) {
  console.log('bye',who);
}

setInterval(sayHello,1*1000,'lee');