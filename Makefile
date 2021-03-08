NAME	=	wolfram
package	=	Wolfram

stack_yaml	=	STACK_YAML='stack.yaml'
stack	=	$(stack_yaml) stack
local_path	:=	$(shell stack path --local-install-root)
executable	:=	$(local_path)/bin

all: $(NAME)

$(NAME):
	$(stack) build $(package)
	cp $(executable)/Wolfram-exe ./$(NAME)
