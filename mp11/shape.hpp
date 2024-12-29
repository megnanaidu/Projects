/* Partner: ellav2
  These functions implement a Shape hierarchy for managing geometric shapes and their properties. 
  The base class, Shape, is inherited by four derived classes: Circle, Rectangle, Sphere, and RectPrism. 
  Each class provides implementations for calculating the area and volume, as well as operator overloading 
  for addition and subtraction of shapes. The file also has functions to read shape data from 
  a file, create shape objects dynamically, and calculate the maximum area and volume.
*/

#ifndef SHAPE_H_
#define SHAPE_H_

#include<iostream>
#include<cmath>
#include<string>
#include<algorithm>
#include<list>
#include<fstream>
#include <iomanip>    

using namespace std;

//Base class
//Please implement Shape's member functions
//constructor, getName()
class Shape{
public:
	// Constructor to initialize shape with a name
  	Shape(string name) : name_(name)
	{
	}
	
  	string getName() // Returns the name of the shape
	{
		return name_;
	}
	
	//pure virtual fucntions calculate area + volume  
  	virtual double getArea() const = 0;
  	virtual double getVolume() const = 0;
	
private:
  string name_;
};

//Rectangle
//Please implement the member functions of Rectangle:
//constructor, getArea(), getVolume(), operator+, operator-

template <class T>
class Rectangle : public Shape{
public:
	// Constructor initializes width and length 
  	Rectangle<T>(T width = 0, T length = 0):Shape("Rectangle"), width_(width), length_(length)
	{
	}
	
	//calculates area 
  	double getArea() const override 
	{
		return static_cast<double>(width_ * length_);
	}
	
  	double getVolume() const override 
	{
		return 0.0;
	}
	
	// Overload + operator for rectangle addition
	Rectangle<T> operator + (const Rectangle<T>& rec) 
	{
		return Rectangle<T>(width_ + rec.width_, length_ + rec.length_);
	}
	
	// Overload - operator for rectangle subtraction
	Rectangle<T> operator - (const Rectangle<T>& rec) 
	{
		return Rectangle<T>(max((T)0, width_ - rec.width_), max((T)0, length_ - rec.length_));
	} 
	
	// Getter for width
	T getWidth() const 
	{ 
		return width_;
	}
	
	//getter for length
	T getLength() const 
	{ 
		return length_;
	}
private:
	T width_;
        T length_;

};

//Circle
//Please implement the member functions of Circle:
//constructor, getArea(), getVolume(), operator+, operator-
//@@Insert your code here

class Circle : public Shape{
public:

	// Constructor initializes radius
  	Circle(double radius):Shape("Circle"), radius_(radius) 
	{
	}
	
	//calculates area of cirle 
  	double getArea() const override
	{
		return M_PI * radius_ * radius_;
	}
	
	//calulcates volume of circle
 	double getVolume() const override
	{
		return 0.0;
	}
	
	// Overload + operator for circle addition
  	Circle operator + (const Circle& cir)
	{
		return Circle(radius_ + cir.radius_);
	}
	
	// Overload + operator for circle subtraction
	Circle operator - (const Circle& cir)
	{
		return Circle(max(0.0, radius_ - cir.radius_));
	} 

	double getRadius() const //getter for radius
	{ 
		return radius_;
	}
	
private:
	double radius_;

};



//Sphere
//Please implement the member functions of Sphere:
//constructor, getArea(), getVolume(), operator+, operator-
//@@Insert your code here

class Sphere : public Shape{
public:
	//constcructor for radius
  	Sphere(double radius):Shape("Sphere"), radius_(radius)
	{
	}

	//claulcates volume
  	double getVolume() const override
	{
		return (4.0 / 3.0) * M_PI * radius_ * radius_ * radius_;
	}	
	
	//calculates area
  	double getArea() const override
	{
		return 4 * M_PI * radius_ * radius_;
	}

	// Overload + operator for sphere addition
	Sphere operator + (const Sphere& sph) 
	{
		return Sphere(radius_ + sph.radius_);
	}

	// Overload + operator for sphere subtraction
	Sphere operator - (const Sphere& sph) 
	{
		return Sphere(max(0.0, radius_ - sph.radius_));
	} 
	
	double getRadius() const  //getter for radius
	{
		return radius_;
	}

private:
	double radius_;

};

//Rectprism
//Please implement the member functions of RectPrism:
//constructor, getArea(), getVolume(), operator+, operator-
//@@Insert your code here
class RectPrism : public Shape{
public:
	//constructor intializes dimensions
  	RectPrism(double width=0, double length=0, double height=0):Shape("RectPrism"), width_(width), length_(length), height_(height) 
	{	
	}
	
	//calculates voluem
  	double getVolume() const override 
	{
		return width_ * length_ * height_;
	}
  	
	//claulcates area
	double getArea() const override
	{
		return 2 * (width_ * length_ + length_ * height_ + width_ * height_);
	}
	
	//overloaded + operator for addition
	RectPrism operator + (const RectPrism& rectp)
	{
		return RectPrism(width_ + rectp.width_, length_ + rectp.length_, height_ + rectp.height_);
	}
	
	//overloaded - operator for subtractiom
	RectPrism operator - (const RectPrism& rectp)
	{
		return RectPrism(max(0.0, width_ - rectp.width_),max(0.0, length_ - rectp.length_),max(0.0, height_ - rectp.height_));
	}	
	

	//getters for width, length, and height
	double getWidth() const 
	{ 
		return width_;
	}
	
	double getLength() const 
	{ 
		return length_;
	}
	
	double getHeight() const 
	{ 
		return height_;
	}
  
private:
  	double length_;
  	double width_;
  	double height_;

};

// Read shapes from test.txt and initialize the objects
// Return a list of pointers that points to the objects 
static list<Shape*> CreateShapes(char* file_name) 
{
	//@@Insert your code here
	list<Shape*> shapes;
	ifstream file(file_name);

	if (!file.is_open()) 
	{
        	return shapes; // Free the allocated memory before returning	
    	}

	int num_shapes; // number of shapes in file
	file >> num_shapes; // Read the number of shapes


	for (int i = 0; i < num_shapes; i++) //loops through each shape entry 
	{
        	string name;
        	file >> name;

		//check the type of shape and create an object of the corresponding subclass
        	if (name == "Circle") 
		{
            		double radius;
            		file >> radius; 
            		shapes.push_back(new Circle(radius));
        	} 
		else if (name == "Rectangle") 
		{
            		double width, length;
            		file >> width >> length;
            		shapes.push_back(new Rectangle<double>(width, length));
        	} 
		else if (name == "Sphere") 
		{
           		double radius;
            		file >> radius;
            		shapes.push_back(new Sphere(radius));
        	} 	
		else if (name == "RectPrism") 
		{
            		double width, length, height;
            		file >> width >> length >> height;
            		shapes.push_back(new RectPrism(width, length, height));
        	}
	}

	file.close();
	return shapes;
	
}

// call getArea() of each object 
// return the max area
static double MaxArea(list<Shape*> shapes){
	double max_area = 0;
	//@@Insert your code here

	for (auto shape : shapes) 
	{
        	max_area = max(max_area, shape->getArea());
    	}
	return max_area;
}

// call getVolume() of each object 
// return the max volume
static double MaxVolume(list<Shape*> shapes){
	double max_volume = 0;
	//@@Insert your code here

	for (auto shape : shapes) 
	{
        	max_volume = max(max_volume, shape->getVolume());
    	}
	
	return max_volume;
}
#endif

