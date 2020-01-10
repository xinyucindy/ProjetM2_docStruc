#!/usr/bin/python
# coding: utf-8

import os
from lxml import etree
from operator import itemgetter

xmlfile = "../data/XML/Pokemon-v3.xml"

TEI_NAMESPACE = "http://www.tei-c.org/ns/1.0"
TEI = "{%s}" % TEI_NAMESPACE

# Initialiser la lecture du fichier
tree = etree.parse(xmlfile)
root = tree.getroot()

def wrap(a, tag):
    "Permet d'envelopper le texte dans des <td>"
    tag1 = tag
    if tag == "table":
        tag1 = "table border=1 align='center' bgcolor=FDE7EE"
    if tag == "td" and a.strip().replace(".", "").isdigit():
        tag1 = "td style=\"text-align:center\""
    return "<{}>{}</{}>".format(tag1,a,tag)

def split(tab):
    "Sépare une string de plusieurs lignes en une liste d'items divisé par des virgules pour chaque colonne"
    tab = tab.splitlines()
    for n, row in enumerate(tab):
        tab[n] = row.split(",")
    return tab
 
def table(tab):
    html = ''  # va contenir l'html
    for n, x in enumerate(tab):
        for a in x:
            html += wrap(a, "td style=\"text-align:center\"")
        html += "<tr>"
    html = wrap(html, "table")
    return html

def create_html_tab(tab_string, cols_name, tab_name):
    "permet de créer un tableau en html"
    tab_str = "\n".join("%s, %s" % tup for tup in tab_string)

    tab_strs = cols_name + tab_str

    data = table(split(tab_strs))

    with open("../web/html/" + tab_name + ".html", "w", encoding="utf-8") as filehtml:
        filehtml.write(data)

def classement_attrib():

    tab_total = {}
    for element in root :
        tab_total[element.attrib['name']] = element[3].text
    tab_total = sorted(tab_total.items(), key=itemgetter(1), reverse=True)

    cols = "Nom pokémon, Total des attributs\n"
    tab_name = "total_attrib"
    
    return create_html_tab(tab_total, cols, tab_name)

def classement_attrib_legend():
    tab_total = {}
    for element in root :
        for child in element :
            liste_dico = []
            if child.tag == "Legendary" and child.text == "True":
                liste_dico.append(element[3].text + ", ")
                liste_dico.append(element[10].text)
                tab_total[element.attrib['name']] = liste_dico
    tab_total = sorted(tab_total.items(), key=lambda x:x[1][0], reverse=True)

    cols = "Nom pokémon, Total des attributs, Génération\n"
    tab_name = "total_attrib_legend"

    liste_frmt = []
    for i in tab_total:
        frmt = ["".join(t) for t in i]
        liste_frmt.append(frmt)

    tab_total = [tuple(i) for i in liste_frmt]

    return create_html_tab(tab_total, cols, tab_name)

def classement_10_Attaque():
    tab_total = {}
    for element in root :
        liste_dico = []
        liste_dico.append(element[10].text)
        liste_dico.append(element[5].text)
        liste_dico.append(element[7].text)
        liste_dico.append(int(element[5].text) + int(element[7].text))
        tab_total[element.attrib['name']] = liste_dico
    tab_total = sorted(tab_total.items(), key=lambda x:x[1][3], reverse=True)

    cols = "Nom pokémon, Génération, Défense, Défense spéciale, Total Défense \n"
    tab_name = "classement_10_Attaque"

    liste_frmt = []
    for i in tab_total[0:10]:
        for t in i :
            frmt = []
            frmt.append(i[0])
            frmt.append(str(i[1][0]) + ", " + str(i[1][1]) + ", " + str(i[1][2]) + ", " + str(i[1][3]))
        liste_frmt.append(frmt)

    tab_total = [tuple(i) for i in liste_frmt]

    return create_html_tab(tab_total, cols, tab_name)

def classement_10_Defense():
    tab_total = {}
    for element in root :
        liste_dico = []
        liste_dico.append(element[10].text)
        liste_dico.append(element[6].text)
        liste_dico.append(element[8].text)
        liste_dico.append(int(element[6].text) + int(element[8].text))
        tab_total[element.attrib['name']] = liste_dico
    tab_total = sorted(tab_total.items(), key=lambda x:x[1][3], reverse=True)

    cols = "Nom pokémon, Génération, Défense, Défense spéciale, Total Défense \n"
    tab_name = "classement_10_Défense"

    liste_frmt = []
    for i in tab_total[0:10]:
        for t in i :
            frmt = []
            frmt.append(i[0])
            frmt.append(str(i[1][0]) + ", " + str(i[1][1]) + ", " + str(i[1][2]) + ", " + str(i[1][3]))
        liste_frmt.append(frmt)

    tab_total = [tuple(i) for i in liste_frmt]

    return create_html_tab(tab_total, cols, tab_name)

classement_10_Attaque()
classement_10_Defense()
classement_attrib()
classement_attrib_legend()
