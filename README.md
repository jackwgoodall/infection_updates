# For anyone wanting to write a new blog post

## Open the project

1. Clone this project from github. Either work in the pages-gh brach, or make a fresh branch and open a pull request to this branch when you're happy. 

## Write the blog post

1. Create a new file in `posts/` — e.g. `posts/my-new-post.qmd`
2. Add the YAML header:

```yaml
---
title: "Your post title"
description: "One sentence summary"
date: 2026-03-20
categories: [infectious disease, AMR]
---
```

3. Write your post in Markdown below the `---`
4. Commit and push — GitHub Actions (should) rebuild the site automatically

## Preview locally

```bash
quarto preview
```

This opens a live preview in your browser. No need to push to see changes. 
(I've save the 'docs' folder this creates in the gitignore so feel free to render locally)

---

## Adding a journal to the papers page

Open `papers.qmd` and add a line to the journal `<select>` block:

```html
<option value="OPENALEX_SOURCE_ID">Journal Name</option>
```

To find a journal's OpenAlex source ID, search at:
https://api.openalex.org/sources?search=journal+name
