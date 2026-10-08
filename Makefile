FONTMAKE ?= fontmake
WOFF2_COMPRESS ?= woff2_compress
TTF := build/league-gothic.ttf
WOFF2 := build/league-gothic.woff2

.DELETE_ON_ERROR:
.PHONY: all
all: $(WOFF2)

# Debian packages: make fontmake woff2
$(TTF): sources/LeagueGothic.glyphs Makefile
	mkdir -p build
	$(FONTMAKE) -g "$<" -o variable --output-path "$@" --master-dir build/sources --verbose WARNING

$(WOFF2): $(TTF)
	$(WOFF2_COMPRESS) "$<"
