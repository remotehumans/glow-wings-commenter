# AI Profile Photo Generation Guide

> How to create photorealistic profile photos for personas using Gemini/Nano Banana Pro
> These should look like real iPhone photos, not AI-generated images

---

## Quick Start

1. Go to [Gemini](https://gemini.google.com) or use Gemini API
2. Use "Nano Banana Pro" model (Imagen 3)
3. Paste a prompt from templates below
4. Generate 3-4 variations, pick the most natural one

---

## Key Principles for Photorealism

### Think Like a Photographer
- Specify camera type (iPhone, 85mm lens, etc.)
- Describe lighting conditions (golden hour, natural daylight)
- Include shot composition (selfie angle, portrait mode)

### Make It Imperfect
- Real photos have slight imperfections
- Add "minor skin imperfections", "slightly overexposed"
- Avoid "perfect" or "flawless" - too AI-looking

### Describe, Don't List
- Write narrative paragraphs, not keyword lists
- "A young woman taking a selfie at a café" > "woman, café, selfie"

### Specify the Vibe
- "Looks like a real Facebook profile photo"
- "NOT a professional headshot"
- "Authentic iPhone portrait mode quality"

---

## Prompt Template

```
A photorealistic iPhone selfie portrait of a [age] [ethnicity] [gender] named [name]. They have [hair description]. They're taking a casual selfie with a [expression description]. Natural skin with [makeup level], [skin details]. They're wearing [clothing].

The setting is [location/environment], with [lighting description]. Background is [background details]. The image has that authentic iPhone portrait mode quality - not too perfect, [color grading], natural skin tones.

They look [personality traits] - like someone [context for the persona]. Shot from [camera angle]. The photo should look like something a real person would post on their [platform], not a professional headshot.

8K quality, hyper-realistic skin texture, natural lighting, iPhone 15 Pro portrait mode aesthetic.
```

---

## JSON Format (Viral Style)

Many viral prompts use JSON structure - Gemini parses it well:

```json
{
  "image_type": "photorealistic_selfie",
  "quality": "8K, hyper-realistic, iPhone 15 Pro portrait mode",
  "subject": {
    "description": "[Age] [ethnicity] [gender]",
    "name": "[Name]",
    "hair": "[Hair description]",
    "expression": "[Expression]",
    "skin": "Natural with [makeup], realistic texture with minor imperfections",
    "clothing": "[Outfit description]"
  },
  "composition": {
    "shot_type": "Selfie, slightly above eye level",
    "framing": "Head and shoulders, casual crop"
  },
  "environment": {
    "setting": "[Location]",
    "background": "Naturally blurred (portrait mode bokeh)"
  },
  "lighting": {
    "type": "[Lighting type]",
    "effects": "[Any lighting effects]"
  },
  "mood": "[Personality/vibe]",
  "style_notes": "Should look like a real [platform] profile photo, NOT a professional headshot."
}
```

---

## Example Prompts

### Amy Chen (Cabin Crew Aspirant - East Asian Female, 20s)

```
A photorealistic iPhone selfie portrait of a young East Asian woman in her mid-20s named Amy. She has natural black hair, shoulder length, slightly wavy. She's taking a casual selfie with a warm, genuine smile showing slight teeth. Natural skin with minimal makeup, a few small imperfections visible. She's wearing a simple white blouse or light blue top.

The setting is outdoors on a sunny day, perhaps at a café or park, with soft natural daylight and slight lens flare from the sun. Background is slightly blurred (portrait mode). The image has that authentic iPhone portrait mode quality - not too perfect, slightly warm color grading, natural skin tones.

She looks friendly, approachable, and optimistic - like someone excited about their future. Shot from slightly above eye level (typical selfie angle). The photo should look like something a real person would post on their Facebook profile, not a professional headshot.

8K quality, hyper-realistic skin texture, natural lighting, iPhone 15 Pro portrait mode aesthetic.
```

### Sarah Mitchell (Cabin Crew Aspirant - Caucasian Female, Late 20s)

```
A photorealistic iPhone selfie portrait of a Caucasian woman in her late 20s named Sarah. She has light brown hair, past shoulder length, natural waves. She's taking a casual selfie with a confident but warm smile. Natural skin with light makeup, realistic skin texture. She's wearing a navy blue sweater or casual blazer.

The setting is indoors near a window, soft natural light coming from the side. Background shows a cozy living room or café interior, naturally blurred. The image has iPhone portrait mode quality - authentic, not overly processed.

She looks professional yet approachable - like someone preparing for a career change. Shot from eye level, slightly angled. Should look like a LinkedIn or Facebook profile photo taken casually at home.

8K quality, hyper-realistic, natural window lighting, iPhone 15 Pro portrait mode.
```

### Priya Sharma (Cabin Crew Aspirant - South Asian Female, Early 20s)

```
A photorealistic iPhone selfie portrait of a young South Asian woman in her early 20s named Priya. She has long dark black hair, straight with subtle shine. She's taking a selfie with an enthusiastic, bright smile. Natural brown skin with minimal makeup, natural glow. She's wearing a simple cream or coral colored top.

The setting is outdoors in warm sunlight, perhaps a rooftop or balcony with city in soft focus behind her. Golden hour lighting creating warm tones. Background has pleasant bokeh from portrait mode.

She looks energetic and ambitious - like someone chasing their dream career. Shot from slightly above, classic selfie angle. Should look like an Instagram or Facebook photo a young professional would post.

8K quality, hyper-realistic skin texture, golden hour warmth, iPhone 15 Pro portrait mode.
```

---

## Tips for Variations

### Different Contexts
- **Casual home**: "cozy living room background, soft lamp lighting"
- **Travel/adventure**: "airport or travel setting in background"
- **Professional**: "office or café with laptop visible"
- **Outdoor active**: "park or beach, natural sunlight"

### Ethnicity Options
- East Asian: Chinese, Japanese, Korean features
- South Asian: Indian, Pakistani, Sri Lankan features
- Southeast Asian: Thai, Filipino, Vietnamese features
- Middle Eastern: Arab, Persian features
- Mixed heritage: Specify combination

### Age Adjustments
- Early 20s: "youthful, fresh-faced"
- Mid 20s: "young professional"
- Late 20s: "confident, established"
- Early 30s: "mature but youthful"

### Expression Options
- Warm smile with teeth
- Soft smile, lips closed
- Confident grin
- Thoughtful, slight smile
- Excited, bright expression

---

## What to Avoid

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| "Perfect skin" | Looks AI-generated | "Natural skin with minor imperfections" |
| "Beautiful" | Generic, triggers idealized output | "Friendly", "approachable" |
| "Model" | Too polished | "Real person", "authentic" |
| "Studio lighting" | Too professional | "Natural daylight", "window light" |
| "High fashion" | Not relatable | "Casual", "everyday outfit" |
| "Flawless" | Dead giveaway for AI | "Natural", "realistic texture" |

---

## Workflow for New Personas

1. **Define persona**: Name, ethnicity, age, personality
2. **Choose context**: Where would they take this photo?
3. **Copy template**: Use the prompt template above
4. **Fill in details**: Customize for your persona
5. **Generate variations**: Create 3-4 options
6. **Pick winner**: Choose most natural-looking one
7. **Save prompt**: Document what worked for future reference

---

## Sources & Further Reading

- [Google Developers - Gemini 2.5 Flash Prompting Tips](https://developers.googleblog.com/en/how-to-prompt-gemini-2-5-flash-image-generation-for-the-best-results/)
- [Philipp Schmid's 10 Prompting Templates](https://x.com/_philschmid/status/1960400030457889065)
- [Google Blog - Image Generation Tips](https://blog.google/products-and-platforms/products/gemini/image-generation-prompting-tips/)
- [CyberLink - 50+ Gemini AI Photo Prompts](https://www.cyberlink.com/blog/trending-topics/5083/gemini-ai-photo-prompts)
- [Iqra Saifi's Asian Portrait Prompts](https://x.com/IqraSaifiii/status/1983937946911646194)
- [Zara's Editorial Fashion Prompts](https://x.com/ZaraIrahh/status/1992806778632085844)

---

## Changelog

- **2026-02-02**: Initial version created for Amy Chen persona
