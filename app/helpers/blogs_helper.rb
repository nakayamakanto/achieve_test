module BlogsHelper
    def chose_create_or_update
        if action_name=="new"
            confirm_blogs_path
        elsif action_name=="edit"
            blog_path
        end
    end
end
