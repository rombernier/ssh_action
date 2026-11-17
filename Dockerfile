FROM python:3.11-slim-bookworm

# Install uv from astral/uv image
COPY --from=ghcr.io/astral-sh/uv:0.9.7 /uv /uvx /bin/

# Create the non-root user
RUN useradd -ms /bin/bash sekoiaio-runtime

# Set working directory
WORKDIR /app
ENV PATH="/app/.venv/bin:$PATH" UV_PYTHON_DOWNLOADS=never

# Copy dependency files first
COPY pyproject.toml uv.lock ./

# Install dependencies
RUN uv sync --frozen --no-install-project --no-dev --compile-bytecode

# Copy application source
COPY . .

# Switch to non-root user
USER sekoiaio-runtime

# Set the entrypoint
ENTRYPOINT [ "python", "./main.py" ]
