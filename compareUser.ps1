Compare-Object -ReferenceObject(Get-ADPrincipalGroupMembership <USERNAME>) -DifferenceObject(Get-ADPrincipalGroupMembership <USERNAME>) -Property name
