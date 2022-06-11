var Pool = require('pg').Pool

export const createImpl = function (poolConfig) {
    return function () {
        return new Pool(poolConfig)
    }
}

export const totalCount = function (pool) {
    return function () {
        return pool.totalCount
    }
}

export const idleCount = function (pool) {
    return function () {
        return pool.idleCount
    }
}

export const waitingCount = function (pool) {
    return function () {
        return pool.waitingCount
    }
}

export const connectImpl = function (errorCallback) {
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

export const end = function (callback) {
    return function (pool) {
        return function () {
            pool.end(callback)
        }
    }
}
