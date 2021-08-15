require'lspconfig'.jdtls.setup{
    cmd = { "/usr/bin/java", "-Declipse.application=org.eclipse.jdt.ls.core.id1", "-Dosgi.bundles.defaultStartLevel=4", "-Declipse.product=org.eclipse.jdt.ls.core.product", "-Dlog.protocol=true", "-Dlog.level=ALL", "-Xms1g", "-Xmx2G", "-jar", "vim.NIL", "-configuration", "vim.NIL", "-data", "vim.NIL", "--add-modules.ALL-SYSTEM", "--add-opens java.base/java.util=ALL-UNNAMED", "--add-opens java.base/java.lang=ALL-UNNAMED" }
}
