#include <iostream>
#include <chrono>


int subsetSumProblemSequential(int* data, int n) {
    int solutionsFound = 0;
    int sum = 0;

    for (long long i = 1; i < (1ULL << n); ++i) {
        int sub_sum = 0;
        for (int j = 0; j < n; ++j) {
            if ((1ULL << j) & i) {
                sub_sum += data[j];
            }
        }
        if (sub_sum == sum) {
            ++solutionsFound;
        }
    }
    return solutionsFound;
}

int generateSubset(int* data, int SIZE) {
    std::srand(std::time(nullptr));

    for (int i = 0; i < SIZE; i++) {
        int num = std::rand() % 201 - 100;

        data[i] = num;
    }

    // Print the generated array
    std::cout << "Generated Array:" << std::endl;
    for (int i = 0; i < SIZE; i++) {
        std::cout << data[i] << " ";
    }
    std::cout << std::endl;

    return 0;
}

int main() {

    int sum = 0;

    #define SIZE 29

    int data[SIZE];
    generateSubset(data, SIZE);
    /*int data[] = { 1, 2 , -2};*/
    int n = sizeof(data) / sizeof(data[0]);
    int* dataDevice;
    int* hasFound;

    
    auto start_time = std::chrono::high_resolution_clock::now();


    std::cout << "Sequential" << std::endl;
    int foundResultsSequential = subsetSumProblemSequential(data, n);
    if (foundResultsSequential) {
        std::cout << "Found a subset with given sum" << std::endl;
        std::cout << foundResultsSequential << std::endl;;
    }
    else
        std::cout << "No subset with given sum" << std::endl;

    auto count_duration = std::chrono::high_resolution_clock::now() - start_time;
    double duration_seconds = std::chrono::duration<double>(count_duration).count();
    std::cout << duration_seconds << std::endl;

    return 0;
}