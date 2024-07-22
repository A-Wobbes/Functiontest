using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata, $Testtrigger)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$name = $Request.Query.Name
if (-not $name) {
    $name = $Request.Body.Name
}

$body = "This HTTP triggered function executed successfully. $Testtrigger"

if ($name) {
    $body = "Hello, $name. This HTTP triggered function executed successfully. Test"
}

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})
