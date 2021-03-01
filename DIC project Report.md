**DIC Project Report**

**Project: DIC/2020/LD/014**

**Determining number of trays ( tray tower) and height (packed tower)
for an absorber**

**Introduction:** Development of a android application for calculating
the number of trays and height of packed tower in an absorber.This
Application gives user a interactive interface and doing complex
calculation in background and showing graphical and mathematical
results. The Project Includes Mc-cabe Thiele method of determining
number of trays in absorbing tower. Absorption is the unit operation in
which one or more components of a gas stream are removed from the gas
mixture by being absorbed onto a non-volatile liquid called a “solvent”.
During this process two streams, one of gas and other of solvent are
made to move in concurrent direction, generally gas from the bottom of
unit and solvent from the top. Absorption can be

1\. **Physical**: when the solute is dissolved into the solvent because
it has higher solubility in the solvent than other gases.

2.**Chemical:** when the solute reacts with the solvent, and the
resulting product still remains in the solvent.

The method used for determining number of trays and height of column are
completely **physical** process of absorption and based on graphical and
mathematical operations.

**Assumptions:**

**For energy balance in the unit:**

1.  Carrier gas should be insoluble in solvent.

2.  Solvent should be in-volatile.

3.  The system should be isothermal and isobaric.

**For Straight operating line:**

1.  Solvent and Gas flow rate need to be constant throughout
    the process.

2.  Energy should be balanced

![](media/image1.PNG){width="5.020833333333333in"
height="4.146418416447944in"}

**User Input:**

User input are almost same for both the methods except some values.

The necessary inputs are as:

**G**: Gas flow rate in the unit(in Kg/hr or Kmol/hr)

**L:** Liquid(or Solvent) flow rate in unit(in Kg/hr or Kmol/hr)

**Y~1~:** mole fraction of solute in output gas stream.

**Y~n+1~:** Mole fraction of solute in inlet gas stream

**X~0~:** Mole fraction of solute in input solvent stream

**Application’s Home Page:**

![](media/image2.jpeg){width="2.6972222222222224in"
height="4.447916666666667in"}![](media/image3.jpeg){width="2.645138888888889in"
height="4.770833333333333in"}The home Page has two buttons, which are
for determining number of trays and Height calculation respectively, and
a side drawer which also enable to directly go to the respective
calculation page.

**Number of Trays Calculation:**

As mentioned above, Data for both the calculations are almost same,
explicit data for number of tray calculation are :

1.  **Efficiency of trays**

2.  **Data for equilibrium curve:** Equilibrium curve can be a line or a
    curve or set of data points. In this application, user has dropdown
    menu to chose option for all the three types of data entry, either
    by equation, data points or simple line.

    ![](media/image4.jpeg){width="2.34375in"
    height="0.9790321522309712in"}

    Selecting slope of line, we have to enter the slope of
    equilibrium line.

    ![](media/image5.jpeg){width="2.3125in"
    height="4.836710411198601in"}
    ![](media/image6.jpeg){width="2.332561242344707in"
    height="4.874695975503062in"}

If data points is selected then we have to enter number of data points,
then a page will be displayed showing the empty field for data points.

![](media/image7.jpeg){width="2.1875in" height="4.582490157480315in"}
![](media/image8.jpeg){width="2.69375in" height="4.583333333333333in"}

Tested data is being entered int the given pictures, for calculation and
result is displayed after calculation

![](media/image9.jpeg){width="2.520138888888889in" height="4.5in"}

If equation is chosen, then we will have three options, that are,
polynomial, exponential or ratio equation. We need to enter p, e or r
respectively for different equations. For example here I have chosen p
for polynomial
equation.![](media/image10.jpeg){width="2.11292104111986in"
height="4.413888888888889in"}
![](media/image11.jpeg){width="2.1003641732283467in"
height="4.404985783027121in"}

And using these values, the result will be

![](media/image12.jpeg){width="2.666661198600175in"
height="5.572916666666667in"}

On the result page, dark red line shows the operating line, blue line
represents the equilibrium line and the bright red lines between them
are representing the stages or half of the number of trays.

**Precaution:**

1.  Any incomplete value will notify the user to fill it

2.  Absurd value will terminate the process.

3.  If the arrangement of values are such that the result is turning out
    to be infinite then the application will terminate.

**Calculation of height of packed column:**

Explicit data required in this part are:

1.  **Value of K~xa~**

2.  **Value of K~ya~**

These value are basically used for calculating the integral for height
calculation

1.  **Data for equilibrium curve:** The set of equilibrium data is
    required to draw equilibrium curve.

All other data is being taken according to a test condition and data is
also saved for that given dataset. Here, if we select saved example
option for equilibrium data points, then auto-filled dataset will be
appear else if “enter data manually” is chosen then,enter the number of
data points needed and empty field will be shown.

![](media/image13.jpeg){width="2.163236001749781in"
height="4.520833333333333in"}
![](media/image14.jpeg){width="3.7364260717410325in"
height="2.1145833333333335in"}

![](media/image15.jpeg){width="2.322422353455818in"
height="4.853508311461067in"}
![](media/image16.jpeg){width="2.317752624671916in" height="4.84375in"}
![](media/image17.jpeg){width="2.3027974628171477in" height="4.8125in"}

Shown data are by default saved for testing purpose, and result is also
shown for that data, although user can enter data manually and check the
result by varying data values, Second picture is plot of the operating
and equilibrium line.

In next figure, result is calculated by finding the area under the
curve, which is obtained by dividing the curve in several small pieces
and calculating trapezoidal area for each of them and finally adding
them, the curve is obtained by finding the value of on operating line,
for each value on equilibrium line, that is connecting them with the
line of slope -K~xa~/K~ya~. And hence the final height is shown after
calculation.

**Conclusion:**

Determination of trays and height of absorber column was quite difficult
and inaccurate while working on paper but it can be calculated
accurately and fast by applying programming concept and techniques like
converting data points to cubic spline equation, area under the random
curve can be calculated by taking small trapezoid, which make it more
accurate.
