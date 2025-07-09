# gsdesign.ai

Up-to-date documentation of clinical trial design and simulation packages
for LLMs and AI coding tools.

## Building the site

### Prerequisites

- Hugo
- Node.js (for Tailwind CSS)

### Initial setup

1. Install Tailwind CSS dependencies:
   ```bash
   cd themes/hugo-gsdesign
   npm install
   ```

### Development workflow

1. **Build CSS** (run this after modifying Tailwind styles):
   ```bash
   cd themes/hugo-gsdesign
   npm run build-css
   ```

2. **Start Hugo development server**:
   ```bash
   hugo server
   ```
   Visit `http://localhost:1313`

### Production build

1. Build CSS for production:
   ```bash
   cd themes/hugo-gsdesign
   npm run build-css
   ```

2. Build the Hugo site:
   ```bash
   hugo
   ```
   The site will be generated in the `public/` directory.

### Key files to edit

- Content: `content/` directory
- Styles: `themes/hugo-gsdesign/static/css/input.css`
- Templates: `themes/hugo-gsdesign/layouts/`
- Site configuration: `config.yaml`

After editing styles, always rebuild CSS with `npm run build-css`.
