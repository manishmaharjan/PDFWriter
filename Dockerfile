FROM ubuntu:latest

#Default directory
WORKDIR /pdfwriter

RUN apt-get update && \
    apt-get install -y --no-install-recommends nano libgtest-dev python3 git curl clang llvm lcov default-jdk zip cmake make gcc  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN which clang

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/CodeIntelligenceTesting/cifuzz/main/install.sh)"

RUN echo "full path and content is"
RUN ls -a && pwd
COPY . . 
RUN ls -a
RUN pwd
RUN ls -a
CMD ["sh", "-c", "cifuzz run pdf_fuzz --use-sandbox=false > fuzzing.log 2>&1 && cat fuzzing.log"]
RUN ls -a
