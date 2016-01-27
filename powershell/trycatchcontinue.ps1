
$y = @( "red", "green", "blue", "yellow", "magenta" )

foreach ($x in $y) {
   try {
       Write-Host $x
       if ($x -eq 'blue') {
           Write-Host 'found a blue'
           throw "throwing a blue error"
       }
   }
   catch {
        Write-Host 'in catch block'
        Write-Host "Exception is '$($_.Exception.Message)'"
        continue
   }

   Write-Host 'at bottom of loop'

}