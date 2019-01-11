#FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
#WORKDIR /app
#EXPOSE 80


#FROM microsoft/dotnet:2.2-sdk AS build
FROM microsoft/dotnet:2.2-sdk
#WORKDIR /src
#COPY ["mvcdocker.csproj", "./"]
#RUN dotnet restore "./mvcdocker.csproj"
WORKDIR /app
#COPY . .
#WORKDIR "/src/."
#RUN dotnet build "mvcdocker.csproj" -c Release -o /app

ENV ASPNETCORE_URLS=https://0.0.0.0:5000

#FROM build AS publish
#RUN dotnet publish "mvcdocker.csproj" -c Release -o /app

#FROM base AS final
# WORKDIR /app
#COPY --from=publish /app .
#ENTRYPOINT ["dotnet", "mvcdocker.dll"]
#ENTRYPOINT ["dotnet", "restore"]
ENTRYPOINT [ "dotnet", "watch", "run", "--no-restore", "--urls", "http://+:5000"]
# CMD [ "/bin/sh","-c","dotnet build && dotnet run"]
