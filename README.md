# Trabalho de Graduação de Curso

Me chamo José Guilherme, sou estudando da Universidade Federal de Pernambuco (*UFPE*), e estou usando o Test Pilot como base para o meu TCC, a ideia é fazer um comparativo entre os resultados das pequisas atingidos com o gpt-5, mas especificamente o modelo *gpt-3.5-turbo-0301*, e o modelos mais recentes criados pela Open IA, o *gpt-4o*.

A seguir vou evidenciar algumas diferenças alguns updates com relação aos modelos usados na pesquisa anterior e esclarecer mudanças que fiz e como executar o testes.

## Mudanças

O modelo *gpt-3.5-turbo-0301* já foi descontinuado, sendo assim é impossível replicar o testes com o mesmo modelo. O *code-cushman-002* segue o mesmo caminho. E o Star code (vou completar depois) ??

## Como Executar

Vou adicionar mais algumas informações de como executar o projeto por conta de alguns ajustes que fiz para facilitar a execução e monitoria.

### 1. Criar arquivo .env
Depois de baixar o projeto você deve criar o arquivo *.env* e replicar as variáveis contidas no *.env.example*.

A variável *TESTPILOT_LLM_API_ENDPOINT* contém a rota da Open IA que será chamada para criar os testes unitários. No exemplo temos:

https://api.openai.com/v1/engines/\<Open IA Model\>/completions

E onde tem o \<Open IA Model\> deve ser alterado pelo modelo que você deseja usar, por exemplo o *gpt-3.5-turbo-instruct*.

Ja a variável *TESTPILOT_LLM_AUTH_HEADERS*, dado o exemplo abaixo:

TESTPILOT_LLM_AUTH_HEADERS='{"Authorization": "Bearer \<your API key\>", "OpenAI-Organization": "\<your organization ID\>", "OpenAI-Project": "\<your project ID\>"}'

têm 3 espaços nos quais os valores devem ser preenchidos.

Você deve primeiro criar um projeto. Siga o tutorial:
https://help.openai.com/en/articles/9186755-managing-your-work-in-the-api-platform-with-projects

Organization ID: https://platform.openai.com/settings/organization/general

API Key: https://platform.openai.com/api-keys

Project ID: Na interface da Open IA, siga o caminho no lado esquerdo, siga para Project -> General. Nessa página estará o project ID.

### 2. Crie um projeto vazio e instale a lib indicada

Execute os comandos:

```sh
mkdir project-with-libs
cd project-with-libs
npm init -y
npm i <package_name>
npm i --no-save mocha
```

### 3. Recupere o caminho e teste se é válido

Mantendo-se no diretório project-with-libs, execute os comandos:

```sh
project_path="$(pwd)"
echo "$project_path"
package_path="$(pwd)/node_modules/<package_name>"
echo "$package_path"
test -f "$package_path/package.json" && echo "OK: package.json encontrado"
```

### 4. Executar o Test Pilot

Volte no diretório do test pilot e execute o comando:

```sh
npm run build && node benchmark/run.js --outputDir "$(pwd)/<output_package>" --package \<package_path\>
```

O dir é o caminho que você deseja salvar o resultado e o path-package é o caminho absoluto do package que salvamos no passo 3. 


