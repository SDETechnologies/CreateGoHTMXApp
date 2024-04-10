#!/bin/bash

print_help(){
    echo -e "\nUsage CreateApp.sh [Project Name]"
    echo
    echo "Options:"
    echo -e "\t -d/--database [true/false] Specifies whether a database layer is to be created"
    echo
}

templateDir=~/Projects/CreateGoHTMXApp/BasicApp/
echo "templateDir: $templateDir"

copy_basic_app_template(){
    appName=$1
    echo "appName: $appName"
    copyDir=$2
    echo "copyDir: $copyDir"
    if [ -z "$appName" ]; then
        echo "No app name specified"
        exit 1
    fi
    if [ -z "$copyDir" ]; then
        echo "No copy directory specified"
        exit 1
    fi
    cp -rf --copy-contents "$templateDir."  -t "$copyDir/" && echo "Copied files from template"

    # goFile=$
    mainFilePath="$copyDir/main.go"

    # cat "$copyDir/main.go" | grep -v "func" | tr "main" "$appName"
}

get_go_dependencies(){
    appDir=$1
    if [ -z "$appDir" ]; then
        echo "No directory specified."
        exit 1
    fi
    dependencyDir="$appDir/go_dependencies.txt"
    # echo "dependencyDir: $dependencyDir"
    cat "$dependencyDir"

    while IFS= read -r line
    do
        echo "line: $line"
        go get "$line"
    done < "$dependencyDir"
}

replace_main_package_name(){
    filePath=$1
    mainPackageName=$2

    if [ -z "$filePath" ]; then
        echo "No file path provided"
        exit 1
    fi

    if [ -z "$mainPackageName" ]; then
        echo "No package name provided"
        exit 1
    fi
    sed -i 's^package main/package $mainPackageName/' "$filePath/$mainPackageName" 
}

enableDatabase="true"

while getopts ":hd:-:" opt; do
    case $opt in
        -)
            case "${OPTARG}" in
                help)
                    print_help
                    exit 0
                    ;;
                destination)
                    projectDir=$OPTIND
                    ;;
                enable-database)
                    enableDatabaseOption="$OPTIND"
                    ;;
            esac
            ;;
        h)
            print_help
            exit 0
            ;;
    esac
done

if [ -z "$1" ]; then
    echo "Error: No project name specified"
    exit 1
else
    projectName=$1
fi

if [ -z "$projectDir" ]; then
    echo "No directory specified. Using current: $(pwd)"
    projectDir=$(pwd)
fi

echo "enableDatabaseOption: $enableDatabaseOption"
if [ -z "$enableDatabaseOption" ] || [ "$enableDatabaseOption" == "Y" ] || [ "$enableDatabaseOption" == "y"]; then 
    enableDatabase="true"
elif [ "$enableDatabaseOption" == "N" ] || [ "$enableDatabaseOption" == "n" ]; then
    enableDatabase="false"
else
    echo "Invalid option entered for --enable-database"
    exit 1
fi

echo "CreateApp.sh with project name $projectName in directory $projectDir"
if [ "$enableDatabase" = "true" ]; then
    echo "Database layer enabled"
else
    echo "Database layer disabled"
fi

baseDir="$projectDir/$projectName"
mkdirResult=$(mkdir "$baseDir" -- 2>&1 | grep "File exists")
if [ -z "$mkdirResult" ]; then
    echo "Created base project directory $baseDir" 
else
    read -p "Directory exists. Remove(y/n): " yn
    case $yn in
        [Yy]* )
            exec $(rm -Rf "$baseDir") && echo "Removed existing project"
            mkdir "$baseDir"
            ;;
        [Nn]* )
            echo "Exiting program."
            exit
            ;;
    esac
fi
cd $baseDir &&
go mod init "$projectName"

copy_basic_app_template "$projectName" "$baseDir"
get_go_dependencies "$projectDir"
