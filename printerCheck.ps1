$printers = @();
$printers += Get-Printer -ComputerName bcepeps01;
$printers += Get-Printer -ComputerName bcepeps02;
$printers += Get-Printer -ComputerName bcepeps03;
$printers += Get-Printer -ComputerName bcepeps04;
$printers += Get-Printer -ComputerName bcepeps05;
$printers = $printers | Select-Object -ExpandProperty Name| Out-String -Stream;

$printerGroupy = @();
$printerGroupy = Get-ADGroup -filter {name -like "PRT_*"}|Select-Object -ExpandProperty Name| Out-String -Stream;
$printersWithGroup =@();
foreach ($group in $printerGroupy){
    $printersWithGroup += $group.Substring(4);

}
Compare-object $printers $printersWithGroup;
