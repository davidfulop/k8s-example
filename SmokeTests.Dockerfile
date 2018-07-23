FROM microsoft/dotnet:2.1-sdk
WORKDIR /source

COPY tests/K8sExample.SmokeTests/K8sExample.SmokeTests.csproj ./tests/K8sExample.SmokeTests/
RUN dotnet restore tests/K8sExample.SmokeTests/K8sExample.SmokeTests.csproj

COPY ./tests/K8sExample.SmokeTests ./tests/K8sExample.SmokeTests
RUN dotnet build tests/K8sExample.SmokeTests/K8sExample.SmokeTests.csproj

ENTRYPOINT ["dotnet", "test", "tests/K8sExample.SmokeTests/K8sExample.SmokeTests.csproj", "--no-build", "-v", "n"]
