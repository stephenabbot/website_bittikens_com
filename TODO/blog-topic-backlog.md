# Blog Topic Backlog

**Maintained by:** Claude Opus 4.6 (Strategic Planning Agent)  
**Last Updated:** 2026-02-10  
**Rule:** Always maintain 10+ topics. Review and refresh with Stephen periodically.

---

## How to Use This Document

1. When ready to write, scan the list and pick what's top of mind
2. Field Notes (500-800 words) can be drafted in 1-2 hours with AI augmentation
3. Essays (1500-2500 words) need 4-6 hours and benefit from an outline pass first
4. After publishing, move the topic to the "Published" section at the bottom and add the date
5. Add new topics as they arise from daily work -- the best posts come from "I just saw this again today"

**Content principle:** Every post must offer novel insight from direct experience. If the reader could find the same content in AWS docs, a Medium tutorial, or a LinkedIn influencer post, it's not worth writing.

---

## Queued Topics

### 1. The Inheritance Problem

**Category:** Pattern Recognition  
**Format:** Essay  
**Novel angle:** Teams don't just inherit infrastructure -- they inherit assumptions, undocumented decisions, and someone else's mental model. What actually happens in the first 90 days when a team takes over AWS accounts they didn't build. The failure modes are predictable and almost nobody talks about them.  
**LinkedIn hook:** "Every team that inherits infrastructure inherits someone else's shortcuts. Here's what breaks first."

### 2. Why Your CloudWatch Alarms Are Lying to You

**Category:** Field Notes  
**Format:** Field Note  
**Novel angle:** The gap between "we have monitoring" and "we understand what our monitoring tells us." Specific patterns observed across 40+ account audits: alarms that fire but nobody responds to, alarms set to wrong thresholds because they were copied from a template, alarms on the wrong metrics entirely. The organizational failure, not just the technical one.  
**LinkedIn hook:** "Having 200 CloudWatch alarms doesn't mean you have observability. It might mean you have 200 things you're ignoring."

### 3. Click-Ops: A Taxonomy of Configuration Drift

**Category:** Pattern Recognition  
**Format:** Essay  
**Novel angle:** Configuration drift isn't one thing. Categorize the distinct types observed in enterprise environments: console-click drift (someone made a change manually), inherited drift (it was wrong when the team got it), emergency drift (changed during an incident, never reverted), knowledge drift (the person who understood the config left). Each type requires a different remediation strategy.  
**LinkedIn hook:** "Not all configuration drift is created equal. The kind that will hurt you most isn't the one you think."

### 4. What 40+ AWS Account Audits Taught Me About IAM

**Category:** Field Notes  
**Format:** Field Note  
**Novel angle:** Patterns that repeat across nearly every account: wildcard permissions granted "temporarily" 3 years ago, service roles with admin access because "it was easier," cross-account trust relationships nobody remembers creating. The human behavior that produces bad IAM, not just the technical fixes.  
**LinkedIn hook:** "I've audited 40+ AWS accounts. The IAM problems are never technical -- they're organizational."

### 5. The $3/Month Production Website

**Category:** Architecture Decisions  
**Format:** Field Note  
**Novel angle:** Not a tutorial -- a design philosophy piece. Every architectural decision for denverbytes.com was made with cost as a first-class constraint. S3 + CloudFront + Route53 = $3/month for a site that handles production traffic. The decisions that make this possible and the trade-offs accepted. Contrast with teams spending $500+/month on equivalent hosting because they didn't think about cost at design time.  
**LinkedIn hook:** "My production website costs $3/month. Most teams spend 100x that for the same capability. Here's why."

### 6. AI as a Force Multiplier, Not an Easy Button

**Category:** Tool Craft / Philosophy  
**Format:** Essay  
**Novel angle:** Stephen's direct experience building a production tool in Python without knowing Python, using AI augmentation. What AI actually does well (accelerating implementation when you understand the design), what it does poorly (replacing architectural judgment), and why the industry conversation about AI in engineering is mostly wrong in both directions -- both the hype and the fear. Concrete examples from personal experience, not theory.  
**LinkedIn hook:** "I built a production platform in a language I didn't know. AI helped. But not in the way you think."

### 7. The Phantom Resource Problem

**Category:** Field Notes  
**Format:** Field Note  
**Novel angle:** Resources that exist in AWS accounts but serve no purpose -- orphaned EBS volumes, detached Elastic IPs, unused security groups, forgotten Lambda functions triggered by nothing. The cost isn't just dollars (though that matters) -- it's cognitive load. Every phantom resource is something an on-call engineer has to evaluate during an incident. Specific examples of what the TDT found, without exposing proprietary details.  
**LinkedIn hook:** "Your AWS account is full of ghosts. Resources that serve no purpose but still cost you money and attention."

### 8. Why "We Have Terraform" Doesn't Mean What You Think

**Category:** Pattern Recognition  
**Format:** Essay  
**Novel angle:** "We use Terraform" is the new "we have unit tests" -- it's a statement that sounds like maturity but often masks dysfunction. Common patterns: Terraform that was run once and never updated, Terraform that manages 30% of the infrastructure while 70% is still click-ops, Terraform state that's drifted so far from reality that a plan would destroy production. The gap between "we have IaC" and "we practice IaC."  
**LinkedIn hook:** "Your team uses Terraform. But does your infrastructure know that?"

### 9. The Onboarding Metric Trap

**Category:** Philosophy  
**Format:** Field Note  
**Novel angle:** When a cloud enablement team measures success by "teams onboarded" rather than "teams operating well," you optimize for throughput at the expense of quality. Direct observation from working in a team of 20 responsible for onboarding teams onto AWS. The metric incentivizes getting teams in the door, not ensuring they understand what they're building on. McNamara Fallacy in practice.  
**LinkedIn hook:** "We onboarded 50 teams to AWS last quarter. We have no idea how many of them are doing it right."

### 10. Security Findings Nobody Wants to Hear About

**Category:** Field Notes  
**Format:** Field Note  
**Novel angle:** The organizational dynamics of surfacing security issues in a large enterprise. When you build a tool that finds real problems, the political challenge is harder than the technical one. Teams don't want to hear their accounts are misconfigured. Managers don't want their dashboards to turn red. The gap between "we take security seriously" and "we act on security findings." No proprietary details -- focus on the human dynamics.  
**LinkedIn hook:** "The hardest part of building a security scanning tool isn't the scanning. It's what happens after you show people the results."

### 11. Regulated Industries and the Compliance Theater Problem

**Category:** Philosophy / Pattern Recognition  
**Format:** Essay  
**Novel angle:** In healthcare, financial services, and government, compliance often becomes performative -- checkbox exercises that satisfy auditors but don't actually improve security posture. The difference between "compliant" and "secure." Observations from working in a Fortune 23 healthcare company serving regulated populations across multiple countries. How to design infrastructure that is genuinely secure, not just auditable.  
**LinkedIn hook:** "Passing an audit and being secure are two different things. Most regulated companies optimize for the wrong one."

### 12. The Case for Boring Infrastructure

**Category:** Philosophy  
**Format:** Field Note  
**Novel angle:** Counterpoint to the industry obsession with cutting-edge tooling. The most reliable infrastructure is often the most boring -- well-understood services, standard patterns, minimal moving parts. When "boring" is a feature, not a limitation. The cost of chasing novelty in production environments.  
**LinkedIn hook:** "The best infrastructure decision I've made this year was choosing the boring option."

### 13. What Nobody Tells You About Multi-Account AWS Organizations

**Category:** Pattern Recognition  
**Format:** Essay  
**Novel angle:** AWS Well-Architected says use multiple accounts. Nobody explains what happens when you have 800+ of them and 200+ teams operating independently. The governance challenges, the visibility gaps, the emergent behaviors that appear only at scale. Control Tower and Organizations help, but they don't solve the human coordination problem.  
**LinkedIn hook:** "AWS says use multiple accounts. They don't tell you what happens when you have 800 of them."

### 14. Learning in Public: A Postmortem on My Own Code

**Category:** Tool Craft  
**Format:** Essay  
**Novel angle:** Honest assessment of the TDT v1 codebase -- what a non-Python developer building in Python for the first time actually produces, what he'd do differently, and why the code quality issues don't negate the value delivered. A case study in "shipped beats perfect." No proprietary code shown -- focus on patterns, anti-patterns, and lessons learned.  
**LinkedIn hook:** "I built a production tool in a language I was learning. The code has problems. It also found $XX,XXX in waste. Both things are true."

### 15. The Cost of Not Knowing What You Have

**Category:** Field Notes  
**Format:** Field Note  
**Novel angle:** Operational opacity -- when teams don't have a complete inventory of what's running in their AWS accounts. The downstream effects: incident response is slower (what is this resource?), cost optimization is impossible (is this needed?), security posture is unknowable (who has access to what?). The TDT was built specifically to solve this. Frame as the problem, not the solution.  
**LinkedIn hook:** "If you can't list every resource in your AWS account and explain why it exists, you have a visibility problem. Most teams do."

---

## Published

| Topic | Date | URL |
|-------|------|-----|
| (none yet) | | |

---

## Parking Lot (Ideas Not Yet Developed)

- The toil budget: how to quantify and reduce operational toil
- Why your tagging strategy failed (and what to do instead)
- Cross-account networking patterns that actually work at scale
- The SRE hiring problem: what interviews miss
- Infrastructure as documentation: when your IaC is your only source of truth
- Cost anomaly detection: why CloudWatch billing alarms aren't enough

---

*Add topics as they arise. The best posts come from patterns observed in daily work.*
