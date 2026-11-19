<#docker run `
-d `
--name postgres-campuscloud `
-p 54320:5432 `
-e POSTGRES_PASSWORD=CampusCloudPostgres? `
-v campuscloud-postgres-data:/var/lib/postgresql/data `
--restart always `
postgres:16-bookworm#>

docker run `
--env-file "$PSScriptRoot\.env" `
-d `
--network campus-network `
--name postgres-campuscloud `
-p 54320:5432 `
-v campuscloud-postgres-data:/var/lib/postgresql/data `
--restart always `
postgres:16-bookworm

