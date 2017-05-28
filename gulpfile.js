// Imports
var gulp = require('gulp');
var clean = require('gulp-clean');
var ts = require('gulp-typescript');
var rename = require("gulp-rename");
var GulpSSH = require('gulp-ssh');
var sequence = require('run-sequence');
var argv = require('yargs').argv;
var merge = require('merge-stream');
var node_ssh = require('node-ssh');

gulp.task('publish:source:tables', function () {
    var config = {
        host: argv.host,
        port: 22,
        username: argv.username,
        password: argv.password
    };

    var gulpSSH = new GulpSSH({
        ignoreErrors: false,
        sshConfig: config
    });

    return gulp
        .src(['./tables/**'])
        .pipe(gulpSSH.dest(argv.dest));
});

gulp.task('publish:source:scripts', function () {
    var config = {
        host: argv.host,
        port: 22,
        username: argv.username,
        password: argv.password
    };

    var gulpSSH = new GulpSSH({
        ignoreErrors: false,
        sshConfig: config
    });

    return gulp
        .src(['./scripts/**'])
        .pipe(gulpSSH.dest(argv.dest));
});

gulp.task('publish:dockerfile', function () {
    var config = {
        host: argv.host,
        port: 22,
        username: argv.username,
        password: argv.password
    };

    var gulpSSH = new GulpSSH({
        ignoreErrors: false,
        sshConfig: config
    });

    return gulp
        .src(['./Dockerfile'])
        .pipe(gulpSSH.dest(argv.dest));
});

gulp.task('docker:stop', function (done) {
    var ssh = new node_ssh();

    ssh.connect({
        host: argv.host,
        username: argv.username,
        password: argv.password
    }).then(function () {
        ssh.execCommand(`docker stop ${argv.service}`).then(function (result) {
            return ssh.execCommand(`docker rm ${argv.service}`);
        }).then(function (result) {
            ssh.dispose();
            done();
        }).catch(function (err) {
            done(err);
        });
    }).catch(function (err) {
        done(err);
    });
});

gulp.task('docker:build', function (done) {
    var ssh = new node_ssh();

    ssh.connect({
        host: argv.host,
        username: argv.username,
        password: argv.password
    }).then(function () {
        ssh.execCommand(`docker build -t ${argv.service} /docker-uploads/${argv.service}`).then(function (result) {
            return ssh.execCommand(`docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=worldofrations -e MYSQL_USER=worldofrations_user -e MYSQL_PASSWORD=worldofrations_password -t ${argv.service}`);
        }).then(function (result) {
            ssh.dispose();
            done();
        }).catch(function (err) {
            done(err);
        });
    }).catch(function (err) {
        done(err);
    });
});

gulp.task('docker:start', function (done) {
    var ssh = new node_ssh();

    ssh.connect({
        host: argv.host,
        username: argv.username,
        password: argv.password
    }).then(function () {
        ssh.execCommand(`docker start ${argv.service}`).then(function (result) {
            ssh.dispose();
            done();
        }).catch(function (err) {
            done(err);
        });
    }).catch(function (err) {
        done(err);
    });
});
