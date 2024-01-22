# Find-CredentialDump
Powershell.  Search the Recorded Future Identity module API for credential dumps, by keyword

Returns Name, Brief Description, Type, when the data was downloaded by RF, and any relevant breach data.  The name and breaches fields are searched for keywords

---
**Parameters**

_String_

The keyword that you wish to search for

_Limit_

The number of results to return

If the limit parameter is not provided, only one discovered result is returned

---

**Examples**
  ```powershell
Find-RecordedFutureCredentialDump -String facebook -limit 5
```

  ```powershell
Find-RecordedFutureCredentialDump -String bank
```
