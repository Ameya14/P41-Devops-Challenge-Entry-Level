#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["DevopsChallenge/DevopsChallenge.csproj", "DevopsChallenge/"]
RUN dotnet restore "DevopsChallenge/DevopsChallenge.csproj"
COPY . .
WORKDIR "/src/DevopsChallenge"
RUN dotnet build "DevopsChallenge.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DevopsChallenge.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

EXPOSE 8080
ENV ASPNETCORE_URLS=http://*:8080

RUN addgroup --group nonrootuser --gid 2000 \
&& adduser \    
    --uid 1000 \
    --gid 2000 \
    "nonrootuser" 

RUN chown nonrootuser:nonrootuser  /app
USER nonrootuser:nonrootuser
ENTRYPOINT ["dotnet", "DevopsChallenge.dll"]