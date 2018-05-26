"use strict";

exports.length = function (error) {
    return error.length
}

exports.severity = function (error) {
    return error.severity
}

exports.detail = function (error) {
    return error.detail
}

exports.schemaImpl = function (error) {
    return error.schema
}

exports.tableImpl = function (error) {
    return error.table
}

exports.constraintImpl = function (error) {
    return error.constraint
}
