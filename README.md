# For anyone wanting to write a new blog post

The website is live at: https://jackwgoodall.github.io/infection_updates/

## Open the project

1. Fork this project from github.
2. I would set up a local R project which has a quarto website as the type (I've set the .gitignore to ignore anything ending in .Rproj so this should get uploaded)
3. Remeber to Fetch from Origin if you've cloned it previously and are now coming back to it to make sure you're up-to-date

## Write the blog post

1. Create a new file in `posts/` directory — e.g. `posts/my-new-post.qmd`
2. Add the YAML header:

```yaml
---
title: "Your post title"
description: "One sentence summary"
date: 03-20-2026                               # American date system
author: "[Your Name](/about.qmd#your-name)"    # If you add a bio to the about section this will link to it
categories: ["Staph aureus", AMR]              # Anything with a space in needs quotes. Please see if a tag has been used before and copy exactly if it has
---
```

3. Write your post in Markdown below the `---`
4. Any images can be added. Please save these in "posts/images/your_post"
5. The [Quarto website](https://quarto.org/docs/authoring/markdown-basics.html) is great for some basic formatting - but if you've used another type of markdown before these are pretty similar
6. Add a brief bio to the about.qmd file 
7. You can render the site locally to see how it looks (if you've made a Quarto Website project the you can `Render Website` in the build pane)
8. Open a pull request to the main branch (which I've confusingly called gh-pages) when you're happy with it
9. I'll accept it and GitHub Actions (should) rebuild the site automatically

## Updating

---

## Adding a journal to the papers page

This is a bit fiddly as I'm not very good at html - so all of these are hard coded in. 
Probably easier just to open and issue and I'll add them.
