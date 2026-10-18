# documentos

Boletín oficial de LinuxUMU

Aquí se publican todos los documentos oficiales con respecto al club y asociación
LinuxUMU.

## Tipografía

Los documentos se confeccionan en texto plano o en LaTeX según el medio o destinatario.

La distribución de LaTeX usada y probada es pdfLaTeX

Algunos documentos requieren dependencias como la fuente Libertinus:

```
mkdir ~/texmf
cd ~/texmf
wget https://mirrors.ctan.org/install/fonts/libertinus-type1.tds.zip
unzip libertinus-type1.tds.zip
mktexlsr ~/texmf
kpsewhich libertinus-type1.sty
updmap-user --enable Map=libertinus.map
kpsewhich libertinus.map
```

