; -----------------------------------------------------------
; Circle Drawing
; 마우스로 포인트를 받아서 원을 그린다.
; -----------------------------------------------------------
; Return : VLA-Object [iAcadLine]
; -----------------------------------------------------------
; Author
; https://github.com/qudrnr/
; -----------------------------------------------------------
; tb
; -----------------------------------------------------------

(defun c:tb ()

	(if (not dcl-project-import)

		(if (vl-catch-all-apply 'vl-cmdf (list "OPENDCL"))	t
			
			(alert "Shut down the 'Autocad' and install 'OpenDCL'\n\nhttp://opendcl.com")
		)
		
		(progn
			
			; DCL DATA Load
			(dcl-project-import 
		
				'("YWt6AxgXAAAC6F9pBuKTJrMxLT9u4YwvaAYcXxwcHPJ48jhXynt6Qub2tj8+bk9YuHWuaO8sbDtf"
"IDZC57ZncQSOnLOxuvG63SCKmGG+u+X33Gkd8mGq5xO1wIkVF9cCqjogjaSJpafj48lNwaenBBz1"
"TzSi4H90r0ozrG4zjpFeO1c2kwr7JVjHWzRQXAQpPCpYcULeSD69qjwzqjhAwPm3tf2Cqjazgqq6"
"Rr4sUcsM9fErtS32hfvHKV01cU90DEEBov4mIh1tNeWLudlLeMqYLjwd5gW1Uj2ikJ1Zv9ytsVMc"
"O+aFysyobMy6tgzsFVlXaWsunJwX9EWHA1CvRnEtwbfjbsa6cgt5jiu+qX65frF94HwCdY5SHsm1"
"9wH8AmTO/IAR1lSH2PcpKIMqOsg1sxYxlJV9UcUEO7twB+vvsXRQClPzaf8EH5rEgU2+sX9Be4L1"
"4oQU6AuwJfn6qgDdl0Oh6DZVS9I5YcXFC+b6Vrzf3FImyxwmyzleAX6GX56F/l010dpzKh3+uely"
"CQPtW+F+hzu+ST+BvKzFu4/cl9Hpjk3ygbpyzp0kZoG7pt2bF9zY/irMV1sc9DK6NgmrFZoZesXj"
"YEO4YPMW0dS5bvUxfuk/Eh4SOGPk02BEM8WHwN5jY5+ZcIBgX4usJspeaKUcBOWWRxaKlAfU8yJ6"
"1LGeB7/ZcsBZhl06mCBd0W+HN/05ewl/ecR/iX5Af2bnznGot7jyaDROvd0fWBiGqayNLzSPwsXh"
"2XSMdHKMGoH9kbW2l4WVyo/AoTII5+3jK7QhJUuIX0k0WyvzlXTWIyk/su5vTtEc4+mdUpa5m49+"
"QIERk2vI8k5eJmfIt8K0EZo/JD2opSYgU52YPpEPzGIEE9JBNDCooWvCQy9DWIXB+BIbtXSZekn9"
"AjGovtTJj6Lr+UP73tC1X7EKjBNrjKloc5XuOZu3zfqDgm62WwgKWDDXXdr0xrLUSRJRzzurcDRt"
"K8hWlFwZarPvTTQas0yHJpHhSGGR3IKExvEsiOyEH0Qyp/D3cxpUhng0YXZLqrXBnLEvQM/zl+2e"
"mEB7heqOVeDNKLhRgUTHtcGX0GvGVfmi6JjyKqq/UGba18IaSFEbsBKEIf5AzqHopwqrxa8rj1RM"
"5RoUNfzdPL1dtlAbJu6m1E+ozbuIVBS60VX3k1+uAX1OqO7fUkubk0Kp6h/mUXXpZP5twJuBn4R/"
"2SgTUOAkKbXHNP1bF4GLN8trmLvtVQxKvTdIEzMleWKMfEB+jRnVB+NLEN/hcSpAOSOFA1hx599z"
"0rDP0OuVcUaY3jI=")

			)

			; Form Show
			(dcl-Form-Show TextboxandButton/Form1)
		)		
	)
)

;-----------------------------------------------------------
; 'Draw' Button Click Event
;-----------------------------------------------------------
(defun c:TextboxandButton/Form1/TextButton1#OnClicked (/ Dr Cr )
	
	; Get Textbox Value
	(setq dr (atof (dcl-Control-GetText TextboxandButton/Form1/TextBox1)))

	; Get Color
	(setq Cr (dcl-Control-GetText TextboxandButton/Form1/ComboBox1))

	; Main Function
	(TB:Drawing dr Cr)

	(princ)
)

;-----------------------------------------------------------
; 'Close' Button Click Event
;-----------------------------------------------------------
(defun c:TextboxandButton/Form1/TextButton2#OnClicked (/)

	; Form Close
	(dcl-Form-Close TextboxandButton/Form1)

	(princ)
)

;-----------------------------------------------------------
; Main Function
;-----------------------------------------------------------
(defun TB:Drawing ( rd Color / doc spc o1)

	(setq doc (vla-get-activedocument (vlax-get-acad-object))
		  spc (vlax-get-property doc
				(if (= 1 (getvar 'CVPORT)) 'Paperspace 'Modelspace)
			 )
	)

	(princ "\n\nSpecify first point:\n")
	
	; Circle Object 
	(setq o1 (vl-catch-all-apply 'vlax-invoke (list spc 'AddCircle (getpoint) rd)))

	; Put Color
	(cond
		(	(= "Red" 	Color)		(vla-put-color o1 1))
		(	(= "Yellow" Color)		(vla-put-color o1 2))
		(	(= "Green" 	Color)		(vla-put-color o1 3))
		(	(= "Cyan" 	Color)		(vla-put-color o1 4))
		(	(= "Blue" 	Color)		(vla-put-color o1 5))
		(	(= "Magenta" Color)		(vla-put-color o1 6))
		(	(= "Whtie" 	Color)		(vla-put-color o1 7)) 
	)

	o1
)





