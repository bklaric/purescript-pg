export const log = function (a) {
    return function () {
        console.log(a)
    }
}
