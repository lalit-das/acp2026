CC      = gcc
CFLAGS  = -std=c99 -Wall -Wextra -Wpedantic -g
BINDIR  = bin

DEMO_SRCS     := $(wildcard src/demo/*.c)
ACTIVITY_SRCS := $(wildcard src/activity/*.c)
ASSIGN_SRCS   := $(wildcard src/assignment/*.c)

DEMO_BINS     := $(patsubst src/demo/%.c,     $(BINDIR)/%, $(DEMO_SRCS))
ACTIVITY_BINS := $(patsubst src/activity/%.c, $(BINDIR)/%, $(ACTIVITY_SRCS))
ASSIGN_BINS   := $(patsubst src/assignment/%.c, $(BINDIR)/%, $(ASSIGN_SRCS))

ALL_BINS := $(DEMO_BINS) $(ACTIVITY_BINS) $(ASSIGN_BINS)

.PHONY: all clean test

all: $(BINDIR) $(ALL_BINS)

$(BINDIR):
	mkdir -p $(BINDIR)

$(BINDIR)/%: src/demo/%.c
	$(CC) $(CFLAGS) $< -o $@

$(BINDIR)/%: src/activity/%.c
	$(CC) $(CFLAGS) $< -o $@

$(BINDIR)/%: src/assignment/%.c
	$(CC) $(CFLAGS) $< -o $@

test: all
	@echo "\nRunning all bats tests...\n"
	./bats-core/bin/bats tests/demo.bats tests/activity.bats tests/assignment.bats

clean:
	rm -rf $(BINDIR) /tmp/*_test.txt /tmp/*_test.bin
