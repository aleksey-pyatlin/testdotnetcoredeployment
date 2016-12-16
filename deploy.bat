pushd "%~dp0\src\DeployAwsWebApplication\"

rem create deploy package

rem call dotnet publish -o .\..\..\deploy\package\awsWebApplication
rem https://github.com/dotnet/cli/issues/3833
rem #Full path works... dotnet publish --configuration Release --output D:\projects\x\published-app

call dotnet publish -o C:\Dev\repos\sapiocare\DeployAwsWebApplication\deploy\package\awsWebApplication

rem create zip package
cd .\..\..\deploy\package\awsWebApplication
del ../awsWebApplication.zip
call zip ../awsWebApplication.zip *

rem create create new zip with package and manifest
cd ../
del aws-full-dotnet-core-bundle.zip
call zip aws-full-dotnet-core-bundle.zip awsWebApplication.zip aws-windows-deployment-manifest.json

popd
