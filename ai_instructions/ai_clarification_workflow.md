# Clarification Process – Question-Driven Requirements Elicitation

## 1. Purpose

Define a repeatable, question-driven process for clarifying requirements before designing an AWS-based solution. The goal is to reach a precise, minimal set of functional requirements with as few high-value questions and answers as possible, while allowing the user to decide when the requirements are “complete enough” to proceed.

---

## 2. Roles and Responsibilities

- User:
  - Provides an initial summary of their needs, even if fuzzy or internally inconsistent.
  - Answers one clarifying question at a time.
  - Decides when the clarification phase is complete.

- Assistant:
  - Interprets the initial summary and uses an internal model to identify uncertainties and potential conflicts.
  - Creates and maintains an internal, not-shared, prioritized list of clarifying questions.
  - Asks only one question at a time, always the currently most valuable one.
  - Adjusts the question list after each answer, removing redundant questions and adding new ones if needed.

---

## 3. Process Overview

1. User provides an initial problem summary.
2. Assistant silently builds an internal, prioritized list of clarifying questions.
3. Assistant asks the single most important question.
4. User answers.
5. Assistant re-evaluates its question list:
   - Marks some questions as answered or redundant.
   - Refines remaining questions.
   - Adds new questions if the answer surfaced new uncertainties or options.
6. Steps 3–5 repeat, with exactly one question per turn from the assistant.
7. The user declares when the requirements clarification phase is sufficiently complete to move on to design/architecture.

The primary design principle is: maximize the information gained per question while minimizing the total number of questions.

---

## 4. Question Design Principles

Questions should be:

- High leverage:
  - Target dimensions that affect major architectural decisions (e.g., number of domains, allowed services, cost constraints, privacy requirements).
- Binary or tightly scoped where possible:
  - Yes/No or constrained-choice questions to reduce ambiguity.
- User-centric:
  - phrased in terms of behavior (“what you want to happen”) rather than internal implementation details.

Examples of such dimensions include:

- Primary mail client and provider.
- Priority between minimal code vs. strict privacy/visibility of personal addresses.
- Tolerance for opinionated flows (e.g., all replies funneled through a single mailbox).
- Scope (single address vs. multiple addresses).
- Requirements for metrics, alerts, and troubleshooting.

---

## 5. Dynamic Question List Management

After each user answer, the assistant must:

1. Re-interpret the answer in the context of all prior answers and the original summary.
2. Update its internal understanding of the requirements.
3. Modify the internal question list:
   - Remove questions whose answers are now implied or irrelevant.
   - Merge or simplify questions that overlap.
   - Add new questions if:
     - The answer introduces a new constraint (e.g., single account, free tier).
     - The answer relaxes prior assumptions (e.g., okay with helper addresses like `thread-<id>@...`).
4. Choose the next question with the highest impact on:
   - Architecture shape.
   - Service selection.
   - Operational and security posture.

The user only ever sees the currently selected question, not the full list or the updates.

---

## 6. Interaction Rules

- One question per assistant turn:
  - The assistant must not bundle multiple separate questions in the same message.
- Minimal phrasing:
  - Questions should be concise and avoid unnecessary jargon.
  - Where earlier questions were overly verbose, later questions should be tightened and refocused.
- User control of completion:
  - At any point, the user may declare that the clarification is sufficient.
  - Once the user does so, the assistant transitions from clarification mode to:
    - Summarizing the agreed requirements, and
    - Proposing architectures or implementation steps.

---

## 7. Example Application to the SES Email Use Case

Applied to the SES email scenario, the process looked like this:

1. User provided an initial high-level description of a desired SES-based mail solution:
   - Inbound receipt, auto-response, forwarding, and reply handling.
   - Desire to hide personal addresses.
   - AWS-only services like SES, S3, Lambda, SQS, CloudWatch acceptable.
   - Minimize lines of code and align with AWS Well-Architected Framework.

2. Assistant identified key uncertain dimensions and asked targeted questions such as:
   - Primary/secondary mail clients and providers.
   - Priority between minimizing code vs. fully hiding private addresses.
   - Willingness to use a dedicated private mailbox behind the scenes.
   - Acceptance of mailbox-like behavior where you never browse mail directly in AWS.
   - Acceptability of helper reply addresses like `thread-<id>@domain`.
   - Scope (single address vs. multiple addresses).
   - Need for proactive metrics and alerts vs. log-only troubleshooting.
   - Single account/region constraint and cost sensitivity.

3. After each reply, the assistant:
   - Refined its model:
     - Single address.
     - Single account and region.
     - Serverless, pay-as-you-go, free-tier friendly.
     - Explicit requirement for metrics and alarms.
     - Acceptance of helper addresses and per-exchange snapshots.
   - Dropped now-redundant questions.
   - Asked the next highest-impact question.

4. Once enough key dimensions were clarified (according to both the assistant’s internal model and the user’s feedback), the assistant:
   - Synthesized a concrete target architecture at a high level.
   - Restated the requirements in structured form (functional and non-functional).

---

## 8. Outputs of the Process

The clarification process is considered successful when it yields:

- A written set of functional requirements:
  - What the system must do, in terms of observable behavior.
- A set of non-functional and architectural constraints:
  - AWS-only, single account/region, Well-Architected alignment, minimal code/complexity, client expectations.
- Enough precision to:
  - Define specific AWS resources (SES rules, S3 buckets, Lambdas, SNS topics, CloudWatch alarms).
  - Design minimal Lambda interfaces and responsibilities.
  - Evaluate trade-offs between alternative patterns.

---

## 9. Reuse and Extensibility

This question-driven clarification method can be reused for other AWS or technical projects by:

- Adapting the “key dimensions” list to the new problem domain (e.g., API design, data pipelines, infrastructure-as-code).
- Maintaining the core interaction pattern:
  - Single most important question per turn.
  - Dynamic refinement of the question set.
  - Explicit user control over when clarification is complete.
