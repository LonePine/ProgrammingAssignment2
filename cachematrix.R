## Since calculating inverse of a matrix is time consuming in a repeated operation the two 
## functions below help with that. makeCacheMatrix creates a special "matrix" that can cache its inverse.
## function cacheSolve computes the inverse of the matrix returned by makeCacheMatrix.


## function makeCacheMatrix caches the inverse of a matrix and returns a list of four functions:
## getmatrix, setmatrix, getinverse, setinverse.

makeCacheMatrix <- function(x = matrix()) {
  IM <- NULL
    setmatrix <- function(y){
      x <<- y
        IM <<- NULL
    }
        getmatrix <- function()x
          setinverse <- function(solve) IM <<- solve
            getinverse <- function()IM
list(setmatrix = setmatrix,getmatrix = getmatrix,setinverse = setinverse,getinverse = getinverse)
}


## function cacheSolve calculates the inverse of a matrix returned by the above function and checks 
## for condition to see if inverse already exists. If not, then it calculates inverse and stores in IM.

cacheSolve <- function(x, ...) {
  
  IM <- x$getinverse()
    
        if(!is.null(IM)){ 
            message(" getting cached matrix")
             return(IM)
    }
    matrix <- x$getmatrix()
      IM <- solve(matrix,...)
        x$setinverse(IM)
          IM
}
## created the matrix below and tested the functons makeCacheMatrix and cacheSolve above with
## print(mat), matrixx <-makeCacheMatrix(mat), matrixx$getmatrix(), matrixx$getinverse(),
## cacheSolve(matrixx), matrixx$getinverse(),class(matrixx$getmatrix()), 
## class(matrixx$getinverse()) and results were found to be correct and valid.
mat <- matrix(c(1,0,5,2,1,6,3,4,0), nrow = 3,ncol = 3)
