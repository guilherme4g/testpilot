# TestPilot

TestPilot is a tool for automatically generating unit tests for npm packages
written in JavaScript/TypeScript using a large language model (LLM).

Note that TestPilot represents an early exploration in the use of LLMs for
test generation, and has been made available in open source as a basis for
research and exploration. For day-to-day use the test generation features
in [Copilot Chat](https://docs.github.com/en/copilot/github-copilot-chat/about-github-copilot-chat)
are likely to yield better results.

## Background

TestPilot generates tests for a given function `f` by prompting the LLM with a
skeleton of a test for `f`, including information about `f` embedded in code
comments, such as its signature, the body of `f`, and examples usages of `f`
automatically mined from project documentation. The model's response is then
parsed and translated into a runnable unit test. Optionally, the test is run and
if it fails the model is prompted again with additional information about the
failed test, giving it a chance to refine the test.

Unlike other systems for LLM-based test generation, TestPilot does not require
any additional training or reinforcement learning, and no examples of functions
and their associated tests are needed.

A research paper describing TestPilot in detail is available on
[arXiv](https://arxiv.org/abs/2302.06527) and [IEEExplore](https://ieeexplore.ieee.org/document/10329992).

## Requirements

In general, to be able to run TestPilot you need access to a Codex-style LLM
with completion API. Set the `TESTPILOT_LLM_API_ENDPOINT` environment variable to
the URL of the LLM API endpoint you want to use, and
`TESTPILOT_LLM_AUTH_HEADERS` to a JSON object containing the headers you need to
authenticate with the API.

Typical values for these variables might be:

- `TESTPILOT_LLM_API_ENDPOINT='https://api.openai.com/v1/engines/code-cushman-001/completions'`
- `TESTPILOT_LLM_AUTH_HEADERS='{"Authorization": "Bearer <your API key>", "OpenAI-Organization": "<your organization ID>"}'`

Note, however, that you can run TestPilot in reproduction mode without access to
the LLM API where model responses are taken from the output of a previous run;
see below for details.

## Installation

You can install TestPilot from a pre-built package or from source.

### Installing from a pre-built package

TestPilot is a available as a pre-built npm package, though it is not currently
published to the npm registry. You can download a tarball from the repository
and install it in the usual way. Note that this distribution only contains the
core part of TestPilot, not the benchmarking harness.

### Installing from source

The `src/` directory contains the source code for TestPilot, which is written in
TypeScript and gets compiled into the `dist/` directory. Tests are in `test/`;
the `benchmark/` directory contains a benchmarking harness for running TestPilot
on multiple npm packages; and `ql/` contains the CodeQL queries used to analyze
the results.

In the root directory of a checkout of this repository, run `npm build` to
install dependencies and build the package.

You can also use `npm run build:watch` to automatically build anytime you make
changes to the code. Note, however, that this will not automatically install
dependencies, and also will not build the benchmarking harness.

Use `npm run test` to run the tests. For convenience, this will also install
dependencies and run a build.

## Benchmarking

If you install TestPilot from source, you can use the benchmarking harness to
run TestPilot on multiple packages and analyze the results. This is not
currently available if you install TestPilot from a pre-built package.

### Running locally

Basic usage is as follows:

```sh
node benchmark/run.js --outputDir <report_dir> --package <package_dir>
```

This generates tests for all functions exported by the package in
`<package_dir>`, validates them, and writes the results to `<report_dir>`.

Note that this assumes that package dependencies are installed and any build
steps have been run (e.g., using `npm i` and `npm run build`). TestPilot also
relies on `mocha`, so if the package under test does not already depend on it,
you must install it separately, for example using the command `npm i --no-save
mocha`.

### Running on Actions

The `run-experiment.yml` workflow runs an experiment on GitHub Actions,
producing the final report as an artifact you can download. The `results-all`
artifact contains the results of all packages, while the other artifacts contain
the individual results of each package.

### Reproducing results

The results of TestPilot are non-deterministic, so even if you run it from the
same package on the same machine multiple times, you will get different results.
However, the benchmarking harness records enough data to be able to replay a
benchmark run in many cases.

To do this, use the `--api` and `--responses` options to reuse the API listings
and responses from a previous run:

```sh
node benchmark/run.js --outputDir <report_dir> --package <package_dir> --api <api.json> --responses <prompts.json>
```

Note that by default replay will fail if any of the prompts are not found in the
responses file. This typically happens if TestPilot is refining failing tests,
since in this case the prompt to the model depends on the exact failure message,
which can be system-specific (e.g., containing local file-system paths), or
depend on the Node.js version or other factors.

To work around these limitations, you can pass the `--strictResponses false`
flag handle treat missing prompts by treating them as getting no response from
the model. This will not, in general, produce the same results as the initial
run, but suffices in many cases.

### Analyzing results

The CodeQL queries in `ql/queries` can be used to analyze the results of running
an experiment. See `ql/CodeQL.md` for instructions on how to setup CodeQL and
run the queries.

## License

This project is licensed under the terms of the MIT open source license. Please refer to [MIT](./LICENSE.txt) for the full terms.

## Maintainers

- Max Schaefer (@max-schaefer)
- Frank Tip (@franktip)
- Sarah Nadi (@snadi)

## Support

TestPilot is a research prototype and is not officially supported. However, if
you have questions or feedback, please file an issue and we will do our best to
respond.

## Acknowledgement

We thank Aryaz Eghbali (@aryaze) for his work on the initial version of
TestPilot.

___

___

# TestPilot - Update 10/09/2024

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

### 2. Instalar as LIB's

Execute o npm install ou npm i para instalar os pacotes do Test Pilot.

### 3. Baixar o Projeto Alvo de Teste

Via NPM, https://www.npmjs.com/, busque a lib que você deseja testar. Siga para o repositório do pacote, no github ou gitlab, e baixe o pacote na mesma pasta que o Test Pilot. Ou seja, caso o Test Pilot estela na pasta *documents*, a lib precisa ser baixada também na classe *documents*.

### 4. Executar o Test Pilot

Execute o comando:

>*npm run build && node benchmark/run.js --outputDir \<dir\>  --package \<package\>*

O dir é nome diretorio que você deseja que o resultado seja armazenado e o package é o diretorio da lib baixada.

