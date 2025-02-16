
$UserName = $args[0] 

$htmlContent = @"
<html>
<head>
    <title>Welcome Page</title>
</head>
<body>
    <h1>Hello, $UserName!</h1>
    <p>Welcome to the Jenkins-generated HTML page.</p>
</body>
</html>
"@

$outputPath = "output.html"
$htmlContent | Out-File -FilePath $outputPath -Encoding UTF8
Write-Output "HTML file has been generated at $outputPath"
