
print <<-EOH
  Set-Alias Octo "c:/chef/cookbooks/lonewolf_base/files/octopus/Octo.exe" -scope Script
	$release = (Octo list-latestdeployments --project="aaaa" --server="http://octopus.lwolf.local" --apikey="api" --environment="foo" | ?{$_.contains("  Version:") } | select-object -first 1)

	if (!$release) {
	  echo "Current release for $octopusProject not found" | Out-File c:\chef\error-octopusdeploy.txt -Append
		return
	}

	$release = $release -replace "\\s+Version:\\s+", ""
	Octo deploy-release --project="proj" --server="http://octopus.lwolf.local" --apiKey="api" --releaseNumber="$release" --specificmachines="api" --deployto=$environment --waitfordeployment --deploymenttimeout="01:00:00"
EOH

