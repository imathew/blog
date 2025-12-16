---
title: "A Comprehensive Guide to Markdown and Web Typography"
description: "Exploring all the markdown elements, typography features, and formatting options supported by this blog."
date: "2025-12-11"
categories: 
  - "technology"
  - "writing"
comments: true
draft: true
---

This is a comprehensive sample post that demonstrates all the markdown and formatting elements supported by this blog. You can use this as a reference when writing new posts.

## Font Strategy and Typography

This blog uses a carefully optimized font strategy based on a major second (1.125x) typographic scale, with a root font size of 18px (1em). The system is built entirely on CSS variables for maintainability and consistency.

### Typography Overview

**Lora** (variable 400–700) is the primary serif font for all body text and headings H2–H6. As a variable font, all weights are available without additional downloads.

**Playfair Display** (weight 400) is reserved exclusively for the page title (H1), providing elegant serif display styling.

**Cascadia Mono** is a crisp monospace font for inline code and code blocks, with excellent legibility for technical content.

### Heading Hierarchy and Scaling

Headings follow a major second (1.125x) scale with proportional margins:

- **Root font size:** 18px (1em = 18px)
- **H1:** 2.1em (37.8px), Playfair Display, centered
- **H2–H6:** 1em margin-top, 0.8em margin-bottom, proportional font weights
- **Line height:** 1.2em (var(--space-lg)) for all headings

## H2 Headings

The h2 uses weight 650 at 1.6em, making it stand out prominently as a major section break. This strong visual presence makes it ideal for the top-level divisions in your content.

### H3 Headings

The h3 uses weight 600 at 1.42em, matching h2's weight but in a smaller size. It should be used for major subsections within your content.

#### H4 Headings

The h4 uses weight 550 at 1.27em, providing a moderate level of emphasis. It's suitable for subsections within h3 sections and provides a subtle but clear distinction from regular text.

##### H5 Headings

The h5 uses weight 500 at 1.12em with italic styling, providing a lighter touch. Use this for minor subdivisions or detailed sections where you want visual separation without the strong emphasis of higher heading levels.

###### H6 Headings

The h6 uses weight 450 at 1em with italic styling. It's best used for deep subsections or minor details—the increased size gives it heading status while staying light enough for subtle emphasis.

## Spacing System

All spacing uses a consistent variable system (root: 18px):

- **--space-xs:** 0.25em (4.5px)
- **--space-sm:** 0.5em (9px)
- **--space-base:** 0.6em (10.8px)
- **--space-md:** 1em (18px)
- **--space-lg:** 1.2em (21.6px)
- **--space-xl:** 1.5em (27px)

Font sizes also use variables:

- **--font-small:** 0.9em (16.2px) — tags, metadata, smaller text
- **--font-smaller:** 0.8em (14.4px) — fine print, captions

## Font Performance

This typography stack is lean and efficient:

- **Lora Regular:** 82 KB (variable font, weights 400–700)
- **Lora Italic:** 90 KB (variable font, weights 400–700)
- **Playfair Display:** 19 KB (weight 400 only)
- **Cascadia Mono:** ~15 KB
- **Total:** ~206 KB

Variable fonts eliminate the need for multiple weight files. The system is 100% CSS-variable-driven for easy maintenance and adjustments.

## Basic Text Formatting

This paragraph contains **bold text** and *italic text* and ***bold italic text***. You can also use __bold__ and _italic_ as alternatives, though the former syntax is preferred.

This is a regular paragraph with normal line breaks. When you break a line in markdown, it doesn't create a new paragraph unless you have a blank line between them.

This is a second paragraph. Notice the blank line above it separates it from the previous paragraph.

### Sub-heading Example

You can create sub-headings using more hash marks. This heading uses three hashes, making it an h3. Each level of heading has its own styling as defined in the site's CSS.

#### Even Deeper

Using four hashes gives you an h4 heading, and you can continue down to h6 if needed, though deeply nested headings are rarely necessary in blog posts.

## Links and External References

This is how you create a [simple link](https://example.com "Example Domain"). The text in quotes is optional and provides a title that appears on hover.

You can also create links to other posts on your site: [check out the dnsmasq post](/2014/05/use-getflix-or-unblock-us-servers-selectively-with-dnsmasq/).

Multiple links in a paragraph work fine: [Google](https://google.com), [GitHub](https://github.com), and [Stack Overflow](https://stackoverflow.com) are all popular destinations.

## Inline Code and Code Blocks

You can write `inline code` within a paragraph, which is perfect for mentioning variable names, function names, or short code snippets like `console.log()`.

For longer code examples, use a code block with triple backticks. You can specify the language for syntax highlighting:

```javascript
// JavaScript example with syntax highlighting
function greetUser(name) {
  const greeting = `Hello, ${name}!`;
  console.log(greeting);
  return greeting;
}

const user = "Alice";
greetUser(user);
```

Here's a Python example:

```python
#!/usr/bin/env python3

def fibonacci(n):
    """Generate Fibonacci sequence up to n terms."""
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

# Usage
for num in fibonacci(10):
    print(num)
```

And a shell/bash example:

```bash
#!/bin/bash

# Create a directory and navigate into it
mkdir -p ~/projects/new-project
cd ~/projects/new-project

# Initialize a git repository
git init
git config user.name "Your Name"
git config user.email "your.email@example.com"

echo "Project initialized!"
```

You can also use inline code blocks with backticks for the language name:

```
This is a code block without syntax highlighting.
Useful for configuration files or plain text output.
```

## Images and Captions

Images can be embedded with alt text and captions:

![Steambox components laid out on a wooden surface](/img/steambox_components.jpg "A Steambox build showcasing the internal components and layout")

The caption appears as hover text on the image and helps describe the visual content for accessibility.

## Lists

### Unordered Lists

You can create unordered lists using dashes, asterisks, or plus signs:

- First item
- Second item
- Third item

### Ordered Lists

For numbered lists, use numbers followed by periods:

1. First step
2. Second step
3. Third step
4. Fourth step

### Nested Lists

Lists can be nested by indenting child items:

1. Project planning
   - Define requirements
   - Sketch wireframes
   - Review with stakeholders
2. Development
   - Set up environment
   - Create repository
   - Start coding
     - Write components
     - Add tests
     - Documentation
3. Deployment
   - Code review
   - Testing in staging
   - Production release

You can mix ordered and unordered lists in nested structures:

- Technology stack
  1. Frontend (React)
  2. Backend (Node.js)
  3. Database (PostgreSQL)
- Team members
  - Frontend developer
  - Backend developer
  - QA engineer

## Blockquotes

Use blockquotes to highlight important quotes or emphasized text:

> This is a blockquote. It appears with a left border and different styling to make it stand out from regular text.

You can have multi-paragraph blockquotes:

> This is the first paragraph of a blockquote.
>
> This is the second paragraph. The blank line with just a `>` on it separates paragraphs within the quote.

Blockquotes can contain other formatting:

> **Note:** This is important information that deserves emphasis. You can use *italic* and `code` within blockquotes as well.

## Horizontal Rules

You can create a horizontal rule with three or more dashes, asterisks, or underscores:

---

The above is a horizontal rule, useful for separating sections or creating visual breaks in your content.

## Line Breaks

Sometimes you want to break a line without creating a new paragraph. You can do this with two trailing spaces at the end of a line:

Line one with two spaces at the end  
Line two that continues on the next line without a paragraph break

Or you can use a backslash:

Line one with backslash at the end\
Line two continues here

## Emphasis Variations

Here are various ways to emphasize text:

- **Bold text** for strong emphasis
- *Italic text* for soft emphasis
- ***Bold and italic*** when you need both
- `Code formatting` for technical terms
- ~~Strikethrough~~ text (though rarely used in this blog)

## Special Characters and Entities

You can use special characters and HTML entities:

- Copyright symbol: ©
- Registered trademark: ®
- Em dash — like this
- En dash – like this
- Ellipsis… like this
- Smart quotes: "quoted text"

## Complex Example: Configuration File

Here's a more realistic example you might find on a technical blog:

```toml
# Hugo configuration
baseURL = "https://example.com/"
languageCode = "en-us"
title = "My Awesome Blog"

[params]
  description = "A blog about technology and life"
  author = "Your Name"
  
[params.social]
  twitter = "yourhandle"
  github = "yourhandle"
  
[outputs]
  home = ["HTML", "RSS"]
```

## Tips and Best Practices

When writing blog posts, remember:

1. **Use clear headings** to structure your content and make it scannable
2. **Break up long paragraphs** for better readability
3. **Use lists** when presenting multiple items or steps
4. **Include code examples** when writing about technical topics
5. **Add blockquotes** to emphasize important points or include relevant quotes
6. **Link generously** to related content and external references
7. **Use emphasis** (bold, italic) sparingly and meaningfully

## Metadata and Supplementary Elements

This section showcases the various metadata and supplementary text styles used throughout the blog.

The post metadata includes the title at the top, a publication date, and category tags. These elements use specialized typography for their role.

When you include quotes from other sources or want to add subtle commentary, you might use italics or smaller text. Similarly, figure captions and image descriptions have their own styling to keep them visually distinct from body text.

Comment headers when discussions happen also receive distinct styling to help readers navigate conversations.

> This is a blockquote with multiple elements. It demonstrates how quoted material is styled with italics and border emphasis. You can include **bold** and *italic* text within blockquotes as well.

The tags for categorizing posts appear in specific places and have their own visual treatment—they're clearly supporting elements that help with navigation and discovery rather than part of the main content flow.

## Conclusion

This sample post covers the main markdown features and demonstrates the optimized typography system used throughout the blog. With Lora's variable weights providing excellent readability and Playfair's elegant accent styling, the blog maintains visual sophistication while keeping font file sizes minimal.

The CSS styling ensures that all these elements look good and maintain visual hierarchy, whether you're using the default light theme or switching to dark mode.

Feel free to use this post as a reference when writing new content. The typography system is ready to support your writing with beautiful, performant font rendering.

---

## About Comments on This Blog

This blog supports comments, which are stored separately in the `data/comments/` directory structure. Each post slug has its own subdirectory containing individual YAML files for each comment. For example, comments on this post would be stored in:

```
data/comments/2025-12-11-comprehensive-sample-post/
  ├── comment-1234567890.yml
  ├── comment-1234567891.yml
  └── comment-1234567892.yml
```

Each comment file contains the author name, email (hashed), date, URL, and the comment text. The templating system automatically renders these comments below the post content using the typography styles defined in the CSS—particularly the Lora italic styling for metadata elements like commenter names and timestamps.

---

**Note:** This is a comprehensive sample post created to demonstrate all supported markdown elements and the updated typography system. You can delete this file once you've used it as a reference for your own posts.
