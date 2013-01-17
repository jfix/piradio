function say(word) {
  console.log(word);
}

function shout(word) {
  console.log(word.toUpperCase());
}

function execute(someFunction, value) {
  someFunction(value);
}

execute(shout, "Hello");
execute(say, "World");