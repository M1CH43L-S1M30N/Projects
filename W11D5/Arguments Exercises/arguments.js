function sum1() {
  let total = 0;
  for (let i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }
  return total;
}

function sum2(...nums) {
  let total = 0;
  for (let i = 0; i < nums.length; i++) {
    total += nums[i];
  }
  return total;
}

Function.prototype.myBind1 = function (context) {
  const func = this;
  const bindArgs = Array.from(arguments).slice(1);
  return function _boundFn() {

    const callArgs = Array.from(arguments);
    return func.apply(context, bindArgs.concat(callArgs));
    
  };
};

Function.prototype.myBind2 = function (context, ...bindArgs) {
  
  return (...callArgs) => this.apply(context, bindArgs.concat(callArgs));
  
};

function curriedSum(numArgs) {
  const numbers = [];

  function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      let total = 0;

      numbers.forEach((n) => { total += n; });

      return total;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

Function.prototype.curry = function (numArgs) {
  const args = [];
  const func = this;

  function _curriedfunc(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return func(...args);
    } else {
      return _curriedfunc;
    }
  }

  return _curriedFunc;
};

Function.prototype.curry1 = function (numArgs) {
  const args = [];
  const func = this;
  function _curriedFunc(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return func.apply(null, args);
    } else {
      return _curriedFunc;
    }
  }
  return _curriedFunc;
};


Function.prototype.curry2 = function (numArg) {
  const argArray = [];
  const _curriedFunc = (arg) => {
    argArray.push(arg);
    if (argArray.length === numArg) {
      return this(...argArray);
    } else {
      return _curriedFunc;
    }
  };
  return _curriedFunc;
};