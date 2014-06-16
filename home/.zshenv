# because we hombrewed rbenv
export RBENV_ROOT=/usr/local/var/rbenv

# additional rbenv stuff which munges our path
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

