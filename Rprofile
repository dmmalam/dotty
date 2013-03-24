# © 2013 D MALAM
# Dotty Rprofile

.Last <- function() {
        if (!any(commandArgs()=='--no-readline') && interactive()){
                require(utils)
                try(savehistory(paste(Sys.getenv("DOTTY_VAR"),"/RHistory", sep="")))
        }
}
