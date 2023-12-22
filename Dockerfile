# Use a Windows Server Core image as the base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Download and install curl
ADD https://curl.se/windows/dl-8.5.0_3/curl-8.5.0_3-win64-mingw.zip C:/temp/curl.zip
RUN powershell -Command \
    Expand-Archive C:\temp\curl.zip -DestinationPath C:\temp ; \
    Move-Item C:\temp\curl-7.79.1-win64-mingw\bin\* C:\Windows\System32\ ; \
    Remove-Item C:\temp\curl.zip ; \
    Remove-Item C:\temp\curl-7.79.1-win64-mingw -Recurse

# Set the default command to run when starting a container
CMD ["cmd.exe"]
