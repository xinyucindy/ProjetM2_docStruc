#!/usr/bin/python
# coding: utf-8

import tkinter
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from lxml import etree
from collections import Counter

xmlfile = "../data/XML/Pokemon-v3.xml"

TEI_NAMESPACE = "http://www.tei-c.org/ns/1.0"
TEI = "{%s}" % TEI_NAMESPACE

# Initialiser la lecture du fichier
tree = etree.parse(xmlfile)
root = tree.getroot()

# Graphique - Répartition des pokémons par types
def types():
    cnt = Counter()
    types = []
    nb_types = []

    for element in root :
        for child in element : 
            if "Type" in child.tag and child.text != None :
                cnt[child.text] += 1

    for a, b in cnt.items():
        types.append(a)
        nb_types.append(b)

    plt.pie(nb_types, labels=types, autopct='%1.1f%%', startangle=90)
    plt.axis('equal')
    plt.savefig('../web/img/types.png')

# Graphique - Nombre de pokémon par génération
def generations():
    cnt = Counter()
    generation = []
    nb_gen = []

    for element in root :
        for child in element : 
            if child.tag == "Generation" :
                cnt[child.text] += 1

    for c, d in cnt.items():
        generation.append("Génération : " + c)
        nb_gen.append(d)

    plt.pie(nb_gen, labels=generation, autopct='%1.1f%%', startangle=90)
    plt.axis('equal')
    plt.savefig('../web/img/generations.png')

# Graphique - Légendaire sur tous les pokémons
def legends():
    compteur_legend = 0

    for element in root :
        for child in element : 
            if child.tag == "Legendary" and child.text == "True":
                compteur_legend += 1

    non_legend = 800 - compteur_legend

    label = ["Légendaire", "Non Légendaire"]
    result = [compteur_legend, non_legend]

    plt.pie(result, labels=label, autopct='%1.1f%%', startangle=90)
    plt.axis('equal')
    plt.savefig('../web/img/legends.png')

types()
plt.clf()
generations()
plt.clf()
legends()
