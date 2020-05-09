## I simply set the input x as a matrix and set solved value n as null
## changed every reference to "mean" to "solve"
makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  n <- NULL
  set <- function(y) {
    x <<- y
    n <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) n <<- solve
  getsolve <- function() n
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Again, changed "mean" to "solve" and "m" to "n"

cacheSolve <- function(x, ...) {
  n <- x$getsolve()
  if(!is.null(n)) {
    message("Inversed matrix is")
    return(n)
  }
  data <- x$get()
  n <- solve(data, ...)
  x$setsolve(n)
  n
}
