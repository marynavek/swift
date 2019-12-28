import UIKit

let aIntegerOptional : Int? = 10
print(aIntegerOptional)

//unwrapping techniques
var name12 : String?
name12 = "Maryna"

//note why no error in struct, auto initializer
//another way to initialize the var in the class -> make it optional
//useful to use in the API -> typicode API
struct Food {
    var foodName : String?
}

//unwrapoing
//nil cielsecing operator
//before doing anything with optional vars, you have to unwrape it, even if they are of the same type

var x : Int? = 10
var y : Int? = 20
//it has to be secured, because if the declaration is var x : Int?, w/o any value assigned then the program will crash
if x != nil && y != nil{
    //"!" is used to unwrape the optional values -->> forced uwrapping
    let z = x! + y!
    print(z)
}


var isValid : Bool? = true

if isValid != nil {
    print(isValid!)
}

//optional binding if let (only works with option)

if let isValidUnwrapped = isValid{
 
}
else {
    
}

//nil coescing
//if there is something is in isValid, it will assign aRes to it, other way aRes is assigned to the false
let aRes = isValid ?? false

//guard let
//only works with in function; mostle used as teh tiop line/instruction to check some critiacl codnfition, fulfill then only execute further, otherwise return'..technique has to unwrapped
//if let guard Vs guard let

func encryptString(aStringToBeEncrypted : String?) -> String {
    
    guard let unwrappedVar = aStringToBeEncrypted else { return ""}
    //logic
    //;pgoc
    //logce
    return "jgfjdnbjnfjndv " + unwrappedVar + "fjrngrm"
}


class person{
    var address : Address?
}

class Address{
    var streetName : String?
    
}

var add : Address? = Address()
add?.streetName = "RJT Offcie"
var p : person? = person()
p?.address = add

if let isValid = p{
    if let newP = isValid.address {
        if let streetName = newP.streetName {
            print("exist \(streetName)")
        }
    }
}

//print(p?.address?.streetName)

// optional chaining
// when you chain optional variables, the last chained variable does not use the question mark
let x2 = p?.address?.streetName

let m = x2 ?? "default office name"
print(m)
