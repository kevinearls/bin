#!/usr/bin/env bash

function update-version {
    echo update-version called with $1 $2 $3
  if [[ ! -z $3 ]] ; then
    sed "s/<\($2\)>.*<\/\1>/<\1>$3<\/\1>/g" "$1" > "$1".new
    rm "$1"
    mv "$1".new "$1"
  fi
}

# $1 should be the project name
# $2 should be git url for this project
function update-project {
    echo ==================================================================
    echo update-project called with $1 $2
    cd ${WORKDIR}
    rm -rf $1
    git clone $2 $1
    cd $1
    git checkout ${TARGET_BRANCH}

    #TODO check all projects to complete this list
    update-version pom.xml "activemq.version" ${ACTIVEMQ_VERSION}
    update-version pom.xml "camel.version" ${CAMEL_VERSION}
    update-version pom.xml "cxf.version" ${CXF_VERSION}
    update-version pom.xml "fabric.version" ${FABRIC_VERSION}
    update-version pom.xml "karaf.version" ${KARAF_VERSION}
    update-version pom.xml "servicemix.version" ${SERVICEMIX_VERSION}

    # TODO update othere versions here -- look at git history

    # TODO remove?
    git status
    # TODO git diff

    if [[ `git status --porcelain` ]]; then
        git commit --all --message "Updated versions to ${SUFFIX}"
        git push
        echo PUSH Here when ready   -- FIXME just push changes in this directory!!!
    else
        echo NO CHANGES for $1
    fi

    # DONE clean up
     cd ${BASEDIR}
     ####  TODO replace this later...rm -rf ${WORKDIR}/$1
}

export PRODUCT_VERSION=621
export BUILD=026
export SUFFIX="redhat-${PRODUCT_VERSION}${BUILD}"

# All FuseByExample projects should be using the same branch names
export TARGET_BRANCH=jboss-fuse-6.2.1

# Versions that need to be updated
export ACTIVEMQ_VERSION="5.11.0.${SUFFIX}"
export CAMEL_VERSION="2.15.1.${SUFFIX}"
export CXF_VERSION="3.0.4.${SUFFIX}"
export FABRIC_VERSION="1.2.0.redhat-621${BUILD}"
export FUSE_EAP_VERSION="6.2.1.redhat-${BUILD}"
export HAWTIO_VERSION="1.4.redhat-621${BUILD}"
export KARAF_VERSION="2.4.0.${SUFFIX}"
export SERVICEMIX_VERSION="servicemix.version"
export SY_PARENT_VERSION="2.0.1.${SUFFIX}"
export WILDFLYCAMEL_VERSION="2.3.0.${SUFFIX}"

# FuseByExample projects that need to be updated
export ACTIVEMQ_AMQP_EXAMPLE_REPO=git@github.com:FuseByExample/activemq-amqp-example.git
export CAMEL_DYNAMIC_ROUTING_REPO=git@github.com:FuseByExample/camel-dynamic-routing.git
export CAMEL_EXAMPLE_TCPIP_PROXY_REPO=git@github.com:FuseByExample/camel-example-tcpip-proxy.git
export CAMEL_PERSISTENCE_PART1_REPO=git@github.com:FuseByExample/camel-persistence-part1.git
export CAMEL_PERSISTENCE_PART2_REPO=git@github.com:FuseByExample/camel-persistence-part2.git
export ESB_TRANSACTIONS_REPO=git@github.com:FuseByExample/esb-transactions.git
export EXTERNAL_MQ_FABRIC_CLIENT_REPO=git@github.com:FuseByExample/external-mq-fabric-client.git
export EXTERNAL_FABRIC_ENDPOINT_EXAMPLE=git@github.com:FuseByExample/fabric-endpoint-example.git
export FILE_BATCH_SPLITTER_REPO=git@github.com:FuseByExample/FileBatchSplitter.git
export GETTING_STARTED_WITH_ACTIVEMQ_REPO=git@github.com:FuseByExample/getting_started_with_activemq.git
export HELLO_CAMEL_REPO=git@github.com:FuseByExample/HelloCamel.git
export HORO_APP_REPO=git@github.com:FuseByExample/horo-app.git
export RIDER_AUTO_OSGI_REPO=git@github.com:FuseByExample/rider-auto-osgi.git
export SERVICEMIX4_EXAMPLE_PAYMENT_SERVICE_REPO=git@github.com:FuseByExample/servicemix4-example-payment-77.git
export SMX_BOOTSTRAPS_REPO=git@github.com:FuseByExample/smx-bootstraps.git
export SMX_WS_EXAMPLES_REPO=git@github.com:FuseByExample/smx-ws-examples.git
export WEBSOCKET_ACTIVEMQ_CAMEL=git@github.com:FuseByExample/websocket-activemq-camel.git

export BASEDIR=`pwd`
export WORKDIR=${BASEDIR}/fbe_work
rm -rf ${WORKDIR}
mkdir ${WORKDIR}

update-project activemq-amqp-example ${ACTIVEMQ_AMQP_EXAMPLE_REPO}
update-project camel-dynamic-routing ${CAMEL_DYNAMIC_ROUTING_REPO}
update-project camel-example-tcpip-proxy ${CAMEL_EXAMPLE_TCPIP_PROXY_REPO}
update-project camel-persistence-part1 ${CAMEL_PERSISTENCE_PART1_REPO}
update-project camel-persistence-part2 ${CAMEL_PERSISTENCE_PART2_REPO}
update-project esb-transactions ${ESB_TRANSACTIONS_REPO}
update-project external-mq-fabric-client ${EXTERNAL_MQ_FABRIC_CLIENT_REPO}
update-project fabric-endpoint-example ${EXTERNAL_FABRIC_ENDPOINT_EXAMPLE}
update-project file-batch-splitter ${FILE_BATCH_SPLITTER_REPO}
update-project getting-started-with-activemq ${GETTING_STARTED_WITH_ACTIVEMQ_REPO}
update-project hello-camel ${HELLO_CAMEL_REPO}
update-project horo-app ${HORO_APP_REPO}
update-project rider-auto-osgi ${RIDER_AUTO_OSGI_REPO}
update-project servicemix4-example-payment ${SERVICEMIX4_EXAMPLE_PAYMENT_SERVICE_REPO}
update-project smx-bootstraps-repo ${SMX_BOOTSTRAPS_REPO}
update-project smx-ws-examples-repo ${SMX_WS_EXAMPLES_REPO}
update-project websocket-activemq-camel ${WEBSOCKET_ACTIVEMQ_CAMEL}





