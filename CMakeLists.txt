cmake_minimum_required(VERSION 3.16)
project(PDFWriter VERSION 1.0)

add_subdirectory(PDFWriterLib)
add_subdirectory(test)
add_subdirectory(PDFWriterExecutable)


enable_testing()

find_package(cifuzz NO_SYSTEM_ENVIRONMENT_PATH)
enable_fuzz_testing()

add_fuzz_test(pdf_fuzz pdf_fuzz.cpp)
