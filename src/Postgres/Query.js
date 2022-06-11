export const queryImpl = function (queryString) {
    return function (queryParameters) {
        return function (errorCallback) {
            return function (successCallback) {
                return function (querier) {
                    return function () {
                        querier.query(
                            queryString,
                            queryParameters,
                            function (error, result) {
                                if (error) {
                                    errorCallback(error)()
                                }
                                else {
                                    successCallback(result)()
                                }
                            }
                        )
                    }
                }
            }
        }
    }
}

export const queryWithConfigImpl = function (queryConfig) {
    return function (errorCallback) {
        return function (successCallback) {
            return function (querier) {
                return function () {
                    querier.query(
                        queryConfig,
                        function (error, result) {
                            if (error) {
                                errorCallback(error)()
                            }
                            else {
                                successCallback(result)()
                            }
                        }
                    )
                }
            }
        }
    }
}
