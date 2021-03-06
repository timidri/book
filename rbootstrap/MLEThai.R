# The present script expects two columns: the first column
# contains the (ordered) observation times and the second column the risk 1,...,K
# for which failure is observed or 0, if there is no failure.


	library(Rcpp)
	A<-read.table("dataThai.txt") 
	sourceCpp("icm.cpp")
  
	output <- ComputeMLE(A)
   
	B <- output$hazard
	C <- output$CI
  
   x2<-B[,1]
   z1<-B[,2]
   z2<-B[,3]
   z3<-B[,4]
   x3<-C[,1]
   t1<-C[,2]
   u1<-C[,3]
   t2<-C[,4]
   u2<-C[,5]
   t3<-C[,6]
   u3<-C[,7]
   
   plot(c(-100,-100),xlim=c(15,35), ylim=c(0,0.12), main= "", ylab="",xlab="",bty="n",las=1)
   lines(x2, z1,lwd=2)
   segments(x3,t1,x3,u1)
   segments(x3-0.05,t1,x3+0.05,t1)
   segments(x3-0.05,u1,x3+0.05,u1)

   plot(c(-100,-100),xlim=c(15,35), ylim=c(0,0.12), main= "", ylab="",xlab="",bty="n",las=1)
   lines(x2, z2,lwd=2)
   segments(x3,t2,x3,u2)
   segments(x3-0.05,t2,x3+0.05,t2)
   segments(x3-0.05,u2,x3+0.05,u2)
   
   plot(c(-100,-100),xlim=c(15,35), ylim=c(0,0.012), main= "", ylab="",xlab="",bty="n",las=1)
   lines(x2, z3,lwd=2)
   segments(x3,t3,x3,u3)
   segments(x3-0.05,t3,x3+0.05,t3)
   segments(x3-0.05,u3,x3+0.05,u3)
		
   save.image("dataThai.RData")
