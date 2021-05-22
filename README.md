# To make changes
- First, make sure you are up to date with the master branch `git checkout master` 
- `git pull`
- Check out a new branch to make your changes `git checkout -b "NAME_OF_BRANCH"` (`git checkout -b fix-broken-unique-index`)
- Make whatever changes you need to make
- Add / stage your changes to your local working directory `git add "PATH"` (where PATH can be a directory `.` or `db` or a specific file `db/something`)
- Commit your changes in logical places `git commit -m "YOUR MESSAGE HERE"` <-- actually type the quotes here. as an example `git commit -m "Fixes the bug that broke our unique index on states table"
- When you are done working on the full change, push your branch up to gitup `git push -u origin "BRANCH_NAME"`
- Create a Pull Request in github. Fill out the description to add as much context as is necessary
- Ask someone (gene) to review and approve the PR
- Make any changes necessary and address the feedback
- Once approved, push the merge button
- Back on your local computer, check out master and pull these new changes `git checkout master` `git pull`
- Optionally delete your old branch now `git branch -D "NAME_OF_BRANCH"` (`git branch -D fix-broken-unique-index`)

# To run vagrant
- `vagrant status` will show you if the vm's are running
- `vagrant up` turns the vm on
- `vagrant halt` turns the vm off
- `vagrant destroy` halts and erases the vm
- `vagrant ssh` ssh into the vm

# To run python using pipenv
NOTE: you need to be in the vagrant for this to work
- `Pipenv shell` will change your shell to the app's virtualenv, which means all the packages will be available
- `Pipenv scripts` will show you what scripts are in the Pipfile
- `Pipenv run SOME_SCRIPT` will run one of them

## To run the etl scratch file
- `Pipenv run scratch`

# Running stuff:
## To run python code directly:
start the shell first with: `pipenv shell`

## Wipe and re-import all data
`./etl/run.sh`

If that fails with a message like `no such file bin/bash^M` run `dos2unix etl/run.sh`

## SQL scripts:
- `psql -f sql/new_tests.sql` calculates new tests per day per state
