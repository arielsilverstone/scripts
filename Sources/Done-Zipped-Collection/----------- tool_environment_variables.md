
## Bun                   ##################################
BUN_INSTALL Installation directory
BUN_CONFIG Config file location
BUN_PLUGIN_DIR Plugin directory
BUN_INSTALL_DIR Directory to store Bun installations.
BUN_CONFIG_FILE Path to the Bun configuration file.


## Claude-Desktop        ##################################
CLAUDE_API_KEY API key for accessing Claude services.-
CLAUDE_CONFIG_FILE Path to the Claude configuration file, typically `claude.config.json` or `claude.json`.


## Deno                  ##################################
DENO_DIR Cache directory <-- huh? not its install dir? something like d:\temp?>
DENO_INSTALL_ROOT Installation directory


## Jupyter               ##################################
JUPYTER_CONFIG_DIR Directory for Jupyter configuration files.
JUPYTER_DATA_DIR Directory for Jupyter data files.        <-- where to tell it to put ipynb files
JUPYTER_RUNTIME_DIR Directory for Jupyter runtime files.
JUPYTER_PATH Paths to search for Jupyter components.


## LM Studio             ##################################
LMSTUDIO_PATH Installation directory
LMSTUDIO_MODELS_PATH Path to model files
LMSTUDIO_PORT Server port
LMSTUDIO_HOST Server host
LMSTUDIO_API_KEY API key for authentication


##.Net Tools             ##################################
DOTNET_ROOT Path to the .NET installation directory.
-
NUGET_PACKAGES Path to the directory where NuGet packages are stored.  <- this is where NuGet installs downloaded packages globally.
-
MSBuildSDKsPath Path to MSBuild SDKs.


## Node.js               ##################################
NODE_PATH List of directories where Node.js looks for modules.
-
NPM_* npm configuration<-- what is the *?>
  Any npm config variable, e.g. `NPM_CONFIG_PREFIX`, `NPM_TOKEN`.


## Ollama                ##################################
OLLAMA_HOST Server host
OLLAMA_PORT Server port
-
OLLAMA_ORIGINS Comma-separated list of allowed request origins (CORS).
OLLAMA_MODELS Model storage directory  <-- Ollama uses its own format; directory can be shared if compatible.
OLLAMA_CONFIG_FILE Path to the Ollama configuration file.


## pip                   ##################################
PIP_DISABLE_PIP_VERSION_CHECK Disable version check
-
PIP_NO_CACHE_DIR disables pip's cache to save disk space.
-
PIP_REQUIRE_VIRTUALENV Force virtualenv usage - Can be set globally or per project; enforces isolation.


## Poetry                ##################################
POETRY_HOME Poetry installation directory
POETRY_VIRTUALENVS_PATH Virtualenvs directory  - Can be global or per project; distinct from pip/venv if set.

POETRY_CACHE_DIR Cache directory
-
POETRY_VIRTUALENVS_IN_PROJECT If set to true, creates virtualenvs inside the project directory

POETRY_NO_INTERACTION If set to 1, disables interactive prompts.


## Python                ##################################
PYTHONPATH List of directories Python searches for modules.
PYTHONHOME Python installation directory
-
PYTHONSTARTUP Path to a Python script; runs at interactive shell start (activate.. )
PYTHONIOENCODING I/O encoding (e.g., 'utf-8')
-
PYTHONNOUSERSITE Disable user site-packages
  Yes, by default user site-packages are enabled. .pth files add paths; PYTHONNOUSERSITE disables loading user site-packages entirely.

VIRTUAL_ENV Path to current virtual environment - Refers to the active venv; usually per project.
-
PYTHONDONTWRITEBYTECODE If set, Python will not write .pyc files on import.
  Prevents creation of .pyc files; useful for clean source code directory, without extra build artifacts.


## SQLiteStudio          ##################################
SQLITESTUDIO_CONFIG Path to the SQLiteStudio configuration file.
SQLITESTUDIO_PLUGINS Directory where SQLiteStudio plugins are stored.


## vLLM                  ##################################
VLLM_CONFIG Path to the vLLM configuration file.
VLLM_DATA_DIR Directory for vLLM data files.


## Windsurf              ##################################
WINDSURF_HOME Installation directory
WINDSURF_CONFIG Config file location - settings.json (default/user) is typically stored here.
-
WINDSURF_PLUGIN_PATH Plugin search path
WINDSURF_THEME UI theme selection
-
WINDSURF_ENV Environment setting for WindSurf, such as 'development' or 'production'.
-changes config, logging, and plugin behavior.  determines the runtime environment for Windsurf. 
-In 'development', logging is verbose, hot-reload and debugging are enabled, and plugins may run in non-strict mode. 
-In 'production', logging is minimal, performance optimizations are applied, and only stable plugins/configs are loaded.

This variable can also affect which config files are loaded (e.g., config.development.json vs config.production.json), feature toggles, and error reporting. Setting this variable ensures the correct operational mode for deployment, testing, or local development.
