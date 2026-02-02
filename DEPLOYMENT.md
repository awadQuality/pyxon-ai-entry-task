# Deployment Guide - Pyxon AI Document Parser

## 🚀 Quick Deployment to Render.com

### Prerequisites
- GitHub account
- Render.com account (free tier)

### Step 1: Prepare Repository

1. **Initialize Git repository:**
```bash
cd "/Users/macbook/Desktop/Pyxon RAG"
git init
git add .
git commit -m "Initial commit: Pyxon AI Document Parser"
```

2. **Create GitHub repository:**
- Go to https://github.com/new
- Name: `pyxon-ai-document-parser`
- Make it public
- Don't initialize with README (we already have one)

3. **Push to GitHub:**
```bash
git remote add origin https://github.com/YOUR_USERNAME/pyxon-ai-document-parser.git
git branch -M main
git push -u origin main
```

### Step 2: Deploy to Render.com

1. **Create PostgreSQL Database:**
   - Go to https://dashboard.render.com
   - Click "New +" → "PostgreSQL"
   - Name: `pyxon-rag-db`
   - Region: Choose closest to you
   - Plan: Free
   - Click "Create Database"
   - **Copy the Internal Database URL** (starts with `postgresql://`)

2. **Create Web Service:**
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Name: `pyxon-ai-parser`
   - Region: Same as database
   - Branch: `main`
   - Runtime: `Docker`
   - Plan: Free
   
3. **Environment Variables:**
   Add these in the "Environment" section:
   ```
   DATABASE_URL=<paste-internal-database-url-here>
   CHROMA_PERSIST_DIRECTORY=/app/chroma_db
   DEBUG=False
   ```

4. **Deploy:**
   - Click "Create Web Service"
   - Wait 5-10 minutes for build and deployment
   - Your app will be live at: `https://pyxon-ai-parser.onrender.com`

### Step 3: Test Deployment

1. **Access the app:**
   - Open: `https://pyxon-ai-parser.onrender.com`
   - You should see the beautiful UI

2. **Test document upload:**
   - Upload a test PDF or TXT file
   - Verify processing completes

3. **Test search:**
   - Enter a query
   - Verify results are returned

### Step 4: Update README

Update the README.md with your demo URL:
```markdown
## 🚀 Live Demo

**Demo URL:** https://pyxon-ai-parser.onrender.com

Test the system with:
- Sample English documents
- Sample Arabic documents with diacritics
- Semantic search queries
```

---

## 🐳 Alternative: Docker Deployment

### Local Docker Testing

```bash
# Build and run
docker-compose up -d

# Check logs
docker-compose logs -f

# Stop
docker-compose down
```

### Deploy to Any Cloud with Docker

**Railway.app:**
```bash
# Install Railway CLI
npm install -g @railway/cli

# Login and deploy
railway login
railway init
railway up
```

**Fly.io:**
```bash
# Install Fly CLI
curl -L https://fly.io/install.sh | sh

# Deploy
fly launch
fly deploy
```

---

## 📋 Pre-Deployment Checklist

- [x] All code committed to Git
- [x] README.md complete with instructions
- [x] .env.example provided
- [x] Docker configuration tested
- [x] Requirements.txt up to date
- [ ] GitHub repository created
- [ ] Render.com database created
- [ ] Web service deployed
- [ ] Demo URL tested
- [ ] README updated with demo link

---

## 🔧 Troubleshooting

### Issue: Database connection failed
**Solution:** Verify DATABASE_URL environment variable is set correctly

### Issue: Out of memory on free tier
**Solution:** 
- Reduce batch size in embedding service
- Use smaller embedding model
- Optimize chunk size

### Issue: Slow cold starts
**Solution:** This is normal for Render.com free tier (sleeps after 15 min inactivity)

### Issue: NLTK data not found
**Solution:** Dockerfile already downloads it, but verify build logs

---

## 📝 Post-Deployment

1. **Test all features:**
   - Document upload (PDF, DOCX, TXT)
   - Arabic document with diacritics
   - Search functionality
   - Document deletion

2. **Run benchmarks:**
   ```bash
   python benchmarks/benchmark_suite.py
   ```

3. **Take screenshots:**
   - Homepage
   - Document upload
   - Search results
   - Arabic text display

4. **Update PR with demo link**

---

## 🎯 Next: Create Pull Request

Once deployed, go to:
https://github.com/pyxon-ai/pyxon-ai-entry-task

And create your PR with:
- ✅ Contact information
- ✅ Live demo link
- ✅ Implementation description
- ✅ Architecture decisions
- ✅ Benchmark results
- ✅ Any assumptions made

**Deadline:** February 2nd, 13:00 Amman time

Good luck! 🚀
