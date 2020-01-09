#!/usr/bin/python
# -*- coding: utf-8 -*-

outstream = open("Pokemon-v3.xml", "w", encoding='utf-8')
outstream.write('<?xml version="1.0" encoding="utf-8"?>\n<pokemons>\n')

with open("Pokemon.csv", encoding="utf8") as instream :
    titles = next(instream).strip().split(",")
    for line in instream:
        infos = line.strip().split(",")
        outstream.write('\t<pokemon name="'+infos[1]+'">\n')
        outstream.write(f'\t\t<Number>{infos[0]}</Number>\n\t\t<Type1>{infos[2]}</Type1>\n\t\t<Type2>{infos[3]}</Type2>\n\t\t<Total>{infos[4]}</Total>\n\t\t<HP>{infos[5]}</HP>\n\t\t<Attack>{infos[6]}</Attack>\n\t\t<Defense>{infos[7]}</Defense>\n\t\t<Sp_Atk>{infos[8]}</Sp_Atk>\n\t\t<Sp_Def>{infos[9]}</Sp_Def>\n\t\t<Speed>{infos[10]}</Speed>\n\t\t<Generation>{infos[11]}</Generation>\n\t\t<Legendary>{infos[12]}</Legendary>')
        outstream.write('\n\t</pokemon>\n')

outstream.write('</pokemons>')
outstream.close()