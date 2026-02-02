# Pyxon AI Document Parser

An intelligent RAG-powered document processing system with full Arabic language support, built for the Pyxon AI technical assessment.

## 🌟 Features

- **Multi-Format Support**: Process PDF, DOCX, DOC, and TXT files
- **Intelligent Chunking**: Automatic strategy selection between fixed-size and dynamic/semantic chunking
- **Arabic Language Support**: Full support for Arabic text including diacritics (harakat)
- **Dual Storage**: PostgreSQL for metadata + ChromaDB for vector embeddings
- **Semantic Search**: Advanced RAG-powered retrieval with multilingual embeddings
- **Modern UI**: Beautiful web interface with drag-and-drop upload
- **Comprehensive Benchmarks**: Built-in benchmark suite for testing retrieval accuracy

## 🚀 Quick Start

### Prerequisites

- Python 3.11+
- PostgreSQL 15+
- Docker (optional, for containerized deployment)

### Local Development

1. **Clone the repository**
```bash
git clone <repository-url>
cd pyxon-ai-document-parser
```

2. **Create virtual environment**
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. **Install dependencies**
```bash
pip install -r requirements.txt
```

4. **Set up environment variables**
```bash
cp .env.example .env
# Edit .env with your database credentials
```

5. **Run the application**
```bash
uvicorn app.main:app --reload
```

6. **Access the application**
- Web Interface: http://localhost:8000
- API Documentation: http://localhost:8000/api/docs

### Docker Deployment

```bash
docker-compose up -d
```

## 📚 API Endpoints

### Documents

- `POST /api/documents/upload` - Upload and process a document
- `GET /api/documents/` - List all documents
- `GET /api/documents/{id}` - Get document details
- `DELETE /api/documents/{id}` - Delete a document

### Query

- `POST /api/query/` - Search documents with semantic similarity
- `GET /api/query/context` - Get context for LLM integration

## 🏗️ Architecture

```
┌─────────────────┐
│   Frontend UI   │
│  (HTML/CSS/JS)  │
└────────┬────────┘
         │
    ┌────▼────┐
    │ FastAPI │
    └────┬────┘
         │
    ┌────▼──────────────────┐
    │  Document Processor   │
    │  - PDF/DOCX/TXT       │
    │  - Arabic Detection   │
    └────┬──────────────────┘
         │
    ┌────▼──────────────────┐
    │  Chunking Service     │
    │  - Fixed Strategy     │
    │  - Dynamic Strategy   │
    └────┬──────────────────┘
         │
    ┌────▼──────────────────┐
    │  Embedding Service    │
    │  (Multilingual Model) │
    └────┬──────────────────┘
         │
    ┌────▼──────────────────┐
    │   Storage Layer       │
    ├───────────────────────┤
    │  PostgreSQL  │ ChromaDB│
    │  (Metadata)  │ (Vectors)│
    └───────────────────────┘
```

## 🧪 Running Benchmarks

```bash
python benchmarks/benchmark_suite.py
```

Benchmark results will be saved to `benchmarks/results/benchmark_results.json`

## 🌐 Arabic Language Support

The system fully supports Arabic text processing:

- **Encoding Detection**: Automatic detection of UTF-8 and CP1256 (Arabic Windows)
- **Diacritics Preservation**: Maintains Arabic diacritics (harakat) throughout processing
- **Multilingual Embeddings**: Uses `paraphrase-multilingual-MiniLM-L12-v2` for Arabic-aware semantic search
- **RTL Support**: Frontend supports right-to-left text display

## 🔧 Technology Stack

- **Backend**: FastAPI, SQLAlchemy, Pydantic
- **Database**: PostgreSQL, ChromaDB
- **ML/NLP**: Sentence Transformers, NLTK, PyTorch
- **Document Processing**: PyPDF2, pdfplumber, python-docx
- **Frontend**: Vanilla HTML/CSS/JavaScript
- **Deployment**: Docker, Docker Compose

## 📊 Chunking Strategies

### Fixed-Size Chunking
- Chunk size: 512 tokens
- Overlap: 50 tokens
- Best for: Uniform content, simple documents

### Dynamic/Semantic Chunking
- Paragraph-aware splitting
- Sentence boundary detection
- Best for: Complex documents, structured content

The system automatically selects the optimal strategy based on document characteristics.

## 🎯 Design Decisions

1. **ChromaDB over Pinecone/Weaviate**: Free, easy deployment, no API keys required
2. **Multilingual Model**: Supports 50+ languages including Arabic
3. **Dual Storage**: SQL for structured queries, Vector DB for semantic search
4. **Glassmorphism UI**: Modern, premium design for better user experience
5. **Automatic Strategy Selection**: AI-powered decision making for chunking

## 📝 Implementation Notes

- All text processing preserves UTF-8 encoding for Arabic support
- Embeddings are generated in batches for efficiency
- Vector similarity uses cosine distance
- Frontend uses vanilla JavaScript for simplicity and performance

## 🚢 Deployment

The application is deployed on Render.com and accessible at:
**[Demo URL will be added here]**

## 👤 Author

**[Your Name]**
- Email: [your-email@example.com]
- GitHub: [your-github-username]

