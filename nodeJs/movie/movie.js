var http = require('http');
var fs = require('fs');
var querystring = require('querystring');

var data = fs.readFileSync('./movieData.json');
var movieList = JSON.parse(data);
var lastId;

var server = http.createServer(function (req, res) {
    var method = req.method.toLowerCase();
    switch (method) {
        case 'get':
            // 영화 목록 보기 : /movies
            // 영화 상세 정보 보기 : /movies/1, /movies/2
            handleGetRequest(req, res);
            return;
        case 'post':
            // 영화 정보 추가 : /movies
            handlePostRequest(req, res);
            return;
        case 'put':
            // 영화 정보 수정 : /movies/1, /movies/2
            handlePutRequest(req, res);
            return;
        case 'delete':
            // 영화 정보 삭제 : /movies, /moives/1
            handleDeleteRequest(req, res);
            return;
        default:
            res.statusCode = 404;
            res.end('잘못된 요청입니다.');
            return;
    }
});
server.listen(3000);

function handleGetRequest(req, res) {
    var url = req.url;
    if (url == '/movies') {
        // 영화 목록 만들기
        var list = [];
        for (var i = 0; i < movieList.length; i++) {
            var movie = movieList[i];
            list.push({ id: movie.id, title: movie.title });
        }
        
        // 항목 갯수와 영화 목록 정보        
        var result = {
            count: list.length,
            data: list
        }

        res.writeHead(200, { 'Content-Type': 'application/json;charset=utf-8' });
        res.end(JSON.stringify(result));
    }
    else {
        // 영화 상세 정보를 위한 id 추출 /movies/0
        var id = url.split('/')[2];
        var movie = null;
        // 영화 데이터베이스에서 영화 검색
        for (var i = 0; i < movieList.length; i++) {
            var item = movieList[i];
            if (id == item.id) {
                movie = item;
                break;
            }
        }
        // 검색된 영화 정보 제공
        if (movie) {
            res.writeHead(200, { 'Content-Type': 'application/json;charset=utf-8'});
            res.end(JSON.stringify(movie));
        }
        else {
            // 영화 정보가 없는 경우
            res.writeHead(404, { 'Content-Type': 'application/json;charset=utf-8' });
            var message = {
                error : {
                    code : 404,
                    message : '영화 정보가 없습니다.'                    
                }
            }
            res.end(JSON.stringify(message));
        }
    }
}

//실습 과제
//POST요청 (등록)
function handlePostRequest(req, res) {

  //영화목록 가져오기
  var list = [];
  for (var i = 0; i < movieList.length; i++) {
    var movie = movieList[i];
    list.push({ id: movie.id, title: movie.title });
    lastId = movie.id;
  }
  var body = '';
    req.on('data', function(chunk) {
        body += chunk;
    });
    req.on('end', function() {
        var data = querystring.parse(body);
        var title = data.title;
        var director = data.director;
        var year = data.year;
        var synopsis = data.synopsis;

        console.log(lastId);
        movieList.push({id:lastId+1, title:title, director:director, year:year, synopsis:synopsis});
        
        res.end(JSON.stringify(movieList));
    });
}

//PUT 요청(수정)
function handlePutRequest(req, res) {
  var id = url.split('/')[2];
  var movie = null;
  for (var i = 0; i < movieList.length; i++) {
      var item = movieList[i];
      if (id == item.id) {
          movie = item;
          var body = '';
          req.on('data', function(chunk) {
              body += chunk;
          });
          req.on('end', function() {
            var data = querystring.parse(body);
            var title = data.title;
            var director = data.director;
            var year = data.year;
            var synopsis = data.synopsis;
            //SON.stringify(json[0].id);
            console.log(lastId);
            movieList.push({id:lastId+1, title:title, director:director, year:year, synopsis:synopsis});
              
            res.end(JSON.stringify(movieList));
        });

          break;
      }
  }



  var body = '';
  req.on('data', function(chunk) {
      body += chunk;
  });
  req.on('end', function() {


      var data = querystring.parse(body);
      var title = data.title;
      var director = data.director;
      var year = data.year;
      var synopsis = data.synopsis;
      //SON.stringify(json[0].id);
      console.log(lastId);
      movieList.push({id:lastId+1, title:title, director:director, year:year, synopsis:synopsis});
        
      res.end(JSON.stringify(movieList));
  });

}

//DELETE 요청(삭제)
function handleDeleteRequest(req, res) {
  var url = req.url;
   
  // 영화 목록 만들기
  var list = [];
  var id = url.split('/')[2];
  var movie = null;
  for (var i = 0; i < movieList.length; i++) {       
    var item = movieList[i];
    if (id == item.id) {

    }else{
        var movie = movieList[i];
        list.push({ id: movie.id, title: movie.title, director:movie.director, year:movie.year, synopsis:movie.synopsis });
    }           
  }

        // 항목 갯수와 영화 목록 정보        
        var result = {
            count: list.length,
            data: list
        }
        movieList = list;
        res.writeHead(200, { 'Content-Type': 'application/json;charset=utf-8' });
        res.end(JSON.stringify(result));

}