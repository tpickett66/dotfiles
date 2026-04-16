# because we hombrewed rbenv
export RBENV_ROOT=/usr/local/var/rbenv

# additional rbenv stuff which munges our path
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

alias assume=". assume"

# BEGIN DRATA OTEL MANAGED
export CLAUDE_CODE_ENABLE_TELEMETRY=1

export OTEL_METRICS_EXPORTER=otlp
export OTEL_LOGS_EXPORTER=otlp

export OTEL_EXPORTER_OTLP_PROTOCOL=http/json
export OTEL_EXPORTER_OTLP_ENDPOINT=https://otel.int.infra.drata.net:4318

export OTEL_LOG_TOOL_DETAILS=1
export OTEL_METRICS_INCLUDE_VERSION=true
export OTEL_RESOURCE_ATTRIBUTES=department=engineering
# END DRATA OTEL MANAGED
