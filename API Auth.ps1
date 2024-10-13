# Your Personal Access Token (PAT)
#Testing authentication to website if we stumble upon an API key laying around...
$pat = "$env:APIKEY"

# Base URL and endpoint for Raygun API
$base = "https://api.raygun.com/v3"
$app = "/applications/api-key"

# Construct the full target URL
$target = "$base$app"

# Function to get data from Raygun API using Bearer Authentication
function Get-RaygunData {
    # Define the headers with Bearer token
    $headers = @{
        "Authorization" = "Bearer $pat"   # Use Bearer authentication with the PAT
        "Content-Type"  = "application/json"  # Raygun API might expect JSON content
    }

    # Send the GET request (you can modify this to POST if required by your API endpoint)
    try {
        $response = Invoke-RestMethod -Uri $target -Method Get -Headers $headers
        return $response
    }
    catch {
        Write-Host "An error occurred: $($_.Exception.Message)"
    }
}

# Call the function and store the result
$response = Get-RaygunData

# Output the response from the API
$response
