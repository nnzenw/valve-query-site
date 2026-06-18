// Static Blog data — SEO long-tail content (English)
// Following SEO_STRATEGY.md: Professional Technical Content
// Tone: Professional, Technical, Objective, Authoritative

export const blogPosts = [
  {
    slug: "ball-valve-vs-globe-valve",
    title: "Ball Valve vs Globe Valve: A Comprehensive Technical Comparison",
    metaTitle: "Ball Valve vs Globe Valve: Which One for Your Application? | ValveSpecs Pro",
    metaDescription: "Detailed ball valve vs globe valve comparison: flow coefficient, pressure drop, throttling capability, fire-safe design, and application scenarios. Data-driven guide for process engineers.",
    date: "2025-06-10",
    author: "ValveSpecs Engineering Team",
    category: "comparison",
    tags: ["ball valve", "globe valve", "comparison", "selection"],
    summary: "Ball valves offer low pressure drop and quick shutoff. Globe valves provide precise throttling control. This technical comparison covers design, performance, and application scenarios to help engineers make data-driven selection decisions.",
    content: `
## Quick Answer

- **Ball Valve**: Best for on/off isolation service with low pressure drop
- **Globe Valve**: Best for throttling and precise flow regulation

## Design and Construction

### Ball Valve
A ball valve controls flow by rotating a spherical disc (ball) with a bore through it. A quarter-turn (90 degrees) moves the valve from fully open to fully closed. The ball sits between two seats and seals against them in both the open and closed positions.

**Key components**: Ball, seat (PTFE or metal), stem, body, handle/actuator

### Globe Valve
A globe valve controls flow by moving a disc (plug) perpendicular to the seat. The fluid path follows an S-shaped curve through the body, creating controlled turbulence that allows precise flow regulation. Multi-turn operation is required.

**Key components**: Disc, seat, stem, bonnet, body, handwheel

## Head-to-Head Comparison

| Parameter | Ball Valve | Globe Valve |
|-----------|-----------|-------------|
| Operation | Quarter-turn (90°) | Multi-turn (360°+) |
| Flow Coefficient (Cv) | High | Low-Medium |
| Pressure Drop | Very Low | High (30-60% of ball valve Cv) |
| Throttling Capability | Poor (except V-port) | Excellent |
| Shutoff Class | API 598 / ISO 5208 | API 598 / ISO 5208 |
| Operating Speed | Fast | Slow |
| Torque Requirement | Low | Medium-High |
| Maintenance | Easy (2-piece, 3-piece body) | Moderate (top-entry accessible) |
| Face-to-Face (ASME B16.10) | Short | Long |
| Weight | Heavier | Lighter |
| Cost (DN100 baseline) | 1.0x | 1.3-1.8x |

## Application Scenarios

| Application | Recommended Valve | Engineering Reason |
|-------------|------------------|--------------------|
| Pipeline isolation | Ball Valve | Low pressure drop, fast quarter-turn shutoff |
| Flow regulation | Globe Valve | Precise throttling with linear or equal % characteristic |
| Emergency shutoff (ESD) | Ball Valve | Fast actuation, bubble-tight sealing |
| Steam distribution | Globe Valve | Better erosion resistance against high-velocity steam |
| Cryogenic service | Ball Valve (extended bonnet) | Better sealing at cryogenic temperatures |
| Pump discharge isolation | Check Valve + Ball Valve | Ball for isolation, check for backflow prevention |
| High-pressure drop acceptable | Globe Valve | Intentional pressure drop for control |

## Material Considerations

Both valve types are available in:
- **Carbon Steel (WCB/WCC)**: Standard service, water, steam, oil
- **Stainless Steel (CF8M/CF3M)**: Corrosive media, food, pharmaceutical
- **Alloy Steel (WC6/WC9)**: High-temperature service above 425°C
- **Duplex (CE3MN)**: Seawater, aggressive corrosion

**Globe valve advantage**: More commonly uses Stellite trim for erosion resistance in high-velocity or flashing service.

**Ball valve advantage**: Soft seat options (PTFE, RPTFE, PEEK) provide bubble-tight sealing at lower costs.

## When to Choose Ball Valve

- On/off isolation with minimal pressure loss
- Quick operation is required (quarter-turn)
- Large bore applications (DN200+)
- Fire-safe service (API 607 / API 6FA certified)
- Bubble-tight sealing is mandatory

## When to Choose Globe Valve

- Throttling and flow regulation
- Precise control with positioner (4-20mA signal)
- High-temperature steam service
- Where pressure drop is acceptable or desired
- Multi-turn operation is not a constraint

## Alternative Consideration: Butterfly Valve

For large bore applications (DN200+) where shutoff class requirements are moderate (not bubble-tight), a **butterfly valve** may be more cost-effective:
- 50-70% lighter than ball valves
- 30-50% lower cost
- Compact installation footprint
- Suitable for water treatment, HVAC, and general service

## Selection Decision Tree

1. Bore >= DN200 and water/general service → **Butterfly Valve**
2. Toxic, flammable, or hazardous media → **Ball Valve** (bubble-tight required)
3. Tight budget + water system → **Butterfly Valve**
4. Flow regulation or throttling needed → **Globe Valve**
5. None of above → **Ball Valve** (safest default choice)

## Find the Right Valve

Use [ValveSpecs Pro](/search) to filter valves by type, material, pressure rating, and standard compliance. Compare specifications side-by-side with the built-in comparison tool.
`,
    faq: [
      {
        question: "What is the main difference between a ball valve and a globe valve?",
        answer: "A ball valve uses a rotating ball for on/off service with low pressure drop, while a globe valve uses a moving disc against a seat for throttling and flow regulation. Ball valves are quarter-turn; globe valves are multi-turn."
      },
      {
        question: "Which valve has lower pressure drop: ball valve or globe valve?",
        answer: "Ball valves have significantly lower pressure drop due to their straight-through flow path. Globe valves create turbulence through an S-shaped flow path, resulting in 30-60% lower flow coefficient (Cv) compared to equivalent ball valves."
      },
      {
        question: "Can ball valves be used for throttling?",
        answer: "Standard ball valves are not recommended for throttling as partial opening causes seat erosion and vibration. V-port ball valves with a contoured ball can provide some throttling capability, but globe valves remain the preferred choice for precise flow regulation."
      },
      {
        question: "Which valve is better for high-temperature steam service?",
        answer: "Globe valves are generally preferred for high-temperature steam service due to better erosion resistance from their guided disc design. Metal-seated globe valves with Stellite trim can operate up to 540°C (1000°F) in steam service."
      }
    ]
  },
  {
    slug: "complete-valve-selection-guide",
    title: "Complete Valve Selection Guide: How to Choose the Right Industrial Valve",
    metaTitle: "Valve Selection Guide: Step-by-Step Process for Engineers | ValveSpecs Pro",
    metaDescription: "Step-by-step industrial valve selection guide: operating conditions, valve type, material, standards, and special requirements. Based on ASME B16.34, API 6D, and industry best practices.",
    date: "2025-06-05",
    author: "ValveSpecs Engineering Team",
    category: "guide",
    tags: ["selection", "engineering guide", "ASME", "API"],
    summary: "A systematic 5-step valve selection process covering operating conditions, valve type, material selection, standards compliance, and special requirements. Based on ASME B16.34 and API standards.",
    content: `
## Why Valve Selection Matters

Valve-related failures account for approximately 40% of all shutdowns in process industries. Incorrect valve selection leads to:
- Unscheduled downtime ($10,000-$500,000 per incident)
- Safety incidents (leaks, fires, environmental releases)
- Premature wear and maintenance costs

A systematic selection process prevents these issues.

## Step 1: Define Operating Conditions

Before selecting any valve, document these parameters:

### Fluid Properties
- **Media type**: Liquid, gas, steam, slurry, or multiphase
- **Media composition**: Corrosive content, solids content, viscosity
- **Specific gravity**: Affects actuator sizing and flow calculations

### Process Conditions
- **Normal operating pressure**: Working pressure at design conditions
- **Design pressure**: Maximum allowable pressure (typically 1.1-1.5x operating)
- **Normal operating temperature**: Steady-state temperature
- **Design temperature**: Maximum/minimum temperature for material selection
- **Flow rate**: Normal and maximum flow requirements

### Environmental Conditions
- **Ambient temperature range**: Affects actuator performance and material selection
- **Outdoor/indoor**: Weather protection requirements
- **Hazardous area classification**: ATEX, IECEx, NEC requirements

## Step 2: Select the Valve Type

Choose based on the primary function:

| Valve Type | Primary Function | Typical Cv Range | Key Advantage |
|------------|-----------------|-----------------|---------------|
| Ball Valve | On/off isolation | High | Low pressure drop |
| Globe Valve | Throttling | Medium | Precise control |
| Butterfly Valve | On/off (large bore) | High | Compact, lightweight |
| Gate Valve | On/off (full bore) | Very High | Minimal flow resistance |
| Check Valve | Backflow prevention | High | Automatic operation |
| Control Valve | Automated regulation | Variable | Process automation |
| Diaphragm Valve | Sanitary/corrosive | Medium | Contamination-free |
| Needle Valve | Fine flow control | Low | Precise metering |

## Step 3: Choose Materials

### Body Material Selection

| Media | Recommended Body Material | Standard |
|-------|--------------------------|----------|
| Water, steam | Carbon Steel (WCB) | ASTM A216 |
| Oil, gas | Carbon Steel (WCB/LCC) | ASTM A216 |
| Corrosive chemicals | Stainless Steel (CF8M) | ASTM A351 |
| Seawater | Duplex Stainless (CE3MN) | ASTM A890 |
| High temperature (>425°C) | Alloy Steel (WC6/WC9) | ASTM A217 |
| Cryogenic (-196°C) | Austenitic SS (CF8) | ASTM A351 |

### Trim and Seat Material
- **Soft seat (PTFE/RPTFE)**: Bubble-tight sealing, max 260°C
- **Metal seat (Stellite)**: High temperature and abrasive service
- **PEEK seat**: High pressure with moderate temperature

### Reference Standard
- **ASME B16.34**: Pressure-temperature ratings for valve materials
- **NACE MR0175/ISO 15156**: Sour service material requirements

## Step 4: Verify Standards Compliance

### API Standards (Oil & Gas)

| Standard | Valve Type | Application |
|----------|------------|-------------|
| API 6D | Ball, check, gate, plug | Pipeline service |
| API 600 | Gate valve | Refinery hydrocarbon service |
| API 602 | Gate valve (compact) | Small bore, high pressure |
| API 608 | Ball valve | Petroleum refining |
| API 607 | Fire-safe testing | Quarter-turn valves |
| API 598 | Leakage testing | All valve types |

### ASME Standards

| Standard | Scope |
|----------|-------|
| ASME B16.34 | Pressure-temperature ratings |
| ASME B16.10 | Face-to-face dimensions |
| ASME B16.5 | Flange dimensions (NPS 1/2-24) |

## Step 5: Address Special Requirements

### Fire-Safe Design
- Required for valves in hydrocarbon service
- Tested per API 607 (quarter-turn) or API 594 (check valves)
- Metal-to-metal secondary sealing behind soft seat

### Cryogenic Service
- Extended bonnet design to keep packing above freezing
- Materials tested to -196°C (LNG) or -253°C (hydrogen)
- Extended stem for insulation clearance

### High-Temperature Service
- Material derating per ASME B16.34 temperature tables
- Graphite packing instead of PTFE
- Metal-to-metal seating

### Food and Pharmaceutical
- FDA 21 CFR 177.1550 compliant materials
- 3A Sanitary Standards
- Electropolished surface finish (Ra <= 0.8 μm)

## Common Selection Mistakes

1. **Ignoring temperature derating**: Carbon steel WCB is rated PN40 at ambient, but only PN16 at 400°C
2. **Oversizing valves**: Leads to poor control, cavitation, and premature seat damage
3. **Wrong leakage class**: Specifying API 598 when ISO 5208 Rate A is required
4. **Forgetting actuator sizing**: Must account for friction, differential pressure, and safety factor
5. **Skipping material test reports**: Always verify MTR against specification

## Tools and Resources

- [ValveSpecs Pro Database](/search): Search and compare valve specifications from 100+ brands
- [Material Selection Guide](/blog/valve-material-selection): Detailed material compatibility reference
- [API Standards Guide](/blog/api-standards-explained): Complete API standard reference
`,
    faq: [
      {
        question: "What is the most important factor in valve selection?",
        answer: "Operating conditions are the most critical factor. Temperature, pressure, media type, and flow requirements determine the valve type, material, and pressure class. Always document these parameters before starting the selection process."
      },
      {
        question: "How do I determine the correct valve size?",
        answer: "Valve size should match the pipe size for isolation valves (ball, gate, butterfly). For control valves, size based on the required flow coefficient (Cv) calculated from flow rate, differential pressure, and fluid specific gravity. Use IEC 60534 or ISA 75.01 sizing methodology."
      },
      {
        question: "What pressure class should I select?",
        answer: "Select the pressure class based on ASME B16.34 pressure-temperature ratings. The valve class must be equal to or greater than the maximum allowable working pressure at the design temperature."
      },
      {
        question: "When do I need a fire-safe valve?",
        answer: "Fire-safe valves are required when the valve handles flammable or combustible fluids and is located in a position where fire exposure is possible. API 607 certifies quarter-turn valves for fire-safe performance."
      }
    ]
  },
  {
    slug: "valve-material-selection",
    title: "Valve Material Selection Guide: Choosing the Right Material for Your Application",
    metaTitle: "Valve Material Selection Guide: Body, Trim & Seal Compatibility | ValveSpecs Pro",
    metaDescription: "Valve material selection by media type: water, steam, chemical, marine, cryogenic. Body material, trim, and seal compatibility tables based on ASME B16.34 and ASTM standards.",
    date: "2025-05-28",
    author: "ValveSpecs Engineering Team",
    category: "guide",
    tags: ["material", "selection", "corrosion", "ASME"],
    summary: "Valve material selection determines service life, safety, and total cost of ownership. This guide provides material compatibility tables for body, trim, and seal materials across common industrial media.",
    content: `
## Why Material Selection is Critical

Material failures in valves account for approximately 25% of all valve-related incidents in process plants. Incorrect material selection leads to:
- Accelerated corrosion and premature failure
- Contamination of process media
- Safety incidents from structural failure
- Excessive maintenance costs

## Valve Body Material Reference

| Material | ASTM Standard | Max Temp (°C) | Corrosion Resistance | Relative Cost | Typical Media |
|----------|--------------|---------------|---------------------|---------------|---------------|
| Carbon Steel (WCB) | A216 WCB | 425 | Low | 1.0x | Water, steam, oil, gas |
| Carbon Steel Low-Temp (LCC) | A352 LCC | -46 | Low | 1.2x | Low-temperature hydrocarbon |
| Stainless Steel 304 (CF8) | A351 CF8 | 425 | High | 2.5x | Corrosive, food, pharma |
| Stainless Steel 316 (CF8M) | A351 CF8M | 450 | High | 3.0x | Chemical, marine, pulp & paper |
| Alloy Steel 1.25Cr-0.5Mo (WC6) | A217 WC6 | 540 | Medium | 3.5x | High-temperature steam, hydrogen |
| Alloy Steel 2.25Cr-1Mo (WC9) | A217 WC9 | 595 | Medium | 4.0x | Refinery, high-temp service |
| Alloy Steel 5Cr-0.5Mo (C5) | A217 C5 | 650 | Medium-High | 5.0x | Catalytic cracking, sulfur service |
| Duplex Stainless (CE3MN) | A890 CE3MN | 300 | Very High | 5.5x | Seawater, aggressive corrosion |
| Nickel Alloy (CW-12MW) | A494 CW-12MW | 650 | Extreme | 10.0x | Strong acids, chlorine |
| Monel (CU5MCuC) | A494 CU5MCuC | 540 | Extreme | 8.0x | Hydrofluoric acid, seawater |
| Hastelloy (CW-12MW) | A494 CW-12MW | 650 | Extreme | 12.0x | Sulfuric acid, HCl |

## Material Selection by Media

### Water and Steam
- **Body**: Carbon Steel (WCB) - best value for non-corrosive water and steam
- **Trim**: 13% Cr stainless steel (CA6NM) for erosion resistance
- **Seal**: PTFE for temperatures below 200°C; graphite for higher temperatures
- **Standard**: ASME B16.34 Class 150/300

### Oil and Gas (Hydrocarbon)
- **Body**: Carbon Steel (WCB) for standard service; Alloy Steel for high temperature
- **Trim**: Stellite #6 facing for erosion resistance
- **Seal**: RPTFE for bubble-tight; metal-to-metal for fire-safe
- **Standard**: API 6D, NACE MR0175 for sour service

### Chemical Processing
- **Body**: Stainless Steel 316 (CF8M) for most corrosive media
- **Trim**: 316 SS or Hastelloy for aggressive chemicals
- **Seal**: PTFE or PEEK depending on temperature
- **Special**: For concentrated sulfuric acid (>96%), use carbon steel (forms protective film)

### Seawater and Marine
- **Body**: Duplex Stainless (CE3MN) or Super Duplex for chloride resistance
- **Trim**: Titanium or Monel for seawater service
- **Seal**: EPDM or Viton for seawater compatibility
- **Standard**: NORSOK M-630 for offshore applications

### Cryogenic Service (-196°C to -46°C)
- **Body**: Austenitic Stainless Steel (CF8) - retains ductility at cryogenic temperatures
- **Trim**: Same as body material for thermal compatibility
- **Seal**: PCTFE (polychlorotrifluoroethylene) or metal-to-metal
- **Design**: Extended bonnet to keep packing above freezing point

### Food and Pharmaceutical
- **Body**: Stainless Steel 316L (CF3M) - low carbon for weldability
- **Trim**: 316L SS with electropolish finish (Ra <= 0.8 μm)
- **Seal**: FDA 21 CFR 177.1550 compliant PTFE
- **Standard**: 3A Sanitary Standards, EHEDG certification

## Trim Material Selection

Trim refers to the internal wetted parts (ball, disc, seat, stem):

| Trim Material | Hardness (HRC) | Max Temp (°C) | Application |
|---------------|---------------|---------------|-------------|
| 316 SS | 20-25 | 450 | General corrosive service |
| Stellite #6 | 38-44 | 815 | Erosion, high-temperature |
| Stellite #21 | 30-35 | 815 | Corrosive + erosion |
| Tungsten Carbide | 65-70 | 500 | Abrasive slurry service |
| 13% Cr (CA6NM) | 25-32 | 450 | Erosion, steam service |

## Seal Material Reference

| Seal Material | Max Temp (°C) | Chemical Resistance | Shutoff Class | Cost Index |
|---------------|---------------|--------------------|---------------|-----------|
| PTFE | 260 | Excellent | Bubble-tight | 1.0x |
| RPTFE (reinforced) | 280 | Excellent | Bubble-tight | 1.2x |
| PEEK | 300 | Good | Bubble-tight | 3.0x |
| Graphite | 650 | Good | Limited leakage | 0.8x |
| EPDM | 150 | Good (water) | Bubble-tight | 0.5x |
| Viton (FKM) | 200 | Excellent (hydrocarbon) | Bubble-tight | 1.5x |
| PCTFE | -196 to 200 | Good | Bubble-tight | 2.0x |
| Metal-to-Metal | 1000+ | Varies | Controlled leakage | 5.0x |

## Common Material Selection Mistakes

1. **Confusing 304 and 316**: 316 contains molybdenum for chloride resistance; 304 is NOT suitable for seawater
2. **Ignoring temperature derating**: ASME B16.34 shows that WCB at 400°C is only rated at ~50% of ambient pressure rating
3. **Using carbon steel in corrosive service**: Carbon steel corrodes rapidly in acidic or chloride environments
4. **Over-specifying materials**: Using Hastelloy where 316 SS suffices increases cost 3-4x without benefit
5. **Forgetting NACE compliance**: Sour service (H2S) requires specific hardness and heat treatment requirements
`,
    faq: [
      {
        question: "What is the difference between 304 and 316 stainless steel for valve bodies?",
        answer: "316 stainless steel contains 2-3% molybdenum, which provides significantly better resistance to chloride pitting and crevice corrosion compared to 304. Use 304 for general atmospheric corrosion and 316 for marine, chemical, and chloride-containing environments."
      },
      {
        question: "Can I use carbon steel valves for steam service?",
        answer: "Yes, carbon steel (WCB) is the standard material for steam service up to 425°C (800°F). Above this temperature, alloy steels like WC6 (1.25Cr-0.5Mo) or WC9 (2.25Cr-1Mo) are required for creep resistance and oxidation resistance."
      },
      {
        question: "What seal material should I use for high-temperature service?",
        answer: "For temperatures above 260°C (500°F), soft seals like PTFE are not suitable. Use graphite packing and metal-to-metal seating. For 200-260°C, RPTFE or PEEK provide better performance than standard PTFE."
      },
      {
        question: "When do I need NACE MR0175 compliant materials?",
        answer: "NACE MR0175 (ISO 15156) compliance is required when the valve will be exposed to hydrogen sulfide (H2S) in sour gas or oil service. The standard limits material hardness (HRC <= 22) and specifies heat treatment requirements to prevent sulfide stress cracking."
      }
    ]
  },
  {
    slug: "api-standards-explained",
    title: "API Standards for Valves: The Complete Reference Guide",
    metaTitle: "API Valve Standards Explained: API 6D, 600, 602, 607, 598 | ValveSpecs Pro",
    metaDescription: "Complete guide to API valve standards: API 6D pipeline valves, API 600 gate valves, API 602 compact gate, API 607 fire-safe testing, API 598 leakage testing. Requirements explained for engineers.",
    date: "2025-05-20",
    author: "ValveSpecs Engineering Team",
    category: "standards",
    tags: ["API", "standards", "API 6D", "API 600", "compliance"],
    summary: "API standards define requirements for valves used in petroleum and natural gas industries. This guide covers API 6D, 600, 602, 607, and 598, explaining scope, key requirements, and how to verify compliance.",
    content: `
## What Are API Standards?

The American Petroleum Institute (API) publishes standards that define design, manufacturing, testing, and documentation requirements for equipment in the petroleum and natural gas industries. API valve standards are recognized globally and often required by project specifications.

## API Standards Quick Reference

| Standard | Valve Type | Scope | Typical Application |
|----------|-----------|-------|---------------------|
| API 6D | Ball, gate, check, plug | Pipeline and piping service | Oil & gas pipelines, refineries |
| API 600 | Gate valve | Steel gate valves | Refinery hydrocarbon service |
| API 602 | Gate valve | Compact steel gate valves (DN <= 100) | Small bore, high pressure |
| API 608 | Ball valve | Metal ball valves | Petroleum refining |
| API 609 | Butterfly valve | Butterfly valves | General and petroleum service |
| API 594 | Check valve | Wafer and dual-plate check | Piping systems |
| API 607 | Fire-safe | Fire-safe test for quarter-turn | All quarter-turn valves |
| API 598 | Leakage testing | Valve inspection and testing | All valve types |
| API 520/521 | Relief valves | Sizing and selection | Overpressure protection |

## API 6D: Pipeline and Piping Valves

**Scope**: Covers design, manufacturing, testing, and documentation for pipeline valves including ball, gate, check, and plug valves.

### Key Requirements
- **Materials**: Must comply with ASME B16.34 or equivalent
- **Face-to-face dimensions**: Per ASME B16.10
- **Flange dimensions**: Per ASME B16.5 (NPS 1/2-24) or ASME B16.47 (NPS 26-60)
- **Testing**: 100% shell test, seat test per API 598
- **Documentation**: Material Test Reports (MTR), test certificates, traceability

### API 6D Valve Types
- **Through-conduit gate valves**: Full bore, low pressure drop
- **Ball valves**: Trunnion-mounted for large bore (DN >= 100)
- **Check valves**: Swing, tilting disc, and dual-plate designs
- **Plug valves**: Lubricated and non-lubricated designs

## API 600: Steel Gate Valves (Refinery Service)

**Scope**: Covers bolted bonnet steel gate valves for petroleum refinery and related applications.

### Key Requirements
- **Size range**: NPS 2-24 (DN 50-600)
- **Pressure classes**: Class 150, 300, 600, 900, 1500, 2500
- **Body-bonnet joint**: Bolted bonnet design
- **Trim**: Standard trim includes 13% Cr stainless steel
- **Testing**: Per API 598

### API 600 vs API 6D (Gate Valves)

| Feature | API 600 | API 6D |
|---------|---------|--------|
| Application | Refinery service | Pipeline service |
| Design | Bolted bonnet | Varies (bolted, welded) |
| Size range | NPS 2-24 | NPS 2-48+ |
| Full bore | Required | Required |
| Through-conduit | Preferred | Required for some |

## API 602: Compact Steel Gate Valves

**Scope**: Covers compact steel gate valves for small bore, high-pressure service.

### Key Requirements
- **Size range**: NPS 1/2-2 (DN 15-50)
- **Pressure classes**: Class 150 to 2500
- **Design**: Compact body, reduced face-to-face dimensions
- **End connections**: Flanged, threaded, or welded
- **Application**: High-pressure instrument and sampling systems

## API 607: Fire-Safe Testing

**Scope**: Defines fire test procedure for quarter-turn valves and valves equipped with non-metallic seats.

### Test Procedure
1. Valve is set in the open position
2. Exposed to fire at 760-982°C (1400-1800°F) for 30 minutes
3. External leakage measured during fire
4. Internal leakage measured after fire (after cooldown)

### Acceptance Criteria
- **External leakage**: Must not exceed specified limits during fire
- **Internal leakage**: Must not exceed specified limits after fire
- **Valve operability**: Must be operable after fire test

### Fire-Safe Design Features
- Secondary metal-to-metal sealing behind soft seat
- Graphite body seals and packing
- Fire-safe stem sealing
- Anti-static device (spring between ball and stem)

## API 598: Valve Inspection and Testing

**Scope**: Covers inspection, examination, and pressure testing requirements for valves.

### Test Requirements

| Test Type | Medium | Duration | Acceptance |
|-----------|--------|----------|------------|
| Shell (hydrostatic) | Water | Minimum 2 minutes | No visible leakage |
| Seat (liquid) | Water | Minimum 2 minutes | Per leakage class |
| Seat (gas) | Air/N2 | Minimum 2 minutes | Per leakage class |
| Backseat | Water | Minimum 2 minutes | No visible leakage |

### Leakage Classes (API 598)

| Class | Test Medium | Allowable Leakage |
|-------|------------|-------------------|
| Soft seat | Liquid | Zero visible leakage |
| Metal seat Class I | Liquid | 0.18 ml/min per inch of nominal size |
| Metal seat Class II | Gas | Bubbles per minute per inch |
| Metal seat Class III | Gas | Defined by manufacturer |

## How to Verify API Compliance

### 1. Check the Nameplate
Every API-compliant valve must have a nameplate with:
- API standard number (e.g., API 6D)
- Size and pressure class
- Material grade
- Heat/lot number for traceability
- Manufacturer name and logo

### 2. Request Documentation
- **Material Test Report (MTR)**: Chemical composition and mechanical properties
- **Pressure Test Certificate**: Shell and seat test results
- **Certificate of Conformance**: States compliance with specific API standard

### 3. Verify Traceability
- Heat numbers on body and bonnet must match MTR
- Material must match specification on data sheet
- Pressure class must meet or exceed design requirements

## Find API-Compliant Valves

Use [ValveSpecs Pro](/search) to filter valves by API standard compliance. Every valve in the database includes the applicable standards and certifications.
`,
    faq: [
      {
        question: "What is the difference between API 6D and API 600 for gate valves?",
        answer: "API 6D covers pipeline service gate valves (including through-conduit design) for oil and gas pipelines. API 600 covers steel gate valves specifically for refinery hydrocarbon service with bolted bonnet design."
      },
      {
        question: "What does API 607 fire-safe testing involve?",
        answer: "API 607 tests quarter-turn valves by exposing them to a fire at 760-982°C for 30 minutes. It measures external leakage during the fire and internal leakage after cooldown. Fire-safe valves use secondary metal-to-metal sealing to maintain integrity after the soft seat is destroyed."
      },
      {
        question: "How do I verify that a valve is API compliant?",
        answer: "Check the valve nameplate for the API standard designation, request Material Test Reports (MTR) and pressure test certificates, verify heat number traceability, and confirm the pressure class meets your design requirements."
      },
      {
        question: "Is API 598 the same as ISO 5208?",
        answer: "No. API 598 is an American standard for valve inspection and testing. ISO 5208 is the international equivalent with more granular leakage rate classifications (Rate A through Rate R). ISO 5208 Rate A (zero visible leakage) is more stringent than API 598 soft seat requirements."
      }
    ]
  },
  {
    slug: "high-temperature-valve-selection",
    title: "High-Temperature Valve Selection Guide: Materials, Design and Standards",
    metaTitle: "High-Temperature Valve Selection: Materials, Design, and API Standards | ValveSpecs Pro",
    metaDescription: "Complete guide to selecting valves for high-temperature service: material temperature limits, trim selection, seal materials, and design features for applications above 200°C.",
    date: "2025-05-15",
    author: "ValveSpecs Engineering Team",
    category: "guide",
    tags: ["high temperature", "selection", "materials", "steam"],
    summary: "Standard valves fail above certain temperatures due to material softening, seal degradation, and thermal expansion. This guide covers material limits, trim selection, and design features for high-temperature service.",
    content: `
## What Qualifies as High Temperature?

In valve engineering, "high temperature" generally refers to service above 200°C (400°F), where:
- Standard PTFE seals begin to soften and creep
- Carbon steel starts to lose strength above 425°C
- Thermal expansion affects clearances and sealing
- Material derating per ASME B16.34 becomes significant

### Temperature Thresholds

| Temperature Range | Classification | Seal Approach |
|------------------|---------------|---------------|
| -196 to -46°C | Cryogenic | Extended bonnet, PCTFE seals |
| -46 to 200°C | Standard | Soft seat (PTFE, RPTFE) |
| 200 to 425°C | Elevated | PEEK seats, graphite packing |
| 425 to 650°C | High | Metal-to-metal seat, Stellite trim |
| > 650°C | Extreme | Specialty alloys, ceramic coatings |

## Body Material Temperature Limits

| Material | ASTM Standard | Max Service Temp (°C) | Notes |
|----------|--------------|----------------------|-------|
| Carbon Steel (WCB) | A216 WCB | 425 | Derates significantly above 350°C |
| WC6 (1.25Cr-0.5Mo) | A217 WC6 | 540 | Good creep resistance |
| WC9 (2.25Cr-1Mo) | A217 WC9 | 595 | Standard for high-temp steam |
| C5 (5Cr-0.5Mo) | A217 C5 | 650 | Catalytic cracking service |
| CF8M (316 SS) | A351 CF8M | 450 | Oxidation resistant |
| Inconel 625 | B564 N06625 | 1000 | Extreme temperature |

### ASME B16.34 Pressure-Temperature Derating

The pressure rating of a valve decreases as temperature increases. For a Class 300 WCB valve:
- At 38°C: 50.7 bar (735 psi)
- At 200°C: 43.8 bar (635 psi)
- At 400°C: 23.1 bar (335 psi)
- At 425°C: 16.5 bar (240 psi)

Always verify pressure-temperature rating at the actual operating temperature using ASME B16.34 tables.

## Valve Design for High Temperature

### Extended Bonnet
For temperatures above 200°C, extended bonnets move the packing box away from the hot body:
- Keeps packing temperature within elastomer limits
- Provides cooling space between body and stem seal
- Required for temperatures above 230°C in most designs

### Bellows Seal
For critical high-temperature service where stem leakage is unacceptable:
- Metal bellows replace traditional packing
- Zero stem emissions
- Typical service: up to 400°C with Inconel bellows

### Anti-Static Design
Required by API 607 for fire-safe service:
- Spring-loaded pin between ball/disc and stem
- Prevents static charge buildup that could ignite flammable media
- Mandatory for all fire-safe quarter-turn valves

## Seal and Seat Materials for High Temperature

| Material | Max Temp (°C) | Shutoff Class | Application |
|----------|---------------|---------------|-------------|
| PTFE | 260 | Bubble-tight | Standard service |
| RPTFE | 280 | Bubble-tight | Improved wear resistance |
| PEEK | 300 | Bubble-tight | High pressure, moderate temp |
| Graphite | 650 | Limited leakage | High-temp packing and seals |
| Stellite #6 | 815 | Controlled leakage | Metal-to-metal seating |
| Ceramic coating | 1000+ | Controlled leakage | Extreme temperature |

### Critical Point: PTFE Creep
PTFE begins to creep above 200°C under pressure. This causes:
- Loss of seating force
- Increased leakage
- Potential blowout in extreme cases

For service above 200°C, use PEEK or metal-to-metal seating.

## High-Temperature Applications

### Steam Systems (Power Plants)
- **Temperature**: 150°C (low pressure) to 565°C (supercritical)
- **Typical valves**: Gate, globe, check
- **Materials**: Carbon steel to C12 (9Cr-1Mo)
- **Standards**: ASME B16.34, ASME Section I

### Thermal Oil Systems
- **Temperature**: 200°C to 400°C
- **Typical valves**: Gate, ball, globe
- **Materials**: Carbon steel (WCB) sufficient for most
- **Special**: Thermal oil is viscous; consider larger Cv

### Catalytic Cracking (Refinery)
- **Temperature**: 500°C to 750°C
- **Typical valves**: Gate, check, control
- **Materials**: C5, C12, or Inconel

### Heat Recovery Systems
- **Temperature**: 300°C to 600°C
- **Typical valves**: Gate, butterfly, control
- **Materials**: Alloy steel (WC6, WC9)
- **Special**: Thermal cycling causes fatigue; use robust designs

## High-Temperature Selection Checklist

1. **Define maximum operating temperature** (not just normal operating)
2. **Check ASME B16.34** pressure-temperature rating at design temperature
3. **Select body material** with adequate temperature margin
4. **Select trim material** for erosion resistance (Stellite for steam, high-velocity service)
5. **Select seal material** appropriate for temperature range
6. **Specify extended bonnet** if packing temperature exceeds seal limits
7. **Specify fire-safe design** if handling flammable media
8. **Consider thermal expansion** effects on clearances and torque
9. **Consider cycling requirements** (frequent thermal cycling = fatigue)
10. **Specify NACE compliance** if sour service is possible

## Find High-Temperature Valves

Use [ValveSpecs Pro](/search) to filter valves by temperature range and material. The database includes high-temperature valve specifications from manufacturers specializing in power, refinery, and process applications.
`,
    faq: [
      {
        question: "What is the maximum temperature for carbon steel valves?",
        answer: "Carbon steel (WCB) valves are rated for service up to 425°C (800°F) per ASME B16.34. However, pressure rating decreases significantly with temperature. At 400°C, a Class 300 WCB valve is only rated at approximately 46% of its ambient pressure capacity."
      },
      {
        question: "At what temperature do I need to replace PTFE seals?",
        answer: "PTFE begins to soften and creep above 200°C (400°F). For service between 200-260°C, use RPTFE or PEEK. Above 260°C, switch to graphite packing and metal-to-metal seating. Above 300°C, only metal seats are recommended."
      },
      {
        question: "What is an extended bonnet and when is it required?",
        answer: "An extended bonnet is a valve design where the bonnet is lengthened to move the stem packing away from the hot valve body. It is required when the body temperature exceeds the packing material temperature limit, typically above 230°C for most applications."
      },
      {
        question: "What valve type is best for high-temperature steam?",
        answer: "Gate valves and globe valves are most commonly used for high-temperature steam. Gate valves provide low pressure drop for isolation, while globe valves offer better erosion resistance for throttling. Materials must be selected based on steam temperature: carbon steel up to 425°C, alloy steel up to 595°C."
      }
    ]
  },
  {
    slug: "butterfly-valve-vs-gate-valve",
    title: "Butterfly Valve vs Gate Valve: When to Use Each",
    metaTitle: "Butterfly Valve vs Gate Valve: Selection Guide | ValveSpecs Pro",
    metaDescription: "Butterfly valve vs gate valve comparison: flow characteristics, pressure rating, installation space, cost analysis. Engineering guide with data tables for industrial valve selection.",
    date: "2026-06-18",
    author: "ValveSpecs Engineering Team",
    category: "comparison",
    tags: ["butterfly valve", "gate valve", "comparison", "selection"],
    summary: "Butterfly valves are compact and cost-effective for large diameters. Gate valves provide low pressure drop in fully open position. This guide compares their design, performance, and ideal applications.",
    content: `
## Quick Comparison

- **Butterfly Valve**: Compact, lightweight, cost-effective for DN50-DN2000
- **Gate Valve**: Low pressure drop, bi-directional, full bore flow

## Design Differences

### Butterfly Valve
A butterfly valve uses a disc mounted on a rotating shaft. The disc rotates within the flow path, creating a variable obstruction. Available in concentric (resilient seat), double-offset, and triple-offset designs.

**Operation**: Quarter-turn (90 degrees)
**Seat types**: Rubber (EPDM, NBR), PTFE, metal-seated (triple offset)

### Gate Valve
A gate valve uses a flat or wedge-shaped gate that slides up and down perpendicular to the flow. When fully open, the gate retracts completely into the bonnet, providing an unobstructed flow path.

**Operation**: Multi-turn (handwheel or actuator)
**Gate types**: Solid wedge, flexible wedge, split wedge, parallel slide

## Performance Comparison

| Parameter | Butterfly Valve | Gate Valve |
|-----------|----------------|------------|
| Size Range | DN50 - DN2000 | DN15 - DN600 |
| Pressure Rating | PN10 - PN40 (typical) | PN10 - PN250 |
| Flow Coefficient (Cv) | Medium (disc obstructs flow) | Very High (full bore) |
| Pressure Drop | Moderate | Very Low |
| Shutoff Class | Class IV - VI | Class II - IV |
| Installation Space | Very Compact | Large (tall bonnet) |
| Weight | 50-80% lighter | Heavier |
| Cost (DN300) | 0.3-0.5x | 1.0x |
| Maintenance | Seat replacement easy | Bonnet removal required |
| Bi-directional | Yes | Yes |

## Application Guide

| Application | Recommended | Why |
|-------------|-------------|-----|
| Water treatment | Butterfly | Low cost, compact, adequate sealing |
| Fire protection | Gate | Full bore, minimal pressure loss |
| HVAC systems | Butterfly | Space-saving, lightweight |
| Oil & gas isolation | Gate | High pressure, bubble-tight |
| Chemical processing | Butterfly (lined) | Corrosion resistance, easy maintenance |
| Power plant steam | Gate | High temperature, full bore |
| Wastewater | Butterfly | Large diameter, cost-effective |
| Desalination | Double-offset butterfly | Seawater corrosion resistance |

## Cost Analysis (DN300, PN16)

| Cost Factor | Butterfly Valve | Gate Valve |
|-------------|----------------|------------|
| Valve cost | $800 | $2,000 |
| Actuator | $1,200 | $1,800 |
| Installation | $200 | $400 |
| Weight savings | Significant | Baseline |
| **Total installed** | **$2,200** | **$4,200** |

## Selection Decision Tree

1. Size > DN500 and pressure < PN16 → **Butterfly Valve**
2. Bubble-tight shutoff required → **Gate Valve** or **Triple-offset Butterfly**
3. Space constrained → **Butterfly Valve**
4. High pressure (>PN40) → **Gate Valve**
5. Frequent operation → **Butterfly Valve** (lower torque)
6. Full bore flow critical → **Gate Valve**

## Special Considerations

**Cavitation risk**: Butterfly valves are more susceptible to cavitation due to the disc creating turbulence. For applications with high pressure drop, consider cavitation-resistant trim.

**Wear**: Butterfly valve seats wear faster than gate valve seats in abrasive service. Plan for more frequent maintenance.

## ValveSpecs Pro Resources

Use our [valve search](/) to compare specific butterfly and gate valve models from 90+ brands. Filter by size, pressure rating, material, and application to find the optimal valve for your project.
`
  },
  {
    slug: "valve-actuator-selection-guide",
    title: "Valve Actuator Selection: Pneumatic vs Electric vs Hydraulic",
    metaTitle: "Valve Actuator Selection Guide: Pneumatic vs Electric vs Hydraulic | ValveSpecs Pro",
    metaDescription: "Complete valve actuator selection guide: pneumatic, electric, and hydraulic actuators compared. Torque calculation, fail-safe requirements, and application recommendations for industrial valves.",
    date: "2026-06-18",
    author: "ValveSpecs Engineering Team",
    category: "guide",
    tags: ["actuator", "pneumatic", "electric", "hydraulic", "selection"],
    summary: "Choosing the right valve actuator is critical for reliable operation. This guide compares pneumatic, electric, and hydraulic actuators with torque calculation methods, fail-safe options, and application-specific recommendations.",
    content: `
## Actuator Types Overview

| Type | Power Source | Speed | Torque Range | Best For |
|------|-------------|-------|--------------|----------|
| Pneumatic | Compressed air (4-8 bar) | Fast | 10-500,000 Nm | On/off, emergency shutdown |
| Electric | AC/DC motor | Medium | 10-200,000 Nm | Precise control, remote locations |
| Hydraulic | Pressurized oil | Slow-Medium | 100-2,000,000 Nm | High torque, heavy-duty |

## Pneumatic Actuators

### Types
- **Rack and pinion**: Most common, 90-degree quarter-turn
- **Scotch yoke**: High torque at end positions
- **Diaphragm**: Linear motion for globe/control valves
- **Vane**: Compact, no external moving parts

### Advantages
- Inherently fail-safe (spring return)
- Fastest response time (0.5-2 seconds)
- Simple design, low maintenance
- Intrinsically safe (no electrical spark)
- Lowest cost per Nm of torque

### Disadvantages
- Requires air supply infrastructure
- Positioning accuracy ±1-2%
- Noise from air exhaust
- Temperature range limited by seals (-40°C to +80°C typical)

### When to Use
- Emergency shutdown (ESD) systems
- On/off isolation service
- Hazardous areas (ATEX/IECEx zones)
- Fast cycling applications

## Electric Actuators

### Types
- **Multi-turn**: For gate and globe valves
- **Quarter-turn**: For ball, butterfly, and plug valves
- **Linear**: For control valves
- **Modulating**: Precise positioning with feedback

### Advantages
- Precise positioning (±0.1%)
- No external power supply needed
- Quiet operation
- Built-in diagnostics
- Wide temperature range (-40°C to +70°C)

### Disadvantages
- Slower response (3-15 seconds for quarter-turn)
- Higher initial cost
- Requires explosion-proof housing in hazardous areas
- Motor can stall under high load
- Battery backup needed for fail-safe

### When to Use
- Modulating control applications
- Remote locations without air supply
- Precise positioning requirements
- SCADA/DCS integrated systems

## Hydraulic Actuators

### Advantages
- Highest torque output
- Smooth, controlled motion
- Excellent for high-pressure differential
- Can hold position without power

### Disadvantages
- Requires hydraulic power unit (HPU)
- Higher maintenance (oil changes, leak inspection)
- Slower response
- Higher total cost of ownership
- Environmental concerns (oil泄漏)

### When to Use
- Large gate valves (>DN600)
- High-pressure differential (>PN100)
- Subsea applications
- Steel mill and mining equipment

## Torque Calculation

### Quarter-turn Valve Torque Formula
\`\`\`
Required Actuator Torque = Valve Break Torque × Safety Factor
Safety Factor: 1.3 (standard) to 1.5 (critical service)
\`\`\`

### Common Torque Requirements

| Valve Size | Ball Valve (Nm) | Butterfly Valve (Nm) | Gate Valve (Nm) |
|-----------|----------------|---------------------|-----------------|
| DN50 | 20-40 | 15-30 | 30-60 |
| DN100 | 50-100 | 40-80 | 80-150 |
| DN200 | 150-300 | 100-200 | 200-400 |
| DN300 | 300-600 | 200-400 | 400-800 |
| DN500 | 600-1200 | 400-800 | 800-1600 |

## Fail-Safe Requirements

| Fail Action | Pneumatic | Electric | Hydraulic |
|-------------|-----------|----------|-----------|
| Fail Closed | Spring return | Battery backup | Spring or accumulator |
| Fail Open | Double-acting | Battery backup | Spring or accumulator |
| Fail Last | Lock-up valve | Motor brake | Lock valve |
| Fail Safe | SOL valve + spring | UPS + battery | Accumulator |

## Selection Decision Guide

1. **Emergency shutdown** → Pneumatic (fast, inherently safe)
2. **Modulating control** → Electric (precise positioning)
3. **Large valve, high torque** → Hydraulic
4. **Remote location, no air** → Electric
5. **Hazardous area** → Pneumatic (simplest certification)
6. **Frequent cycling** → Pneumatic (longest cycle life)

## Cost Comparison (DN200 Ball Valve)

| Component | Pneumatic | Electric | Hydraulic |
|-----------|-----------|----------|-----------|
| Actuator | $800 | $2,500 | $4,000 |
| Accessories | $200 | $300 | $1,500 |
| Installation | $300 | $300 | $800 |
| Annual maintenance | $100 | $50 | $500 |
| **5-year TCO** | **$4,800** | **$7,550** | **$14,300** |

## ValveSpecs Pro Resources

Browse our valve database to find actuated valve solutions from top brands. Filter by valve type, actuator type, and application requirements.
`
  },
  {
    slug: "industrial-valve-standards-guide",
    title: "Industrial Valve Standards: API, ASME, ISO, DIN, and JIS Explained",
    metaTitle: "Industrial Valve Standards Guide: API, ASME, ISO, DIN, JIS | ValveSpecs Pro",
    metaDescription: "Complete guide to industrial valve standards: API 6D, API 600, ASME B16.34, ISO 5208, DIN, and JIS. Understand certification requirements for global valve procurement.",
    date: "2026-06-18",
    author: "ValveSpecs Engineering Team",
    category: "guide",
    tags: ["standards", "API", "ASME", "ISO", "DIN", "certification"],
    summary: "Understanding valve standards is essential for global procurement. This guide covers API, ASME, ISO, DIN, and JIS standards with a comparison matrix to help engineers specify the correct standards for their projects.",
    content: `
## Why Valve Standards Matter

Valve standards ensure:
- **Interchangeability**: Valves from different manufacturers fit the same piping
- **Safety**: Minimum material, testing, and design requirements
- **Quality**: Consistent performance across suppliers
- **Regulatory compliance**: Meeting local and international codes

## Major Standard Organizations

| Organization | Region | Focus |
|-------------|--------|-------|
| API (American Petroleum Institute) | USA | Oil & gas, petroleum |
| ASME (American Society of Mechanical Engineers) | USA | Pressure vessels, piping |
| ISO (International Organization for Standardization) | Global | International standards |
| DIN (Deutsches Institut für Normung) | Germany/Europe | European industry |
| JIS (Japanese Industrial Standards) | Japan | Japanese industry |
| BS (British Standards) | UK | British industry |

## Key API Standards for Valves

| Standard | Title | Application |
|----------|-------|-------------|
| API 6D | Pipeline and Piping Valves | Pipeline ball, check, gate valves |
| API 600 | Steel Gate Valves | Bolted bonnet gate valves |
| API 602 | Compact Steel Gate Valves | Small size (DN100 and under) |
| API 603 | Corrosion-Resistant Gate Valves | Stainless steel gate valves |
| API 607 | Fire Test for Quarter-Turn Valves | Fire-safe ball, butterfly, plug |
| API 608 | Metal Ball Valves | Flanged, threaded, welding end |
| API 609 | Butterfly Valves | Double and triple offset |
| API 594 | Check Valves | Wafer, lug, double flange |
| API 598 | Valve Inspection and Testing | Leakage and pressure testing |
| API 594 | Pressure Relief Valves | PRV/PSV sizing and selection |

## Key ASME Standards

| Standard | Title | Application |
|----------|-------|-------------|
| ASME B16.34 | Valves — Flanged, Threaded, Welding End | Pressure-temperature ratings |
| ASME B16.10 | Face-to-Face and End-to-End Dimensions | Valve dimensions |
| ASME B16.5 | Pipe Flanges and Flanged Fittings | Flange dimensions |
| ASME B16.25 | Buttwelding Ends | Weld end preparation |
| ASME B16.47 | Large Diameter Steel Flanges | DN650 and above |

## Key ISO Standards

| Standard | Title | Application |
|----------|-------|-------------|
| ISO 5208 | Pressure Testing of Industrial Valves | Leakage classes A-D |
| ISO 5211 | Actuator Attachment | Actuator mounting |
| ISO 17292 | Metal Ball Valves | Petrochemical use |
| ISO 10434 | Bolted Bonnet Steel Gate Valves | Oil and gas |
| ISO 15761 | Steel Gate Valves | Petrochemical |

## DIN Standards (European)

| Standard | Equivalent | Application |
|----------|-----------|-------------|
| DIN 3202 | ASME B16.10 | Face-to-face dimensions |
| DIN 2501 | ASME B16.5 | Flange dimensions |
| DIN 3352 | API 600 | Gate valves |
| DIN 3354 | API 608 | Ball valves |
| DIN 3356 | API 594 | Check valves |

## JIS Standards (Japanese)

| Standard | Equivalent | Application |
|----------|-----------|-------------|
| JIS B 2073 | API 600 | Gate valves |
| JIS B 2071 | API 608 | Ball valves |
| JIS B 2074 | API 594 | Check valves |
| JIS B 2002 | ASME B16.10 | Face-to-face |
| JIS B 2220 | ASME B16.5 | Flanges |

## Pressure-Temperature Ratings Comparison

### Class 150 (PN20) at Various Temperatures

| Temperature | ASME (ksi) | DIN (bar) | JIS (MPa) |
|-------------|-----------|-----------|-----------|
| -29°C to 425°C | 285 | 195 | 19.6 |
| 450°C | 230 | 157 | 15.4 |
| 500°C | 170 | 116 | 11.3 |

## Leakage Classification (ISO 5208)

| Class | Test Medium | Max Leakage |
|-------|-----------|-------------|
| A | Water | No visible leakage |
| B | Water | 0.01 × DN (mm³/s) |
| C | Air/N₂ | 0.03 × DN (mm³/s) |
| D | Air/N₂ | Bubble-tight |

## Global Procurement Tips

1. **API standards** → Required for US and Middle East projects
2. **DIN/EN standards** → Required for European projects
3. **JIS standards** → Required for Japanese projects
4. **ISO standards** → Acceptable globally as baseline
5. **Dual certification** → Many manufacturers offer API + DIN certified valves

## ValveSpecs Pro Resources

Our valve database includes specifications referencing all major standards. Search by standard to find compliant valves for your project.
`
  },
  {
    slug: "control-valve-sizing-guide",
    title: "Control Valve Sizing: Cv Calculation and Selection Methodology",
    metaTitle: "Control Valve Sizing Guide: Cv Calculation & Selection | ValveSpecs Pro",
    metaDescription: "Learn how to size control valves using Cv calculation. Step-by-step guide covering liquid, gas, and steam sizing with examples. ISA/IEC standards and practical selection tips.",
    date: "2026-06-18",
    author: "ValveSpecs Engineering Team",
    category: "guide",
    tags: ["control valve", "sizing", "Cv", "calculation", "ISA"],
    summary: "Proper control valve sizing ensures accurate process control and prevents cavitation, noise, and premature wear. This guide covers Cv calculation for liquid, gas, and steam applications with practical examples.",
    content: `
## What is Cv?

**Cv (Flow Coefficient)** is the number of US gallons per minute (GPM) of water at 60°F that will flow through a valve with a pressure drop of 1 psi.

- **Cv for water**: Standard definition above
- **Kv (metric)**: Cv × 0.865
- **Av**: Kv × (ρ/1000)^0.5

## Liquid Sizing (Incompressible Flow)

### Basic Cv Formula
\`\`\`
Cv = Q × √(SG / ΔP)

Where:
Q = Flow rate (GPM)
SG = Specific gravity (relative to water = 1.0)
ΔP = Pressure drop across valve (psi)
\`\`\`

### Example: Water Service
- Flow: 200 GPM
- SG: 1.0
- Upstream pressure: 100 psig
- Downstream pressure: 80 psig
- ΔP: 20 psi

\`\`\`
Cv = 200 × √(1.0 / 20) = 200 × 0.224 = 44.7
\`\`\`

**Select a valve with Cv ≥ 45**

### Pressure Recovery Factor (FL)
For applications approaching cavitation, use the corrected formula:
\`\`\`
Cv = Q × √(SG / (FL² × (P1 - P2)))
\`\`\`

Typical FL values: 0.6-0.9 depending on valve trim design.

## Gas Sizing (Compressible Flow)

### Basic Cv Formula (Subsonic)
\`\`\`
Cv = Qg / (63.5 × Fp) × √(SG × T / ΔP × P2)

Where:
Qg = Gas flow rate (SCFH)
Fp = Piping geometry factor
T = Temperature (°R)
P2 = Downstream pressure (psia)
\`\`\`

### Choked Flow Check
When P2/P1 < 0.53 (for air/gas with k=1.4), the flow is choked:
\`\`\`
Use choked Cv formula with P1 instead of ΔP
\`\`\`

## Steam Sizing

### Saturated Steam
\`\`\`
Cv = W / (63.5 × Fp) × √(1 / (ΔP × P2))

Where:
W = Steam flow rate (lb/hr)
\`\`\`

### Superheated Steam
Add superheat correction factor:
\`\`\`
Cv = W / (63.5 × Fp) × √(1 / (ΔP × P2)) × Fsh
\`\`\`

## Valve Sizing Steps

1. **Define process conditions**: Flow, pressure, temperature, fluid properties
2. **Calculate Cv requirement** using appropriate formula
3. **Select valve type**: Globe, ball, butterfly based on application
4. **Check for cavitation**: Compare operating ΔP vs. critical ΔP
5. **Check noise level**: Use IEC 60534-8-3 for aerodynamic noise
6. **Verify rangeability**: Ensure valve can handle turndown ratio
7. **Select actuator**: Based on torque/force requirements

## Common Sizing Mistakes

| Mistake | Consequence | Solution |
|---------|-------------|----------|
| Ignoring FL factor | Oversized valve, poor control | Use FL-corrected formula |
| Not checking choked flow | Incorrect Cv, cavitation | Verify P2/P1 ratio |
| Using wrong Cv formula | Undersized or oversized valve | Match formula to fluid type |
| Ignoring piping effects | Incorrect Cv | Apply Fp factor |
| Oversizing for "safety" | Poor control at low flows | Size for normal operating conditions |

## Valve Characteristics

| Characteristic | Flow Curve | Best For |
|---------------|-----------|----------|
| Linear | Equal increment per % travel | Liquid level control |
| Equal Percentage | Equal % change per % travel | Pressure control, gas |
| Quick Opening | Fast opening, linear | On/off, emergency |

## Control Valve Noise

| Noise Level | Acceptable? | Action Required |
|-------------|-------------|-----------------|
| <85 dBA | Acceptable | None |
| 85-95 dBA | Marginal | Consider low-noise trim |
| >95 dBA | Unacceptable | Use special trim or multi-stage |

## ValveSpecs Pro Resources

Browse our control valve specifications. Filter by Cv range, valve type, and application to find the right control valve for your process.
`
  },
  {
    slug: "valve-material-guide-for-corrosive-media",
    title: "Valve Material Selection for Corrosive Media: Complete Compatibility Guide",
    metaTitle: "Valve Material Selection for Corrosive Media | ValveSpecs Pro",
    metaDescription: "Valve material compatibility guide for corrosive chemicals: stainless steel, duplex, Hastelloy, titanium. Include chemical resistance charts and selection criteria for aggressive media.",
    date: "2026-06-18",
    author: "ValveSpecs Engineering Team",
    category: "guide",
    tags: ["material", "corrosion", "stainless steel", "Hastelloy", "chemical resistance"],
    summary: "Selecting the right valve material for corrosive media is critical for equipment longevity and safety. This guide covers stainless steel grades, exotic alloys, and chemical compatibility for common industrial chemicals.",
    content: `
## Material Selection Overview

| Material | UNS Number | Max Temp | Corrosion Resistance | Cost Factor |
|----------|-----------|----------|---------------------|-------------|
| Carbon Steel (WCB) | J02502 | 425°C | Poor in corrosive | 1.0x |
| 304 SS (CF8) | J92600 | 425°C | Good general | 2.5x |
| 316 SS (CF8M) | J92900 | 425°C | Better (Mo content) | 3.0x |
| Duplex (CD3MN) | J93370 | 315°C | Excellent | 5.0x |
| Hastelloy C276 | N10276 | 675°C | Outstanding | 15x |
| Titanium (Grade 2) | R50400 | 315°C | Seawater, chlorides | 20x |
| Monel 400 | N04400 | 450°C | HF acid, seawater | 12x |

## Chemical Compatibility Chart

### Acids

| Chemical | 304 SS | 316 SS | Duplex | Hastelloy C276 | Titanium |
|----------|--------|--------|--------|----------------|----------|
| Sulfuric (dilute) | Fair | Good | Good | Excellent | Fair |
| Sulfuric (concentrated) | Poor | Poor | Fair | Good | Poor |
| Hydrochloric | Poor | Poor | Poor | Excellent | Fair |
| Nitric | Good | Good | Good | Good | Good |
| Phosphoric | Good | Good | Good | Excellent | Good |
| Acetic | Good | Good | Good | Excellent | Good |
| Formic | Fair | Good | Good | Excellent | Good |

### Alkalis

| Chemical | 304 SS | 316 SS | Duplex | Hastelloy C276 | Titanium |
|----------|--------|--------|--------|----------------|----------|
| Sodium Hydroxide (<50%) | Good | Good | Good | Good | Good |
| Sodium Hydroxide (>50%) | Fair | Fair | Good | Good | Fair |
| Potassium Hydroxide | Good | Good | Good | Good | Good |
| Ammonia | Good | Good | Good | Good | Good |

### Chlorides

| Chemical | 304 SS | 316 SS | Duplex | Hastelloy C276 | Titanium |
|----------|--------|--------|--------|----------------|----------|
| NaCl (seawater) | Poor (pitting) | Fair | Good | Excellent | Excellent |
| HCl (dilute) | Poor | Poor | Poor | Excellent | Fair |
| Chlorinated water | Poor | Fair | Good | Excellent | Excellent |

## Material Selection by Industry

### Oil & Gas
- **Standard service**: Carbon Steel (WCB/WCC)
- **Sour service (H2S)**: NACE MR0175 compliant (HRC ≤ 22)
- **Seawater**: Duplex or Super Duplex (CD3MN/CE3MN)
- **High temperature**: Chrome-moly (WC6/WC9/C5)

### Chemical Processing
- **Dilute acids**: 316 SS (CF8M)
- **Strong acids**: Hastelloy C276 or Alloy 20
- **Chlorinated solvents**: Hastelloy or Titanium
- **Caustic service**: Nickel 200/201

### Water Treatment
- **Potable water**: 304 SS or ductile iron
- **Desalination**: Super Duplex (CE3MN)
- **Wastewater**: 316 SS or Duplex

### Food & Pharmaceutical
- **Sanitary applications**: 316L SS (low carbon)
- **FDA/EC 1935/2004 compliance**: Electropolished surfaces

## Material Selection Decision Tree

1. **Is the media corrosive?** → If no, use Carbon Steel
2. **Is it seawater or chloride-rich?** → Duplex or Titanium
3. **Is it a strong acid (HCl, H2SO4 concentrated)?** → Hastelloy C276
4. **Is it a dilute acid?** → 316 SS may be sufficient
5. **Is high temperature involved (>425°C)?** → Chrome-moly or nickel alloys
6. **Is cost the primary concern?** → 304 SS or 316 SS with corrosion allowance

## Cost vs. Lifetime Analysis

| Material | Initial Cost | Expected Life (seawater) | 20-Year TCO |
|----------|-------------|-------------------------|-------------|
| Carbon Steel | $1,000 | 1-2 years | $15,000 |
| 316 SS | $3,000 | 5-8 years | $8,000 |
| Duplex | $5,000 | 15-20 years | $5,500 |
| Super Duplex | $8,000 | 25+ years | $8,500 |
| Titanium | $15,000 | 30+ years | $15,500 |

## ValveSpecs Pro Resources

Search our valve database by body material to find valves compatible with your process media. Filter by brand, valve type, and material grade.
`
  }
];

export function getPostBySlug(slug) {
  return blogPosts.find(p => p.slug === slug);
}

export function getAllSlugs() {
  return blogPosts.map(p => p.slug);
}

export function getAllCategories() {
  return [...new Set(blogPosts.map(p => p.category))];
}

export function getPostsByCategory(category) {
  return blogPosts.filter(p => p.category === category);
}