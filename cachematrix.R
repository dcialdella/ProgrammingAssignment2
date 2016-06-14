
##
## 2 functions for Asignments Number 2
## R programming course U.J.H.
## DAC 2016-06-14
##

## This function creates a special "matrix" object that can cache its inverse.
##    copy / paste from orig page
## x - matrix used in function
## m - inversed matrix.
## 
makeCacheMatrix <- function( x = matrix() ) 
{
  m <- NULL

  set<-function( y ) # set x with matrix  and  blank to Imatrix (m)
  {
    x <- y     
    m <- NULL
  }

  get <- function()   # return matrix passed to function (x)
  {
    x
  }

  setInverse <- function() 
  {
  }

  getInverse <- function()  # return the inverse 
  {
  	m
  }

  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated
## (and the matrix has not changed), then cacheSolve should 
## retrieve the inverse from the cache.
##    copy / paste from orig page

cacheSolve <- function(x, ...) 
{
  m <- x$getInverse()
  if ( is.null( m ) ) 
  {
    temporal <- x$get()
    m        <- solve(temporal) %*% temporal
    x$setInverse(m)
  }
  m # return matrix inverted
}





//

How test it

# Create a sample matrix (easy)
  set.seed(25) # funny number for this sample
  x <- matrix( sample(3000), 5, 5)
  func_process <- makeCacheMatrix(x)
  func_process$get()   # Read cachematrix complete
  cacheSolve( func_process )
  inverso <- cacheSolve( func_process )
  inverso %*% x


# Create Another matrix for testing 
  set.seed(52)
  x <- matrix( sample(1:25), 5, 5)
  func_process <- makeCacheMatrix(x)
  func_process$get()   # Read cachematrix complete
  cacheSolve( func_process )
  inverso <- cacheSolve( func_process )
  inverso %*% x

# Create Another matrix for testing 
  x <- matrix( 1:25, 5, 5)
  func_process <- makeCacheMatrix(x)
  func_process$get()   # Read cachematrix complete
  cacheSolve( func_process )    ## WARNING SINGULAR 
  inverso <- cacheSolve( func_process )
  inverso %*% x


//

