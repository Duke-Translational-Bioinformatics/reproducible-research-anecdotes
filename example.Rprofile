## .Rprofile
setHook(
  packageEvent("synapseClient", "attach"),
  function(...){
    synapseLogin("replace.with.your@email.org", "replaceWithYourPassword")
  }
)

.First <- function(){
  cat("\nWelcome to R!\n")
  cat("\nIt is now", format(Sys.time(), "%a %d %b @ %H:%M:%S %Y"), "\n")
}

.Last <- function(){
  cat("\nGoodbye at ", date(), "\n")
}