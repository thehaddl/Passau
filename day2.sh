#!/usr/bin/env bash

# Token scopes: read_api, read_repository
# Token role: Developer
readonly TOKEN=glpat-igaWzyykMTGZnzAivs9o
readonly TOKEN_NAME=Sommercamp2024

readonly GIT_URL=gitlab.infosun.fim.uni-passau.de/se2/teaching/sommercamp/let-ai-handle-it/pong-assignment.git

readonly BASE_DIR="${HOME}/PycharmProjects"
readonly PROJECT_DIR="${BASE_DIR}/Pong-Game"

function clone_project() {
    mkdir -p "${BASE_DIR}"
    git clone "https://${TOKEN_NAME}:${TOKEN}@${GIT_URL}" "${PROJECT_DIR}"
}

function open_project_in_pycharm() {
    if [ -n "$(command -v pycharm)" ]; then
        (pycharm "${PROJECT_DIR}" &> /dev/null) &
    elif [ -n "$(command -v pycharm-community)" ]; then
        (pycharm-community "${PROJECT_DIR}" &> /dev/null) &
    else
        # PyCharm could not be launched automatically
        echo "Please open the project ${PROJECT_DIR} in PyCharm"
    fi
}

function main() {
    clone_project
    #open_project_in_pycharm
}

main
