*** Settings ***
Documentation       variables pour le run configuration


*** Variables ***

${BROWSER}              chrome    # chrome | chromemobileemulation | edge | firefox
${BROWSER_HEADLESS}     no    # no | yes
${BASE_URL}             https://opensource-demo.orangehrmlive.com/
${IMPLICIT_WAIT}        5s
# Chargé dans le suite setup
${COMPTE}         ${EMPTY}

