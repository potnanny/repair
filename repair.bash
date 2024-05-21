# #############################################################################
#
# Repair potnanny sqlite db file if it becomes locked/corrupted
# Usage:
#   bash repair.bash
#
# #############################################################################

# use the local venv
source $HOME/venv/bin/activate

echo "copying data to new file..."
echo ".dump" | sqlite3 $HOME/potnanny/potnanny.db | sqlite3 $HOME/potnanny/new.db

potnanny stop

echo "replacing db file"
mv $HOME/potnanny/potnanny.db $HOME/potnanny/potnanny.db.old
mv $HOME/potnanny/new.db $HOME/potnanny/potnanny.db
mv $HOME/potnanny/errors.log $HOME/potnanny/errors.repair

potnanny start
