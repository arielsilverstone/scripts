Get-ChildItem d:\vm -Recurse -Filter "Virtual Machines" | %{Get-ChildItem lab\ -Recurse -Filter "Virtual Machines" | %{Get-ChildItem $_.FullName -Filter *.vmcx} | %{import-vm $_.FullName -Register}} | %{import-vm $_.FullName -Register}

