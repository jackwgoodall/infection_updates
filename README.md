# jackwgoodall.github.io

Personal site — infectious disease research blog + live OpenAlex papers feed.

Built with [Quarto](https://quarto.org) and hosted on GitHub Pages.

---

## Setup (first time only)

### 1. Create the GitHub repo

Create a new repo at github.com named exactly: `jackwgoodall.github.io`

### 2. Clone and push this folder

```bash
git init
git remote add origin https://github.com/jackwgoodall/jackwgoodall.github.io.git
git add .
git commit -m "Initial site"
git push -u origin main
```

### 3. Enable GitHub Pages

In your repo on GitHub:
- Go to **Settings → Pages**
- Under **Source**, select **Deploy from a branch**
- Branch: `gh-pages` / folder: `/ (root)`
- Click Save

The GitHub Action will build and deploy automatically on every push.
Your site will be live at: **https://jackwgoodall.github.io**

---

## Writing a new blog post

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
4. Commit and push — GitHub Actions rebuilds the site automatically

## Preview locally

```bash
quarto preview
```

This opens a live preview in your browser. No need to push to see changes.

---

## Adding a journal to the papers page

Open `papers.qmd` and add a line to the journal `<select>` block:

```html
<option value="OPENALEX_SOURCE_ID">Journal Name</option>
```

To find a journal's OpenAlex source ID, search at:
https://api.openalex.org/sources?search=journal+name
