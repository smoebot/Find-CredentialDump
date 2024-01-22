function Find-CredentialDump {
<#
    .SYNOPSIS
        Search Recorded Future for credential dumps by keyword
    .DESCRIPTION
        Search Recorded Future for credential dumps by keyword
        Returns Name, Brief Description, Type, when the data was downloaded by RF, and any relevant breach details
    .PARAMETER String
        [Mandatory]
        The string to search for
        The name and breaches fields are searched for this string
    .PARAMETER Limit
        The number of results to return
        If the limit parameter is not provided, only one discovered result is returned
    .NOTES
        Author: Joel Ashman
        v0.1 - (2024-01-02) Initial version
        v0.2 - (2024-01-22) Renamed function
    .EXAMPLE
        Find-CredentialDump -String kramerica -limit 5
        Find-CredentialDump -String bubbleboy
    #>

    #requires -version 5
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$String,
        [Parameter()]
        $Limit
    )

    $ApiToken = "<API Token goes here>" # Not a secure way to store this - should investigate another option
    $RecordedFutureCredDumpUrl = "https://api.recordedfuture.com/identity/metadata/dump/search"
    $Header = @{"X-RFToken" = $ApiToken} # Authorisation header for RF API
    if (-not $Limit) {$Limit = "1"} # If limit isn't provided, set a default value of 1
    $Params = @{ # Build the table to hold the request body data (case sensitive)
        'names' = @($String)
        'limit' = $Limit
    }
    $Body = $Params | ConvertTo-Json # Convert the table to JSON for the API to accept it
    # POST request to the API
    try{
        (Invoke-restmethod -Method Post -Headers $Header -Uri $RecordedFutureCredDumpUrl -Body $Body -ContentType application/json).dumps
    }
    catch{
        if($Error.Errors -eq $null){Write-Warning "Error: $($Error[0].ErrorDetails.message)"}
        else{Write-Warning "Error: $($Error.Errors.Message)"}
    }
}
