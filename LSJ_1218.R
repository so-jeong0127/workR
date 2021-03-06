#
# 작성자: 이소정
# 작성일: 2019-12-18
# 제출일: 2019-12-18
#

# 문1)
# R에서 제공하는 state.x77 데이터셋에 대해 k-평균 군집화를 실시하고 결과를 그래프로 출력하시오.

# • 군집의 수는 5로 한다.
# • state.x77은 각 변수(열)의 값들의 단위의 차이가 많이 나기 때문에 0~1 표준화를 실시한 후 군집화를 실행한다.

std <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

stdata <- std(state.x77)
fit <- kmeans(x = stdata, centers = 5)
fit

library(cluster)

clusplot(stdata, fit$cluster, color = TRUE,
         shade = TRUE, labels = 2, lines = 1)

# 문2)
# mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-평균 군집화를 실시하고 결과를 그래프로 출력하시오.

# • 군집의 수는 2로 한다.
# • Sonar 데이터셋에서 마지막에 있는 Class 열은 제외하고 군집화를 실행한다.

library( mlbench )
data( "Sonar" ) 			# 데이터셋 불러오기

str(Sonar)
snr <- Sonar[ ,1:60]
str(snr)

fit <- kmeans(x=snr,centers = 2)
fit

clusplot(snr, fit$cluster, color = TRUE, shade = TRUE,
         labels = 2, lines = 1)

# 문3) 
# mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-최근접 이웃 알고리즘을 이용하여 모델을 만들고 예측 정확도를 측정하시오.

# . Sonar 데이터셋에서 마지막에 있는 Class 열이 그룹 정보이다.
# . Sonar 데이터셋에서 홀수 번째 데이터(관측값)를 훈련용 데이터로 하고, 짝수번째 데이터(관측값)를 테스트용 데이터로 한다.
# . k-최근접 이웃에서 k를 3, 5, 7로 다르게 하여 예측 정확도를 비교한다.

Sonar$Class

num <- as.integer(rownames(Sonar))
zak <- subset(num,num %% 2 == 0)
hol <- subset(num,num %% 2 !=0)

ds.tr <- Sonar[hol,1:60] # 훈련용
ds.ts <- Sonar[zak,1:60] # 테스트용
cl.tr <- factor(Sonar[hol,61])  # 훈련용 그룹정보
cl.ts <- factor(Sonar[zak,61]) # 테스트 그룹정보

# k가 3
pred <- knn(ds.tr,ds.ts,cl.tr,k=3,prob=TRUE)
pred
acc <- mean(pred==cl.ts)
acc
table(pred, cl.ts)

# k가 5
pred5 <- knn(ds.tr,ds.ts,cl.tr,k=5,prob=TRUE)
pred5
acc5 <- mean(pred5==cl.ts)
acc5
table(pred5, cl.ts)

# k가 7
pred7 <- knn(ds.tr,ds.ts,cl.tr,k=7,prob=TRUE)
pred7
acc7 <- mean(pred7==cl.ts)
acc7
table(pred7, cl.ts)

# k가 3일때가 가장 정확하다.

# 문4) 
# mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-최근접 이웃 알고리즘을 이용하여 모델을 만들고 예측 정확도를 측정하시오.

# . Sonar 데이터셋에서 마지막에 있는 Class 열이 그룹 정보이다.
# . k-최근접 이웃에서 k는 3으로 한다.
# . 5-fold 교차 검증 방법으로 예측 정확도를 측정한다.

library(cvTools)

k=5
folds <- cvFolds(nrow(Sonar),K=k)

acc <- c()
for(i in 1:k){
  ts.idx <- folds$which == i
  ds.tr <- Sonar[-ts.idx,1:60]
  ds.ts <- Sonar[ts.idx,1:60]
  cl.tr <- factor(Sonar[-ts.idx,61])
  cl.ts <- factor(Sonar[ts.idx,61])
  pred <- knn(ds.tr, ds.ts, cl.tr, k=3)
  acc[i] <- mean(pred == cl.ts)
}
acc
mean(acc)
