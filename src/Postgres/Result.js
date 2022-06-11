export const rows = function (result) {
    return result.rows
}

export const fields = function (result) {
    return result.fields
}

export const rowCount = function (result) {
    return result.rowCount
}

export const command = function (result) {
    return result.command
}

export const name = function (field) {
    return field.name
}

export const tableID = function (field) {
    return field.tableID
}

export const columnID = function (field) {
    return field.columnID
}

export const dataTypeID = function (field) {
    return field.dataTypeID
}

export const dataTypeSize = function (field) {
    return field.dataTypeSize
}

export const dataTypeModifier = function (field) {
    return field.dataTypeModifier
}

export const format = function (field) {
    return field.format
}
