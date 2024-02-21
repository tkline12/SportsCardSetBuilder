// sync --------------------------------

function syncTask(n) {
    const start = Date.now();
    let now = start;
    while (now - start < n * 1000) {
      now = Date.now();
    }
    console.log(`Completed in ${n} second(s).`)
}

function timeTasks(tasksFunc) {
    let start = Date.now();
    tasksFunc();
    console.log(`Completed all in  ${(Date.now() - start)/ 1000 } second(s).`)
}

//timeTasks(() => {syncTask(1); syncTask(2); syncTask(5)});


// promise --------------------------------

let promise1 = new Promise((resolve, reject) => {
    // This anonymous function executes after Promise is created.
    // The promise represents the eventual completion of this function.
    // If this function completes successfully then it should call resolve.
    // If this function fails then it should call reject.
    let x = 10;
    if (x == 10) {
        resolve("Success!");
    } else {
        reject("Failure!!");
    }
});

// promise1.then( (data) => {
//     console.log(`In first then(): ${data}`);
//     return 'some data'
// }).catch( (data) => {
//     console.log(`In error(): ${data}`);
// })


// async --------------------------------

function asyncTask(n) {
    setTimeout(() => {
        console.log(`Completed in ${n} second(s).`);
    }, n * 1000);
}

function promiseTask(n) {
    return new Promise ( (resolve, reject) => {
        setTimeout(() => {
            console.log(`Completed in ${n} second(s).`);
            resolve();
        }, n * 1000);
    }); 
}


//timeTasks(() => {asyncTask(1); asyncTask(2); asyncTask(5); });
//timeTasks(() => {promiseTask(1); promiseTask(2); promiseTask(5); });


// await ------------------------------

async function waitForPromise() {
    console.log('Before...')
    await promiseTask(5);
    console.log('After!')
}

//waitForPromise();

async function awaitTasks(promiseFunc) {
    let start = Date.now();
    await promiseFunc();
    console.log(`Completed all in ${(Date.now() - start)/ 1000 } second(s).`)
}

//awaitTasks(() => {return Promise.all([promiseTask(1), promiseTask(2), promiseTask(5)]);});
