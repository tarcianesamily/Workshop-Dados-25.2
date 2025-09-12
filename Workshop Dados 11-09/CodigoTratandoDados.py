# código inteiro para melhor visualização e entendimento

import pandas as pd

df = pd.read_csv("/content/dados_nao_tratados.csv")
display(df.head())

display(df)

#passando a coluna idade pra valores numéricos

df["idade"] = pd.to_numeric(df["idade"], errors='coerce')
df["idade"] = df["idade"].astype('Int64')
df["idade"] = df["idade"].fillna(0)

display(df)

# passando a coluna notas pra valores numéricos

df["nota"] = pd.to_numeric(df["nota"], errors='coerce')
df["nota"] = df["nota"].astype('Float64')
df["nota"] = df["nota"].fillna(0)

display(df)

df["ativo"] = df["ativo"].astype(str).str.strip().str.lower().map({
    "sim":True,
    "não":False,
    "true":True,
    "false":False,
    "yes":True,
    "nao":False,
    "e":False, # assumindo que e é um valor inválido e deve ser tratado como falso
    "nan": False, # atribui nulo = falso
    "TRUE":True,
    "FALSE":False
})
display(df)

# tratando as datas
df["data_inscricao"] = pd.to_datetime(df["data_inscricao"], errors='coerce')
df["data_inscricao"] = df["data_inscricao"].dt.strftime("%d/%m/%Y") # deixando a coluna data no formato dd/m/aaaa

display(df)

df['ativo']=df['ativo'].fillna("sem cadastro")
display(df)

df=df.fillna(0)
display(df)

