(add-tests-with-string-output "fixnum?"
  [(fixnum? 0) => "#t\n"]
  [(fixnum? #t) => "#f\n"]
  [(fixnum? '()) => "#f\n"]
  [(fixnum? "s") => "#f\n"]
  [(fixnum? (fx+ 12 13)) => "#t\n"]
)

(add-tests-with-string-output "fixnum"
  [(fixnum 0.0) => "0\n"]
  [(fixnum 1.5) => "1\n"]
  [(fixnum 11.9) => "11\n"]
  [(fixnum -2.45) => "-2\n"]
  [(fixnum? (fixnum 100.01)) => "#t\n"]
)

(add-tests-with-string-output "fx+"
  [(fx+ 1 2) => "3\n"]
  [(fx+ 1 -2) => "-1\n"]
  [(fx+ -1 2) => "1\n"]
  [(fx+ -1 -2) => "-3\n"]
  [(fx+ 268435455 -1) => "268435454\n"]
  [(fx+ 268435454 1) => "268435455\n"]
  [(fx+ -268435456 1) => "-268435455\n"]
  [(fx+ -268435455 -1) => "-268435456\n"]
  [(fx+ 268435455 -268435456) => "-1\n"]
  [(fx+ 1 (fx+ 2 3)) => "6\n"]
  [(fx+ 1 (fx+ 2 -3)) => "0\n"]
  [(fx+ 1 (fx+ -2 3)) => "2\n"]
  [(fx+ 1 (fx+ -2 -3)) => "-4\n"]
  [(fx+ -1 (fx+ 2 3)) => "4\n"]
  [(fx+ -1 (fx+ 2 -3)) => "-2\n"]
  [(fx+ -1 (fx+ -2 3)) => "0\n"]
  [(fx+ -1 (fx+ -2 -3)) => "-6\n"]
  [(fx+ (fx+ 1 2) 3) => "6\n"]
  [(fx+ (fx+ 1 2) -3) => "0\n"]
  [(fx+ (fx+ 1 -2) 3) => "2\n"]
  [(fx+ (fx+ 1 -2) -3) => "-4\n"]
  [(fx+ (fx+ -1 2) 3) => "4\n"]
  [(fx+ (fx+ -1 2) -3) => "-2\n"]
  [(fx+ (fx+ -1 -2) 3) => "0\n"]
  [(fx+ (fx+ -1 -2) -3) => "-6\n"]
  [(fx+ (fx+ (fx+ (fx+ (fx+ (fx+ (fx+ (fx+ 1 2) 3) 4) 5) 6) 7) 8) 9) => "45\n"]
  [(fx+ 1 (fx+ 2 (fx+ 3 (fx+ 4 (fx+ 5 (fx+ 6 (fx+ 7 (fx+ 8 9)))))))) => "45\n"]
)

(add-tests-with-string-output "fx-"
  [(fx- 1 2) => "-1\n"]
  [(fx- 1 -2) => "3\n"]
  [(fx- -1 2) => "-3\n"]
  [(fx- -1 -2) => "1\n"]
  [(fx- 268435454 -1) => "268435455\n"]
  [(fx- 268435455 1) => "268435454\n"]
  [(fx- -268435455 1) => "-268435456\n"]
  [(fx- -268435456 -1) => "-268435455\n"]
  [(fx- 1 268435455) => "-268435454\n"]
  [(fx- -1 268435455) => "-268435456\n"]
  [(fx- 1 -268435454) => "268435455\n"]
  [(fx- -1 -268435456) => "268435455\n"]
  [(fx- 268435455 268435455) => "0\n"]
  [(fx- -268435455 -268435456) => "1\n"]
  [(fx- 1 (fx- 2 3)) => "2\n"]
  [(fx- 1 (fx- 2 -3)) => "-4\n"]
  [(fx- 1 (fx- -2 3)) => "6\n"]
  [(fx- 1 (fx- -2 -3)) => "0\n"]
  [(fx- -1 (fx- 2 3)) => "0\n"]
  [(fx- -1 (fx- 2 -3)) => "-6\n"]
  [(fx- -1 (fx- -2 3)) => "4\n"]
  [(fx- -1 (fx- -2 -3)) => "-2\n"]
  [(fx- 0 (fx- -2 -3)) => "-1\n"]
  [(fx- (fx- 1 2) 3) => "-4\n"]
  [(fx- (fx- 1 2) -3) => "2\n"]
  [(fx- (fx- 1 -2) 3) => "0\n"]
  [(fx- (fx- 1 -2) -3) => "6\n"]
  [(fx- (fx- -1 2) 3) => "-6\n"]
  [(fx- (fx- -1 2) -3) => "0\n"]
  [(fx- (fx- -1 -2) 3) => "-2\n"]
  [(fx- (fx- -1 -2) -3) => "4\n"]
  [(fx- (fx- (fx- (fx- (fx- (fx- (fx- (fx- 1 2) 3) 4) 5) 6) 7) 8) 9) => "-43\n"]
  [(fx- 1 (fx- 2 (fx- 3 (fx- 4 (fx- 5 (fx- 6 (fx- 7 (fx- 8 9)))))))) => "5\n"]
)

(add-tests-with-string-output "fx*"
  [(fx* 3 -3) => "-9\n"]
  [(fx* (fx* 1 -2) -3) => "6\n"]
)

(add-tests-with-string-output "fx="
  [(fx= 12 13) => "#f\n"]
  [(fx= 12 12) => "#t\n"]
  [(fx= 16 (fx+ 13 3)) => "#t\n"]
  [(fx= 16 (fx+ 13 13)) => "#f\n"]
  [(fx= (fx+ 13 3) 16) => "#t\n"]
  [(fx= (fx+ 13 13) 16) => "#f\n"]
)

(add-tests-with-string-output "fx<"
  [(fx< 12 13) => "#t\n"]
  [(fx< 12 -13) => "#f\n"]
  [(fx< 1 1) => "#f\n"]
)

(add-tests-with-string-output "if"
  [(if (fx= 12 13) 12 13) => "13\n"]
  [(if (fx= 12 12) 13 14) => "13\n"]
)
