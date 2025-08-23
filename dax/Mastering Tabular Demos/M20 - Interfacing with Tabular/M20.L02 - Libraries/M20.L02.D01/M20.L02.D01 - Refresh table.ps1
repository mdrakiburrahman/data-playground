# Install the package before running the script:
# Install-Package Microsoft.AnalysisServices.retail.amd64 -Source https://www.nuget.org/api/v2

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.AnalysisServices.Tabular")

$server = New-Object Microsoft.AnalysisServices.Tabular.Server
$server.Connect("localhost\tabular2019")
$db = $server.Databases.FindByName("Contoso")
$model = $db.Model
$tableSales = $model.Tables["Sales"]
$tableSales.RequestRefresh("Full")
$result = $model.SaveChanges()
Write $result.XmlaResults
