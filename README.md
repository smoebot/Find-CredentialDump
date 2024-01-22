# Find-RecordedFutureCredentialDump
Powershell.  Search Recorded Future for credential dumps, by keyword

Returns Name, Brief Description, Type, when the data was downloaded by RF, and any relevant breach data.  The name and breaches fields are searched for keywords

If the limit parameter is not provided, only one discovered result is returned

**Examples**
  `Find-RecordedFutureCredentialDump -String facebook -limit 5`
  `Find-RecordedFutureCredentialDump -String bank`
