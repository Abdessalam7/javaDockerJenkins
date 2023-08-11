# Use official Maven image as base
FROM maven:3.8.3-openjdk-11

# Switch to root user to install additional software (if needed)
USER root
