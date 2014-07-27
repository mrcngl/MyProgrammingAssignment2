## The purpose of this R file is to define a pair of functions that cache the inverse of a matrix.

## FIRST FUNCTION - makeCacheMatrix ##
## This function creates a special "matrix" object that can cache its inverse.
## The resulting vector is a list containing a function to:
# a. Set the value of the matrix
# b. Get the value of the matrix
# c. Set the value of the inverse
# d. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(solve) inv <<- solve
    getinv <- function() inv
        list(set = set, get = get,
	setinv = setinv, 
	getinv = getinv)
}



## SECOND FUNCTION - cacheSolve ##
## The following function calculates the inverse of the special "matrix" created with the first function.
## It first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse and sets its value in the cache via the solve function.

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if (!is.null(inv)) {
        message(“Retrieving cached data")
        return(inv)
    }
	data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}
