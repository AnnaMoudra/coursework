= HW3 - Text Mining

Task:
Find any suitable textual data for processing which will contain at least 500 sentences.

Perform following NLP tasks:
- POS tagging
- NER with entity classification (using nltk.ne_chunk)
- NER with custom patterns e.g. every match of: adjective (optional) and proper noun (singular/plural) is matched as the entity

Implement your custom entity classification:
- For each detected entity (using both nltk.ne_chunk and custom patterns):
    - Try to find a page in the Wikipedia
    - Extract the first sentence from the summary
    - Detect category from the sentence as a noun phrase
    - Example: for „Wikipedia“ entity the first sentence is „Wikipedia (/ˌwɪkᵻˈpiːdiə/ or /ˌwɪkiˈpiːdiə/ WIK-i-PEE-dee-ə) is a free online encyclopedia that aims to allow anyone to edit articles.“ you can detect pattern „…​ is/VBZ a/DT free/JJ online/NN encyclopedia/NN …​“ the output can be „Wikipedia“: „free online encyklopedia“
    - For unknown entities assign default category e.g. „Thing“


My solution:
I chose the book Silmarillion for this task as the text is long enough and contains many non-english terms and names.

Contents of src folder:
- jupyter notebook
- silmarillion.txt (input text)
    
Contents of res folder:
- entities_binary.json (NER with nltk.ne_chunks())
- entities_all.json (NER with nltk.ne_chunks())
- entities_custom.json (NER with custom pattern)
- named_entitites_wordbook.txt (Wikipedia categorization of NE with nltk entities (binary))
- custom.txt (Wikipedia categorization of NE with custom entities)