# Trabalho de Graduação de Curso

Meu nome é José Guilherme e sou estudante da Universidade Federal de Pernambuco (UFPE). 
Este repositório faz parte do meu Trabalho de Conclusão de Curso, no qual utilizo a ferramenta 
**TestPilot** para investigar a evolução dos Grandes Modelos de Linguagem (LLMs) na geração 
automatizada de testes unitários em JavaScript.

O objetivo principal é **comparar os resultados alcançados no estudo original de Schäfer et al. (2024)**, 
que teve como modelo com maior destaque o *gpt-3.5-turbo-0301*, com os resultados obtidos por modelos modernos da 
OpenAI, especificamente **GPT-4.1** e **GPT-5.1**.

---

## 🛠️ Mudanças em relação ao estudo original

O estudo de Schäfer et al. (2024) utilizava uma API e formatos de requisição que não suporta modelos mais novos. 
Assim, foram necessárias adaptações para manter a metodologia equivalente e permitir comparações válidas.

O estudo original usava o endpoint antigo de completions.  
A pesquisa atual utiliza o endpoint moderno:

- **POST /v1/responses**

Com as seguintes particularidades:

- O conteúdo do prompt é passado em **`input`**
- A orientação do modelo (antes representada por “system prompt”) é passada em **`instructions`**
- O parâmetro `n` **não existe mais na API moderna**

De acordo com o meu ponto de vista o impacto não é extremo a ponto de tornar os resultados gerados hoje invalidos para comparação.

---

## ▶️ Como Executar

Vou adicionar mais algumas informações de como executar o projeto por conta de alguns ajustes que fiz para facilitar a execução e monitoria.

### 1. Criar arquivo .env
Depois de baixar o projeto você deve criar o arquivo *.env* e replicar as variáveis contidas no *.env.example*.

A variável *TESTPILOT_LLM_API_ENDPOINT* contém a rota da Open IA que será chamada para criar os testes unitários. 
No exemplo temos a rota que de fato é usada: https://api.openai.com/v1/responses

Ja a variável *TESTPILOT_LLM_AUTH_HEADERS*, dado o exemplo abaixo:

TESTPILOT_LLM_AUTH_HEADERS='{"Authorization": "Bearer \<your API key\>", "OpenAI-Organization": "\<your organization ID\>", "OpenAI-Project": "\<your project ID\>"}'

têm 3 espaços nos quais os valores devem ser preenchidos.

Você deve primeiro criar um projeto. Siga o tutorial:
https://help.openai.com/en/articles/9186755-managing-your-work-in-the-api-platform-with-projects

Organization ID: https://platform.openai.com/settings/organization/general

API Key: https://platform.openai.com/api-keys

Project ID: Na interface da Open IA, siga o caminho no lado esquerdo, siga para Project -> General. Nessa página estará o project ID.

### 2. Clone os repositórios usados para o estudo

A estrutura usada para esse tutorial foi essa, é necessário esclarecer para ficar clara a execução dos comandos.

```
tcc/
├── testpilot/      # repositório que contém o orquestrador
├── repositories/   # contém as bibliotecas usadas no estudo
└── outputs/        # resultados obtidos através do test pilot
```

[dirty](https://github.com/felixge/node-dirty/tree/d7fb4d4ecf0cce144efa21b674965631a7955e61)  
[delta](https://github.com/quilljs/delta/tree/5ffb853d645aa5b4c93e42aa52697e2824afc869)  
[node-geo-point](https://github.com/rainder/node-geo-point/tree/c839d477ff7a48d1fc6574495cbbc6196161f494)  
[countries-and-timezones](https://github.com/manuelmhtr/countries-and-timezones/tree/e34cb4b6832795cbac8d44f6f9c97eb1038b831b)  
[graceful-fs](https://github.com/isaacs/node-graceful-fs/tree/c1b377782112ae0f25b2abe561fbbea6cfb6f876)  
[q](https://github.com/kriskowal/q/tree/6bc7f524eb104aca8bffde95f180b5210eb8dd4b)  
[zip-a-folder](https://github.com/maugenst/zip-a-folder/tree/5089113647753d5086ea20f052f9d29840866ee1)  
[bluebird](https://github.com/petkaantonov/bluebird/tree/6c8c069c34829557abfaca66d7f22383b389a4b5)  
[Complex.js](https://github.com/infusion/Complex.js/tree/d995ca105e8adef4c38d0ace50643daf84e0dd1c)  
[js-sdsl](https://github.com/js-sdsl/js-sdsl/tree/055866ad5515037c724a529fecb2d3c2b35b2075)  
[glob](https://github.com/isaacs/node-glob/tree/8315c2d576f9f3092cdc2f2cc41a398bc656035a)  
[pull-stream](https://github.com/pull-stream/pull-stream/tree/29b4868bb3864c427c3988855c5d65ad5cb2cb1c)  
[simple-statistics](https://github.com/simple-statistics/simple-statistics/tree/31f037dd5550d554c4a96c3ee35b12e10a1c9cb7)  
[plural](https://github.com/swang/plural/tree/f0027d66ecb37ce0108c8bcb4a6a448d1bf64047)  
[node-jsonfile](https://github.com/jprichardson/node-jsonfile/tree/9c6478a85899a9318547a6e9514b0403166d8c5c)  
[fs-extra](https://github.com/jprichardson/node-fs-extra/tree/6bffcd81881ae474d3d1765be7dd389b5edfd0e0)  
[node-uneval](https://github.com/chakrit/node-uneval/tree/7578dc67090f650a171610a08ea529eba9d27438)  
[rsvp.js](https://github.com/tildeio/rsvp.js/tree/21e0c9720e08ffa53d597c54fed17119899a9a83)  
[node-dir](https://github.com/fshost/node-dir/tree/a57c3b1b571dd91f464ae398090ba40f64ba38a2)  
[memfs](https://github.com/streamich/memfs/tree/ec83e6fe1f57432eac2ab61c5367ba9ec3a775a1)  
[omnitool](https://gitlab.com/comfort-stereo/omnitool/tree/0edf7d148337051c7c2307738423f0ff3db494c7)  
[gitlab-js](https://gitlab.com/nerd-vision/opensource/gitlab-js/tree/c2c9ef54b1ea0fc82b284bc72dc2ff0935983f4c)  
[image-downloader](https://gitlab.com/demsking/image-downloader/tree/19a53f652824bd0c612cc5bcd3a2eb173a16f938)  
[crawler-url-parser](https://gitlab.com/autokent/crawler-url-parser/tree/202c5b25ad693d284804261e2b3815fe66e0723e)  
[spacl-core](https://gitlab.com/cptpackrat/spacl-core/tree/fcb8511a0d01bdc206582cfacb3e2b01a0288f6a)

Execute os comandos em cada repositório:

```sh
npm i
npm i -D mocha # or npm i --no-save mocha
```

### 3. Recupere o caminho e teste se é válido

Estando no diretório do testpilot, execute os comandos:

```sh
output_path="$(pwd)/../outputs/<model>/<package_name>"
echo "$output_path"
package_path="$(pwd)/../repositories/<package_name>"
test -f "$package_path/package.json" && echo "OK: package.json encontrado"
```

### 4. Executar o Test Pilot

Volte no diretório do test pilot e execute o comando:

```sh
npm run build && node benchmark/run.js --outputDir "$output_path" --package "$package_path"
```

O outputDir é o caminho que você deseja salvar o resultado e o package é o caminho absoluto do package que salvamos no passo 3. 


<!-- ### 5. Analise dos resultados

-- a fazer -->

<!-- Você deve baixar uma versão do CodeQL via esse link:
https://github.com/github/codeql-cli-binaries/releases

E executar a sequencia de comandos para usar o CodeQL CLI no WSL 2
```sh
mkdir -p ~/codeql
unzip -q ~/downloads/codeql-linux64.zip -d ~/
chmod +x ~/codeql
echo 'export PATH="$HOME/codeql:$PATH"' >> ~/.zshrc
source ~/.zshrc
which codeql
codeql --version # para confirmar a instalacao
```

Vá ao diretório do project-with-libs e execute o comando:
```sh
codeql database create ~/codeql-dbs/tcc-analysis \
  --language=javascript \
  --source-root /home/wsl/documents/tcc/project-with-libs
```

Volte ao diretório do test-pilot e execute o comando:
```sh
codeql database analyze ~/codeql-dbs/tcc-analysis \
  /home/wsl/documents/tcc/testpilot/ql/queries \
  --format=sarifv2 \
  --output ~/codeql-dbs/tcc-analysis.sarif
```
LGTM_INDEX_FILTERS=$'include:**/*.json \
exclude:**/coverageData/**/*.json' \
  codeql database create --overwrite \
  -l javascript \
  --source-root /home/wsl/documents/tcc/project-with-libs/output_glob \
  -- /home/wsl/codeql-dbs/output-glob-db -->