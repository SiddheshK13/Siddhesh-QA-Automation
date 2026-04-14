//program to add first n natural numbers
let n = 5
let sum = 0
for(let i = 1; i<=n;i++)
{
    sum = sum + i
}
console.log(sum)

//factorial
let fact = 1
for(let i = 1; i<=n;i++)
{
    fact = fact * i
}
console.log(fact)

//fibonacci series
let a = 0
let b = 1
let c = 0
for(let i = 1; i<=n;i++)
{
    c = a + b
    console.log(c)
    a = b
    b = c
}