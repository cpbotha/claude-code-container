FROM astral/uv:python3.14-trixie

# Accept build arguments for user/group IDs
ARG UID=1000
ARG GID=1000
ARG USERNAME=claude

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    sudo \
    tmux \
    vim \
    locales

# Configure locale for UTF-8 support
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US:en

# Create user with matching UID/GID
RUN groupadd -g ${GID} ${USERNAME} && \
    useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the created user
USER ${USERNAME}
WORKDIR /home/${USERNAME}

# Install Claude Code using official installation method
RUN curl -fsSL https://claude.ai/install.sh | bash

# Update PATH for the user
ENV PATH="/home/${USERNAME}/.local/bin:${PATH}"

# Set the working directory for projects
WORKDIR /workspace

# Default command
#CMD ["claude"]
CMD ["tmux"]
