# Add Program Name
NAME			=

CXX				=		c++
CXXFLAGS		=		-I./SFML/include -std=c++11
LDFLAGS			=		-L./SFML/lib -lsfml-window -lsfml-graphics -lsfml-system -Wl,-rpath,./SFML/lib

SRCS_DIR		=		./srcs/
# Add srcs file
SRC_FILES		=

OBJ_DIR			=		./.OBJ
OBJ_FILES		=		$(addprefix $(SRCS_DIR), $(SRC_FILES:.cpp=.o))

NONE='\033[0m'
GREEN='\033[32m'
YELLOW='\033[33m'
GRAY='\033[2;37m'
CURSIVE='\033[3m'
PURPLE='\033[35m'
BLUE='\033[34m'
DELETELINE='\033[K;

all : $(NAME)

$(NAME) : $(OBJ_FILES)
	@echo $(CURSIVE)$(YELLOW) "\t- Making $(NAME) Game -" $(NONE)
	@$(CXX) $(LDFLAGS) $^ -o $@
	@echo $(CURSIVE)$(YELLOW) "\t- Compiling $(NAME) -" $(NONE)
	@echo $(GREEN)"\t- Complete -"$(NONE)

%.o : %.cpp
	@echo $(CURSIVE)$(YELLOW) "\t- Making object files -" $(NONE)
	@$(CXX) $(CXXFLAGS) -c $< -o $@

clean :
	@rm -fr $(OBJ_FILES)
	@echo $(CURSIVE)$(BLUE) "\t- clean OBJ files -" $(NONE)

fclean : clean
	@rm -fr $(NAME)
	@echo $(CURSIVE)$(PURPLE)"\t- clean $(NAME) file -"$(NONE)

re	:
	@make fclean
	@make all
