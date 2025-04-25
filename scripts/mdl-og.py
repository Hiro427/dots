import requests
from bs4 import BeautifulSoup
import os
from urllib.parse import urljoin
import zipfile
from io import BytesIO
from tqdm import tqdm
import time

headers = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"
}


def download_images_to_cbz(url, destination_folder, cbz_filename):
    # Ensure the destination folder exists
    if not os.path.exists(destination_folder):
        os.makedirs(destination_folder)

    # Full path for the CBZ file
    output_file = os.path.join(destination_folder, cbz_filename)

    # Get the HTML content from the URL
    response = requests.get(url, headers=headers)
    if response.status_code != 200:
        print("Failed to retrieve the webpage")
        return

    soup = BeautifulSoup(response.text, 'html.parser')

    # Find all image tags in the HTML
    img_tags = soup.find_all('img')
    # print(f"Found {len(img_tags)} images.")

    # Create a .cbz file (a ZIP file with .cbz extension)
    with zipfile.ZipFile(output_file, 'w') as cbz:
        for index, img_tag in enumerate(img_tags[0:], start=0):
            img_url = img_tag.get('src')  # Get the 'src' attribute
            if not img_url:
                continue  # Skip if no 'src' attribute

            # Construct the full URL for the image
            img_url = urljoin(url, img_url)

            try:
                # Download the image content
                img_response = requests.get(img_url, stream=True)
                if img_response.status_code == 200:
                    # Save the image content in the CBZ file
                    image_name = f"image_{index+1}.jpg"
                    cbz.writestr(image_name, img_response.content)
                    # print(f"Added: {image_name}")
                else:
                    print(f"Failed to download: {img_url}")
            except Exception as e:
                print(f"Error downloading {img_url}: {e}")


def download_multiple_chapters():
    num_chapters = 1
    for i in tqdm(range(1, num_chapters + 1), desc="Downloading Chapters(s)"):
        # chapter_number = str(i).zfill(3)

        website_url = f"https://chapmanganato.to/manga-aa951409/chapter-{i}"
        cbz_filename = f"Ch.{i}.cbz"  # Replace with your desired output folder
        output_directory = "One-Piece"

        download_images_to_cbz(website_url, output_directory, cbz_filename)
        time.sleep(5)


def main():
    download_multiple_chapters()


if __name__ == "__main__":
    main()
