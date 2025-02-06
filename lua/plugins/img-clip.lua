return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    use_absolute_path = true,
    insert_mode = true,
    filetypes = {
      tex = {
      relative_template_path = false, ---@type boolean | fun(): boolean
      template = [[
\begin{figure}[h]
  \centering
  \includegraphics[width=0.8\textwidth]{$FILE_PATH}
  \caption{$CURSOR}
  \label{fig:$LABEL}
\end{figure}
    ]], ---@type string | fun(context: table): string
    },

    }
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },

}
