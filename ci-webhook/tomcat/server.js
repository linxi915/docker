var http = require("http"),
    exec = require('child_process').exec;

const PORT = 7788, projectName = 'gkxt';
const repo = {
    url: 'http://sys:11111111@192.168.3.231:10080/zgbj/gkxt.git', // git repository
    branch: 'master',
    localPath: '/tmp/',
    buildCommand: './gradlew clean dist -x test',
    distPath: '/root/tomcat/webapps/'
};

http.createServer(function (request, response) {
    if (request.url.search(/deploy\/?$/i) > 0) {
        var commands = [
            'rm -rf ' + repo.localPath + projectName,
            'cd ' + repo.localPath,
            'git clone ' + repo.url + ' ' + projectName,
            'cd ' + projectName,
            'git checkout ' + repo.branch,
            repo.buildCommand,
            'rm -rf ' + repo.distPath + "*",
            'unzip ./build/dist/*.zip -d ' + repo.distPath,
            'service tomcat restart'
        ].join(' && ');
        var buildProcess = exec(commands, function (err, out, code) {
            if (err instanceof Error) {
                response.writeHead(500);
                response.end('Server Internal Error.');
                throw err
            }
            response.writeHead(200, {'Content-Type': 'text/plain'});
            response.end('Deploy Done.');
        });
        buildProcess.stdout.on('data', function (data) {
            console.log(data);
        });
    } else {
        response.writeHead(404);
        response.end('Not Found.')
    }

}).listen(PORT);

// Console will print the message
console.log('Server running at http://127.0.0.1:' + PORT + '/');