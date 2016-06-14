
## 2 functions for Asignments Number 2
## R programming course U.J.H.
## DAC 2016-06-14
##

## This function creates a special "matrix" object that can cache its inverse.
##    copy / paste from orig page
makeCacheMatrix <- function( x = matrix() ) 
{
  m <- NULL

  set<-function( y )
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



//
How test it

# Create a sample matrix (easy)
  set.seed(25) # funny number for this sample
  x <- matrix( sample(1:25), 5,5)
  func_process <- makeCacheMatrix(x)
  func_process$get()   # Read cachematrix complete

# Create Another matrix for testing
  set.seed(52)
  x <- matrix( sample(1:25), 5,5)
  func_process <- makeCacheMatrix(x)
  func_process$get()   # Read cachematrix complete


  func_process$
cX$get()
cacheSolve(cX)

//
