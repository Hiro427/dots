import requests
from bs4 import BeautifulSoup
import os
import zipfile
from tqdm import tqdm
import time

headers = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"
}


def download_images_to_cbz(chapter_url, destination_folder, cbz_filename):
    """Download all images from a chapter and save as a .cbz file"""
    # Ensure the destination folder exists
    os.makedirs(destination_folder, exist_ok=True)

    # Full path for the CBZ file
    output_file = os.path.join(destination_folder, cbz_filename)

    # Get the HTML content from the URL
    response = requests.get(chapter_url, headers=headers)
    if response.status_code != 200:
        print(f"Failed to retrieve chapter page: {chapter_url}")
        return

    soup = BeautifulSoup(response.text, 'html.parser')

    # Find all image tags inside the chapter reader div
    image_tags = soup.select("div.container-chapter-reader img")
    if not image_tags:
        print("No images found on the page.")
        return

    print(f"Found {len(image_tags)} images in {cbz_filename}")

    # Create a .cbz file (a ZIP file with .cbz extension)
    with zipfile.ZipFile(output_file, 'w') as cbz:
        for index, img_tag in enumerate(tqdm(image_tags, desc=f"Downloading {cbz_filename}")):
            img_url = str(img_tag.get('src')) if img_tag.get('src') else None
            if not img_url or not isinstance(img_url, str):
                continue  # Skip invalid URLs
            # Use the chapter page URL as referer to avoid access denial
            img_headers = {
                "User-Agent": headers["User-Agent"],
                "Referer": chapter_url  # Required to bypass anti-scraping
            }

            try:
                # Download the image
                img_response = requests.get(img_url, headers=img_headers, stream=True)
                if img_response.status_code == 200:
                    image_name = f"image_{index + 1}.jpg"
                    cbz.writestr(image_name, img_response.content)
                else:
                    print(f"Failed to download: {img_url}")
            except Exception as e:
                print(f"Error downloading {img_url}: {e}")

    print(f"Saved {cbz_filename} in {destination_folder}")


def download_multiple_chapters():
    """Download multiple chapters and save as CBZ files"""
    num_chapters = 1  # Modify this for more chapters
    manga_slug = "aa951409"  # Modify this to the actual manga slug

    for i in tqdm(range(1, num_chapters + 1), desc="Downloading Chapters"):
        chapter_url = f"https://chapmanganato.com/manga-{manga_slug}/chapter-{i}"
        cbz_filename = f"Ch.{i}.cbz"
        output_directory = "One-Piece"  # Modify this for a different manga

        download_images_to_cbz(chapter_url, output_directory, cbz_filename)
        time.sleep(5)  # Prevents rate-limiting


def main():
    download_multiple_chapters()


if __name__ == "__main__":
    main()

