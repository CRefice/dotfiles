let b:ale_fixers = ['rustfmt']
let b:ale_linters = ['rls']
let b:ale_rust_rls_config = { 'rust': { 'clippy_preference': 'on' } }
let b:ale_rust_rustfmt_options = '--edition 2018'