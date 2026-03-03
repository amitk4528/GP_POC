public class PosRecController 
{
Public List<Position__C> lposition{get; set;}


Public void Getallpos()
{
lposition = [Select id, name, Status__C from Position__C];
}

}