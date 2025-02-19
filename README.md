# RingBearerAI

Final project for the Building AI course

## Summary

RingBearerAI is an AI-powered tool designed to determine the perfect engagement ring size from just a couple of pictures. Using advanced computer vision and deep learning, it analyzes hand proportions with precision—no guessing, no awkward questions. Whether you're planning a surprise proposal or just want an effortless way to find the right fit, RingBearerAI carries the burden for you.

## Background

Choosing the right engagement ring size can be challenging, especially when planning a surprise proposal. Many people struggle with:
* Guessing the correct ring size, leading to resizing costs and delays
* Asking for size directly, which may ruin the surprise
* Finding a convenient and accurate way to determine ring size without visiting a jeweler

RingBearerAI provides a seamless, AI-driven solution to these common issues.

## How is it used?

Users upload a couple of hand images to the RingBearerAI platform, and the AI processes them to determine the best-fitting ring size. The process is quick, private, and eliminates the guesswork.

### Steps:
1. Take and upload 2-3 pictures of the person's hand (with a reference object for scale, such as a coin or card).
2. The AI analyzes the images and estimates the correct ring size.
3. Users receive the result instantly and can use it to purchase the perfect ring.

This tool is ideal for individuals planning a surprise proposal, jewelers looking to enhance customer experience, and anyone needing an easy way to determine ring size.

![Ring Image](https://upload.wikimedia.org/wikipedia/commons/6/6c/Wedding_and_engagement_ring.jpg)

## Data sources and AI methods

RingBearerAI uses:
* Computer vision techniques (e.g., OpenCV, MediaPipe) to detect and measure hand proportions
* Deep learning models (e.g., TensorFlow Lite) trained on annotated hand images with known ring sizes
* A dataset of hand images with verified ring sizes, collected from public sources and user contributions

## Challenges

RingBearerAI does not solve:
* Cases where images are unclear, blurry, or lack a proper reference object for scaling
* Variations in finger size due to temperature, hydration, or weight fluctuations
* Ensuring 100% accuracy in every scenario (small margin of error is possible)

Ethical considerations include:
* Protecting user privacy—images are processed locally and not stored
* Avoiding biases in the dataset to ensure accuracy across different hand shapes and skin tones

## What next?

To improve RingBearerAI, future developments could include:
* Enhancing the AI model with more diverse training data
* Adding a mobile app for easier image capture and processing
* Integrating with online jewelry stores for a seamless shopping experience

To move forward, the project needs additional image data, AI model refinement, and potential partnerships with jewelry retailers.

## Acknowledgments

* Inspired by the challenge of surprise engagements and the importance of a perfect ring fit
* Uses open-source AI tools like TensorFlow Lite and OpenCV

