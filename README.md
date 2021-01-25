bagit-build
===========

This is a utility for building BagIt bags for a specific project.

It is not a general-purpose BagIt utility.

Usage
-----

* bagit-all - Run bagit-build on all top-level directories in the current directory.

* bagit-build [directory] - Convert directory into a bag, functionally in place.  Dotfiles are removed.

* fix-baginfo [directory] - Update bag-info.txt, if necessary, to ensure that required fields are present.

License
-------

Copyright 2021 by MLE Slone.

See LICENSE for terms.
