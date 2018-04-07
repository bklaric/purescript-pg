"use strict";

exports.rows = function (result) {
    return result.rows
}

exports.fields = function (result) {
    return result.fields
}

exports.rowCount = function (result) {
    return result.rowCount
}

exports.command = function (result) {
    return result.command
}

exports.name = function (field) {
    return field.name
}

exports.tableID = function (field) {
    return field.tableID
}

exports.columnID = function (field) {
    return field.columnID
}

exports.dataTypeID = function (field) {
    return field.dataTypeID
}

exports.dataTypeSize = function (field) {
    return field.dataTypeSize
}

exports.dataTypeModifier = function (field) {
    return field.dataTypeModifier
}

exports.format = function (field) {
    return field.format
}
