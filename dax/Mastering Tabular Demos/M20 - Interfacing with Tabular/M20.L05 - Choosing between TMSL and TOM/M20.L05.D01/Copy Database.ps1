# Install the package before running the script:
# Install-Package Microsoft.AnalysisServices.retail.amd64 -Source https://www.nuget.org/api/v2

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.AnalysisServices.Tabular")

$sourceServer = New-Object Microsoft.AnalysisServices.Tabular.Server
$destServer = New-Object Microsoft.AnalysisServices.Tabular.Server
$sourceServer.Connect("SERVER1\tabular")
$destServer.Connect("SERVER2\tabular")
$sourceDb = $sourceServer.Databases["Contoso"]
$destDb = $sourceDb.Clone()
$destServer.Databases.Add( $destDb )
$destDb.Update( "ExpandFull" )