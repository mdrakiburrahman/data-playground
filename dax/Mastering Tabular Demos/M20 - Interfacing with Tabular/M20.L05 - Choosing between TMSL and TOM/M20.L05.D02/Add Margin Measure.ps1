# Install the package before running the script:
# Install-Package Microsoft.AnalysisServices.retail.amd64 -Source https://www.nuget.org/api/v2

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.AnalysisServices.Tabular")

$server = New-Object Microsoft.AnalysisServices.Tabular.Server
$server.Connect("localhost\tabular2019")
$db = $server.Databases["Contoso from BIM file"]
$model = $db.Model
$tableSales = $model.Tables["Sales"]
$measureMargin = New-Object Microsoft.AnalysisServices.Tabular.Measure
$measureMargin.Name = "Margin"
$measureMargin.Expression = "SUMX( Sales, Sales[Quantity] + (Sales[Net Price] - Sales[Unit Cost]))"
$tableSales.Measures.Add( $measureMargin )
$model.SaveChanges() 
