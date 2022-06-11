export const length = function (error) {
    return error.length
}

export const severity = function (error) {
    return error.severity
}

export const detail = function (error) {
    return error.detail
}

export const schemaImpl = function (error) {
    return error.schema
}

export const tableImpl = function (error) {
    return error.table
}

export const constraintImpl = function (error) {
    return error.constraint
}
