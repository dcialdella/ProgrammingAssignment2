
##
## 2 functions for Asignments Number 2
## R programming course U.J.H.
## DAC 2016-06-14    - LAST VERSION
##

## This function creates a special "matrix" object that can cache its inverse.
##    copy / paste from orig page
## x - matrix used in function
## m - inversed matrix.
## 
makeCacheMatrix <- function( x = matrix() ) 
{
  m <- NULL    # matrix INVERTED var to NULL

  set<-function( y ) # set x = matrix passed to func (y)   and  m = NULL (inverted)
  {
    x <- y     
    m <- NULL
  }

  get <- function()   # return matrix passed to (x) - trivial & efective
  {
    x
  }

  setInverse <- function(inverse)   # ontain inverso y return matrix inverted
  {
  	retorno <<- inverse
  	retorno
  }

  getInverse <- function()  # return the inverse matrix (m)
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
  m <- x$getInverse()     # Obtain inverted temporary storage
  if ( is.null( m ) )     # if null then calculate it
  {
    temporal <- x$get()
    m        <- solve(temporal)    # the real vudu magic

    # others use
    # zz <- svd(temporal)
    # m <- zz$v%*%diag(1/zz$d)%*%t(zz$u)

    x$setInverse(m)       # store inverted in var (m)
  }
  m                       # return matrix inverted
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


> set.seed(25) # funny number for this sample
> x <- matrix( sample(3000), 5, 5)
> func_process <- makeCacheMatrix(x)

> func_process$get()   # Read cachematrix complete
     [,1] [,2] [,3] [,4] [,5]
[1,] 1249 2951  981  441  122
[2,] 2084 1875 1087 1611 1344
[3,]  447 1011 2865 2173  276
[4,] 2690  200 1759 1423  460
[5,]  373  844 2077 2175  869


> cacheSolve( func_process )
              [,1]         [,2]          [,3]          [,4]         [,5]
[1,]  1.000000e+00 1.776357e-15 -2.664535e-15  0.000000e+00 4.440892e-16
[2,]  4.440892e-16 1.000000e+00 -1.776357e-15  8.881784e-16 0.000000e+00
[3,]  1.776357e-15 0.000000e+00  1.000000e+00  0.000000e+00 0.000000e+00
[4,] -5.329071e-15 0.000000e+00  0.000000e+00  1.000000e+00 7.105427e-15
[5,]  1.776357e-15 0.000000e+00 -7.105427e-15 -1.421085e-14 1.000000e+00


> inverso <- cacheSolve( func_process )

> inverso %*% x
     [,1] [,2] [,3] [,4] [,5]
[1,] 1249 2951  981  441  122
[2,] 2084 1875 1087 1611 1344
[3,]  447 1011 2865 2173  276
[4,] 2690  200 1759 1423  460
[5,]  373  844 2077 2175  869




> func_process$get()   
     [,1] [,2] [,3] [,4] [,5]
[1,]    5   10   13    6    3
[2,]   24   16   12   15    7
[3,]    8   22    2    4   21
[4,]    1   18   14   20   11
[5,]   19   17   23   25    9

> cacheSolve( func_process )
              [,1]          [,2]          [,3]          [,4]          [,5]
[1,]  1.000000e+00  0.000000e+00  0.000000e+00  1.110223e-16  0.000000e+00
[2,]  0.000000e+00  1.000000e+00  0.000000e+00  0.000000e+00 -4.440892e-16
[3,]  0.000000e+00  2.220446e-16  1.000000e+00  0.000000e+00  1.110223e-16
[4,] -1.804112e-16 -2.775558e-16 -2.498002e-16  1.000000e+00 -1.734723e-16
[5,]  4.440892e-16 -4.440892e-16  0.000000e+00 -4.440892e-16  1.000000e+00

> inverso <- cacheSolve( func_process )

> inverso %*% x
     [,1] [,2] [,3] [,4] [,5]
[1,]    5   10   13    6    3
[2,]   24   16   12   15    7
[3,]    8   22    2    4   21
[4,]    1   18   14   20   11
[5,]   19   17   23   25    9


//



