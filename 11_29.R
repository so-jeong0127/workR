## 2019-11-29
#
# 함수 반환값(return값)이 여러 개일 때의 처리
myfunc <- function(x,y) {
  val.sum <- x+y
  val.mul <- x*y
  
  return(list(sum=val.sum,mul=val.mul))
  # return값은 하나만 가능
  # list를 사용하여 두 개의 값을 구함
}

result <- myfunc(5,8)

s <- result$sum
m <- result$mul
cat('5+8 =',s,'\n')
cat('5*8 =',m,'\n')

# Matrix
z <- matrix(1:20, nrow =4 )
z

z <- matrix(1:20, ncol=4)
z

z <- matrix(1:20,nrow=4, ncol=5)
z

z <- matrix(1:20,nrow=4, ncol=5, byrow=T)
z

x <- 1:4
x
y <- 5:8
y
z <- matrix(1:20,nrow=4,ncol=5)
z

m1 <- cbind(x,y)
m1
m2 <- rbind(x,y)
m2
m3 <- rbind(m2,x)
m3
m4 <- cbind(z,x)
m4

# Matrix에서 cell의 값 추출
z[2,3]
z[1,4]
z[2, ]
z[ ,4]

z[2,1:3]
z[1,c(1,2,4)]
z[1:2, ]
z[ ,c(1,4)]

# Matrix에서 행/열에 이름 지정
score <- matrix( c(90,85,69,78,
                   85,96,49,95,
                   90,80,70,70),
                 nrow=4,ncol=3)
score
rownames(score) <- c("Hong","Kim","Lee","Yoo")
colnames(score) <- c("English","Math","Science")
score

score['Hong','Math']
score['Kim',c('Math','Science')]
score['Lee',]
score[,'English']
rownames(score)
colnames(score)
colnames(score)[2]

# 교재 p.64-67

# Data Frame 생성
city <- c("Seoul","Tokyo","Washington")
rank <- c(1,3,2)
city.info <- data.frame(city,rank)
city.info

name <- c("Hong","Kim","Lee")
age <- c(22,20,25)
gender <- factor(c("M","F","M"))
blood.type <- factor(c("A","O","B"))
person.info <- data.frame(name,age,gender,blood.type)
person.info

person2.info <- data.frame(name=c("Hong","Kim","Lee"),
                           age=c(22,20,25),
                           gender=factor(c("M","F","M")),
                           blood.type=factor(c("A","O","B")))
person2.info

city.info[1,1]
city.info[1, ]
city.info[ ,1]
city.info[ city.info$city, ]
city.info[ ,"rank"]

person.info$name
person.info[person.info$name == "Hong"]
person.info[person.info$name == "Hong",c("name","age")]

data()

iris

iris[ ,c[1:2]]
iris[ ,c(1,3,5)]
iris[ ,c("Sepal.Length","Species")]
iris[1:5,]
iris[1:5,c(1,3)]

# Matrix와 Data Frame에서 사용하는 함수
dim(person.info)           # 몇행 몇열인지 알 수 있다.
dim(iris)
nrow(person.info)
nrow(m3)
ncol(m3)
head(iris)                 #
tail(iris)                 #
str(iris)                  # 'data frame', 행 수, 열 수
str(city.info)
str(person.info)
iris[ ,5]
unique(iris[ ,5])          # 중복된 데이터 생략 
table(iris[ ,"Species"])   # 종류별로 카운터 해주는 함수
table(person.info[ ,"blood.type"])
table(person.info[ ,"gender"])

# 교재 p.77-79

# Matrix/Data Frame 사용 함수
# 행별/ 열별 합계와 평균 계산
colSums(iris[,-5]);                      apply(iris[,1:4],2,sum)            # 변수의 합계 # apply(dataset,방향(행-1,열-2),동작)
colMeans(iris[,-5]);                     apply(iris[,1:4],2,mean)   
rowSums(iris[,-5]);                      apply(iris[,-5],1,sum)
rowMeans(iris[,-5]);                     apply(iris[,-5],1,mean)
apply(iris[,-5],2,median)
# - 5 -> 5번째 변수 제외

#행/열 방향 전환
z <- matrix(1:20,nrow=4,ncol=5)
z
t(z)     # 전치 행렬

# 조건에 맞는 행과 열의 값 추출(Data Frame만 가능)
IR.1 <- subset(iris,Species == "setosa")
IR.1
IR.2 <- subset(iris,Sepal.Length >5.0 & Sepal.Width>4.0)
IR.2
IR.2[,c(2,4)]

# Matrix/Data Frame 산술연산
a <- matrix(1:20,4,5)
a
b <- matrix(21:40,4,5)
b

2*a
b-5
2*a+3*b

a+b
b-a
b/a
a*b

# Matrix/Data Frame 자료구조 확인/변환
class(iris); str(iris)
class(state.x77); str(state.x77)
is.matrix(iris)
is.data.frame(iris)
is.matrix(state.x77)
is.data.frame(state.x77)

st <- data.frame(state.x77)
str(st)
head(st)
class(st)
dim(st)

iris.m <- as.matrix(iris[,1:4])
head(iris.m)
class(iris.m)
str(iris.m)

head(st)
Population
attach(st) # 변수명 자체를 쓸 수 있도록 하는 것
Population
detach(st) # attach를 해제하는 것
Population






