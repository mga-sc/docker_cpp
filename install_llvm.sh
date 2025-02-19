#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

LLVM_VERSION=14

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
  ca-certificates \
  gpg-agent \
  lsb-release \
  software-properties-common \
  wget \

DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
  clang-$LLVM_VERSION \
  clang-format-$LLVM_VERSION \
  clang-tidy-$LLVM_VERSION \
  clangd-$LLVM_VERSION \
  libc++-11-dev \
  libc++abi-11-dev \
  lld-$LLVM_VERSION \
  lldb-$LLVM_VERSION \
  llvm-$LLVM_VERSION-dev \

rm -rf /var/lib/apt/lists/*

update-alternatives \
  --install /usr/bin/clang clang /usr/bin/clang-$LLVM_VERSION $LLVM_VERSION"0" \
  --slave /usr/bin/FileCheck FileCheck /usr/bin/FileCheck-$LLVM_VERSION \
  --slave /usr/bin/analyze-build analyze-build /usr/bin/analyze-build-$LLVM_VERSION \
  --slave /usr/bin/asan_symbolize asan_symbolize /usr/bin/asan_symbolize-$LLVM_VERSION \
  --slave /usr/bin/bugpoint bugpoint /usr/bin/bugpoint-$LLVM_VERSION \
  --slave /usr/bin/c-index-test c-index-test /usr/bin/c-index-test-$LLVM_VERSION \
  --slave /usr/bin/clang++ clang++ /usr/bin/clang++-$LLVM_VERSION \
  --slave /usr/bin/clang-apply-replacements clang-apply-replacements /usr/bin/clang-apply-replacements-$LLVM_VERSION \
  --slave /usr/bin/clang-change-namespace clang-change-namespace /usr/bin/clang-change-namespace-$LLVM_VERSION \
  --slave /usr/bin/clang-check clang-check /usr/bin/clang-check-$LLVM_VERSION \
  --slave /usr/bin/clang-cl clang-cl /usr/bin/clang-cl-$LLVM_VERSION \
  --slave /usr/bin/clang-cpp clang-cpp /usr/bin/clang-cpp-$LLVM_VERSION \
  --slave /usr/bin/clang-doc clang-doc /usr/bin/clang-doc-$LLVM_VERSION \
  --slave /usr/bin/clang-extdef-mapping clang-extdef-mapping /usr/bin/clang-extdef-mapping-$LLVM_VERSION \
  --slave /usr/bin/clang-format clang-format /usr/bin/clang-format-$LLVM_VERSION \
  --slave /usr/bin/clang-format-diff clang-format-diff /usr/bin/clang-format-diff-$LLVM_VERSION \
  --slave /usr/bin/clang-include-fixer clang-include-fixer /usr/bin/clang-include-fixer-$LLVM_VERSION \
  --slave /usr/bin/clang-linker-wrapper clang-linker-wrapper /usr/bin/clang-linker-wrapper-$LLVM_VERSION \
  --slave /usr/bin/clang-move clang-move /usr/bin/clang-move-$LLVM_VERSION \
  --slave /usr/bin/clang-nvlink-wrapper clang-nvlink-wrapper /usr/bin/clang-nvlink-wrapper-$LLVM_VERSION \
  --slave /usr/bin/clang-offload-bundler clang-offload-bundler /usr/bin/clang-offload-bundler-$LLVM_VERSION \
  --slave /usr/bin/clang-offload-wrapper clang-offload-wrapper /usr/bin/clang-offload-wrapper-$LLVM_VERSION \
  --slave /usr/bin/clang-query clang-query /usr/bin/clang-query-$LLVM_VERSION \
  --slave /usr/bin/clang-refactor clang-refactor /usr/bin/clang-refactor-$LLVM_VERSION \
  --slave /usr/bin/clang-rename clang-rename /usr/bin/clang-rename-$LLVM_VERSION \
  --slave /usr/bin/clang-reorder-fields clang-reorder-fields /usr/bin/clang-reorder-fields-$LLVM_VERSION \
  --slave /usr/bin/clang-repl clang-repl /usr/bin/clang-repl-$LLVM_VERSION \
  --slave /usr/bin/clang-scan-deps clang-scan-deps /usr/bin/clang-scan-deps-$LLVM_VERSION \
  --slave /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-$LLVM_VERSION \
  --slave /usr/bin/clang-tidy-diff.py clang-tidy-diff.py /usr/bin/clang-tidy-diff-$LLVM_VERSION.py \
  --slave /usr/bin/clangd clangd /usr/bin/clangd-$LLVM_VERSION \
  --slave /usr/bin/count count /usr/bin/count-$LLVM_VERSION \
  --slave /usr/bin/diagtool diagtool /usr/bin/diagtool-$LLVM_VERSION \
  --slave /usr/bin/dsymutil dsymutil /usr/bin/dsymutil-$LLVM_VERSION \
  --slave /usr/bin/find-all-symbols find-all-symbols /usr/bin/find-all-symbols-$LLVM_VERSION \
  --slave /usr/bin/git-clang-format git-clang-format /usr/bin/git-clang-format-$LLVM_VERSION \
  --slave /usr/bin/hmaptool hmaptool /usr/bin/hmaptool-$LLVM_VERSION \
  --slave /usr/bin/hwasan_symbolize hwasan_symbolize /usr/bin/hwasan_symbolize-$LLVM_VERSION \
  --slave /usr/bin/intercept-build intercept-build /usr/bin/intercept-build-$LLVM_VERSION \
  --slave /usr/bin/ld.lld ld.lld /usr/bin/ld.lld-$LLVM_VERSION \
  --slave /usr/bin/ld64.lld ld64.lld /usr/bin/ld64.lld-$LLVM_VERSION \
  --slave /usr/bin/llc llc /usr/bin/llc-$LLVM_VERSION \
  --slave /usr/bin/lld lld /usr/bin/lld-$LLVM_VERSION \
  --slave /usr/bin/lld-link lld-link /usr/bin/lld-link-$LLVM_VERSION \
  --slave /usr/bin/lldb lldb /usr/bin/lldb-$LLVM_VERSION \
  --slave /usr/bin/lldb-argdumper lldb-argdumper /usr/bin/lldb-argdumper-$LLVM_VERSION \
  --slave /usr/bin/lldb-instr lldb-instr /usr/bin/lldb-instr-$LLVM_VERSION \
  --slave /usr/bin/lldb-server lldb-server /usr/bin/lldb-server-$LLVM_VERSION \
  --slave /usr/bin/lldb-vscode lldb-vscode /usr/bin/lldb-vscode-$LLVM_VERSION \
  --slave /usr/bin/lli lli /usr/bin/lli-$LLVM_VERSION \
  --slave /usr/bin/lli-child-target lli-child-target /usr/bin/lli-child-target-$LLVM_VERSION \
  --slave /usr/bin/llvm-PerfectShuffle llvm-PerfectShuffle /usr/bin/llvm-PerfectShuffle-$LLVM_VERSION \
  --slave /usr/bin/llvm-addr2line llvm-addr2line /usr/bin/llvm-addr2line-$LLVM_VERSION \
  --slave /usr/bin/llvm-ar llvm-ar /usr/bin/llvm-ar-$LLVM_VERSION \
  --slave /usr/bin/llvm-as llvm-as /usr/bin/llvm-as-$LLVM_VERSION \
  --slave /usr/bin/llvm-bcanalyzer llvm-bcanalyzer /usr/bin/llvm-bcanalyzer-$LLVM_VERSION \
  --slave /usr/bin/llvm-bitcode-strip llvm-bitcode-strip /usr/bin/llvm-bitcode-strip-$LLVM_VERSION \
  --slave /usr/bin/llvm-c-test llvm-c-test /usr/bin/llvm-c-test-$LLVM_VERSION \
  --slave /usr/bin/llvm-cat llvm-cat /usr/bin/llvm-cat-$LLVM_VERSION \
  --slave /usr/bin/llvm-cfi-verify llvm-cfi-verify /usr/bin/llvm-cfi-verify-$LLVM_VERSION \
  --slave /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-$LLVM_VERSION \
  --slave /usr/bin/llvm-cov llvm-cov /usr/bin/llvm-cov-$LLVM_VERSION \
  --slave /usr/bin/llvm-cvtres llvm-cvtres /usr/bin/llvm-cvtres-$LLVM_VERSION \
  --slave /usr/bin/llvm-cxxdump llvm-cxxdump /usr/bin/llvm-cxxdump-$LLVM_VERSION \
  --slave /usr/bin/llvm-cxxfilt llvm-cxxfilt /usr/bin/llvm-cxxfilt-$LLVM_VERSION \
  --slave /usr/bin/llvm-cxxmap llvm-cxxmap /usr/bin/llvm-cxxmap-$LLVM_VERSION \
  --slave /usr/bin/llvm-debuginfod-find llvm-debuginfod-find /usr/bin/llvm-debuginfod-find-$LLVM_VERSION \
  --slave /usr/bin/llvm-diff llvm-diff /usr/bin/llvm-diff-$LLVM_VERSION \
  --slave /usr/bin/llvm-dis llvm-dis /usr/bin/llvm-dis-$LLVM_VERSION \
  --slave /usr/bin/llvm-dlltool llvm-dlltool /usr/bin/llvm-dlltool-$LLVM_VERSION \
  --slave /usr/bin/llvm-dwarfdump llvm-dwarfdump /usr/bin/llvm-dwarfdump-$LLVM_VERSION \
  --slave /usr/bin/llvm-dwp llvm-dwp /usr/bin/llvm-dwp-$LLVM_VERSION \
  --slave /usr/bin/llvm-exegesis llvm-exegesis /usr/bin/llvm-exegesis-$LLVM_VERSION \
  --slave /usr/bin/llvm-extract llvm-extract /usr/bin/llvm-extract-$LLVM_VERSION \
  --slave /usr/bin/llvm-gsymutil llvm-gsymutil /usr/bin/llvm-gsymutil-$LLVM_VERSION \
  --slave /usr/bin/llvm-ifs llvm-ifs /usr/bin/llvm-ifs-$LLVM_VERSION \
  --slave /usr/bin/llvm-install-name-tool llvm-install-name-tool /usr/bin/llvm-install-name-tool-$LLVM_VERSION \
  --slave /usr/bin/llvm-jitlink llvm-jitlink /usr/bin/llvm-jitlink-$LLVM_VERSION \
  --slave /usr/bin/llvm-jitlink-executor llvm-jitlink-executor /usr/bin/llvm-jitlink-executor-$LLVM_VERSION \
  --slave /usr/bin/llvm-lib llvm-lib /usr/bin/llvm-lib-$LLVM_VERSION \
  --slave /usr/bin/llvm-libtool-darwin llvm-libtool-darwin /usr/bin/llvm-libtool-darwin-$LLVM_VERSION \
  --slave /usr/bin/llvm-link llvm-link /usr/bin/llvm-link-$LLVM_VERSION \
  --slave /usr/bin/llvm-lipo llvm-lipo /usr/bin/llvm-lipo-$LLVM_VERSION \
  --slave /usr/bin/llvm-lto llvm-lto /usr/bin/llvm-lto-$LLVM_VERSION \
  --slave /usr/bin/llvm-lto2 llvm-lto2 /usr/bin/llvm-lto2-$LLVM_VERSION \
  --slave /usr/bin/llvm-mc llvm-mc /usr/bin/llvm-mc-$LLVM_VERSION \
  --slave /usr/bin/llvm-mca llvm-mca /usr/bin/llvm-mca-$LLVM_VERSION \
  --slave /usr/bin/llvm-ml llvm-ml /usr/bin/llvm-ml-$LLVM_VERSION \
  --slave /usr/bin/llvm-modextract llvm-modextract /usr/bin/llvm-modextract-$LLVM_VERSION \
  --slave /usr/bin/llvm-mt llvm-mt /usr/bin/llvm-mt-$LLVM_VERSION \
  --slave /usr/bin/llvm-nm llvm-nm /usr/bin/llvm-nm-$LLVM_VERSION \
  --slave /usr/bin/llvm-objcopy llvm-objcopy /usr/bin/llvm-objcopy-$LLVM_VERSION \
  --slave /usr/bin/llvm-objdump llvm-objdump /usr/bin/llvm-objdump-$LLVM_VERSION \
  --slave /usr/bin/llvm-opt-report llvm-opt-report /usr/bin/llvm-opt-report-$LLVM_VERSION \
  --slave /usr/bin/llvm-otool llvm-otool /usr/bin/llvm-otool-$LLVM_VERSION \
  --slave /usr/bin/llvm-pdbutil llvm-pdbutil /usr/bin/llvm-pdbutil-$LLVM_VERSION \
  --slave /usr/bin/llvm-profdata llvm-profdata /usr/bin/llvm-profdata-$LLVM_VERSION \
  --slave /usr/bin/llvm-profgen llvm-profgen /usr/bin/llvm-profgen-$LLVM_VERSION \
  --slave /usr/bin/llvm-ranlib llvm-ranlib /usr/bin/llvm-ranlib-$LLVM_VERSION \
  --slave /usr/bin/llvm-rc llvm-rc /usr/bin/llvm-rc-$LLVM_VERSION \
  --slave /usr/bin/llvm-readelf llvm-readelf /usr/bin/llvm-readelf-$LLVM_VERSION \
  --slave /usr/bin/llvm-readobj llvm-readobj /usr/bin/llvm-readobj-$LLVM_VERSION \
  --slave /usr/bin/llvm-reduce llvm-reduce /usr/bin/llvm-reduce-$LLVM_VERSION \
  --slave /usr/bin/llvm-rtdyld llvm-rtdyld /usr/bin/llvm-rtdyld-$LLVM_VERSION \
  --slave /usr/bin/llvm-sim llvm-sim /usr/bin/llvm-sim-$LLVM_VERSION \
  --slave /usr/bin/llvm-size llvm-size /usr/bin/llvm-size-$LLVM_VERSION \
  --slave /usr/bin/llvm-split llvm-split /usr/bin/llvm-split-$LLVM_VERSION \
  --slave /usr/bin/llvm-stress llvm-stress /usr/bin/llvm-stress-$LLVM_VERSION \
  --slave /usr/bin/llvm-strings llvm-strings /usr/bin/llvm-strings-$LLVM_VERSION \
  --slave /usr/bin/llvm-strip llvm-strip /usr/bin/llvm-strip-$LLVM_VERSION \
  --slave /usr/bin/llvm-symbolizer llvm-symbolizer /usr/bin/llvm-symbolizer-$LLVM_VERSION \
  --slave /usr/bin/llvm-tapi-diff llvm-tapi-diff /usr/bin/llvm-tapi-diff-$LLVM_VERSION \
  --slave /usr/bin/llvm-tblgen llvm-tblgen /usr/bin/llvm-tblgen-$LLVM_VERSION \
  --slave /usr/bin/llvm-tli-checker llvm-tli-checker /usr/bin/llvm-tli-checker-$LLVM_VERSION \
  --slave /usr/bin/llvm-undname llvm-undname /usr/bin/llvm-undname-$LLVM_VERSION \
  --slave /usr/bin/llvm-windres llvm-windres /usr/bin/llvm-windres-$LLVM_VERSION \
  --slave /usr/bin/llvm-xray llvm-xray /usr/bin/llvm-xray-$LLVM_VERSION \
  --slave /usr/bin/modularize modularize /usr/bin/modularize-$LLVM_VERSION \
  --slave /usr/bin/not not /usr/bin/not-$LLVM_VERSION \
  --slave /usr/bin/obj2yaml obj2yaml /usr/bin/obj2yaml-$LLVM_VERSION \
  --slave /usr/bin/opt opt /usr/bin/opt-$LLVM_VERSION \
  --slave /usr/bin/pp-trace pp-trace /usr/bin/pp-trace-$LLVM_VERSION \
  --slave /usr/bin/run-clang-tidy run-clang-tidy /usr/bin/run-clang-tidy-$LLVM_VERSION \
  --slave /usr/bin/run-clang-tidy.py run-clang-tidy.py /usr/bin/run-clang-tidy-$LLVM_VERSION.py \
  --slave /usr/bin/sancov sancov /usr/bin/sancov-$LLVM_VERSION \
  --slave /usr/bin/sanstats sanstats /usr/bin/sanstats-$LLVM_VERSION \
  --slave /usr/bin/scan-build scan-build /usr/bin/scan-build-$LLVM_VERSION \
  --slave /usr/bin/scan-build-py scan-build-py /usr/bin/scan-build-py-$LLVM_VERSION \
  --slave /usr/bin/scan-view scan-view /usr/bin/scan-view-$LLVM_VERSION \
  --slave /usr/bin/split-file split-file /usr/bin/split-file-$LLVM_VERSION \
  --slave /usr/bin/verify-uselistorder verify-uselistorder /usr/bin/verify-uselistorder-$LLVM_VERSION \
  --slave /usr/bin/wasm-ld wasm-ld /usr/bin/wasm-ld-$LLVM_VERSION \
  --slave /usr/bin/yaml-bench yaml-bench /usr/bin/yaml-bench-$LLVM_VERSION \
  --slave /usr/bin/yaml2obj yaml2obj /usr/bin/yaml2obj-$LLVM_VERSION \

