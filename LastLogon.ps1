Get-ADUser -filter * -Properties Name,LastLogon |
Select-Object Name,@{n='LastLogon';e={[DateTime]::FromFileTime($_.LastLogon)| get-date -Format "HH:mm dd/MM/yyyy"}}   |
Export-csv -path .\Documents\list.csv
