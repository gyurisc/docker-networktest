# Use a Windows Server Core image as the base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Download the MSI installer for PowerShell
ADD https://github.com/PowerShell/PowerShell/releases/download/v7.4.0/PowerShell-7.4.0-win-x64.msi /powershell.msi

# Install PowerShell
RUN msiexec.exe /q /i powershell.msi

# Remove the installer
RUN del /f /q powershell.msi

# Set the default shell to PowerShell
SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Set the default command to run when starting a container
CMD ["pwsh"]
