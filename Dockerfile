FROM mcr.microsoft.com/dotnet/sdk:5.0

RUN apt update -y && apt install -y sudo wget curl neofetch

RUN curl -fsSL https://code-server.dev/install.sh | sh
# VSCode extensions
ENV HOME_DIR "/root"

# Setup User Visual Studio Code Extentions
ENV CODE_SERVER_EXTENSIONS "${HOME_DIR}/.local/share/code-server/extensions"

# Setup User Visual Studio Code Workspace Storage
ENV CODE_SERVER_WORKSPACESTORAGE "${HOME_DIR}/.code-server/User/workspaceStorage"

# Mkdir Workspace Storage
RUN mkdir -p ${CODE_SERVER_WORKSPACESTORAGE}

# Setup Python Extension
RUN mkdir -p ${CODE_SERVER_EXTENSIONS}/python \
 && curl -JLs --retry 5 https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-python/vsextensions/python/latest/vspackage | bsdtar --strip-components=1 -xf - -C ${CODE_SERVER_EXTENSIONS}/python extension

EXPOSE 8080
EXPOSE 8085
EXPOSE 8443

ENTRYPOINT [ "code-server", "--auth", "none", "--bind-addr", "0.0.0.0:8443" ]