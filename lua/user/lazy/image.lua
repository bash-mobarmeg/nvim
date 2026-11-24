return {
  enabled = false,
  "3rd/image.nvim",
  config = function ()
    require('image').setup({
      backend = "kitty", -- force kitty graphics
      integrations = {
        markdown = {
          only_render_image_at_cursor = true,
          only_render_image_at_cursor_mode = "popup",
          resolve_image_path = function(document_path, image_path, fallback)
            return fallback(document_path, image_path)
          end,
        }
      }
    }).enable();
  end
}
