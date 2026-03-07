module github.com/gomlx/backend

go 1.26rc2

replace github.com/gomlx/gomlx => ../gomlx

// Use ajroetker/goat fork with SVE/SME streaming mode, FP16 headers, ABI offset fixes, int32_t support, size-appropriate load instructions, stack frame fixes, and Go reserved register fixes
replace github.com/gorse-io/goat => github.com/ajroetker/goat v0.0.0-sve-sme-support-017

tool (
	github.com/ajroetker/go-highway/cmd/hwygen
	github.com/gorse-io/goat
)

require (
	github.com/ajroetker/go-highway v0.0.3
	github.com/charmbracelet/lipgloss v1.1.0
	github.com/dustin/go-humanize v1.0.1
	github.com/gomlx/gomlx v0.0.0-00010101000000-000000000000
	github.com/google/go-cmp v0.7.0
	github.com/janpfeifer/must v0.2.0
	github.com/muesli/termenv v0.16.0
	github.com/pkg/errors v0.9.1
	github.com/stretchr/testify v1.11.1
	github.com/x448/float16 v0.8.4
	k8s.io/klog/v2 v2.130.1
)

require (
	github.com/aymanbagabas/go-osc52/v2 v2.0.1 // indirect
	github.com/charmbracelet/colorprofile v0.3.0 // indirect
	github.com/charmbracelet/x/ansi v0.10.1 // indirect
	github.com/charmbracelet/x/cellbuf v0.0.13 // indirect
	github.com/charmbracelet/x/term v0.2.1 // indirect
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
	github.com/go-logr/logr v1.4.3 // indirect
	github.com/gomlx/go-xla v0.1.5-0.20260107152240-2890a4924d88 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/gorse-io/goat v0.1.3 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/klauspost/asmfmt v1.3.2 // indirect
	github.com/lucasb-eyer/go-colorful v1.2.0 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	github.com/mattn/go-runewidth v0.0.16 // indirect
	github.com/mitchellh/colorstring v0.0.0-20190213212951-d06e56a500db // indirect
	github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 // indirect
	github.com/remyoudompheng/bigfft v0.0.0-20230129092748-24d4a6f8daec // indirect
	github.com/rivo/uniseg v0.4.7 // indirect
	github.com/samber/lo v1.50.0 // indirect
	github.com/schollz/progressbar/v3 v3.18.0 // indirect
	github.com/spf13/cobra v1.10.2 // indirect
	github.com/spf13/pflag v1.0.10 // indirect
	github.com/xo/terminfo v0.0.0-20220910002029-abceb7e1c41e // indirect
	golang.org/x/exp v0.0.0-20260112195511-716be5621a96 // indirect
	golang.org/x/mod v0.32.0 // indirect
	golang.org/x/sync v0.19.0 // indirect
	golang.org/x/sys v0.40.0 // indirect
	golang.org/x/term v0.39.0 // indirect
	golang.org/x/text v0.33.0 // indirect
	golang.org/x/tools v0.41.0 // indirect
	google.golang.org/protobuf v1.36.11 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
	modernc.org/cc/v4 v4.26.3 // indirect
	modernc.org/mathutil v1.7.1 // indirect
	modernc.org/opt v0.1.4 // indirect
	modernc.org/sortutil v1.2.1 // indirect
	modernc.org/strutil v1.2.1 // indirect
	modernc.org/token v1.1.0 // indirect
)
