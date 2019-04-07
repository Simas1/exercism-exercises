#!/usr/bin/env bash

date="$*"
giga=$(ruby <<DOC
require 'time'
giga = (Time.parse('$date').utc + (10 ** 9)).strftime('%a %b %d %T %Z %Y')
puts giga
DOC
)
echo $giga

# # RUBY - oneline
# echo $(ruby -e "puts [:Hello, :world].join(' ')")

# # PYTHON
# dt=$(python - <<DOC
# import sys
# from dateutil.parser import parse
# dt = parse('$date')
# print(dt)
# DOC
# )
# echo $dt

# # PYTHON - passing agrument
# dt=$(python - "$date" <<DOC
# import sys
# from dateutil.parser import parse
# dt = parse(sys.argv[1])
# print(dt)
# DOC
# )
# echo $dt
