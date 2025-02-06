return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      use_absolute_path = false, -- Use relative paths to avoid LaTeX path issues
      insert_mode_after_paste = true,
      save_path = vim.fn.expand("%:p:h") .. "/img", -- Save images in the 'img' directory
    },
    filetypes = {
      tex = {
        relative_template_path = true, -- Ensure paths are relative for LaTeX compatibility
        template = [[
\begin{figure}[h]
  \centering
  \includegraphics[width=0.8\textwidth]{img/$FILE_NAME}
  \caption{$CURSOR}
  \label{fig:$LABEL}
\end{figure}
        ]], -- Inserts the correct LaTeX figure template
      },
    },
  },
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
