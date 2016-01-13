#Get-Service ad*
#Get-Module

#Import-Module activedirectory
#Get-help get-adcomputer -full
Get-ADComputer -Filter 'ObjectClass -eq "Computer"' | Select -Expand Name




  
