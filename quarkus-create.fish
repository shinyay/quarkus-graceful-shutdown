#!/usr/bin/env fish

function do_func
  argparse -n do_func 'h/help' 'a/artifact=' -- $argv
  or return 1

  if set -lq _flag_help
    echo "quarkus-create.fish -a/--artifact <ARTIFACT_ID>"
    return
  end

  set -lq _flag_artifact
  or set -l _flag_artifact "getting-started"

  mvn io.quarkus:quarkus-maven-plugin:1.8.3.Final:create \
#  mvn io.quarkus:quarkus-maven-plugin:1.9.0.CR1:create \
    -DprojectGroupId=com.google.shinyay \
    -DprojectArtifactId=$_flag_artifact \
    -DclassName="com.google.shinyay.QuarkusApplication" \
    -Dpath="/" \
#    -DbuildTool=GRADLE_KOTLIN_DSL \
    -DbuildTool=GRADLE \
    -Dextensions="kotlin,resteasy-jsonb"
end

do_func $argv
