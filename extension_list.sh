identityre='(.*)-[0-9]'
for dir in $(ls extensions); do
    [[ $dir =~ $identityre ]]
    identity=${BASH_REMATCH[1]}
    if [ $identity = "ultra.cmg" ]; then
        continue
    fi
    echo $identity
done
