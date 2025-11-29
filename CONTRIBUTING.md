# Contributing to eng-rubrics

Thank you for your interest in contributing. eng-rubrics exists to bring consistency and rigour to engineering hiring, and contributions from practitioners make it stronger.

Before contributing, please read the [Manifesto](MANIFESTO.md). It defines the principles and boundaries of this project. Contributions that conflict with the manifesto will not be accepted.

---

## What We Accept

### New Rubrics

We welcome rubrics for roles not yet covered, such as:

- Staff Engineer
- Principal Engineer
- Technical Lead
- Engineering Director
- VP of Engineering
- Platform Engineer
- Site Reliability Engineer
- Data Engineer
- Other engineering leadership or senior IC roles

### Example Question Banks

Rubrics define *what* to assess, not *how* to ask. However, we welcome separate question banks that provide example STAR-format questions for each competency area. These should be clearly marked as examples, not mandated questions.

### Improvements to Existing Rubrics

- Clarifying behavioural anchors
- Fixing errors or ambiguities
- Improving alignment to source frameworks (UK-SPEC, SFIA)
- Adding references to framework sections

### Documentation

- Usage guides for interviewers
- Guidance for HR teams implementing eng-rubrics
- Translations (with maintainer approval)

---

## What We Don't Accept

### Opinion-Based Criteria

Every competency area must trace back to an established external framework (UK-SPEC, SFIA, or equivalent). We don't accept criteria based on personal views of what "good" looks like.

### Technical Assessments

eng-rubrics is not for evaluating coding ability, system design, or technical problem-solving. Those belong in dedicated technical interview rounds.

### Culture Fit Criteria

Cultural alignment is inherently subjective. It has no place in these rubrics.

### Framework Substitutions

We won't replace an existing framework alignment (e.g., swapping UK-SPEC for something else) unless the original framework becomes unmaintained or obsolete.

### Deviations from Format

All rubrics must follow the standard structure:

- 2 pages maximum
- 5 competency areas
- 1 scorecard with behavioural anchors and seniority thresholds

If you believe a role genuinely requires a different format, open an issue to discuss before submitting.

---

## Rubric Requirements

Every submitted rubric must include:

### 1. Framework Alignment

State which framework(s) the rubric aligns to and reference specific sections. For example:

> *This rubric aligns to UK-SPEC Fourth Edition, Sections A–E, adapted for the Engineering Manager role.*

or

> *This rubric aligns to SFIA 9, covering competencies RLMT, PEMT, LEDA at Levels 5–6.*

### 2. Five Competency Areas

Each competency area must include:

- **Title** - clear, concise name
- **Framework reference** - which part of UK-SPEC/SFIA/other it maps to
- **Description** - what this competency covers (2–3 sentences)
- **What to look for** - specific indicators of experience and capability

### 3. Scorecard with Behavioural Anchors

The scorecard must define what each score (1–5) looks like for each competency area. Anchors should describe observable behaviours or evidence, not subjective judgments.

| Score | Meaning |
|-------|---------|
| 1 | No evidence of competency |
| 2 | Limited evidence; significant gaps |
| 3 | Adequate evidence; some gaps or inconsistencies |
| 4 | Strong evidence; minor gaps only |
| 5 | Exceptional evidence; exceeds expectations |

Adapt these descriptions to each competency area with specific behavioural indicators.

### 4. Seniority Thresholds

Define score thresholds for each seniority level the rubric covers. For example:

| Level | Threshold |
|-------|-----------|
| Mid-level | 15+ |
| Senior | 20+ |
| Lead | 23+ |

### 5. No Embedded Questions

Rubrics define criteria, not questions. Do not include interview questions in the rubric itself. Example questions may be submitted separately as a companion question bank.

---

## How to Submit

### For New Rubrics

1. Fork the repository
2. Create a new branch: `rubric/[role-name]` (e.g., `rubric/staff-engineer`)
3. Add your rubric in the `/rubrics` directory using the naming convention: `[role-name].md`
4. Ensure your rubric meets all requirements above
5. Submit a pull request with:
   - A clear title: `Add rubric: [Role Name]`
   - A description explaining the framework alignment and target seniority levels
   - Any context on why this role needs a rubric

### For Improvements

1. Fork the repository
2. Create a new branch: `fix/[brief-description]` or `improve/[brief-description]`
3. Make your changes
4. Submit a pull request explaining what you changed and why

### For Question Banks

1. Fork the repository
2. Create a new branch: `questions/[role-name]`
3. Add your question bank in the `/questions` directory using: `[role-name]-questions.md`
4. Submit a pull request

---

## Review Process

All contributions are reviewed by maintainers. We assess:

- **Framework alignment** - Does it trace to UK-SPEC, SFIA, or equivalent?
- **Format compliance** - Does it follow the 2-page, 5-competency, 1-scorecard structure?
- **Behavioural anchors** - Are scores defined by observable evidence, not opinion?
- **Clarity** - Is it clear enough for any interviewer to use consistently?

We may request changes before merging. This isn't personal - it's about maintaining the standard.

---

## Code of Conduct

Be respectful, constructive, and professional. We're here to improve engineering hiring, not to argue about preferences. If a contribution is rejected, the maintainers will explain why.

---

## Questions?

Open an issue with the label `question`. We're happy to clarify requirements before you invest time in a contribution.
