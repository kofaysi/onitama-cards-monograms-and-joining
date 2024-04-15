# Onitama Custom Cards Extension

This project involves creating new extension cards for the Onitama game. The instructions below will guide you through the process of adding new cards, placing a monogram on them, and generating a PDF file in an A4 format with a 2x2 grid of the new cards.

## Prerequisites

Before starting, ensure you have the following:
- Image editing software to create and edit card images.
- Shell environment to run script files.

## Card Creation Guidelines

### Adding New Cards
1. **Image and Card Size:**
   - Create images with a total size of 382 x 240 pixels.
   - Ensure the actual card size within the image is 342 x 200 pixels.
   - Include a bleed of 20 pixels around the card.

2. **Naming Convention:**
   - Name the files using the following format:
     ```
     onitama_front_<image series number>_<EXTENSION NAME>_<card number>.png
     ```
   - Increment the `<image series number>` for each new series of cards.
   - Use CAPITAL letters for `<EXTENSION NAME>` and a sequential number for `<card number>`.

### Scripts to Run

#### Adding Monogram
- Run `place_monogram.sh` to add the monogram to each card image:
  ```bash
  ./place_monogram.sh
  ```
  This script will process images and output files named with the suffix `_monogram.png`.

#### Creating PDF
- Execute `join_images_ouput_pdf.sh` to compile the images into a PDF:
  ```bash
  ./join_images_ouput_pdf.sh
  ```
  This script arranges the monogrammed images in a 2x2 grid and outputs the file named "Onitama cards 2x2 (A4) optimised.pdf".

## Usage

1. Prepare your card images according to the guidelines above.
2. Place the images in the designated directory where the scripts can access them.
3. Run the `place_monogram.sh` script to add monograms to the images.
4. After monogramming, run `join_images_ouput_pdf.sh` to create the final PDF.

## Additional Resources

- Original cards reference: 

## Contribution

Feel free to fork this project and submit pull requests or open issues for any improvements or problems you encounter.

## License

The original Onitama cards are licensed under the terms available at the following link: [Onitama Cards 2x2 on BoardGameGeek](https://boardgamegeek.com/filepage/249135/onitama-cards-2x2-plus-backs-a4).

This project is released under a standard open-source license, allowing free use, modification, and distribution of the modified work under the same license as the original.
