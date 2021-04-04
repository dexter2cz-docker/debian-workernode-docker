#Managed by Puppet

# Inicializace modulu ...
if [ "$LOGNAME" != root ]; then
  if [ -f /software/modules/init ]; then
		source /software/modules/init
  fi
else  #root
    alias mod='source /software/modules/init'
fi
