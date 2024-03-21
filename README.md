# terraform-google-compute
Provisions Compute Engine Resources in Google Cloud Platform


## pre-commit

`pre-commit` is a tool that allows us to run git hook scripts that identify simple issues before code is commited and submitted for review. To install pre-commit, follow the instructions [here](https://pre-commit.com/#install). Run `pre-commit install` in the directory where you want to set up the git hook scripts (root of this repository in this case). Now pre-commit will check your files whenever you `git commit`

Note: The git hooks may lint and fix the syntax of your files. You can always look at the `git diff` of those files. If the changes are good, `git add` the file and try committing again.
