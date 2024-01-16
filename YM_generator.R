library(spsUtil)
quiet(library(googlesheets4))
quiet(library(fastverse) )
# gsURL: google sheet url, op: vector of option
generateYM <- function(gsURL,op){

  quiet(totalYM <- read_sheet(gsURL, ))
  quiet(setDT(totalYM))
  selYM <- totalYM[과목명 == sel[1] & `시험 유형` == sel[2] & `차수` == sel[3] & !is.na(suppressWarnings(as.numeric(`문제 번호`))),]
  selYM$`문제 번호` <- as.numeric(selYM$`문제 번호`)
  setorder(selYM, `문제 번호`)
  cat(paste0("# ",paste(op, collapse = " "), "\n"))
  
  for(i in 1:nrow(selYM)){
    cat(paste0("## ",selYM[i,`문제 번호`], "\n"))
    cat(paste0(selYM[i,`문제 내용`], "\n"))
    cat(paste0("답: ",selYM[i,`문제 정답`], "\n"))
    cat("\n\n")
    
  }
  
  
}

#URL <- "https://docs.google.com/spreadsheets/d/1dWtltgoBX1x4aF06_CRKqBwAukjw0zSY49-dkAobVdo/edit#gid=2057754976"
#totalYM <- read_sheet(URL)
#setDT(totalYM)
#sel <- c("머리목해부학", "주간평가", "1회차" )
#selYM <- totalYM[과목명 == sel[1] & `시험 유형` == sel[2] & `차수` == sel[3],]
#cat(paste0("# ",paste(sel, collapse = " "), "\n"))

#for(i in 1:nrow(selYM)){
#  cat(paste0("## ",selYM[i,`문제 번호`], "\n"))
#  cat(paste0(selYM[i,`문제 내용`], "\n"))
#  cat(paste0("답: ",selYM[i,`문제 정답`], "\n"))
  
#}

