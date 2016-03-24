#Get-Command -CommandType All | foreach { $_ }
#foreach ($ent in Dir c:\) { $ent.Name }
#Dir c:\ | foreach { $_.Name }
#Dir c:\ | ForEach-Object { $_.Name }

$env:PSModulePath

Import-Module benchmark.psm1

Benchmark-Command { foreach ($ent in Dir c:\) { $ent.Name } } -Samples 1000 -Silent
Benchmark-Command { Dir c:\ | foreach { $_.Name } }           -Samples 1000 -Silent
Benchmark-Command { Dir c:\ | foreach-object { $_.Name } }    -Samples 1000 -Silent
#Benchmark-Command { foreach ($ent in Dir c:\) { $ent.Name } } -Samples 1000 -Silent



# ======== benchmark results ==========
# 
# PS C:\Users\jtrammell> Benchmark-Command { foreach ($ent in Dir c:\) { $ent.Name } } -Samples 1000 -Silent
# Benchmark-Command { Dir c:\ | foreach { $_.Name } }           -Samples 1000 -Silent
# Benchmark-Command { Dir c:\ | foreach-object { $_.Name } }    -Samples 1000 -Silent
#
#.................. ... 
# Avg: 1.1365ms
# Min: 0.8476ms
# Max: 4.7408ms
# ................. ...
# Avg: 1.6169ms
# Min: 1.2008ms
# Max: 4.9783ms
# ................. ...
# Avg: 1.5792ms
# Min: 1.1779ms
# Max: 5.1084ms
#
# To summarize: there are some cacheing effects in the test--the first command benchmarked
# appears to take a hit.  Nonetheless we can probably conclude:
#  - no significant differences in loop times for this operation
#  - no significant difference between Foreach-Object and its alias
#  - arguably the foreach() looping construct is faster than the commandlet, but not much
#  - another hole in powershell is its lack of a proper benchmarking tool


