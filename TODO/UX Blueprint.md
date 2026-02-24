Bittikens.com UX Audit & Improvement Blueprint
Site Review Date: February 24, 2026
Reviewer: Perplexity AI (performing multi-perspective UX audit)
Review Scope: Structure, navigation, visual hierarchy, content tone, and interaction patterns
Priority Focus: Desktop experience optimized for AWS hiring managers, recruiters, and technical peers
Executive Summary
This document provides a comprehensive UX audit of bittikens.com from three audience perspectives: AWS hiring managers (primary), technical recruiters (secondary), and industry peers/enthusiasts (tertiary). The review identifies structural improvements, navigation enhancements, visual hierarchy adjustments, and content refinements to create a more immersive, intuitive experience that demonstrates competence through implementation rather than assertion.
Key Findings
What's Working Well:
    • Flagship project (Programmatic Account Analysis) immediately signals enterprise-scale experience
    • Clean, modern visual design with good use of whitespace
    • Core Technologies section establishes technical credibility quickly
    • AWS-centric focus is clear and appropriate for target audience
Critical Improvements Needed:
    • Landing page structure buries valuable content below fold without scroll indicators
    • Project catalog lacks cohesive organization and discoverability
    • Typography hierarchy creates reading friction (headlines too large, body text too small)
    • Navigation lacks intuitive pathways between related content
    • Forced language ("Professional," "Enterprise") weakens demonstration-over-assertion approach
    • Missing repository links at top of project pages disrupts exploration flow

Part 1: Audience Perspective Reviews
Perspective 1: AWS Hiring Manager (15-Second Evaluation)
Context: Senior engineering leader at AWS-heavy organization, evaluating whether to invest 30 minutes in a phone screen. Scans site for 10-15 seconds to answer: "Is this person competent enough to warrant my time?"
First Impressions (0-10 seconds)
✅ What Works:
    • Title "Infrastructure Platform Engineer | AWS at Enterprise Scale" immediately establishes context
    • Four capability cards (Cloud Architecture, Site Reliability, Technical Mentorship, AI-Assisted Development) signal breadth
    • Flagship project visible immediately with concrete metrics ("800+ AWS accounts," "Fortune 23 healthcare")
    • Clean, professional visual design doesn't distract from content
❌ What Breaks Flow:
    • "Enterprise-grade," "solutions that scale," and similar phrases feel marketing-forward rather than engineering-native
    • Capability card descriptions are abstract benefits rather than concrete capabilities
    • Core Technologies section creates false "end of page" impression—valuable content hidden below
    • No immediate path to GitHub or work samples—hiring manager wants to verify claims with code
10-30 Second Scan (if still engaged)
✅ What Works:
    • Flagship project has enough detail to assess complexity (account analysis, security misconfigurations, cost optimization)
    • "Currently rebuilding with v1 lessons" signals iteration mindset
    • Core Technologies logos provide quick technical stack verification
❌ What Breaks Flow:
    • Supporting Projects section uses oversized generic placeholder images that dwarf actual project information
    • Project titles in small overlay text are hard to read—visual hierarchy inverted
    • No clear indicator that more projects exist below visible area
    • "View All Articles" and "Core Technologies" create ambiguous navigation—unclear what each does
    • Missing quick-access repository links
Decision Point
After 15 seconds, hiring manager forms hypothesis: "This person has relevant scale experience and technical depth, but site navigation is frustrating. Worth a conversation, but unclear how much depth exists beyond flagship project."
Key Opportunity: Site demonstrates competence in first 10 seconds but loses momentum due to navigation friction and buried content.

Perspective 2: Technical Recruiter (60-Second Scan)
Context: Technical recruiter for AWS-focused roles, scanning to determine if candidate matches job requirements and has compelling narrative for hiring manager handoff. Looking for: technical keywords, career progression, communication clarity, and "feel."
First Impressions (0-20 seconds)
✅ What Works:
    • Clean, modern design signals attention to detail and professionalism
    • Title and capability cards provide easy talking points for candidate submission
    • Flagship project gives compelling story hook: "managed infrastructure across 800+ AWS accounts"
    • Core Technologies section provides keyword checklist (Python, Terraform, AWS services)
❌ What Breaks Flow:
    • Capability card language ("solutions that scale," "governance solutions") is vague—recruiter can't extract specific talking points
    • No clear employment history visible on landing page—recruiter must hunt for experience/resume
    • Supporting Projects section is visually overwhelming—large cards with minimal information make it hard to extract value
    • Unclear how to navigate to full portfolio or resume
    • Missing email contact or LinkedIn link at top—recruiter wants easy outreach path
20-60 Second Exploration (if still engaged)
✅ What Works:
    • If recruiter finds Experience page, clean presentation of work history with concrete achievements
    • Project pages (when found) have good structure: Problem → Approach → Outcome
    • Repository links validate technical credibility
❌ What Breaks Flow:
    • Navigation to Experience page not obvious from landing page
    • Projects page doesn't list all public projects—inconsistent catalog
    • Individual project pages bury repository link—recruiter wants quick GitHub verification
    • Tags section feels redundant—unclear if tags are clickable or informational
    • Hovering "← All Projects" turns text invisible—broken interaction disrupts navigation
    • No downloadable resume/PDF—recruiter needs shareable document for hiring manager
Decision Point
After 60 seconds, recruiter forms impression: "Strong technical background with relevant AWS experience, but site navigation is frustrating. Will need to hunt for resume and GitHub. Candidate seems competent but website UX undermines professional impression."
Key Opportunity: Site has strong content but poor information architecture prevents recruiter from efficiently extracting and packaging candidate value.

Perspective 3: First-Time LinkedIn Visitor (30-Second Curiosity Check)
Context: Industry peer or passive job seeker who clicked through from LinkedIn post. Casually curious, low commitment, easily distracted. Looking for: "Is this interesting enough to keep reading?"
First Impressions (0-15 seconds)
✅ What Works:
    • Modern, clean design creates positive first impression
    • Flagship project immediately establishes credibility—concrete numbers and real-world scale
    • Core Technologies section provides quick technical alignment check
    • Site loads quickly and feels responsive
❌ What Breaks Flow:
    • Title "Infrastructure Platform Engineer | AWS at Enterprise Scale" feels formal/corporate—might not resonate with casual visitor
    • Capability cards use enterprise-speak that doesn't invite exploration
    • No obvious hook for "why should I care" beyond professional credentials
    • Core Technologies section signals "end of content"—visitor likely doesn't scroll further
    • No visible blog, articles, or thought leadership content—unclear if site offers learning value
15-30 Second Exploration (if still engaged)
✅ What Works:
    • If visitor scrolls, Supporting Projects section shows breadth of work
    • Clean visual design maintains engagement
❌ What Breaks Flow:
    • Supporting Projects use generic placeholder images—feels template-default rather than intentional
    • Project navigation unclear—visitor unsure how to explore further
    • No clear "things to learn here" signal—site feels like resume rather than resource
    • Missing blog or insights section—no reason to return or bookmark
    • Social proof absent—no testimonials, case studies, or community engagement indicators
Decision Point
After 30 seconds, visitor forms impression: "Competent AWS engineer with relevant experience, but site is pure resume/portfolio. Nothing to learn or engage with. Won't return unless I'm hiring."
Key Opportunity: Site currently serves as static portfolio. To engage peers/enthusiasts, needs content that provides value beyond showcasing credentials.

Part 2: Structural & Navigation Issues
Issue 1: Landing Page Content Hierarchy
Problem:
Core Technologies section creates false "end of page" impression. Valuable Supporting Projects section is buried below fold with no scroll indicator, leading to low discoverability.
Impact:
    • Hiring managers miss breadth of project portfolio
    • Recruiters don't see full scope of work
    • Casual visitors bounce before seeing additional content
Recommendation:
Restructure landing page to signal depth and encourage exploration:
    1. Add scroll indicator after Core Technologies (subtle animated arrow or "Explore Projects ↓" text)
    2. Reposition Core Technologies to bottom of page (becomes closing summary rather than false ending)
    3. Elevate Supporting Projects to appear immediately after Flagship project
    4. Add section heading "Additional Projects & Infrastructure Work" to signal more content exists
Alternative Approach:
Create dedicated Projects catalog page and replace Supporting Projects section with clear CTA: "View Complete Project Portfolio →"

Issue 2: Project Organization & Discoverability
Problem:
Projects lack cohesive organizational structure. No clear taxonomy, hierarchy, or relationship mapping. Projects page doesn't list all public projects. Individual projects exist in isolation without clear connections.
Impact:
    • Hiring managers struggle to understand how projects fit together
    • Recruiters can't articulate project relationships in candidate narrative
    • Visitors miss demonstration of systems thinking and architectural judgment
Recommendation:
Create project catalog with clear hierarchical organization:
    1. Group projects into logical categories:
        ◦ Foundation Infrastructure (bootstrap, IAM, OIDC)
        ◦ Application Platforms (website infrastructure, hosting)
        ◦ Operational Tools (account analysis, monitoring)
        ◦ Integration Demonstrations (this website as capstone)
    2. Add visual relationship diagram:
        ◦ Hierarchical infrastructure diagram showing project dependencies
        ◦ Each project as clickable node with title + one-line description
        ◦ Visual connections showing how projects integrate
    3. Implement contextual navigation:
        ◦ "Related Projects" section on each project page
        ◦ "This project uses: [Foundation Bootstrap] [OIDC Auth] [Website Infrastructure]" with clickable links
        ◦ "Projects that build on this: [Professional Website Platform]" showing dependent projects
    4. Create unified project catalog page:
        ◦ Complete list of all public projects
        ◦ Filterable by technology, type, or complexity
        ◦ Consistent card format with key details visible

Issue 3: Typography & Reading Hierarchy
Problem:
Desktop typography creates reading friction. Section headings (The Problem, Approach, Outcome) are too large relative to body text, making transition from headline to paragraph difficult. Body text is slightly too small for comfortable extended reading.
Impact:
    • Hiring managers experience eye strain when reading project details
    • Reading flow is disrupted by extreme size contrast
    • Content feels less accessible and professional
Recommendation:
Adjust typography scale for better reading rhythm:
    1. Page titles: Reduce from current size by ~15%
    2. Section headings: Reduce by ~25% (currently too dominant)
    3. Body text: Increase by ~10% (from ~14px to ~16px equivalent)
    4. Line height: Increase body text line height to 1.6-1.8 for improved readability
    5. Section heading weight: Reduce font weight from bold to semi-bold to soften visual hierarchy
Target hierarchy: Page title should be prominent but not overwhelming. Section headings should clearly organize content without dominating. Body text should be comfortable for extended reading.

Issue 4: Navigation & Link Behavior
Problem:
Multiple navigation friction points disrupt user flow:
    • Repository links buried at bottom of project pages (should be at top)
    • External links navigate away from site (should open new tab)
    • "← All Projects" hover state turns text invisible
    • GitHub Profile link goes to general profile (should go to repositories filter)
    • No consistent "back" navigation pattern
Impact:
    • Users lose context when exploring external resources
    • Hiring managers frustrated by having to hunt for repository links
    • Broken hover states signal lack of polish
    • Navigation friction increases bounce rate
Recommendation:
    1. Repository links at top of project pages:
        ◦ Add "View Repository →" button immediately after project title
        ◦ Use button styling (not pill) to signal primary action
        ◦ Open in new tab with target="_blank" rel="noopener noreferrer"
    2. Fix all external link behavior:
        ◦ GitHub links open in new tab
        ◦ Repository links open in new tab
        ◦ Internal site navigation stays in same tab
    3. Fix hover states:
        ◦ "← All Projects" should remain visible on hover
        ◦ Consider adding subtle background highlight on hover instead of color change
    4. Update GitHub Profile link:
        ◦ Change destination to <https://github.com/stephenabbot?tab=repositories>
        ◦ Ensures visitors land on work samples, not generic profile
    5. Add breadcrumb navigation:
        ◦ Show current location: "Home > Projects > Website Infrastructure"
        ◦ Each segment clickable for quick navigation

Issue 5: Pills vs Buttons & Interactive Elements
Problem:
Current design uses "pills" (rounded capsule shapes) for multiple purposes: tags, navigation, and actions. This creates ambiguity about what is clickable and what is informational. "View All Articles" competes with Core Technologies section, causing navigation confusion.
Impact:
    • Users uncertain which elements are interactive
    • Tags section looks clickable but may not be (creates false affordance)
    • Primary actions (navigation, external links) don't have clear visual priority
    • Inconsistent interaction patterns across site
Recommendation:
    1. Replace pills with buttons for primary actions:
        ◦ "View Repository" → Button with clear affordance
        ◦ "View All Articles" → Button styling
        ◦ "View All Projects" → Button styling
        ◦ Use consistent button styling: solid background, clear hover state, appropriate padding
    2. Tags section clarity:
        ◦ If tags are informational only: Remove pill styling, use plain text with subtle background
        ◦ If tags are clickable: Make destination clear ("View all projects using [Python]")
        ◦ Consider removing "Tags" label entirely—redundant when visual treatment is clear
    3. Differentiate navigation from content:
        ◦ Navigation links: Text links with underline on hover
        ◦ Primary actions: Buttons with solid background
        ◦ Metadata/tags: Subtle treatment, clearly non-interactive
        ◦ External resources: Button with external link icon
    4. Resolve "View All Articles" vs Core Technologies ambiguity:
        ◦ If articles exist: Move "View All Articles" to primary navigation
        ◦ If no articles yet: Remove this CTA until content exists
        ◦ Core Technologies should be clearly labeled as informational section

Issue 6: Resume Page & Contact Flow
Problem:
Resume/Experience page lacks downloadable PDF, making it difficult for recruiters to share with hiring managers. Contact section is present but missing primary action (email). GitHub Profile link goes to general profile instead of repositories.
Impact:
    • Recruiters must manually copy/paste experience into emails or ATS systems
    • Hiring managers can't easily forward candidate information to colleagues
    • Missing email contact increases friction for outreach
    • GitHub link destination doesn't showcase actual work
Recommendation:
    1. Add downloadable resume PDF:
        ◦ Place prominent "Download Resume PDF →" button at top of Experience page
        ◦ Use trusted HTML-to-PDF converter (e.g., Puppeteer, wkhtmltopdf, or design in LaTeX)
        ◦ Alternative: Create PDF manually in design tool (Figma, Canva) for full control
        ◦ Ensure PDF formatting is professional and ATS-friendly
    2. Contact section improvements:
        ◦ Move email contact to first position (most important action)
        ◦ Add clear "Send Email" button (not just display address)
        ◦ Consider simple contact form if you want to filter/organize inquiries
        ◦ Add LinkedIn profile link alongside GitHub
    3. Fix GitHub Profile link:
        ◦ Update destination to: <https://github.com/stephenabbot?tab=repositories>
        ◦ This showcases actual work immediately instead of generic profile
    4. Add contact CTA to landing page:
        ◦ Consider adding subtle contact link in header/footer
        ◦ "Interested in working together? Let's talk →"

Part 3: Content & Tone Refinements
Issue 7: Forced "Enterprise" Language
Problem:
Repeated use of "enterprise-grade," "professional," "solutions that scale," and similar phrases feels marketing-forward rather than engineering-native. This language tells rather than shows, weakening the demonstration-over-assertion approach that is the site's core strength.
Impact:
    • Hiring managers perceive content as over-marketed
    • Engineering peers find tone inauthentic
    • Demonstration value of actual implementations is diluted by marketing language
    • Competence is asserted rather than evident through work
Current Examples of Forced Language:
    1. Landing Page Capability Cards:
        ◦ "AWS infrastructure design with enterprise-grade security and cost optimization"
        ◦ "Observability, automation, and governance solutions that scale"
        ◦ "Guiding teams through complex infrastructure challenges"
    2. Project Pages:
        ◦ "enterprise-grade hosting solutions"
        ◦ "Professional Website Platform" (title)
        ◦ "Enterprise CI/CD Pipeline"
        ◦ "Enterprise Readiness" (section heading)
        ◦ "living proof of enterprise infrastructure capabilities"
Recommendation:
Replace marketing language with concrete technical descriptions and outcomes. Let the work demonstrate scale, professionalism, and enterprise readiness without labeling it explicitly.
Revised Landing Page Capability Cards:
Before:
    • "AWS infrastructure design with enterprise-grade security and cost optimization"
After:
    • "AWS infrastructure design with IAM governance, cost analysis, and security compliance automation"
Why better: Concrete capabilities replace vague promise. Hiring manager immediately knows what you do.

Before:
    • "Observability, automation, and governance solutions that scale"
After:
    • "Observability frameworks using CloudWatch, OpenTelemetry, and distributed tracing for multi-account environments"
Why better: Specific technologies and context replace generic claim. Demonstrates actual implementation knowledge.

Before:
    • "Guiding teams through complex infrastructure challenges"
After:
    • "Technical mentorship: infrastructure architecture, migration strategies, and operational best practices"
Why better: Concrete areas of mentorship replace vague "guidance." More actionable for hiring managers.

Before:
    • "Leveraging AI tools for accelerated infrastructure design and solution architecture"
After:
    • "AI-assisted infrastructure development: using LLMs for code generation, architecture review, and documentation"
Why better: Specific use cases replace generic "leveraging." Shows intentional, thoughtful AI integration.

Revised Project Page Language:
Before:
    • "This isn't just website hosting - it's infrastructure that scales with business needs."
After:
    • "Dynamic domain discovery through filesystem scanning allows adding new domains with minimal configuration changes."
Why better: Technical implementation detail demonstrates scalability rather than claiming it.

Before:
    • "This project demonstrates how to build enterprise-grade hosting solutions that are both cost-effective and operationally efficient."
After:
    • "This multi-domain hosting infrastructure operates at ~$3/month while providing global CDN distribution, automated SSL management, and zero-downtime deployments."
Why better: Concrete metrics and capabilities demonstrate value. "Enterprise-grade" is implied by features, not stated.

Before:
    • "Living proof of enterprise infrastructure capabilities"
After:
    • "This website demonstrates complete infrastructure integration from foundation bootstrap through application deployment."
Why better: Describes what is demonstrated. "Enterprise" label removed—competence evident from scope.

Before (Section Heading):
    • "Enterprise Readiness"
After:
    • "Production Deployment Patterns"
Why better: Focuses on concrete patterns rather than abstract readiness. More engineering-native language.

Before:
    • "This project serves as the capstone demonstration of how all foundation projects work together to deliver a complete, production-ready solution."
After:
    • "This website integrates all foundation projects: S3 backend, OIDC authentication, IAM roles, website infrastructure, and service discovery through SSM Parameter Store."
Why better: Lists specific integrations. Technical reader understands scope immediately.

Issue 8: Capability Card Abstraction
Problem:
Landing page capability cards describe benefits ("solutions that scale," "guiding teams") rather than concrete capabilities. This forces hiring managers to infer technical depth rather than seeing it directly.
Impact:
    • Hiring managers must work harder to extract technical qualifications
    • Cards feel like marketing copy rather than technical summary
    • Specific competencies hidden behind abstract language
Recommendation:
Rewrite capability cards to lead with concrete technical skills and technologies, followed by brief context.
Revised Capability Cards:
Cloud Architecture
Before:
AWS infrastructure design with enterprise-grade security and cost optimization
After:
Multi-account AWS architecture using Organizations, Control Tower, and Service Control Policies. Infrastructure as Code with Terraform and CloudFormation. Security compliance automation and cost governance frameworks.
Why better: Hiring manager immediately sees AWS organizational structure experience, IaC tools, and governance capabilities. Concrete and scannable.

Site Reliability
Before:
Observability, automation, and governance solutions that scale
After:
Observability with CloudWatch, OpenTelemetry, and distributed tracing. CI/CD automation using GitHub Actions and OIDC authentication. Multi-account resource tagging and compliance monitoring.
Why better: Specific tools and patterns. Hiring manager can match against job requirements immediately.

Technical Mentorship
Before:
Guiding teams through complex infrastructure challenges
After:
Architecture reviews, migration strategy development, and operational best practices coaching. Focus on infrastructure modernization, containerization adoption, and observability implementation.
Why better: Concrete mentorship areas. Hiring manager understands specific value you bring to teams.

AI-Assisted Development
Before:
Leveraging AI tools for accelerated infrastructure design and solution architecture
After:
LLM-assisted code generation, architecture review, and documentation creation. AI collaboration for rapid prototyping and infrastructure pattern development. Demonstrated by 10-hour website build with AI.
Why better: Specific applications of AI tools with concrete example (10-hour website build). Shows practical implementation rather than buzzword adoption.

Issue 9: Project Page Template Language
Problem:
Project pages contain standardized phrases that appear across multiple projects: "This isn't just X - it's Y," "Living proof of Z," "Demonstrates the complete W." This repetitive framing weakens individual project narratives and feels formulaic.
Impact:
    • Hiring managers notice repetition, reducing perceived authenticity
    • Each project loses unique voice and specific context
    • Template language suggests content was generated rather than crafted
    • Demonstrations feel marketed rather than naturally evident
Recommendation:
Remove template phrases entirely. Let project descriptions stand on technical merit without meta-commentary about what they demonstrate.
General Principles:
    1. Start with the technical problem, not the demonstration claim
    2. Describe implementation directly, not what the implementation proves
    3. Use concrete metrics and outcomes, not interpretive framing
    4. Let integration patterns be evident from technical description
    5. Remove "this demonstrates," "living proof," and similar meta-statements
Example Rewrites:
Before (Website Infrastructure project):
"This isn't just website hosting - it's infrastructure that scales with business needs."
"This infrastructure demonstrates how to build enterprise-grade hosting solutions that are both cost-effective and operationally efficient, serving as a foundation for any organization's web presence."
After:
Remove these sentences entirely. The technical description (S3, CloudFront, Route53, ACM, automated deployment) already demonstrates scalability and cost-effectiveness. No meta-commentary needed.

Before (Professional Website Platform project):
"This project serves as the capstone demonstration of how all foundation projects work together to deliver a complete, production-ready solution."
"This isn't just a website - it's living proof of enterprise infrastructure capabilities."
After:
"This website integrates foundation projects into a complete deployment pipeline: S3 backend, OIDC authentication, IAM deployment roles, website infrastructure, and SSM Parameter Store service discovery."
Why better: States integration directly. "Capstone" and "living proof" removed—integration is self-evident.

Before (Account Analysis project - hypothetical example):
"This demonstrates the ability to build scalable analysis platforms that provide visibility across complex multi-account environments."
After:
"Python/PostgreSQL platform analyzing 800+ AWS accounts for cost optimization, security misconfigurations, and compliance gaps. Deployed across 40+ accounts at Fortune 23 healthcare company."
Why better: Concrete scope and scale. Capability evident from description.

Issue 10: Section Heading Specificity
Problem:
Some section headings use vague or marketing-forward language that doesn't help readers navigate content: "The Scalability Story," "The Demonstration Value," "Show Don't Tell Philosophy."
Impact:
    • Hiring managers scanning content struggle to find specific technical information
    • Headings don't aid navigation or content comprehension
    • Professional tone undermined by storytelling-style headings
Recommendation:
Replace narrative-style headings with descriptive, technical headings that clearly identify section content.
Examples:
Current Heading Revised Heading Rationale
"The Scalability Story" "Dynamic Domain Management" Describes technical feature, not meta-narrative
"The Demonstration Value" "Production Deployment Patterns" Focuses on content, not interpretation
"Show Don't Tell Philosophy" "Live Infrastructure Integration" Concrete description of what section contains
"The Integration Challenge" "Multi-Layer Infrastructure Integration" Technical problem statement, not narrative setup

Part 4: Visual & Interaction Design
Issue 11: Supporting Projects Visual Treatment
Problem:
Supporting Projects section uses large placeholder images (default project templates) with project names overlaid in small text in upper right corner. Visual hierarchy is inverted—images dominate while project information is minimized.
Impact:
    • Project content is hard to read and scan
    • Visual treatment detracts from projects rather than highlighting them
    • Section feels template-default rather than intentionally designed
    • Hiring managers struggle to extract project information quickly
Recommendation:
Redesign project cards to prioritize information over imagery:
Option 1: Text-Forward Cards
    • Remove or significantly reduce image size
    • Lead with project name (large, readable)
    • Include one-line description
    • Show 2-3 key technologies as small badges
    • Link entire card to project page
    • Minimal, clean design that prioritizes content
Option 2: Icon-Based Cards
    • Replace generic images with simple, relevant icons
    • AWS service icons for infrastructure projects
    • Technology logos for tool-specific projects
    • Much smaller icon size (supporting, not dominant)
    • Text remains primary focus
Option 3: Remove Images Entirely
    • Simple text-based list with hover effects
    • Project name + one-line description
    • Technology badges
    • Clean, scannable, information-dense
Recommended Approach: Option 1 (text-forward cards) with optional small icons if they add clarity without dominating.

Issue 12: Mobile Navigation & Viewport Optimization
Problem:
While desktop is priority, mobile experience must remain intuitive. Current design doesn't account for mobile-specific navigation patterns (smaller viewport, thumb-driven navigation, sequential content consumption).
Impact:
    • LinkedIn mobile visitors experience friction
    • Hiring managers reviewing on phone between meetings face usability issues
    • Site appears desktop-only, suggesting lack of modern responsive design consideration
Recommendation:
Mobile-specific optimizations (that don't compromise desktop experience):
    1. Hamburger menu for mobile:
        ◦ Collapsible navigation for small viewports
        ◦ Primary sections clearly visible
        ◦ Contact/GitHub links easily accessible
    2. Typography adjustments:
        ◦ Larger touch targets (minimum 44x44px for buttons)
        ◦ Increased line height for mobile readability
        ◦ Reduced heading size contrast (even more important on small screens)
    3. Simplified mobile landing page:
        ◦ Consider hiding Core Technologies section on mobile (move to Projects page)
        ◦ Streamline capability cards to single column with reduced content
        ◦ Ensure CTA buttons are thumb-friendly size
    4. Test critical paths on mobile:
        ◦ Landing page → Project page → Repository link
        ◦ Landing page → Resume → Download PDF
        ◦ Verify hover states become touch states appropriately

Issue 13: Scroll Indicators & Content Discovery
Problem:
No visual indicator that content exists below Core Technologies section. Users who don't scroll miss Supporting Projects and additional content entirely.
Impact:
    • Low discoverability of full project portfolio
    • Hiring managers form incomplete picture of capabilities
    • Bounce rate likely higher than necessary
Recommendation:
Add subtle scroll indicators and visual cues:
    1. Animated scroll indicator:
        ◦ Small downward arrow or "↓ Explore More" text
        ◦ Subtle animation (pulse or bounce)
        ◦ Positioned after Core Technologies section
        ◦ Fades out on scroll or disappears after first scroll
    2. Visual continuity:
        ◦ Ensure content visually "bleeds" at bottom of viewport
        ◦ Partially visible next section indicates more content below
        ◦ Avoid hard visual stops that suggest end of page
    3. Section counter:
        ◦ Optional: "1/3" indicator showing current section
        ◦ Subtle dots indicating scroll depth
        ◦ Common pattern, especially for landing pages

Part 5: Content Gaps & Future Opportunities
Issue 14: Blog/Thought Leadership Absence
Problem:
Site currently functions as static portfolio/resume. No blog, articles, or thought leadership content. For peer/enthusiast audience (future primary audience), there's no reason to return or bookmark site.
Impact:
    • Limited engagement beyond job-seeking context
    • No demonstration of communication skills or ability to distill complex topics
    • Missed opportunity to build technical credibility through teaching
    • No organic traffic or SEO benefits from content creation
Recommendation:
Plan blog/content section for future iterations:
    1. Content types that align with site goals:
        ◦ Technical deep-dives: "How I built X" with code examples
        ◦ Architecture decision records: Public ADRs explaining design choices
        ◦ Problem-solving narratives: Real challenges and solutions
        ◦ Tool comparisons: "When to use X vs Y" based on experience
        ◦ Cost optimization case studies: Concrete savings examples
    2. Integration strategy:
        ◦ Add "Insights" or "Writing" to primary navigation
        ◦ Feature latest article on landing page (below projects)
        ◦ Cross-link articles from related projects
        ◦ RSS feed for subscribers
    3. Content priority for target audiences:
        ◦ Hiring managers: Architecture decision rationale, scale challenges
        ◦ Recruiters: Success stories, team collaboration examples
        ◦ Peers: Actionable technical guides, lessons learned
    4. Initial content ideas (based on existing projects):
        ◦ "Multi-Account AWS Infrastructure: Lessons from 800+ Accounts"
        ◦ "Building a $3/Month Multi-Domain Hosting Platform"
        ◦ "OIDC Authentication for GitHub Actions: Security Without Secrets"
        ◦ "AI-Assisted Infrastructure Development: 10-Hour Website Build"

Issue 15: Social Proof & Credibility Signals
Problem:
No testimonials, recommendations, case study outcomes, or external validation. All credibility is self-asserted through project descriptions.
Impact:
    • Hiring managers lack third-party validation
    • Recruiters miss compelling narrative elements
    • Site feels one-dimensional (capability claims without external confirmation)
Recommendation:
Add strategic credibility signals (for future iterations):
    1. LinkedIn recommendations:
        ◦ Select 2-3 strong recommendations from LinkedIn
        ◦ Display with person's role and company
        ◦ Link to full LinkedIn profile
    2. Project outcomes (quantified):
        ◦ "Reduced infrastructure costs by 40% through automated resource optimization"
        ◦ "Improved deployment time from 45 minutes to 3 minutes"
        ◦ "Eliminated security compliance gaps across 40+ accounts"
    3. Speaking/community engagement:
        ◦ Conference talks (if applicable)
        ◦ Open source contributions
        ◦ Community forum participation
    4. Certifications (if relevant):
        ◦ AWS certifications with badge
        ◦ Other industry certifications
        ◦ Only include if recent and relevant (avoid certification spam)

Part 6: Quick Wins (Implementation This Week)
These changes can be implemented quickly and provide immediate UX improvements:
Quick Win 1: Repository Links at Top of Project Pages
Time: 30 minutes
Impact: High
Implementation: Add "View Repository →" button immediately after project title on all project pages. Use button styling, open in new tab.
Quick Win 2: Fix "← All Projects" Hover State
Time: 15 minutes
Impact: Medium
Implementation: Update CSS to maintain text visibility on hover. Consider background highlight instead of color change.
Quick Win 3: Update GitHub Profile Link Destination
Time: 5 minutes
Impact: Medium
Implementation: Change link from github.com/stephenabbot to github.com/stephenabbot?tab=repositories
Quick Win 4: Add Scroll Indicator After Core Technologies
Time: 1 hour
Impact: High
Implementation: Add animated "↓ Explore More Projects" indicator after Core Technologies section with subtle bounce animation.
Quick Win 5: Body Text Size Increase
Time: 30 minutes
Impact: Medium
Implementation: Increase body text from ~14px to ~16px. Test across all pages. Adjust line height to 1.6-1.8.
Quick Win 6: Remove One "Enterprise-Grade" Instance
Time: 10 minutes
Impact: Low (but starts tone shift)
Implementation: Pick one obvious instance of "enterprise-grade" or "professional" and replace with concrete technical description. Test reception.
Quick Win 7: Add Email Contact to Resume Page
Time: 30 minutes
Impact: Medium
Implementation: Move email to top of Contact section with clear "Send Email" button or mailto link.
Quick Win 8: Section Heading Size Reduction
Time: 30 minutes
Impact: Medium
Implementation: Reduce section heading font size by ~25%. Reduce weight from bold to semi-bold. Test reading flow.
Quick Win 9: External Links Open in New Tab
Time: 30 minutes
Impact: Medium
Implementation: Audit all external links (GitHub, repositories). Add target="_blank" rel="noopener noreferrer". Verify internal links stay in same tab.
Quick Win 10: Remove "Tags" Label from Project Pages
Time: 5 minutes
Impact: Low
Implementation: If tags are informational only, remove "Tags:" label. Visual treatment makes purpose clear without label.

Part 7: Implementation Priorities
Phase 1: Critical Navigation & Structure (This Week)
    1. Repository links at top of project pages
    2. Fix hover states (All Projects link)
    3. External links open in new tab
    4. Update GitHub Profile link destination
    5. Body text size increase
    6. Section heading size reduction
    7. Add scroll indicator after Core Technologies
Goal: Remove navigation friction and improve readability immediately.

Phase 2: Landing Page Restructure (Week 2)
    1. Reposition Core Technologies to bottom of landing page
    2. Elevate Supporting Projects section
    3. Redesign project cards (text-forward approach)
    4. Add "View Complete Portfolio →" CTA if appropriate
    5. Revise capability card language (concrete vs abstract)
Goal: Improve content hierarchy and discoverability.

Phase 3: Project Organization & Catalog (Week 3-4)
    1. Create unified project catalog page
    2. Group projects into logical categories
    3. Add "Related Projects" sections to individual project pages
    4. Create visual project relationship diagram
    5. Ensure all public projects are listed
Goal: Make project relationships clear and improve navigation between related work.

Phase 4: Content Tone Refinement (Week 4-5)
    1. Remove "enterprise-grade," "professional," forced language across all pages
    2. Replace marketing phrases with concrete technical descriptions
    3. Remove meta-commentary ("this demonstrates," "living proof")
    4. Update section headings to be descriptive vs narrative
    5. Revise project page template language
Goal: Shift from telling to showing. Let implementations demonstrate competence.

Phase 5: Resume & Contact Optimization (Week 5)
    1. Create downloadable resume PDF
    2. Add prominent download button to Experience page
    3. Improve Contact section (email first, clear CTAs)
    4. Add contact option to landing page
    5. Consider simple contact form
Goal: Remove friction for recruiters and hiring managers.

Phase 6: Mobile Optimization (Week 6)
    1. Test all critical user flows on mobile devices
    2. Implement responsive navigation (hamburger menu)
    3. Adjust typography for mobile readability
    4. Verify touch targets meet minimum size requirements
    5. Streamline mobile landing page if needed
Goal: Ensure mobile experience is intuitive and usable.

Phase 7: Future Content Strategy (Ongoing)
    1. Plan blog/insights section architecture
    2. Draft initial article topics
    3. Integrate blog into navigation
    4. Cross-link articles from projects
    5. Consider social proof additions (testimonials, outcomes)
Goal: Transform site from static portfolio to engaging resource.

Part 8: Success Metrics
How to Measure UX Improvements
Qualitative Indicators:
    • Fewer "where do I find X?" questions from visitors
    • Positive feedback on site navigation and readability
    • Recruiters able to extract information efficiently
    • Hiring managers spending more time exploring projects
Quantitative Metrics (if analytics available):
    • Reduced bounce rate on landing page
    • Increased scroll depth (indicating discovery of Supporting Projects)
    • Higher click-through rate to project pages
    • More GitHub profile visits from site
    • Longer average session duration
    • Higher pages per session (improved navigation encourages exploration)
A/B Testing Opportunities:
    • Capability card language: Abstract vs concrete
    • Project card visual treatment: Image-heavy vs text-forward
    • Core Technologies position: Middle vs bottom of landing page

Appendix A: Specific Text Revisions
Landing Page - Capability Cards (Complete Rewrite)
Card 1: Cloud Architecture
Current:
Cloud Architecture
AWS infrastructure design with enterprise-grade security and cost optimization
Revised:
Cloud Architecture
Multi-account AWS environments using Organizations, Control Tower, and SCPs. Infrastructure as Code with Terraform and CloudFormation. Security compliance automation and cost governance.

Card 2: Site Reliability
Current:
Site Reliability
Observability, automation, and governance solutions that scale
Revised:
Site Reliability
Observability with CloudWatch, OpenTelemetry, and distributed tracing. CI/CD automation using GitHub Actions with OIDC authentication. Multi-account resource tagging and compliance monitoring.

Card 3: Technical Mentorship
Current:
Technical Mentorship
Guiding teams through complex infrastructure challenges
Revised:
Technical Mentorship
Architecture reviews, migration strategy, and operational best practices. Focus on infrastructure modernization, containerization adoption, and observability implementation.

Card 4: AI-Assisted Development
Current:
AI-Assisted Development
Leveraging AI tools for accelerated infrastructure design and solution architecture
Revised:
AI-Assisted Development
LLM-assisted code generation, architecture review, and documentation. AI collaboration for rapid prototyping and infrastructure pattern development. This website built in 10 hours using AI.

Project Pages - Remove Template Phrases
Phrases to Remove Entirely:
    • "This isn't just X - it's Y"
    • "Living proof of Z"
    • "Demonstrates the complete W"
    • "This project demonstrates"
    • "Capstone demonstration"
    • "Enterprise-grade" (replace with specific capabilities)
    • "Professional" (replace with specific technical context)
    • "Solutions that scale" (replace with specific scaling mechanisms)
Replace With:
    • Direct technical descriptions
    • Concrete implementation details
    • Specific technologies and patterns
    • Measurable outcomes and metrics
    • Integration points and dependencies

Section Headings - Specificity Improvements
Current Heading Issue Revised Heading
"The Scalability Story" Narrative, not descriptive "Dynamic Domain Management"
"The Demonstration Value" Meta-commentary "Production Deployment Patterns"
"Show Don't Tell Philosophy" Meta-commentary "Live Infrastructure Integration"
"The Integration Challenge" Generic "Multi-Layer Infrastructure Integration"
"Enterprise Readiness" Marketing-forward "Production Deployment Patterns"
"Complete Foundation Integration" Vague "Foundation Project Dependencies"
"Living Proof of Architecture" Marketing-forward "Integrated Infrastructure Components"

Appendix B: Visual Design Specifications
Typography Scale (Recommended)
Desktop:
    • Page titles: 2.5rem (40px) → reduce to 2.25rem (36px)
    • Section headings: 2rem (32px) → reduce to 1.5rem (24px)
    • Subsection headings: 1.5rem (24px) → keep at 1.5rem
    • Body text: 0.875rem (14px) → increase to 1rem (16px)
    • Small text/captions: 0.75rem (12px) → keep at 0.75rem
Mobile:
    • Page titles: 2rem (32px)
    • Section headings: 1.25rem (20px)
    • Body text: 1rem (16px)
    • Small text: 0.75rem (12px)
Line Height:
    • Body text: 1.6-1.8 (increased from current ~1.5)
    • Headings: 1.2-1.3
Font Weight:
    • Page titles: 700 (bold)
    • Section headings: 600 (semi-bold) - reduced from 700
    • Body text: 400 (regular)

Button Specifications
Primary Action Buttons:
    • Padding: 12px 24px
    • Border radius: 6px
    • Font size: 1rem (16px)
    • Font weight: 500 (medium)
    • Background: Solid color (site accent color)
    • Text: White or high-contrast color
    • Hover: Slight darkening (10-15%)
    • Transition: 200ms ease
Examples:
    • "View Repository →"
    • "Download Resume PDF →"
    • "View All Projects →"
Secondary Action Buttons:
    • Padding: 10px 20px
    • Border radius: 6px
    • Font size: 0.9375rem (15px)
    • Font weight: 500
    • Background: Transparent with border
    • Border: 2px solid (site accent color)
    • Text: Site accent color
    • Hover: Background fills with accent color, text inverts

Project Card Specifications (Text-Forward Design)
Card Structure:
    • Max width: 350px
    • Padding: 24px
    • Border: 1px solid (subtle gray)
    • Border radius: 8px
    • Background: White/subtle background
    • Hover: Subtle shadow + slight scale (1.02)
Card Content:
    • Project name: 1.25rem (20px), weight 600
    • One-line description: 0.9375rem (15px), weight 400, line-height 1.5
    • Technology badges: Small pills with subtle background
    • Entire card clickable (link wraps card)
Optional Icon:
    • Size: 40px x 40px
    • Position: Top left or above title
    • Treatment: Simple, monochrome or subtle color
    • Purpose: Recognition aid, not visual focus

Conclusion
This audit identifies structural, navigational, and content improvements to transform bittikens.com from a functional portfolio into an immersive, intuitive experience that demonstrates competence through implementation. Priority recommendations focus on:
    1. Navigation friction removal - Repository links accessible, external links behave correctly, hover states functional
    2. Content hierarchy - Landing page structure signals depth, projects organized cohesively
    3. Readability - Typography adjusted for comfortable extended reading
    4. Tone refinement - Replace marketing language with concrete technical descriptions
    5. Mobile optimization - Ensure responsive experience is intuitive
By implementing Quick Wins this week and following phased implementation priorities, the site will better serve AWS hiring managers (primary audience), technical recruiters (secondary), and eventually industry peers (tertiary) as thought leadership content develops.
The core strength of the site—demonstrating competence through working implementations—remains intact. These improvements amplify that strength by removing friction, improving discoverability, and letting the work speak for itself without forced interpretation.
