preexec() {
  COMMANDSTRING=$@
  KEY_SET="COMMANDSTRING" encodeJson | kvdnc http://$KVDN_HOST:$KVDN_PORT/R/$STRADDR
}
