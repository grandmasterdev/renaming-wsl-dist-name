# Renaming WSL Dist Name

Often the distribution installed for your WSL will use it's default naming convention format like the following...

```markdown
Ubuntu-<version>

# or 

Ubuntu-20.04
```

But if you want to change the name to simplify it like `Ubuntu`, you may do so by taking the following step(s).

## Manual

1. Open up the `powershell` 
2. Run the following script to get the default distribution ID
   ```powershell

    Get-ItemPropertyValue 'HKCU:HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss' -Name DefaultDistribution

   ```
3. Run the following script to set the new value
   ```powershell

   Set-ItemProperty "HKCU:HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss\<Distribution ID>" -Name DistributionName -Value <New value>

   ```

## Automated script

If you don't want to run the above one by one, you can also trigger the following script in the repo.

```powershell

scripts/rename-dist.ps1

```

---
***Note***

After doing the above, you will have to close down everything and restart WSL again by running the following (if it's manual)

```powershell

wsl --shutdown

wsl

```

---