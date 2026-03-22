# For anyone wanting to write a new blog post

The website is live at: 

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
date: 20-03-2026
author: "[Your Name](/about.qmd#your-name)"
categories: [infectious disease, AMR]
---
```

3. Write your post in Markdown below the `---`
4. The [Quarto website](https://quarto.org/docs/authoring/markdown-basics.html) is great for some basic formatting - but if you've used another type of markdown before these are pretty similar
4. Add a brief bio to the about.qmd file
5. You can render the site locally (if you've made a Quarto Website project the you can `Render Website` in the build pane)
5. Open a pull request to the main branch (which I've confusingly called gh-pages) when you're happy with it
6. I'll accept it and GitHub Actions (should) rebuild the site automatically

## Preview locally

```bash
quarto preview
```

This opens a live preview in your browser. No need to push to see changes. 
(I've save the 'docs' folder this creates in the .gitignore so feel free to render locally - these files shouldn't be uploaded)

---

## Adding a journal to the papers page

This is a bit fiddly as I'm not very good at html - so all of these are hard coded in. 
Probably easier just to open and issue and I'll add them.
