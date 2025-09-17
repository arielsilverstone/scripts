#
# ════════════════════════════════════════════════════════════════════════════════
# Script: Enforce-EnvVars.ps1
# Ensures TEMP, TMP, HOMEDRIVE, and HOMEPATH are correctly set at boot
# ════════════════════════════════════════════════════════════════════════════════
#

[Environment]::SetEnvironmentVariable("TEMP",     "D:\Temp",         "User")
[Environment]::SetEnvironmentVariable("TMP",      "D:\Temp",         "User")
[Environment]::SetEnvironmentVariable("TEMP",     "D:\Temp",         "Machine")
[Environment]::SetEnvironmentVariable("TMP",      "D:\Temp",         "Machine")

[Environment]::SetEnvironmentVariable("HOMEDRIVE", "D:",             "User")
[Environment]::SetEnvironmentVariable("HOMEPATH",  "\Users\Ariel", "User")
[Environment]::SetEnvironmentVariable("HOMEDRIVE", "D:",             "Machine")
[Environment]::SetEnvironmentVariable("HOMEPATH",  "\Users\Ariel", "Machine")
