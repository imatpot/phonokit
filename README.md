# Phonotypst

A comprehensive phonology toolkit for Typst, providing IPA transcription with tipa-style input and prosodic structure visualization.

## Features

### IPA Module

- **tipa-style input**: Use familiar LaTeX tipa notation instead of hunting for Unicode symbols
- **Comprehensive symbol support**: All IPA consonants, vowels, and other symbols from the tipa chart
- **Combining diacritics**: Nasalization (`\\~`), devoicing (`\\r`), voicing (`\\v`), and liaison (`\\t`)
- **Suprasegmentals**: Primary stress (`'`), secondary stress (`,`), length (`:`)
- **Automatic character splitting**: Type `SE` instead of `S E` for efficiency (spacing is necessary around characters using backslashes)
- **Charis SIL font**: Proper rendering of all IPA symbols

### Prosody Module

- **Prosodic structure visualization**: Draw syllable structures with onset, nucleus, and coda
- **Flexible foot structure**: Use parentheses to mark explicit foot boundaries
- **Stress marking**: Mark stressed syllables with apostrophe
- **Flexible alignment**: Left or right alignment for prosodic word heads
- **Beautiful diagrams**: Clean `CeTZ`-based visualizations

## Installation

### Package Repository

- `http://github.com/guilhermegarcia/phonotypst`

## Usage

### IPA Transcription

```typst
// Basic transcription
#ipa("'hEloU")  // → ˈhɛloʊ

// With nasalization
#ipa("\\~ E")  // → ɛ̃

// With devoicing
#ipa("\\r s")  // → s̥

// With voicing
#ipa("\\v n")  // → n̩

// Affricates
#ipa("\\t s")  // → t͡s

// Complex example with multiple features
#ipa("'sIn,t \\ae ks")  // → ˈsɪnˌtæks
```

#### tipa Notation Quick Reference

**Single-character codes** (no space needed):

- Common vowels: `i I e E a A o O u U @`
- Common consonants: `p b t d k g f v s z S Z m n N l r`
- Stress: `'` (primary), `,` (secondary)
- Length: `:` (place after vowel)

**Multi-character codes** (with backslash, need spaces around them):

- `\\textltailn` → ɲ
- `\\ae` → æ
- See [tipa chart](http://www.tug.org/tugboat/tb17-2/tb51rei.pdf) for complete list

**Combining diacritics** (need space before target):

- `\\~` → ̃ (nasalization)
- `\\r` → ̥ (devoicing/voiceless)
- `\\v` → ̩ (voicing mark)
- `\\t` → ͡ (tie bar/liaison)

### Prosodic Structures

```typst
// Syllables without feet
#prosody("ka.va.lo")

// One foot with two syllables, plus one footless syllable
#prosody("(ka.'va).lo")

// Right-aligned prosodic word (default)
#prosody("(ka.'va).lo", foot: "R")

// Left-aligned prosodic word
#prosody("('ka.va)", foot: "L")

// Multiple feet
#prosody("('ka.ta)('vas.lo)", foot: "L")
```

**Prosody notation:**

- `.` separates syllables
- `'` before a syllable marks it as stressed (e.g., `'va`)
- `()` marks foot boundaries
- Characters within syllables are automatically parsed into onset, nucleus, and coda

## Reference

### `ipa(input: string)`

Convert tipa-style notation to IPA symbols rendered in Charis SIL font.

**Parameters:**

- `input` (string): tipa-style notation

**Returns:** Formatted IPA content

**Example:**

```typst
#ipa("'Sip")  // → ˈʃip
```

### `prosody(input: string, foot: string)`

Draw a prosodic structure with explicit foot boundaries marked by parentheses.

**Parameters:**

- `input` (string): Syllables separated by dots, with optional parentheses for feet and apostrophes for stress
- `foot` (string, optional): Alignment of prosodic word head - `"R"` for right-aligned (default) or `"L"` for left-aligned

**Returns:** CeTZ drawing of prosodic structure showing syllables, feet, and prosodic word

**Example:**

```typst
#prosody("(ka.'va).lo", foot: "R")
```

## Dependencies

- [CeTZ](https://github.com/cetz-package/cetz) 0.4.2 - For drawing prosodic structures

## License

MIT

## Author

**Guilherme D. Garcia**
Email: <guilherme.garcia@lli.ulaval.ca>

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## Fonts

This package includes **Charis SIL**, a Unicode-based font family designed for broad phonetic transcription and supporting comprehensive IPA symbols. Charis SIL is developed by SIL International and distributed under the SIL Open Font License (OFL).

- **Font**: Charis SIL
- **Version**: 6.200 (or later)
- **Copyright**: © 1997-2023 SIL International
- **License**: SIL Open Font License 1.1
- **Website**: <https://software.sil.org/charis/>

The inclusion of Charis SIL ensures consistent and accurate rendering of IPA symbols across all systems without requiring users to install additional fonts.

## Acknowledgments

This package was developed to make phonological notation and visualization easier for linguists using Typst.

Special thanks to SIL International for developing and maintaining Charis SIL, an essential resource for linguistic typography.
