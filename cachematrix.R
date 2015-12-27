## Below are two functions does mainly three things...
## 1)stores Matrix 2) Computes Matrix Inverse 
## 3) Caches Matrix Inverse (saving computational time)

## This function creates matrix that can cache its inverse.
makeCacheMatrix <- function(x = matrix()){
                   mat_inv <- NULL
                   
            set <- function(y){
                   x <<- y
                   mat_inv <<- NULL
              }
            get <- function() x
         setinv <- function(inv) mat_inv <<- inv
         getinv <- function() mat_inv
                   list(set = set, get = get,
                   setinv = setinv,
                   getinv = getinv)
}

## This function computes the matrix inverse of matrix created
## by above function(makeCacheMatrix).
## If inverse is already calculated it retrieves the inverse 
## from cache.
cacheSolve <- function(x, ...) {
             mat_inv <- x$getinv()
             if(!is.null(mat_inv)) {
             message("getting cached data")
             return(mat_inv)
  }
        mat <- x$get()
           mat_inv <- solve(mat, ...)
                x$setinv(mat_inv)
                mat_inv
}
