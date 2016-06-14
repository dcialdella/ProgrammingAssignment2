## This function creates a special "matrix" object that can cache its inverse.
##    copy / paste from orig page
makeCacheMatrix <- function(x = matrix()) 
{
  m <- NULL

  set<-function()
  {
    x <<- y
    m <<- NULL
  }

  get <- function() 
  {
  	x
  }

  setInverse <- function() 
  {
  }

  getInverse <- function()
  {
  }

  list(set = set, get = get,setInverse = setInverse,getInverse = getInverse)

}


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated
## (and the matrix has not changed), then cacheSolve should 
## retrieve the inverse from the cache.
##    copy / paste from orig page

cacheSolve <- function(x, ...) 
{
  ## Return a matrix that is the inverse of 'x'

}
