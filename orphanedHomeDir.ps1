$folders = get-childitem -Path \\BCEPEFS01\home$ -Directory | Sort-Object name | Select-Object -expand name
$foldersNotInUse = @()
$foldersOrphaned = @()

foreach ($i in $folders){

    $error.clear()

    try {

          Get-ADUser $i | Select-Object UserPrincipalName

          }

    catch {

             $foldersNotInUse += $i

             }

}
foreach ($i in $foldersNotInUse){

    $error.clear()

    try {

          Get-ADUser SHARED-ARCHIVE-$i | Select-Object UserPrincipalName

          }

    catch {

             $foldersOrphaned += $i

             }

}
