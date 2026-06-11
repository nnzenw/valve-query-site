# ValveSpecs Pro - SEO & Content Strategy Guide

## 1. Positioning & Audience
**Goal**: Establish the site as the "Industry Standard" for valve technical specifications.
**Target Audience**:
- **Process Engineers**: Seeking precise technical data for design and selection.
- **Procurement Officers**: Comparing brands and models for cost/risk optimization.
- **Maintenance Engineers**: Checking standards for replacement and repair.

**Tone of Voice**: 
- **Professional, Technical, Objective, and Authoritative.**
- Avoid marketing fluff (e.g., "the best", "amazing", "unbeatable").
- Use precise engineering terminology (e.g., use "Face-to-Face" instead of "Length").

---

## 2. Keyword Hierarchy (L1-L3)

### L1: Specification Layer (High Intent - Bottom of Funnel)
- **Focus**: Specific model/brand/standard combinations.
- **URL Pattern**: `/valve/[brand]-[model]-[type]`
- **Title Template**: `[Brand] [Model] [Valve Type] Specifications, Dimensions & Standards`
- **Goal**: Rank for "long-tail" searches (e.g., "KITZ 10K Cast Iron Globe Valve Specs").

### L2: Selection Layer (Comparative Intent - Middle of Funnel)
- **Focus**: Brand A vs Brand B or Material A vs Material B.
- **URL Pattern**: `/compare/[product-a]-vs-[product-b]`
- **Title Template**: `[Product A] vs [Product B]: Which one for [Industry/Application]?`
- **Goal**: Help users make a final decision.

### L3: Knowledge Layer (Educational Intent - Top of Funnel)
- **Focus**: Standards, Materials, and "How-to" guides.
- **URL Pattern**: `/blog/[slug]`
- **Title Template**: `The Complete Guide to [Technical Term/Standard]`
- **Goal**: Capture "problem-aware" users via educational content.

---

## 3. Content Production Standards (The "Gold Standard")

### A. Product Detail Pages (PDP)
Every detail page must include:
1. **Standardized Title**: As defined in L1.
2. **Technical Table**: Organized by: Basic Info → Material Specs → Performance → Certifications.
3. **FAQ Section**: 3-5 questions based on common engineering concerns (e.g., "Is this model fire-safe?").
4. **Cross-Links**: "Similar valves from other brands" or "Alternative materials for this application".

### B. Technical Blog Posts (Engineering Wiki)
Every blog post must follow this structure:
1. **The "Problem"**: Start with a real-world engineering challenge.
2. **The "Technical Answer"**: Provide the solution using industry standards (ASME, API, ISO).
3. **The "Comparison Matrix"**: Always include a table or a list for quick scanning.
4. **The "Product Connection"**: Link back to specific valves in the database that solve the problem.

### C. Vocabulary & Terminology (The Glossary)
| ❌ Avoid (Generic) | ✅ Use (Engineering Standard) |
| :--- | :--- |
| Valve Length | Face-to-Face Dimension |
| Inside Material | Trim Material |
| Closing way | Seating / Closure |
| Leaking | Leakage Class / Tightness |
| High quality | Compliance with [Standard, e.g., API 6D] |
| Best for | Recommended for [Application] |

---

## 4. Technical SEO Requirements

### A. Structured Data (Schema.org)
Implement the following JSON-LD:
- **Product**: Include `brand`, `model`, `material`, `standard`.
- **BreadcrumbList**: Home → Brand/Type → Specific Model.
- **FAQPage**: For all FAQ sections to increase SERP real estate.

### B. Performance & UX for Engineers
- **LCP (Largest Contentful Paint)**: The Technical Table must be the first thing visible. No oversized hero images.
- **Readability**: Use monospace fonts for dimensions/model numbers (e.g., `DN100`, `PN16`).
- **Sitemap**: Dynamic sitemap including all generated specification pages.

---

## 5. LLM Prompting Guidelines (For future Agents)

When generating content for this site, the Agent must use the following prompt constraints:

**System Prompt Extension**:
> "You are a Senior Valve Engineer and Technical Writer with 20 years of experience in Oil & Gas and Chemical process industries. Your task is to write technical content for ValveSpecs Pro. 
> 1. **No Fluff**: No adjectives like 'incredible', 'industry-leading', or 'perfect'. 
> 2. **Evidence-Based**: Every claim must be linked to a standard (e.g., ASME B16.34). 
> 3. **Structure**: Use H2/H3 headings, bullet points, and markdown tables. 
> 4. **Audience**: Write for an audience that understands what 'Cv' and 'Stellite' are. 
> 5. **Goal**: Provide objective technical utility, not a sales pitch."

---

## 6. B2B Conversion Path (The Lead Funnel)
Content → Specs → Comparison → **CTA: "Request Quote/Technical Data Sheet"** → Lead Generation.