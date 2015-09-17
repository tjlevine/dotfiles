# dotfile symlinker make script by Tyler Levine

BACKUP_DIR_NAME = backup
LINK = ln -s
MV = mv
MKDIR = mkdir -p
ECHO = echo
RM = rm
FILTER_FILES = Makefile .gitignore

FILTERS = $(FILTER_FILES) $(BACKUP_DIR_NAME)
DOTFILES = $(filter-out $(FILTERS), $(shell ls))
DOTFILE_DIR = $(HOME)
TARGETS = $(realpath $(DOTFILES))
LINK_NAMES = $(addprefix $(DOTFILE_DIR)/., $(DOTFILES))

default: clean link

link:
	@for file in $(DOTFILES);\
	do\
		$(ECHO) "$(LINK) "$(PWD)/$$file" $(DOTFILE_DIR)/.$$file" &&\
		$(LINK) "$(PWD)/$$file" "$(DOTFILE_DIR)/.$$file";\
	done

clean:
	@$(MKDIR) $(BACKUP_DIR_NAME)
	@for file in $(DOTFILES);\
	do\
		[ -e "$(DOTFILE_DIR)/.$$file" -a ! -L "$(DOTFILE_DIR)/.$$file" ] &&\
			$(ECHO) "$(MV) "$(DOTFILE_DIR)/.$$file" "$(BACKUP_DIR_NAME)/$$file"" &&\
			$(MV) "$(DOTFILE_DIR)/.$$file" "$(BACKUP_DIR_NAME)/$$file"; \
		[ -e "$(DOTFILE_DIR)/.$$file" -a -L "$(DOTFILE_DIR)/.$$file" ] &&\
			$(ECHO) "$(RM) "$(DOTFILE_DIR)/.$$file"" &&\
			$(RM) "$(DOTFILE_DIR)/.$$file"; \
	done
