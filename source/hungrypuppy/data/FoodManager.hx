package hungrypuppy.data;

class FoodManager
{
	public static var foodFiles = ["testFood"];

	public static function getScale(curFood):Array<Dynamic>
	{
		switch (curFood)
		{
			case "testFood":
				return [1.5, 1.5];
			default:
				return [1, 1];
		}
	}
}