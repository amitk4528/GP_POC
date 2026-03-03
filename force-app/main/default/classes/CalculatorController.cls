public class CalculatorController 
{

Public Integer Firstnumber {get; set;}
Public Integer Secondnumber {get; set;}
Public Integer Result {get; set;}



Public void Add()
{
Result = Firstnumber + Secondnumber;
}

Public void Sub()
{
Result = Firstnumber - Secondnumber;
}

Public void Mult()
{
Result = Firstnumber * Secondnumber;
}

Public void Div()
{
Result = Firstnumber / Secondnumber;
}

}