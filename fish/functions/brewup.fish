function brewup
  brew update
  set -lx outdated_brews (brew outdated)
  if count $outdated_brews
    brew update $outdated_brews
  else
    echo "Everything up to date"
  end
end
