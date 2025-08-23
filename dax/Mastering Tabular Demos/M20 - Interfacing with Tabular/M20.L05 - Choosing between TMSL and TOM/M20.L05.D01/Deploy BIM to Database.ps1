# Install the package before running the script:
# Install-Package Microsoft.AnalysisServices.retail.amd64 -Source https://www.nuget.org/api/v2

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.AnalysisServices.Tabular")

$serverName = "localhost\tabular2019"
$dbName = "Contoso from BIM file"
$bimFilename = "c:\demos\model.bim"

$modelBim = [IO.File]::ReadAllText($bimFilename)
$db = [Microsoft.AnalysisServices.Tabular.JsonSerializer]::DeserializeDatabase($modelBim)
$db.ID = $dbName
$db.Name = $dbName

$server = New-Object Microsoft.AnalysisServices.Tabular.Server
$server.Connect($serverName)

$server.Databases.Add( $db )
$db.Update( "ExpandFull" ) 
