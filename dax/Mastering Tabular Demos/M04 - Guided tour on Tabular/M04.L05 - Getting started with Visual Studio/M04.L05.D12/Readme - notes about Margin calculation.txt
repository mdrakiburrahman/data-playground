The Margin measure in the video has been created using a wrong formula: 
the third line had a "+" instead of "*".

This is the formula in the video:
SUMX ( 
    Sales,
    Sales[Quantity] + ( Sales[Net Price] - Sales[Unit Cost] )
)

This is the correct formula:
SUMX ( 
    Sales,
    Sales[Quantity] * ( Sales[Net Price] - Sales[Unit Cost] )
)

The Contoso folder contains the project with the fixed formula.
The "Contoso - wrong Margin calculation" folder contains the version used in the video.
We provide that version if you want to obtain the same values for the Margin measure that you have seen in the video.
