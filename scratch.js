let myErrorTester = async () => {
  try {    // Intentionally cause an error
    // await setTimeout(async () => someAsyncFunctionThatDoesNotExist(), 0);
    await new Promise((r) => setTimeout(r, 0));
  } catch (error) {
    console.error("!!!!! An error occurred:", error);
  }
}
