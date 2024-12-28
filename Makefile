ifeq (run,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

man: 
  $(info *** Simple manual for compile files in this project ***)
  $(info make run dir-name [file-name])
  $(info If file-name is not specified, 'main' will be passed as file-name)
  $(info It is not required to specify file extension since all files are in .tex)

.PHONY: run
run: 
	./scripts/build.sh $(RUN_ARGS)