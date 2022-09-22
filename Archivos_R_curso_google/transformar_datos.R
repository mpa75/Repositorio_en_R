#Creamos un marco manualmente
id <- c(1:10)

name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, name, job_title)

#Separo un sting en dos columnas diferentes
separate(employee, name, into=c('first_name', 'last_name '), sep=' ')

#Une  dos string en columnas diferentes en una columna

unite(employee, 'name', first_name, last_name, sep=' ')
