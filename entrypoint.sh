#!/bin/bash
set -e
source ${PG_APP_HOME}/functions

[[ ${DEBUG} == true ]] && set -x

# allow arguments to be passed to postgres
if [[ ${1:0:1} = '-' ]]; then
  EXTRA_ARGS="$@"
  set --
elif [[ ${1} == postgres || ${1} == $(which postgres) ]]; then
  EXTRA_ARGS="${@:2}"
  set --
fi

# default behaviour is to launch postgres
if [[ -z ${1} ]]; then
  map_uidgid

  create_datadir
  create_certdir
  create_logdir
  create_rundir

  set_resolvconf_perms

  configure_postgresql

CURRENT_MASTER=`cluster_master || echo ''`
echo ">>> Auto-detected master name: '$CURRENT_MASTER'"

if [ -f "$MASTER_ROLE_LOCK_FILE_NAME" ]; then
    echo ">>> The node was acting as a master before restart!"

    if [[ "$CURRENT_MASTER" == "" ]]; then
        echo ">>> Can not find new master. Will keep starting postgres normally..."
        export CURRENT_REPLICATION_PRIMARY_HOST=""
    else
        echo ">>> Current master is $CURRENT_MASTER. Will clone/rewind it and act as a standby node..."
        rm -f "$MASTER_ROLE_LOCK_FILE_NAME"
        export MASTER_SLAVE_SWITCH="1"
        export CURRENT_REPLICATION_PRIMARY_HOST="$CURRENT_MASTER"
    fi
else
    if [[ "$CURRENT_MASTER" == "" ]]; then
        export CURRENT_REPLICATION_PRIMARY_HOST="$REPLICATION_PRIMARY_HOST"
    else
        export CURRENT_REPLICATION_PRIMARY_HOST="$CURRENT_MASTER"
    fi
fi

/usr/local/bin/cluster/repmgr/configure.sh


  echo "Starting PostgreSQL ${PG_VERSION}..."
  exec start-stop-daemon --start --chuid ${PG_USER}:${PG_USER} \
    --exec ${PG_BINDIR}/postgres -- -D ${PG_DATADIR} ${EXTRA_ARGS}
else
  exec "$@"
fi

