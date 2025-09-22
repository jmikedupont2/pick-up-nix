docs/NOOB_TUTORIAL.md:This script helps organize your generated content and logs by year. It will check if a directory for the current year exists within our `streamofrandom` data. If not, it will suggest creating a new GitHub repository to store that year's data.
docs/NOOB_TUTORIAL.md:2.  Navigate to the `streamofrandom/scripts/` directory:
docs/NOOB_TUTORIAL.md:    cd /data/data/com.termux.nix/files/home/pick-up-nix/source/github/meta-introspector/streamofrandom/scripts/
docs/NOOB_TUTORIAL.md:2.  Navigate to the `streamofrandom/scripts/` directory:
docs/NOOB_TUTORIAL.md:    cd /data/data/com.termux.nix/files/home/pick-up-nix/source/github/meta-introspector/streamofrandom/scripts/
docs/NOOB_TUTORIAL.md:All your image/video generation requests and tweet confirmations are logged in a central file called `social_media_fiber_log.md`. This file is organized by date within the `streamofrandom` submodule.
docs/NOOB_TUTORIAL.md:2.  Navigate to the `streamofrandom` submodule's directory for the current year, month, and day. For example, for September 8, 2025:
docs/NOOB_TUTORIAL.md:    cd /data/data/com.termux.nix/files/home/pick-up-nix/source/github/meta-introspector/streamofrandom/2025/09/08/
docs/SUBMODULE_DOCS_INDEX.md:## source/github/meta-introspector/streamofrandom
docs/SUBMODULE_DOCS_INDEX.md:### /data/data/com.termux.nix/files/home/pick-up-nix/source/github/meta-introspector/streamofrandom/README.md
docs/SUBMODULE_DOCS_INDEX.md:# streamofrandom
docs/crqs/CRQ_030_Repository_Placement_Guidelines.md:        *   `source/github/meta-introspector/streamofrandom/YYYY/MM/DD/[project_name]/`
docs/crqs/CRQ_031_Experimental_Project_Creation_and_Auditing.md:Develop a script (`scripts/create_experiment.sh`) and an accompanying Standard Operating Procedure (`docs/sops/SOP_Experimental_Project_Creation_and_Auditing.md`) to automate the creation of experimental project directories. This process will ensure consistent placement within the `streamofrandom` structure and generate an audit log for each experiment created, enhancing traceability and adherence to the "digital mycology" procedure.
docs/crqs/CRQ_031_Experimental_Project_Creation_and_Auditing.md:    *   Standardized creation of experimental project directories under `source/github/meta-introspector/streamofrandom/YYYY/MM/DD/[project_name]/`.
docs/crqs/CRQ_031_Experimental_Project_Creation_and_Auditing.md:*   Determine the current date (`YYYY/MM/DD`) to construct the path: `source/github/meta-introspector/streamofrandom/YYYY/MM/DD/[project_name]/`.
docs/submodules.md:| `source/github/meta-introspector/streamofrandom` | `https://github.com/meta-introspector/streamofrandom` | Stream of random data. |
fix_submodules.sh:  "source/github/meta-introspector/streamofrandom"
