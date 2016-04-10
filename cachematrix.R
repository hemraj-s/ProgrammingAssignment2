## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	
	mInverse <- NULL ## this will hold the inverse of the matrix
	
	## set function can be called to set the matrix
	set <- function(newMatrix){
		x <<- newMatrix ## assign the new matrix to the private var
		mInverse <<- NULL 		 ## set the inverse to null as the matrix has changed
		
	}
	
	get <- function() x 
	
	setInverse <- function(pInverse) mInverse <<- pInverse
	
	getInverse <- function() mInverse
	
	list(set=set, get=get, setInverse = setInverse, getInverse = getInverse)
	
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		mInverse <- x$getInverse()
		if (!is.null(mInverse)) {
			message('getting cached data')
			return(mInverse)
		}
		data <- x$get()
		mInverse <- solve(data, ...)
		x$setInverse(mInverse)
		mInverse
}
