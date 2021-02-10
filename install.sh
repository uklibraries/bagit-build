#!/bin/bash

BINDIR="$HOME/bin"

# You should not need to change anything below this line

echo "Checking for CPAN"
which cpan
if [[ "$?" != "0" ]]; then
    echo "not ok, can't find CPAN.  Install failed"
    exit 1
fi
echo "ok CPAN"

echo "Checking which modules need to be installed"
modules="DateTime Digest::MD5 Digest::SHA File::Basename File::Copy File::Find File::Path"
for module in $modules; do
    echo $module | perl -M$module -ne 'chomp; print "ok $_\n"' 2>/dev/null
    module_err=$?
    if [[ "$module_err" != "0" ]]; then
        echo "not ok $module, installing"
        cpan "$module"
    fi
done

if [[ ! -d "$BINDIR" ]]; then
    echo "Creating BINDIR $BINDIR"
    mkdir "$BINDIR"
fi

echo "Installing programs"
programs="bagit-build bagit-all fix-baginfo fix-baginfo-all bagit-validate bagit-validate-all"
for program in $programs; do
    cp "$program" "$BINDIR"
    if [[ -e "$BINDIR/$program" ]]; then
        echo "ok $program"
    fi
done
