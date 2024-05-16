# come chiamare R Markdown Vignette
# Usiamo HTML perchè è meglio


# My first markdown file!
this file contains functions for R scripting in geo-ecological remote sensing

We are going to make use of the following package:
'''{r}
library (imageRy)
'''
# simbolo uncinetto e scegliere dove salvare il file con nome, per creare il primo documento.
In order to viusualize the list of data use:
'''{r, eval=F} # per avere solo il comando scrivo eval=F
im.list()
'''
er to import data we can use the following function:
'''{r, eval=T
in order to look at different band combination altogether we can use:
'''{r, eval=T]
par(mfrow=c(1,3))
    

