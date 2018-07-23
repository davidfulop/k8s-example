
FROM microsoft/dotnet:2.1-sdk AS builder
ARG configuration=Release
ARG version
WORKDIR /src

COPY src/K8sExample/K8sExample.csproj .
RUN dotnet restore

COPY src/K8sExample appsettings* ./
RUN dotnet publish /p:Version=$version --output /src/ --configuration $configuration

FROM microsoft/dotnet:2.1-aspnetcore-runtime
ARG aspnetcore_environment=local
WORKDIR /app

ENV ASPNETCORE_ENVIRONMENT=$aspnetcore_environment

COPY --from=builder /src .
ENTRYPOINT ["dotnet", "K8sExample.dll"]
