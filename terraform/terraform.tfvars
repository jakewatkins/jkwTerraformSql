
Region = "USW1"
Release = "R1"
Workload = "Config"

resource_location = "WEST US"

resource_group_name = {
  dev = "RGP-%s-%s%s-DEV"
  qa  = "RGP-%s-%s%s-QA"
  stg = "RGP-%s-%s%s-STG"
  prd = "RGP-%s-%s%s-PRD"
} 

resource_group_name_support = "jkw-resources"

key_vault_name = "kvGPSecrets"

sql_server_name = {
  dev = "srv-%s-%s%s-dev"
  qa  = "srv-%s-%s%s-qa"
  stg = "srv-%s-%s%s-stg"
  prd = "srv-%s-%s%s-prd"
}


database_name = {
  dev = "sql-%s-%s%s-dev"
  qa  = "sql-%s-%s%s-qa"
  stg = "sql-%s-%s%s-stg"
  prd = "sql-%s-%s%s-prd"
}

sql_size = {
  dev = "100"
  qa = "100"
  stg = "100"
  prd = "100"
}

sql_sku = {
  dev = "S1"
  qa = "S1"
  stg = "S1"
  prd = "S1"
}
db_ConnectionString_name = "dbConnectionString"

sqlAdmin = "SqlAdmin"

