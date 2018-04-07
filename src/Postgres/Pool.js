"use strict";

var Pool = require('pg').Pool

exports.createImpl = function (poolConfig) {
    return function () {
        return new Pool(poolConfig)
    }
}

exports.totalCount = function (pool) {
    return function () {
        return pool.totalCount
    }
}

exports.idleCount = function (pool) {
    return function () {
        return pool.idleCount
    }
}

exports.waitingCount = function (pool) {
    return function () {
        return pool.waitingCount
    }
}

exports.connectImpl = function (errorCallback) {
    return function (successCallback) {
        return function (pool) {
            return function () {
                pool.connect(function (error, client, releaseClient) {
                    if (error) {
                        errorCallback(error)()
                    }
                    else {
                        successCallback(client)(releaseClient)()
                    }
                })
            }
        }
    }
}

exports.end = function (callback) {
    return function (pool) {
        return function () {
            pool.end(callback)
        }
    }
}
