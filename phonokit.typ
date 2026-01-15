#import "lib.typ": *
#import "@preview/fontawesome:0.5.0": *

// Logo:
#let kit = text(fill: blue.darken(5%))[*#emph[k]it*]
#let logo = [*phono*#kit]

#set math.equation(numbering: "(1)")
#show raw.where(block: false): it => {
  let content = if it.lang == none and it.text.starts-with("#") {
    raw(it.text, lang: "typ")
  } else {
    it
  }
  let size = if it.text.starts-with("#") { 1.1em } else { 1em }
  box(
    fill: rgb("#f0f0f0"),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 4pt),
    radius: 3pt,
    text(font: "Berkeley Mono", size: size, fill: rgb("#c7254e"), content),
  )
}

// NOTE: Code block
#show raw.where(block: true): it => {
  set text(font: "Berkeley Mono", size: 1em)
  block(
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
    width: auto,
    it,
  )
}

// NOTE: Helper for showing code and output side-by-side
#let show-example(code, output) = {
  grid(
    columns: (1.2fr, 1fr),
    gutter: 1em,
    align(left + horizon, code), align(center + horizon, output),
  )
}

// NOTE: Paragraph
#set par(
  first-line-indent: 2em,
  spacing: 1em,
  leading: 1em,
  justify: true,
  hanging-indent: 0em,
)

// #set figure(supplement: "Fig.")
#set figure(gap: 1em)

// NOTE: Text
#set text(font: "Charis SIL", size: 10pt, lang: "en", hyphenate: auto)

// NOTE: Margins
#set page(
  // fill: luma(50),
  margin: (
    top: 2cm,
    bottom: 2cm,
    left: 2.5cm,
    right: 2.5cm,
  ),
  numbering: "1",
  number-align: center,
)

// NOTE: Define LaTeX command/logo
#let LaTeX = {
  let A = (
    offset: (
      x: -0.33em,
      y: -0.3em,
    ),
    size: 0.7em,
  )
  let T = (
    x_offset: -0.12em,
  )
  let E = (
    x_offset: -0.2em,
    y_offset: 0.23em,
    size: 1em,
  )
  let X = (
    x_offset: -0.1em,
  )
  [L#h(A.offset.x)#text(size: A.size, baseline: A.offset.y)[A]#h(T.x_offset)T#h(E.x_offset)#text(size: E.size, baseline: E.y_offset)[E]#h(X.x_offset)X]
}

// NOTE: Define LaTeXiT command/logo
#let LaTeXiT = {
  let A = (
    offset: (
      x: -0.33em,
      y: -0.3em,
    ),
    size: 0.7em,
  )
  let T = (
    x_offset: -0.12em,
  )
  let E = (
    x_offset: -0.2em,
    y_offset: 0.23em,
    size: 1em,
  )
  let X = (
    x_offset: -0.1em,
  )
  let I = (
    x_offset: -0.1em,
  )
  [L#h(A.offset.x)#text(size: A.size, baseline: A.offset.y)[A]#h(T.x_offset)T#h(E.x_offset)#text(size: E.size, baseline: E.y_offset)[E]#h(X.x_offset)X#h(I.x_offset)#text(size: E.size, baseline: E.y_offset)[I]#h(T.x_offset)#text(size: A.size, baseline: A.offset.y, weight: 800)[T]]
}

// NOTE: Adjust heading numbering and justification
#set heading(
  numbering: "1.1.",
)

#show heading: it => {
  v(1em)
  it
  v(0.5em)
}

#show figure: it => {
  v(1em)
  it
  v(1em)
}

#show grid: it => {
  v(1em)
  it
  v(1em)
}

#let abstract(body) = {
  align(center)[*Abstract*]
  v(0.5em)
  align(center)[
    #block(width: 85%)[
      #align(left)[
        #par(justify: true, leading: 0.8em, first-line-indent: 0pt)[
          #set text(size: 0.9em)
          #body
        ]
      ]
    ]
  ]
  v(1em)
}

// NOTE: Link colors
#show link: set text(fill: blue)
#show ref: set text(fill: rgb(200, 0, 0))

// NOTE: Begin doc here

#title([#logo])
_A toolkit to create phonological representations in Typst_

#grid(
  columns: (1fr, auto),
  [Guilherme D. Garcia #link("https://orcid.org/0000-0003-1412-3856")[#box(baseline: 20%, image("orcid.svg", height: 1em))]\
    #par(leading: 0.8em, first-line-indent: 0pt)[#text(
      size: 0.7em,
    )[Pavillon Charles-De Koninck, 1030, Bureau DKN-3267\
      Département de langues, linguistique et traduction, #smallcaps[Université Laval] \
      Avenue des Sciences-Humaines, Québec QC, Canada\
      #fa-earth-americas() #link("https://gdgarcia.ca")[`gdgarcia.ca`] #fa-github() #link(
        "https://github.com/guilhermegarcia",
      )[`guilhermegarcia`] #fa-envelope() #link(
        "mailto: guilherme.garcia@lli.ulaval.ca",
      )[`guilherme.garcia@lli.ulaval.ca`]]]],
  [#link("https://doi.org/10.5281/zenodo.17971031")[#image("zenodo-badge.svg", height: 1em)]

  ],
)

#v(4em)

#abstract[
  Creating high-quality phonological representations in academic documents is often time-consuming and requires juggling multiple tools and #LaTeX packages (most notably `TikZ`). This vignette introduces #logo, an open-source Typst package designed to streamline the creation of phonological structures while maintaining typographical precision. The package provides intuitive functions for IPA transcription (supporting `tipa` input conventions), prosodic representations (syllables, feet, prosodic words, metrical grids), autosegmental phonology (feature spreading, tone, delinking), and constraint-based frameworks (SPE feature matrices, Optimality Theory tableaux, Harmonic Grammar, and Maximum Entropy grammars). All functions prioritize minimal input syntax while automatically handling complex typographical challenges such as dynamic spacing, line crossing prevention, and proper alignment. #logo aims to reduce cognitive load in document preparation, allowing phonologists to focus on content rather than
  formatting. The package is freely available through Typst's package repository and is under active development.
]

#v(1em)

#outline(depth: 1, title: "Table of contents")

#v(1fr)
#align(right)[
  #text(fill: gray)[_Last updated on #datetime.today().display("[month repr:long] [day], [year]")_]
]
#pagebreak()

= Introduction <sec-intro>

This vignette introduces #logo and its functions. If you haven't used Typst yet and want to follow along, go to #link("https://typst.app")[Typst.app] to use their online editor. You may want to check their own #link("https://typst.app/docs/tutorial/")[tutorial] too (I have an introductory YouTube series #link("https://www.youtube.com/playlist?list=PL3Qku9eEGkK25vbfHx_YUpvNNogYAqt3N")[here]). This is *not* an introduction to Typst, but see @app-editor, @app-packages and @app-png in the appendix for some useful info. The GitHub repository for the package can be found at `guilhermegarcia/phonokit`. Comments and suggestions are welcome, as are bug reports (open an issue in the package's repository). The main goals of #logo are to #smallcaps("minimize effort") and #smallcaps("maximize quality").


== Installation <sec-installation>

Typst packages are always loaded the same way: using the `#import` function at the top of your `typ` document, as shown in @code-import1. Replace `X.X.X` with the version you wish to import. For example, the most recent version of #logo at the time of this writing is `0.3.0`. The `*` simply states that we want to import all functions from the package in question. See package's page on Typst's website #link("https://typst.app/universe/package/phonokit")[here].

#figure(
  caption: [Loading a package in Typst using the official repository],
  supplement: "Code",
  kind: "code",
  ```typst
  #import "@preview/phonokit:X.X.X": *
  ```,
) <code-import1>


Alternatively, if you want the most up-to-date version and this version is ahead of the published version, download/clone the repository #link("https://github.com/guilhermegarcia/phonokit")[here] and load package locally. This is shown in @code-import2. You simply need to import the `lib.typ` file, which is present in any package.

#figure(
  caption: [Loading a package in Typst using a local package],
  supplement: "Code",
  kind: "code",
  ```typst
  #import "phonokit/lib.typ": *
  ```,
) <code-import2>

You may need to create a symlink depending on how you structure your files. See @app-packages for more information on Typst packages in general, as they work slightly differently from what you may be used to if you use #LaTeX.


= IPA module <sec-ipa-module>

IPA transcription is likely the most commonly used feature when typesetting documents in phonology. #logo accomplishes that with the `#ipa()` function, which takes a string as input. Crucially, the function uses the familiar `tipa` input @tipa, with a few exceptions (e.g., secondary stress is represented by a comma `,`, not by two double quotes `""`).


== Phonemic transcription <sec-ipa-trans>

As can be seen in @fig-ipa-examples, symbols introduced by two backslashes `\\` must not have adjacent characters. For archiphonemes, you can use `\\` followed by a capital letter of your choice. This is nice because you don't need to leave the function to render an archiphoneme, so the font will be automatically consistent across phonemes and archiphonemes. Thus, while `#ipa("N")` maps to "#ipa("N")", `#ipa("\\N")` maps to "#ipa("\\N")" --- see examples. Note that all functions in #logo require the Charis SIL font @charis_sil, regardless of the font used in the document.

#figure(
  caption: [Transcriptions using `#ipa()`],
  supplement: "Code",
  kind: "code",
  table(
    columns: (auto, auto, auto),
    stroke: none,
    align: left,
    [`#ipa("DIs \\s Iz \\s @ \\s sEn.t@ns")`], ipa("DIs \\s Iz \\s @ \\s sEn.t@ns"), [_This is a sentence_],
    [`#ipa("N \\N R \\R \\I I Z \\Z")`], ipa("N \\N R \\R \\I I Z \\Z"), [_Escaped characters_],
    [`#ipa("p \\h I k \\* \\s \\t tS \\ae t \\s p \\r l iz")`],
    ipa("p \\h I k \\* \\s \\t tS \\ae t \\s p \\r l iz"),
    [_Pick, chat, please_],

    [`#ipa("'lIt \\v l \\s 'b2R \\schwar ,flaI")`], ipa("'lIt \\v l \\s 'b2R \\schwar ,flaI"), [_Little butterfly_],
  ),
) <fig-ipa-examples>


== Phonemic inventories

Two additional functions allow users to quickly create consonant tables and vowel trapezoids given a string of phonemes. @fig-consonants-it shows the consonant inventory for Italian, for example. The function mirrors the pulmonic consonants table in the IPA chart with some minor changes. For example, affricates are shown when `affricates: true`, and #ipa("/w/") is shown in the approximant row under both bilabial and velar columns (when #ipa("/ \\textturnmrleg /") is not present, in which case #ipa("/w/") appears only under bilabial).


#figure(
  caption: [Italian consonants - `#consonants("italian", affricates: true)`],
  consonants("italian", affricates: true),
) <fig-consonants-it>

Aspirated consonants are shown when `aspirated: true`. In cases where neither `affricates` nor `aspirated` are set to `true`, the function will omit both groups and fewer rows will be printed.

The user can either input a language#footnote[Available languages: Arabic, English, French, German, Italian, Japanese, Portuguese, Russian and Spanish (all language names are lowercase in the function). You can also use `all` to display all consonants. The same applies to the function `#vowels()`.] (see caption of @fig-consonants-it) or a string of consonants to create a custom inventory (@fig-consonants-custom) --- the input follows the same format used by the `#ipa()` function discussed in @sec-ipa-trans, so `#ipa("\\*r")` generates "#ipa("\\*r")". Note, however, that both affricates and aspirated consonants require curly braces around them as well as `affricates: true` and `apirated: true`, as shown in the caption of @fig-consonants-custom. Finally, the function also allows for flexible sizing with the `scale` argument.



#figure(
  caption: [`#consonants("ts{ts}psS \\*r g{tS} k {k \\h}", affricates: true, aspirated: true)`],
  consonants("ts{ts}psS \\*r g{tS} k {k \\h}", affricates: true, aspirated: true),
) <fig-consonants-custom>


Besides the function `#consonants()`, the package also has a function to print vowel inventories. The function `#vowels()` also accepts either a pre-defined language or a string as input. @fig-vowels-english and @fig-vowels-french show the inventories for English and French, respectively. The argument `scale` is also available here, so the user can adjust the size of the trapezoid as needed.

#grid(
  columns: (1fr, 1fr),
  [#align(center + bottom)[
    #figure(
      caption: [`#vowels("english", scale: 0.6)`],
      vowels("english", scale: 0.6),
    ) <fig-vowels-english>
  ]],
  [#align(center + bottom)[
    #figure(
      caption: [`#vowels("french", scale: 0.6)`],
      vowels("french", scale: 0.6),
    ) <fig-vowels-french>
  ]],
)




= Prosody module <sec-prosody>

== Sonority

When discussing the sonority principle in introductory phonology courses, it is often useful to illustrate relative sonority with a visual representation. The function `#sonority()`, based on the Fonology package for R @fonology, plots phonemes and their relative sonority profiles. The function is based on the sonority scale in #cite(<parker_sonority_2011>, form: "prose", supplement: [p. 18]). You may want to customize the sonority scale in question to your needs and preferences. In that case, download or clone the package and adjust the scale as needed in the source code (`sonority.typ`).

#figure(
  caption: [`#sonority("vA \\*r . sI.ti", scale: 0.7)`],
  sonority("vA \\*r . sI.ti", scale: 0.7),
) <fig-son1>

@fig-son1 shows an example for the word "varsity". If syllable boundaries are detected in the input, the function alternates between white and gray fills to distinguish each syllable. If no boundaries are detected, all boxes will be white by default.

== Syllables

We start with an essential representation, namely the syllable. Two options are available: `#syllable()` for a classic onset-rhyme representation (@fig-syl1), and `#mora(..., coda: true)` for a moraic representation (@fig-syl2). The latter option allows you to define whether or not codas project a mora (`coda: true`). These two functions are used for single-syllable representations only. As can be seen in the figures, these functions take as input a string that should be familiar given the discussion about `#ipa()` in @sec-ipa-trans.

#grid(
  columns: (1fr, 1fr),
  [#align(center + bottom)[
    #figure(
      caption: [`#syllable("\\t tS \\ae t")`],
      syllable("\\t tS \\ae t", scale: 0.9),
    ) <fig-syl1>
  ]],
  [#align(center + bottom)[
    #figure(
      caption: [`#mora("\\t tS \\ae t", coda: true)`],
      mora("\\t tS \\ae t", coda: true, scale: 0.9),
    ) <fig-syl2>
  ]],
)


Vowel length is also represented in both `#syllable()` and `#mora()`, as can be seen in @fig-syl-long and @fig-mora-long, respectively. The crucial element here is the use of `:`, which triggers the #ipa(":") symbol for both representations. In the moraic representation, two moras branch out of the vowel, as expected.

#grid(
  columns: (1fr, 1fr),
  [#align(center + bottom)[
    #figure(
      caption: [`#syllable("tR \\~ a:m")`],
      syllable("tR \\~ a:m", scale: 0.9),
    ) <fig-syl-long>
  ]],
  [#align(center + bottom)[
    #figure(
      caption: [`#mora("tR \\~ a:m", coda: true)`],
      mora("tR \\~ a:m", coda: true, scale: 0.9),
    ) <fig-mora-long>
  ]],
)


The dimensions of each representation adjust as a function of how many segments are found in the input. As such, more complex onsets, nuclei or codas result in wider representations that respect a safe and consistent between-segment distance. @fig-syl3 illustrates this with an extreme example.

#figure(
  caption: [How spacing is managed],
  syllable("xxxxxaaaaaxxxxx", scale: 0.9),
) <fig-syl3>



We often need to adjust the size of a representation as a whole. But doing so can be problematic if the text and the representation itself behave independently. Here, however, representations can be easily adjusted with the argument `scale`, which takes care of both line width and text size. Examples are shown in @fig-scale075, @fig-scale05 and @fig-scale025.


#grid(
  columns: (1fr, 1fr, 1fr),
  [#align(center + bottom)[
    #figure(
      syllable("\\t tS \\ae t", scale: 0.75),
      caption: [Scale 0.75],
    )<fig-scale075>
  ]],
  [#align(center + bottom)[
    #figure(
      syllable("\\t tS \\ae t", scale: 0.5),
      caption: [Scale 0.5],
    )<fig-scale05>
  ]],
  [#align(center + bottom)[
    #figure(
      syllable("\\t tS \\ae t", scale: 0.25),
      caption: [Scale 0.25],
    )<fig-scale025>
  ]],
)


== Feet

Next, we examine metrical feet (@fig-ft1 and @fig-ft2). These functions are designed to deal with a single foot where all syllables are footed by definition, since unfooted syllables have nowhere to attach to (see @sec-pwd). A period `.` is used in the code to indicate syllabification and a single apostrophe `'` is used to indicate which syllable is the head of the foot. This allows us to easily create trochees and iambs. Naturally, you are free to generate non-binary feet, as the function can handle them as well (dactyls in @fig-ft3 and @fig-ft4).

#grid(
  columns: (1fr, 1fr),
  [#align(center + bottom)[
    #figure(
      caption: [`#foot("'p \\h \\ae.\\*r Is")`],
      foot("'p \\h \\ae.\\*r Is", scale: 0.9),
    ) <fig-ft1>
  ]],
  [#align(center + bottom)[
    #figure(
      caption: [`#foot-mora("po.'Ral", coda: true)`],
      foot-mora("po.'Ral", coda: true, scale: 0.9),
    ) <fig-ft2>
  ]],
)

#grid(
  columns: (1fr, 1fr),
  [#align(center + bottom)[
    #figure(
      caption: [`#foot("'po.Ra.ma")`],
      foot("'po.Ra.ma", scale: 0.9),
    ) <fig-ft3>
  ]],
  [#align(center + bottom)[
    #figure(
      caption: [`#foot-mora("'po.Ra.ma")`],
      foot-mora("'po.Ra.ma", coda: true, scale: 0.9),
    ) <fig-ft4>
  ]],
)


Geminates are also represented by the functions `#foot()` and `#foot-mora()`. In onset-rhyme representations, a geminate will be linked to the coda and the following onset, as expected. In moraic representations, the user will probably want to define `coda: true` to represent geminates in a traditional fashion. @fig-ft5 and @fig-ft6 show a disyllabic word containing a geminate in both onset-rhyme and moraic representations. The two figures alternate the stress position to illustrate right- and left-headed feet --- it goes without saying that the function does not evaluate the plausibility of a metrical representation.

#grid(
  columns: (1fr, 1fr),
  [#align(center + bottom)[
    #figure(
      caption: [`#foot("'pot.ta")`],
      foot("'pot.ta", scale: 0.9),
    ) <fig-ft5>
  ]],
  [#align(center + bottom)[
    #figure(
      caption: [`#foot-mora("'pot.ta", coda: true)`],
      foot-mora("'pot.ta", coda: true, scale: 0.9),
    ) <fig-ft6>
  ]],
)


Extreme cases are important to test how adaptable the function is when it comes to line crossings, a key problem in prosodic representations. When the head of a domain (the foot here) is at an edge of a long string, it is challenging to avoid crossing or overlapping lines. As can be seen in @fig-ft7, the height of $Sigma$ is proportional to the width of the representation to avoid superposition of lines.


#figure(
  caption: [An extreme case],
  foot("'xa.xa.xa.xa.xa.xa.xa.xa.xa.xa.xa.xa", scale: 0.7),
)<fig-ft7>


== Prosodic words <sec-pwd>

Finally, we arrive at prosodic words (PWd), which bring together syllables and feet. This is where the user has more options, given the metrical parameters involved. Parentheses `()` are used to define feet, which means that any syllable _outside_ the foot will be linked directly to the PWd. Next, an apostrophe `'` symbolizing stress (both primary _and_ secondary) is used to indicate the head of each foot. Finally, the argument `foot: "R"` or `foot: "L"` is used to determine which foot in the PWd contains the primary stress in the word (in cases where more than one foot is present in a given PWd).

#grid(
  columns: (1fr, 1fr),
  rows: 2,
  inset: 2em,
  [#align(center + bottom)[
    #figure(
      caption: [`#word("('po.Ra).ma")`],
      word("('po.Ra).ma", scale: 0.9),
    ) <fig-wd1>
  ]],
  [#align(center + bottom)[
    #figure(
      caption: [`#word-mora("('po.Ra).ma")`],
      word-mora("('po.Ra).ma", coda: true, scale: 0.9),
    ) <fig-wd2>
  ]],

  [#align(center + bottom)[
    #figure(
      caption: [When `foot: "L"` (default)],
      word-mora("('po.Ra).('ma.pa)", foot: "L", scale: 0.9),
    ) <fig-wd4>
  ]],
  [#align(center + bottom)[
    #figure(
      caption: [When `foot: "R"`],
      word("('po.Ra).('ma.pa)", foot: "R", scale: 0.9),
    ) <fig-wd3>
  ]],
)

=== Extreme scenarios

It is worth noting that _all_ lines are straight in the prosody module (this is by design), so curved lines are not a possibility. Consequently, in extreme scenarios, e.g., where an unfooted syllable is _very_ far away from the head foot of a given PWd, the height of the representation will be adjusted accordingly to avoid line crossings. This will inevitably create taller figures, as already mentioned. @fig-extreme presents a hypothetical scenario to demonstrate how the function deals with extreme cases.

#figure(
  caption: [Unfooted syllable far away from head foot],
  word("xa.(xa.xa)(xa.xa)(xa.xa)(xa.xa)", scale: 0.7),
) <fig-extreme>


== Metrical grid

The function `#met-grid()` allows you to create a metrical grid using $times$ to indicate prominence (e.g., #cite(<zsiga2013sounds>, form: "prose", supplement: "p. 373")). As with all functions in the package, the goal here is to create high-quality output with _minimal effort_, that is to say, with functions that are as intuitive and parsimonious as possible. @fig-grid1 and @fig-grid2 show grids for the word _butterfly_.

#align(center)[
  #grid(
    columns: (auto, auto),
    gutter: 5em,
    [#figure(
        caption: [Input as string],
        kind: image,
        met-grid("bu3.tter1.fly2"),
      ) <fig-grid1>
    ],
    // <- comma here
    [#figure(
        caption: [Input as tuple (IPA-compatible)],
        kind: image,
        met-grid(
          ("b2", 3),
          ("R \\schwar", 1),
          ("flaI", 2),
        ),
      ) <fig-grid2>
    ],
  )
]


#figure(
  gap: 1em,
  caption: [Metrical grids shown in @fig-grid1 and @fig-grid2],
  supplement: "Code",
  kind: "code",
  ```typst
  #met-grid("bu3.tter1.fly2") // Input as string
  #met-grid(("b2", 3), ("R \\schwar", 1), ("flaI", 2)) // Input as tuple
  ```,
) <fig-grid>




== Autosegmental phonology <sec-auto>

Another key function in #logo is `#autoseg()`, introduced in version 0.3.0. The function allows you to represent either features or tones on a separate tier. More importantly, the function is able to show linking and delinking, floating tones, as well as contour tones. @fig-nasal-spreading demonstrates how `#autoseg()` works in a simple scenario of feature spreading.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (top, top),
  [
    #figure(
      caption: [Code to generate @fig-nasal-spreading],
      supplement: "Code",
      kind: "code",
      ```typst
      #autoseg(
          ("k", "\\ae", "n", "t"),
          features: ("", "", "[+nas]", ""),
          links: ((2, 1),),
          spacing: 1.0,
          arrow: false,
        )
      ```,
    )
  ],
  [
    #figure(
      caption: [Feature spreading],
      [#autoseg(
          ("k", "\\ae", "n", "t"),
          features: ("", "", "[+nas]", ""),
          links: ((2, 1),),
          spacing: 1.0,
          arrow: false,
        )
      ],
    ) <fig-nasal-spreading>
  ],
)

As can be seen in the figure, `#autoseg()` accepts the same inputs as `#ipa()`. Here, inputs are arrays, so each phoneme must be entered individually. This results in more flexibility, as you can add empty spaces, symbols for domain boundaries, etc. The argument `features` works the same way. In this particular case, only one feature is present (in position 2, since we count from zero). That position is aligned with the segment "n": this automatically draws a vertical line linking segment to feature. Indices are key because the argument `links` depends on them. For the spreading to be represented here, `links` is defined as *an array of tuples* `((2,1),)`, hence the commas. Read this as "draw a link from index 2 to index 1". Finally, `spacing` allows you to conveniently set the inter-segmental spacing (lines and links are adjusted accordingly). The argument `arrow` simply asks whether an arrow head should be added to the linking line (`true` or `false`).

Multiple links are easy to implement. @fig-metaphony shows an example of metaphony in Brazilian Veneto @garcia_guzzo_ijl where two vowels are targeted by the spreading of [+high]. The source of the process is position 6 ("i") and the targets are positions 3 ("e") and 1 ("o"), hence the array `((6,3), (6,1))` in the code. Finally, notice that the argument `gloss` allows for quick annotation.

#grid(
  columns: (1.35fr, 1fr),
  gutter: 1em,
  align: (top, top),
  [
    #figure(
      caption: [Code to generate @fig-metaphony],
      supplement: "Code",
      kind: "code",
      ```typst
      #autoseg(
          ("z", "o", "v", "e", "n", "–", "i"),
          features: ("", "", "", "", "", "", "[+hi]"),
          links: ((6, 3), (6, 1)),
          spacing: 0.5, // better spacing
          arrow: true,
          gloss: [_young_.#smallcaps("pl")],
        )
      ```,
    )
  ],
  [
    #figure(
      caption: [Metaphony in Brazilian Veneto],
      [#autoseg(
          ("z", "o", "v", "e", "n", "–", "i"),
          features: ("", "", "", "", "", "", "[+hi]"),
          links: ((6, 3), (6, 1)),
          spacing: 0.5,
          arrow: true,
          gloss: [_young_.#smallcaps("pl")],
        )
      ],
    ) <fig-metaphony>
  ],
)

=== Tones

One of the arguments in `#autoseg()` is `tone` (`true` or `false`). This allows us to "flip" the representation vertically to show tones above the segmental tier. Take a look at @fig-ebe, which shows a case of low tone spreading without delinking in Nupe @zsiga2013sounds. We can easily add multiple instances of the function to represent processes with relatively concise code.


#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  [#figure(
      caption: [Code to generate @fig-ebe],
      supplement: "Code",
      kind: "code",

      ```typst
      #autoseg(
        ("e", "b", "e"),
        features: ("L", "", "H"),
        spacing: 0.5,
        tone: true,
        gloss: [],
      )
      #a-r // arrow
      #autoseg(
        ("e", "b", "e"),
        features: ("L", "", "H"),
        links: ((0, 2),),
        spacing: 0.5,
        tone: true,
        gloss: [èbě],
      )

      ```,
    ) <code-ebe>
  ],
  [
    #figure(
      caption: [Tone spreading],
      [#autoseg(
          ("e", "b", "e"),
          features: ("L", "", "H"),
          spacing: 0.5,
          tone: true,
          gloss: [],
        )
        #a-r
        #autoseg(
          ("e", "b", "e"),
          features: ("L", "", "H"),
          links: ((0, 2),),
          spacing: 0.5,
          // arrow: true,
          tone: true,
          gloss: [èbě _pumpkin_],
        )
      ],
    ) <fig-ebe>
  ],
)

Floating tones can be added with the `float` argument. @fig-float demonstrates how to add such a tone and how to draw a circle around it with the `highlight` argument, which can be used with any tone, of course.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (top, top),
  [
    #figure(
      caption: [Floating tone],
      supplement: "Code",
      kind: "code",
      ```typst
      #autoseg(
            ("i", "@", "N", "k", "a"),
            features: ("H", "", "L", "", "H"),
            highlight: (2,),
            spacing: 1.0,
            tone: true,
            float: (2,),
          )
      ```,
    ) <fig-float>
  ],
  [
    #figure(
      caption: [Floating tone],
      autoseg(
        ("i", "@", "N", "k", "a"),
        features: ("H", "", "L", "", "H"),
        highlight: (2,),
        spacing: 1.0,
        tone: true,
        float: (2,), // L tone at position 2 is floating
      ),
    )

  ],
)

Spreading from a contour tone involves a more complex scenario. In @fig-contour, the vowel in position 2 is linked to two tones. To create this representation, the element in position 2 inside `features` must be itself a tuple with the two tones in question. This will already add the solid lines connecting the vowel to the two tones. The `links` argument then takes care of the dashed line: `(((2, 0), 1),),`. This merely says "look at position 2 and pick the first element there, i.e., `(2,0)`, then draw a dashed line from that element to position 1". Tuples inside tuples are essential here.


#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  [
    #figure(
      caption: [Contour tone],
      supplement: "Code",
      kind: "code",
      ```typst
      #autoseg(
        ("m", "1", "A", "u"),
        features: ("", "", ("H", "L"), ""),
        links: (((2, 0), 1),),
        tone: true,
        highlight: ((2, 0),),
        spacing: 1.0,
        arrow: true,
      ),
      ```,
    )
  ],
  [
    #figure(
      caption: [Contour tone],
      autoseg(
        ("m", "1", "A", "u"),
        features: ("", "", ("H", "L"), ""),
        links: (((2, 0), 1),), // From H (first tone at position 2) to segment 1
        tone: true,
        highlight: ((2, 0),), // Highlight the H tone
        spacing: 1.0,
        arrow: true,
      ),
    ) <fig-contour>

  ],
)

Finally, let's take a look at a three-step process @zsiga2013sounds. In this example, we have three instances of `#autoseg()` (one for each stage in the process). Here, we have delinking and segments that share a tone, which require some branching. Delinking is an essential process to represent, and that's what the argument `delinks` does. If you examine @code-delink, you will notice that the third function specifies `delinks: ((3, 3),)`. This merely states that the link created between position 3 and itself must be delinked. Both `links` and `delinks` work as arrays of tuples.

#figure(
  caption: [OCP effects in Vai @zsiga2013sounds],
  [#autoseg(
      ("m", "u", "s", "u"),
      features: ("", "L", "", "H"),
      tone: true,
      spacing: 0.5, // keep consistent
      baseline: 37%,
      gloss: [_woman_],
    ) +
    #autoseg(
      ("k", "u", "n", "d", "u"),
      features: ("", "H", "", "", ""), // H at position 1, but will be repositioned
      tone: true,
      float: (1,), // Mark H as floating so it doesn't draw vertical stem
      multilinks: ((1, (1, 4)),), // H links to segments at positions 1 and 4
      spacing: 0.5,
      baseline: 37%,
      arrow: false,
      gloss: [_short_],
    ) #a-r
    #autoseg(
      ("m", "u", "s", "u", "–", "k", "u", "n", "d", "u"),
      features: ("", "L", "", "H", "", "", "H", "", "", ""),
      links: ((1, 3),), // link between L and H
      delinks: ((3, 3),),
      arrow: false,
      multilinks: ((6, (6, 9)),), // automatically erases vertical line in position 6
      tone: true,
      baseline: 37%,
      spacing: 0.50,
      gloss: [_short woman_],
    )
  ],
) <fig-woman>

To create a tone that is underlyingly linked to more than one segment, we use the `multilinks` argument. Unsurprisingly, this will require tuples inside tuples once again. For example, the result of the process in question is represented by the third `#autoseg()` in @code-delink. There, we see `multilinks: ((6, (6, 9)),)`, which means "search for position 6 (this is the 'u' in 'kun'), then link that to positions 6 and 9 _at the same time_". The function automatically centers the tone between the two segments in question (it will center the tone regardless of how many segments it is linked to), and it also "erases" the vertical line inserted by the `features` argument.


#figure(
  caption: [Code to generate @fig-woman],
  supplement: "Code",
  kind: "code",
  [
    ```typst
    #autoseg(
          ("m", "u", "s", "u"),
          features: ("", "L", "", "H"),
          tone: true,
          spacing: 0.5, // keep consistent
          baseline: 37%,
          gloss: [_woman_],
        ) +
        #autoseg(
          ("k", "u", "n", "d", "u"),
          features: ("", "H", "", "", ""), // H at position 1, but will be repositioned
          tone: true,
          float: (1,), // Mark H as floating so it doesn't draw vertical stem
          multilinks: ((1, (1, 4)),), // H links to segments at positions 1 and 4
          spacing: 0.5,
          baseline: 37%,
          arrow: false,
          gloss: [_short_],
        ) #a-r
        #autoseg(
          ("m", "u", "s", "u", "–", "k", "u", "n", "d", "u"),
          features: ("", "L", "", "H", "", "", "H", "", "", ""),
          links: ((1, 3),), // Link between L and H
          delinks: ((3, 3),), // Delink line between position 3 and itself
          arrow: false,
          multilinks: ((6, (6, 9)),), // Automatically removes vertical line in position 6
          tone: true,
          baseline: 37%, // Adjust as needed to customize vertical position
          spacing: 0.50,
          gloss: [_short woman_],
        )

    ```
  ],
) <code-delink>

Autosegments are difficult to typeset because there are many degrees of freedom involved, which means functions start to become too convoluted for the benefit they provide. There is probably a sweet spot, a point beyond which a function of this type becomes impractical because there are simply too many arguments. `#autoseg()` attempts to be intuitive while covering spreading, delinking, one-to-many and many-to-one relationships, floating tones, and highlights with circles. I believe these cover the vast majority of scenarios with precision and symmetry. The function also provides convenient arguments for horizontal (`spacing`) and vertical (`baseline`) positioning, which can be handy in processes where you may want to adjust the position of the representation relative to an arrow or any other symbols you may want to add outside the function _per se_.

Finally, the function does not and will not cover intonation, as its sole goal is to represent autosegmental phonology. In the future, an additional function might be added to cover intonational patterns and a wider range of tone-related representations.




= SPE

Rewrite rules can be very complex, and an excellent package already exists to deal with their complexity in Typst #cite(<linphon>, supplement: [#link("https://typst.app/universe/package/linphon")[`linphon`]]). The problem is that, like autosegmental representations, too many degrees of freedom exist in SPE-like representations, not to mention the variation across scholars when it comes to symbols, brackets, etc. On the plus side, you can do a lot simply by employing primitives that already exist (e.g., matrices and arrows), so SPE rules are not as challenging to typeset as some other non-linear structures in phonology (at least simpler rules...). For that reason, #logo only has two primitive functions to help create feature matrices, which in turn can be combined to form SPE-style rules @chomsky1968spe


#figure(
  gap: 1em,
  caption: [Generating matrices for the phonemes in "patchy", shown in @fig-max-feat],
  supplement: "Code",
  kind: "code",
  `#feat-matrix("p") #feat-matrix("\\ae") #feat-matrix("\\t tS") #feat-matrix("i")`,
) <feat-matrix>


#figure(
  gap: 2em,
  // placement: auto,
  caption: [Matrices for the phonemes in the word "patchy"],
  [#feat-matrix("p") #feat-matrix("\\ae") #feat-matrix("\\t tS") #feat-matrix("i")],
) <fig-max-feat>

The first function is `#feat-matrix()`, shown in @feat-matrix. It outputs the maximal feature matrix for a given phoneme (with the option for 0 values if `all: true`). This can be useful in introductory courses, where students are introduced to the notion of distinctive features. The function is not able to compute _minimal_ matrices, i.e., it can't figure out that feature A entails feature B given inventory I,#footnote[But see the #link("https://gdgarcia.ca/fonology")[Fonology] package for R @fonology.] but it can be used in sequence to represent matrices for a given word, for example --- see @fig-max-feat. The user is free to adjust the inventory of features and their values, since there's variation in the literature. The function is based on the features in #cite(<hayes2009introductory>, form: "prose").


Next, the function `#feat()` creates a matrix given a set of features. This is the function used in a rewrite rule, for example. The assimilation rule in @fig-spe is achieved with the code shown in @fig-spe-code --- notice that #sym.alpha notation requires a specific syntax, i.e., `sym.X + "feat"` or `sym.X + [#smallcaps("feat")]` if you prefer to use small caps. A helper function, `#blank()`, adds a long underline for the context of application in the rule. Likewise, `#a-r` adds an arrow using New Computer Modern (other arrows are available, such as `#a-l` #a-l, `#a-u` #a-u, `#a-d` #a-d, `#a-lr` #a-lr, `#a-sr` #a-sr).

#figure(
  caption: [Nasal place assimilation using `#feat()`],
  supplement: "Code",
  kind: "code",
  ```typst
  #feat("+son", "–approx") #a-r
    #feat(sym.alpha + [#smallcaps("place")]) / #blank()\]#sub[#sym.sigma]
    #feat("–son", "–cont", "–del rel", sym.alpha + [#smallcaps("place")])
  ```,
) <fig-spe-code>

#figure(
  // placement: auto,
  caption: [A nasal place assimilation rule],
  [#feat("+son", "–approx") #a-r
    #feat(sym.alpha + [#smallcaps("place")]) / #blank()\]#sub[#sym.sigma]
    #feat("–son", "–cont", "–del rel", sym.alpha + [#smallcaps("place")])],
) <fig-spe>



= Optimality theory

Unlike SPE rules, tableaux in optimality theory (OT; #cite(<prince1993optimality>, form: "prose", supplement: "originally circulated in 1993")) are more predictable and constrained. They're also one of the easiest representations to typeset, but if you use #LaTeX they're still time-consuming to create (even though you can find tools online to streamline the task). #logo includes two constraint-related functions, the first of which is `#tableau()`, shown in @fig-tableau1. The function takes six arguments: `input`, `candidates`, `constraints`, `violations`, `winner`, and `dashed-lines`. The accompanying code shown in @fig-tableau1 provides an example of how each argument works. For example, the `violations` argument requires a nested structure. Likewise, `dashed-lines` requires a comma if you want a given column to have a dashed line. If no dashed lines are needed, you can simply specify `dashed-lines: ()`. The `winner` candidate counts from zero, so that is the index/position for the first candidate, as shown in the example. These conventions are the same as those presented for autosegmental representations in @sec-auto.



#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  [
    #figure(
      caption: [Code to generate @fig-tableau1],
      supplement: "Code",
      kind: "code",
      ```typst
      #tableau(
        input: "kraTa",
        candidates: ("kra.Ta", "ka.Ta", "ka.ra.Ta"),
        constraints: ("Max", "Dep", "*Complex"),
        violations: (
          ("", "", "*"),
          ("*!", "", ""),
          ("", "*!", ""),
        ),
        winner: 0, // <- Position of winning cand
        dashed-lines: (1,) // <- Note the comma
        shade: true, // <- true by default
      )
      ```,
    )

  ],
  [
    #figure(
      caption: [A typical OT tableau],
      supplement: "Tableau",
      kind: "tableau",
      tableau(
        input: "kraTa",
        candidates: ("[kra.Ta]", "[ka.Ta]", "[ka.ra.Ta]"),
        constraints: ("Max", "Dep", "*Complex"),
        violations: (
          ("", "", "*"),
          ("*!", "", ""),
          ("", "*!", ""),
        ),
        winner: 0,
        dashed-lines: (1,),
        shade: true,
      ),
    ) <fig-tableau1>
  ],
)

// #let tableau1 = tableau(
//   input: "kraTa",
//   candidates: ("[kra.Ta]", "[ka.Ta]", "[ka.ra.Ta]", "[ka.ra.Tu]"),
//   constraints: ("Max", "Dep", "*Complex", "Ident"),
//   violations: (
//     ("", "", "*", ""),
//     ("*!", "", "", ""),
//     ("", "*!", "", ""),
//     ("", "*!", "", "*"),
//   ),
//   winner: 0,
//   dashed-lines: (1,),
// )
//
// #figure(
//   caption: [A typical OT tableau],
//   supplement: "Tableau",
//   kind: "Tableau",
//   show-example(
//     ```typst
//     #tableau(
//       input: "kraTa",
//       candidates: ("kra.Ta", "ka.Ta", "ka.ra.Ta", "ka.ra.Tu"),
//       constraints: ("Max", "Dep", "*Complex", "Ident"),
//       violations: (
//         ("", "", "*", ""),
//         ("*!", "", "", ""),
//         ("", "*!", "", ""),
//         ("", "*!", "", "*"),
//       ),
//       winner: 0, // <- Position of winning cand
//       dashed-lines: (1,) // <- Note the comma
//     )
//
//     ```,
//     tableau1,
//   ),
// ) <fig-tableau1>

One nice feature of `#tableau()` is that the function automatically shades cells once a fatal violation is entered (`!`). Likewise, it adds the "#finger" symbol for the winner, whose position is extracted from the `winner` argument shown in the accompanying code next to @fig-tableau1.

It is often useful to present a ranking using a Hasse diagram. These diagrams can be generated in #logo using the `#hasse()` function. In a nutshell, the function takes tuples with $n$ elements. In the simplest case, $n = 1$, which produces a floating constraint. @hasse-1 shows a basic scenario. The third element in the first tuple indicates the "stratum" in the diagram --- this is especially important in more complex cases, which require better control over the vertical position of different constraints. Optional arguments exist to give the user more flexibility (e.g., `scale` and `node-spacing`).


#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  [
    ```typst
    #hasse(
       (
         ("C1", "C2", 0),
         ("C3",), // floating constraint
       ),
       node-spacing: 2, // optional
       level-spacing: 2, // optional
       scale: 0.9, // optional
     )
    ```
  ],
  [
    #figure(
      caption: [Basic scenario],
      supplement: "Hasse diagram",
      kind: "hasse",
      hasse(
        (
          ("C1", "C2", 0),
          ("C3",), // floating constraint
        ),
        node-spacing: 2,
        level-spacing: 2,
        scale: 0.9, // optional
      ),
    ) <hasse-1>


  ],
)

A more realistic scenario is shown in @hasse-2. Notice that constraint names are automatically rendered in small caps (except features inside square brackets; see figure). 4-element tuples are also possible, in which case the fourth element allows for different line types between two constraints (`"dashed"` or `"dotted"`).

The top level of a diagram occupies position 0, which includes four partial rankings here. The second level (position 1) has two partial rankings in the diagram in question, namely #smallcaps[Max] $>>$ #smallcaps[NoCoda] and #smallcaps[Dep] $>>$ #smallcaps[Constraint]. You may want to play around with this position: change it from 1 to 2 and then to 3 to see how this affects the diagram --- you may need to manually adjust the `node-spacing` accordingly to avoid constraint overlapping.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  [
    ```typst
    #hasse(
        (
          ("*Complex", "Max", 0),
          ("*Complex", "Dep", 0),
          ("Onset", "Max", 0),
          ("Onset", "Dep", 0),
          ("Max", "NoCoda", 1),
          ("Dep", "Constraint[Feat]", 1, "dotted"),
        ),
        node-spacing: 3,
      )
    ```
  ],
  [
    #figure(
      caption: [Dotted lines and small caps],
      supplement: "Hasse diagram",
      kind: "hasse",
      hasse(
        (
          ("*Complex", "Max", 0),
          ("*Complex", "Dep", 0),
          ("Onset", "Max", 0),
          ("Onset", "Dep", 0),
          ("Max", "NoCoda", 1),
          ("Dep", "Constraint[Feat]", 1, "dotted"),
        ),
        node-spacing: 3,
      ),
    ) <hasse-2>


  ],
)

Finally, let's see a more complex scenario (notice that diagrams are automatically scaled according to their complexity). @hasse-3 is adapted from #cite(<Lamont_2021>, form: "prose").

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  [
    ```typst
    #hasse(
        (
          ("Ident[F]", "Agree[place]", 0),
          ("Dep", "Agree[vce]", 0),
          ("Dep", "Agree[place]", 0),
          ("Max[nas]", "Ident[place]", 1),
          ("Max[cor]", "Ident[place]", 1),
          ("Max[cor]", "Ident[vce]", 1),
          ("Max[h]", "Ident[vce]", 1),
          ("Agree[place]", "Ident[place]", 1),
          ("Agree[vce]", "Ident[vce]", 1),
          ("Ident[place]", "*[labial]", 2),
          ("Ident[vce]", "*[+voice]", 2),
          ("*[labial]", "Max", 3),
          ("*[+voice]", "Max", 3),
        ),
      )
    ```
  ],
  [
    #figure(
      caption: [Example from #cite(<Lamont_2021>, form: "prose")],
      supplement: "Hasse diagram",
      kind: "hasse",
      hasse(
        (
          ("Ident[F]", "Agree[place]", 0),
          ("Dep", "Agree[vce]", 0),
          ("Dep", "Agree[place]", 0),
          ("Max[nas]", "Ident[place]", 1),
          ("Max[cor]", "Ident[place]", 1),
          ("Max[cor]", "Ident[vce]", 1),
          ("Max[h]", "Ident[vce]", 1),
          ("Agree[place]", "Ident[place]", 1),
          ("Agree[vce]", "Ident[vce]", 1),
          ("Ident[place]", "*[labial]", 2),
          ("Ident[vce]", "*[+voice]", 2),
          ("*[labial]", "Max", 3),
          ("*[+voice]", "Max", 3),
        ),
      ),
    ) <hasse-3>


  ],
)

= Maximum Entropy grammars

Last but not least, the package goes one step further and produces a MaxEnt tableau @goldwater2003learning @HayesWilson08 with the function `#maxent()`. @fig-tableau2 illustrates a scenario where the data in @fig-tableau1 are variable, i.e., all candidates in question have a non-zero probability of being observed given a specific input $x$. The column $h_i$ displays the Harmony score of each candidate $i$, calculated as the weighted sum of all constraint violations. Next, the column $e^(-h_i)$ provides the unnormalized probability, which is the exponential of the negated Harmony score (this has also been called the _MaxEnt score_). Finally, the actual predicted probability is shown in column $P_i$, which is obtained by dividing the unnormalized value of a candidate by $Z(x)$ (the sum of all unnormalized scores). The formal equation for this probability is provided in @maxent-prob.

$ P(y|x) = frac(e^(- sum_(i=1)^n w_i C_i (y, x)), Z(x)) $ <maxent-prob>

The function `#maxent()` calculates $h_i$, $e^(-h_i)$ and $P(y|x)$#footnote[Where $y$ is a given candidate and $x$ is the input.] (shown as $P_i$ in the tableau) automatically given the weights provided. @fig-tableau2 lists the weights for the constraints in use at the top and prints probability bars at the right margin. These can be turned off with `visualize: false` (see @code-maxent), but they are printed by default as this can help students quickly visualize probabilities when many candidates are evaluated.

#figure(
  caption: [A MaxEnt tableau],
  supplement: "Tableau",
  kind: "Tableau",
  maxent(
    input: "kraTa",
    candidates: ("[kra.Ta]", "[ka.Ta]", "[ka.ra.Tu]"),
    constraints: ("Max", "Dep", "*Complex"),
    weights: (2.5, 1.8, 1),
    violations: (
      (0, 0, 1),
      (1, 0, 0),
      (0, 1, 0),
    ),
    visualize: true, // Show probability bars (default)
  ),
) <fig-tableau2>


In @code-maxent, you can see all the necessary arguments for the function `#maxent()`. Like the function `#tableau()` discussed above, the `violations` argument in `#maxent()` requires a nested structure. Everything else is self-explanatory. As expected, the rows and columns will expand as needed for both constraint-based functions.

#figure(
  caption: [Code to generate a MaxEnt tableau],
  supplement: "Code",
  kind: "code",
  ```typst
  #maxent(
    input: "kraTa",
    candidates: ("[kra.Ta]", "[ka.Ta]", "[ka.ra.Ta]"),
    constraints: ("Max", "Dep", "*Complex"),
    weights: (2.5, 1.8, 0.5),
    violations: (
      (0, 0, 1),
      (1, 0, 0),
      (0, 1, 0),
    ),
    visualize: true, // Show probability bars (default)
  )
  ```,
) <code-maxent>

#logo also has functions for harmonic grammars (`#hg()`) and noisy harmonic grammars (`#nhg()`). These functions are very similar to `#maxent()`, so their syntax will be familiar. The Noisy Harmonic Grammar function derives probabilities by simulating a number of evaluations (by default, 1000) given the constraints and violations provided by the user. It is possible to change the number of simulations and to omit the noise column from the tableau. The noise displayed is extracted from an additional simulation, so it is shown for illustrative purposes. For the most part,the functions discussed in this section are based on conventions in the literature, e.g., #cite(<flemming2021comparing>, form: "prose").

= Final remarks

#logo is a _very_ young project (December 2025). As stated above, its main goal is to quickly generate structures that are frequently used by phonologists when typesetting documents for teaching and research. This means that functions must be *intuitive* --- but an intuitive interface cannot sacrifice typographical quality. I hope to have shown that this goal is possible. The package will certainly improve as people start using it in a wider range of scenarios than those presented in this vignette, which represent for the most part the contexts I need myself when preparing documents.

Typst is still in its infancy, and I believe most linguists do not know about it yet (as of 2025). But as the language expands into linguistics, there is _a lot_ of potential for significant advances in our workflows (both in research and teaching). I hope this package will make document preparation quicker and more enjoyable to the phonologists out there.



// #pagebreak()
#bibliography("references.bib", title: "References", style: "apa")
#pagebreak()


#heading(numbering: none, outlined: true)[Appendix]
#counter(heading).update(0)
#set heading(numbering: "A.1.")

= IPA symbol reference


#set text(size: 0.9em)
#figure(
  caption: [TIPA-to-IPA Reference Guide],
  table(
    columns: (auto, auto, auto, auto, auto, auto, auto, auto),
    inset: 5.5pt,
    align: horizon,
    stroke: 0.5pt + luma(200),
    table.header([*Input*], [*Output*], [*Input*], [*Output*], [*Input*], [*Output*], [*Input*], [*Output*]),
    table.hline(stroke: 0.5pt),
    // --- PLOSIVES ---
    table.cell(colspan: 8, align: center)[_Plosives_],
    raw("p"), ipa("p"), raw("b"), ipa("b"), raw("t"), ipa("t"), raw("d"), ipa("d"),
    raw("\\\:t"), ipa("\\:t"), raw("\\\:d"), ipa("\\:d"), raw("c"), ipa("c"), raw("\\\barredj"), ipa("\\barredj"),
    raw("k"), ipa("k"), raw("g"), ipa("g"), raw("q"), ipa("q"), raw("\\\;G"), ipa("\\;G"),
    raw("?"), ipa("?"), [], [], [], [], [], [],
    // --- FRICATIVES ---
    table.cell(colspan: 8, align: center)[_Fricatives_],
    raw("f"), ipa("f"), raw("v"), ipa("v"), raw("T"), ipa("T"), raw("D"), ipa("D"),
    raw("s"), ipa("s"), raw("z"), ipa("z"), raw("S"), ipa("S"), raw("Z"), ipa("Z"),
    raw("\\\:s"), ipa("\\:s"), raw("\\\:z"), ipa("\\:z"), raw("C"), ipa("C"), raw("J"), ipa("J"),
    raw("x"), ipa("x"), raw("G"), ipa("G"), raw("X"), ipa("X"), raw("K"), ipa("K"),
    raw("\\\\textcrh"), ipa("\\textcrh"), raw("Q"), ipa("Q"), raw("h"), ipa("h"), raw("H"), ipa("H"),
    raw("\\\\textbeltl"), ipa("\\textbeltl"), raw("\\\l3"), ipa("\\l3"), [], [], [], [],
    // --- NASALS ---
    table.cell(colspan: 8, align: center)[_Nasals_],
    raw("m"), ipa("m"), raw("M"), ipa("M"), raw("n"), ipa("n"), raw("\\\:n"), ipa("\\:n"),
    raw("\\\\nh"), ipa("\\nh"), raw("N"), ipa("N"), raw("\\\;N"), ipa("\\;N"), [], [],
    // --- APPROXIMANTS & TRILLS ---
    table.cell(colspan: 8, align: center)[_Approximants & trills_],
    raw("V"), ipa("V"), raw("\\\*r"), ipa("\\*r"), raw("j"), ipa("j"), raw("\\\darkl"), ipa("\\darkl"),
    raw("l"), ipa("l"), raw("L"), ipa("L"), raw("\\\:l"), ipa("\\:l"), raw("\\\;L"), ipa("\\;L"),
    raw("r"), ipa("r"), raw("R"), ipa("R"), raw("\\\:r"), ipa("\\:r"), raw("\\\;R"), ipa("\\;R"),
    raw("\\\\textturnmrleg"), ipa("\\textturnmrleg"), [], [], [], [], [], [],
    // --- VOWELS ---
    table.cell(colspan: 8, align: center)[_Vowels_],
    raw("i"), ipa("i"), raw("I"), ipa("I"), raw("y"), ipa("y"), raw("Y"), ipa("Y"),
    raw("1"), ipa("1"), raw("0"), ipa("0"), raw("W"), ipa("W"), raw("u"), ipa("u"),
    raw("U"), ipa("U"), raw("e"), ipa("e"), raw("\\\o"), ipa("\\o"), raw("9"), ipa("9"),
    raw("8"), ipa("8"), raw("7"), ipa("7"), raw("o"), ipa("o"), raw("@"), ipa("@"),
    raw("E"), ipa("E"), raw("\\\oe"), ipa("\oe"), raw("3"), ipa("3"), raw("2"), ipa("2"),
    raw("O"), ipa("O"), raw("\\\ae"), ipa("\ae"), raw("\\\OE"), ipa("\OE"), raw("a"), ipa("a"),
    raw("5"), ipa("5"), raw("A"), ipa("A"), raw("6"), ipa("6"), raw("\\\schwar"), ipa("\\schwar"),
    raw("\\\epsilonr"), ipa("\\epsilonr"), [], [], [], [], [], [],
    // --- DIACRITICS & STRESS ---
    table.cell(colspan: 8, align: center)[_Diacritics, suprasegmentals, archiphonemes_],
    raw("'ta"), ipa("'ta"), raw(",ta"), ipa(",ta"), raw("u:"), ipa("u:"), raw("\\\~ a"), ipa("\\~ a"),
    raw("\\\\r i"),
    ipa("\\r i"),
    raw("\\\v n"),
    ipa(" \\v n"),
    raw("t \\\h"),
    ipa("t \\h"),
    raw("p \\\*"),
    ipa("p \\*"),
    raw("\\\\t ts"),
    ipa("\\t ts"),
    raw("k \\\labial"),
    ipa("k \\labial"),
    raw("p \\\velar"),
    ipa("p \\velar"),
    raw("t \\\palatal"),
    ipa("t \\palatal"),
    raw("\\\dental t"), ipa("\\dental t"), raw("\\\C"), ipa("\\C"), raw("\\\V"), ipa("\\V"), raw("\\\N"), ipa("\\N"),
  ),
)

= How can I use Typst offline? <app-editor>

This vignette assumes that you know about Typst, but you may not be very familiar with it. That's why this section exists. For example, while the online app at #link("https://typst.app")[Typst.app] is very useful and practical, most of us prefer to work offline. *How can you use Typst offline then?*

One of the best IDE options out there is to use VS Code with the extension Tinymist @tinymist --- the extension is therefore available for Positron, which is the successor to RStudio. Tinymist is also available as a plugin for NeoVim users. All these options work extremely well because Tinymist is great, and I haven't had any issues thus far: compilation is instantaneous, and `bib` files also work flawlessly.#footnote[Provided that they are clean and do not have any problems regarding fields, repeated entries, etc.]

= How do packages work in Typst? <app-packages>

If you've used R, Python, #LaTeX, etc., you are used to installing packages and then importing them. This vignette has imported #logo, of course, which in turn imports CeTZ @cetz as a dependency. As you start using Typst, you will notice that it works a bit differently, and this may not be self-evident at first. As seen in @sec-installation, there are basically two ways to load and use a package, both of which require the function `#import` inside your `typ` document --- notice that you don't install a package _per se_. The traditional way is to import a package from the official Typst collection/repository, which means adding `#import "@preview/phonokit:0.3.0": *` to your `typ` document if you plan on using #logo (assuming version `0.3.0`). The `@preview` bit indicates that the package comes from Typst's official repository. This is what you should do most of the time. Typst packages are cached once you compile a document with a given package.

Another option is to fork, clone or download a package from GitHub and import its `lib.typ` file instead: `#import "PACKAGE_DIRECTORY/lib.typ": *`. There's only one caveat: Typst restricts imports to files within the compilation root and its subdirectories (i.e., you can't load `lib.typ` if the package is in a parent directory or elsewhere in your system). Thus, you may need to use symlinks (this is the same strategy applied to `bib` files if you don't want to have a local copy of your references).

#figure(
  caption: [Creating a symlink to local package],
  supplement: "Code",
  kind: "code",
  ```bash
  # From your working directory:
  ln -s PATH_TO_PACKAGE_DIRECTORY package_name
  ```,
)

Finally, Typst's repository contains sub-directories to keep track of each version of a given package. When a package is updated, nothing happens to the existing version of the package. Instead, a new directory is added with the updated version. That's why you specify the _version_ of a package upon importing is: `#import "@preview/phonokit:0.3.0": *`. If you go to Typst's repository on GitHub, you will see that the repository for #logo has one sub-directory for each version of the package. This means that you always know which version of a package you are using. And because previous versions are not removed, backwards compatibility is not an issue. If you are used to #LaTeX and you have the habit of frequently updating your packages, you will appreciate this, as there's no risk of recompiling your document and running into errors because one of the packages you use has been updated with breaking changes.



= Exporting representations as images <app-png>

You may want to use #logo without necessarily adopting Typst. Fortunately, it is easy to simply export PNGs that you can later add to your #LaTeX or Word document --- this is similar to using #LaTeXiT. First, make sure you install Typst compiler #link("https://typst.app/open-source/")[here]. Then, create a Typst file with your desired representation. One example is provided in @code-export-png, where we replicate @fig-tableau2. In the preamble of the file, notice that we load #logo and then adjust our page settings. You will notice that `fill` is set to `none`, which ensures that our resulting PNG file has transparent background. Finally, both `height` and `width` are set to `auto`, which sets the page size dynamically according to the size of the representation you wish to create. We will call this file `maxent.typ`.

#figure(
  caption: [Example `typ` file to generate a MaxEnt tableau (@fig-tableau2)],
  supplement: "Code",
  kind: "code",
  ```typst
  // Create a file called maxent.typ:
  #import "@preview/phonokit:0.3.0": *
  #set page(width: auto, height: auto, margin: 0.5em, fill: none)
  #maxent(
    input: "kraTa",
    candidates: ("[kra.Ta]", "[ka.Ta]", "[ka.ra.Ta]"),
    constraints: ("Max", "Dep", "*Complex"),
    weights: (2.5, 1.8, 1),
    violations: (
      (0, 0, 1),
      (1, 0, 0),
      (0, 1, 0),
    ),
    visualize: true, // Show probability bars (default)
  )
  ```,
) <code-export-png>

After having created the file in question, simply run the command shown in @code-bash-compile from Terminal. This will generate a PNG file called `maxent.png` with 500 pixels per inch.

#figure(
  caption: [Compile to PNG in terminal],
  supplement: "Code",
  kind: "code",
  ```bash
  typst compile --ppi 500 maxent.typ maxent.png
  ```,
) <code-bash-compile>

You could go one step further and use a convenient bash script to take a #logo function and generate a PNG figure for any given representation. If you're not familiar with bash scripting, you can use any AI agent to create such a script. An example is provided in @code-bash-script. The script allows you to run the function `phonokit()` from your terminal. Inside the function, you can use any #logo function. For example, if you wanted to create a PNG figure for the syllable "ast", you would simply run `phonokit(syllable("ast"))`. The script also gives you the option to set your resolution. By default, the output is saved with a time stamp to your desktop (I'm using Mac OS for reference).

#figure(
  caption: [Syllable "ast" generated as a PNG file],
  syllable("ast"),
)

#figure(
  caption: [Bash script to export PNGs],
  supplement: "Code",
  kind: "code",
  ```bash
  # NOTE: Function to generate PNGs figures using Phonokit
  # Adjust Phonokit version and destination as needed
  phonokit() {
    local code="$1"
    local ppi="${2:-500}"
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local output="$HOME/Desktop/phonokit_output_${timestamp}.png"
    local tmp=$(mktemp /tmp/phonokit-XXXXXX.typ)

    cat > "$tmp" << EOF
  #import "@preview/phonokit:0.3.0": *
  #set page(width: auto, height: auto, margin: 0.5em, fill: none)
  $code
  EOF

    typst compile --ppi "$ppi" "$tmp" "$output"
    rm "$tmp"

    echo "Saved to $output"
  }
  ```,
) <code-bash-script>


= Useful NeoVim keymaps <app-nvim>

If you use NeoVim, you may want to set some keymaps for Typst files. The keymaps in @code-keymaps are the ones I use along with two key plugins: Tinymist (`neovim/nvim-lspconfig`), already mentioned, and `typst-preview` (`chomosuke/typst-preview.nvim`), which allows you to preview `typ` files live in the browser. In a nutshell, I frequently use two commands: `\p` to preview a `typ` file on the browser and `\c` to compile the document to a `PDF`. The other two commands listed in @code-keymaps are also useful, I but I use them less frequently: `\i` generates a `PNG` file from the `typ` document (see @app-png), and `\s` stops the preview.



#figure(
  caption: [Useful keymaps NeoVim],
  supplement: "Code",
  kind: "code",
  ```lua
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function()
      vim.keymap.set("n", "<localleader>i", function()
        local file = vim.fn.expand("%")
        local png_name = vim.fn.expand("%:r") .. ".png"
        vim.fn.system("typst compile --format png --ppi 500 " .. vim.fn.shellescape(file))
        if vim.v.shell_error == 0 then
          print("✓ Exported: " .. png_name)
        else
          print("✗ PNG export failed!")
        end
      end, { desc = "Export Typst to PNG (1000 ppi)", buffer = true })
      vim.keymap.set("n", "<localleader>p", "<cmd>TypstPreview<cr>", { desc = "Typst Preview", buffer = true })
      vim.keymap.set("n", "<localleader>s", "<cmd>TypstPreviewStop<cr>", { desc = "Typst Preview Stop", buffer = true })
      vim.keymap.set("n", "<localleader>c", function()
        local file = vim.fn.expand("%")
        local pdf_name = vim.fn.expand("%:r") .. ".pdf"

        vim.fn.system("typst compile " .. vim.fn.shellescape(file))

        if vim.v.shell_error == 0 then
          print("✓ Compiled: " .. pdf_name)
        else
          print("✗ Compilation failed!")
        end
      end, { desc = "Export Typst to PDF", buffer = true })
    end,
  })
  ```,
) <code-keymaps>


= More information, questions, suggestions


If you have any questions, visit #link("https://github.com/guilhermegarcia/phonokit")[`github.com/guilhermegarcia/phonokit`], where you will find all the code for the package. If you find a bug or typo, of if you'd like to suggest a feature, please open an issue in the repository --- this will help improve the package. This is an ongoing project that started in December 2025, so there is _a lot_ to be improved.

