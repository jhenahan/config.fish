set -l non_boxen_includes $fish_location/not_boxen

for i in (ls $non_boxen_includes)
  source $non_boxen_includes/$i
end
