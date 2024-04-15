# Onitama Custom Cards Manipulation

This project involves rearranging existing cards for better printing and/or creating new extension cards, for the Onitama game. Detailed instructions guide you through the process of adding new cards, placing a monogram on them, and generating a PDF file formatted in A4 with a 2x2 grid of the new cards.

## Prerequisites

Before starting, ensure you have the following:
- Download the original PDF with the cards from [Onitama Kártyák (HU-EN) PnP](https://boardgamegeek.com/filepage/232693/onitama-kartyak-hu-en-pnp).
- Access to a shell environment to run script files.

## Card Creation Guidelines

### Adding New Cards

1. **Image and Card Size:**
   - Create card images with the following dimensions:
     - Width: 1,593 pixels
     - Height: 1,001 pixels
     - Bleed-in Width: 87 pixels
     - Bleed-in Height: 52 pixels

   Alternatively, use a different size while maintaining the same width-to-height and bleed-in ratios.

2. **Naming Convention:**
   - Name the files using the following format:
     ```
     onitama_front_<image series number>_<EXTENSION NAME>_<card number>.jpg
     ```
   - Increment the `<image series number>` for each new series of cards.
   - Use CAPITAL letters for `<EXTENSION NAME>` and a sequential number for `<card number>`.

## Scripts to Run

### Exporting Pages as Tiles

- Execute `export.sh` on the downloaded PDF:
```
./export.sh Onitama\ Cards\ PnP\ HU−ENHU−EN\ v1.0.pdf
```

This script outputs one tile per image and is used to extract individual card images from the PDF.

### Adding Monogram
- Execute `place_monogram.sh` to add the monogram to each card image:

```bash
./place_monogram.sh
```

This script processes the images and appends _monogram.jpg to the filenames.

### Creating PDF

- Run join_images_ouput_pdf.sh to compile the images into a PDF:

```
./join_images_ouput_pdf.sh
```
    
This script arranges the monogrammed images in a 2x2 grid and outputs "Onitama cards 2x2 (A4) optimised.pdf".

## Usage

1. Download the original PDF from BoardGameGeek and run the export.sh script.
2. If adding new cards, prepare your images according to the guidelines above.
3. Place the new images in the designated directory.
4. Execute place_monogram.sh to add monograms to the images.
5. After monogramming, run join_images_ouput_pdf.sh to create the final PDF.

## Additional Resources

Original cards reference: [Onitama kártyák (HU-EN) PnP](https://boardgamegeek.com/filepage/232693/onitama-kartyak-hu-en-pnp).

## Contribution

Feel free to fork this project and submit pull requests or open issues for any improvements or problems you encounter.
License

The original Onitama cards are licensed under the terms available at the following link: [Onitama Cards 2x2 on BoardGameGeek](https://boardgamegeek.com/filepage/249135/onitama-cards-2x2-plus-backs-a4).

This project is released under a standard open-source license, permitting free use, modification, and distribution of the modified work under the same license as the original.

