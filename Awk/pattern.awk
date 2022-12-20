#!/usr/bin/env -S awk -f
/abc/ && ( /rst/ || /xyz/ ) && !/0\.00/
