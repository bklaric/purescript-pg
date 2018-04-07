"use strict";

var pg = require("pg")

exports.createImpl = function (clientConfig) {
    return function () {
        return new pg.Client(clientConfig)
    }
}

exports.connectImpl = function (callback) {
    return function (client) {
        return function () {
            client.connect(function (error) {
                callback(error ? error : null)()
            })
        }
    }
}

exports.endImpl = function (callback) {
    return function (client) {
        return function () {
            client.end(function (error) {
                callback(error ? error : null)()
            })
        }
    }
}
