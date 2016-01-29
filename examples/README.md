Bash Shell Examples
============

These examples are scripts that can be run independently to demonstrate the Rosette API functionality.

You can run your desired `_endpoint_.sh` file to see it in action.
For example, run `./categories.sh <your_key>` if you want to see the categories
functionality demonstrated.

If you would like to specify a different URL, run `_endpoint.sh <your_key> [alternate_url]`

All files require you to input your Rosette API User Key.
For example: `./ping.sh --key 1234567890`  

Each example, when run, prints its output to the console.

| File Name                     | What it does                                          | 
| -------------                 |-------------                                        | 
| base64_input.sh                    | Gets the entities from a piece of base64 encoded text              | 
| categories.sh                    | Gets the category of a document at a URL              | 
| entities.sh                      | Gets the entities from a piece of text                | 
| entities_linked.sh               | Gets the linked (to Wikipedia) entities from a piece of text |
| info.sh                          | Gets information about Rosette API                    | 
| language.sh                      | Gets the language of a piece of text                  | 
| matched-name.sh                  | Gets the similarity score of two names                | 
| morphology_complete.sh               | Gets the complete morphological analysis of a piece of text| 
| morphology_compound-components.sh    | Gets the de-compounded words from a piece of text     | 
| morphology_han-readings.sh           | Gets the Chinese words from a piece of text           | 
| morphology_lemmas.sh                 | Gets the lemmas of words from a piece of text         | 
| morphology_parts-of-speech.sh        | Gets the part-of-speech tags for words in a piece of text | 
| ping.sh                          | Pings the Rosette API to check for reachability       | 
| sentences.sh                     | Gets the sentences from a piece of text               |
| sentiment.sh                     | Gets the sentiment of a local file                    | 
| tokens.sh                        | Gets the tokens (words) from a piece of text          | 
| translated-name.sh               | Translates a name from one language to another        |
