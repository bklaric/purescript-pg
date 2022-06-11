import * as pg from "pg"

export const createImpl = function (clientConfig) {
    return function () {
        return new pg.Client(clientConfig)
    }
}

export const connectImpl = function (callback) {
    return function (client) {
        return function () {
            client.connect(function (error) {
                callback(error ? error : null)()
            })
        }
    }
}

export const endImpl = function (callback) {
    return function (client) {
        return function () {
            client.end(function (error) {
                callback(error ? error : null)()
            })
        }
    }
}
