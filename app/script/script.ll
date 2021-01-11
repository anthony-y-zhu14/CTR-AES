; ModuleID = 'script.c'
source_filename = "script.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32"

; Function Attrs: noinline nounwind optnone
define hidden zeroext i8 @setBit(i8 zeroext %0, i32 %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  store i8 %0, i8* %3, align 1
  store i32 %1, i32* %4, align 4
  %6 = load i8, i8* %3, align 1
  %7 = zext i8 %6 to i32
  %8 = load i32, i32* %4, align 4
  %9 = shl i32 1, %8
  %10 = or i32 %7, %9
  %11 = trunc i32 %10 to i8
  store i8 %11, i8* %5, align 1
  %12 = load i8, i8* %5, align 1
  ret i8 %12
}

; Function Attrs: noinline nounwind optnone
define hidden zeroext i8 @clearBit(i8 zeroext %0, i32 %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  store i8 %0, i8* %3, align 1
  store i32 %1, i32* %4, align 4
  %6 = load i8, i8* %3, align 1
  %7 = zext i8 %6 to i32
  %8 = load i32, i32* %4, align 4
  %9 = shl i32 1, %8
  %10 = xor i32 %9, -1
  %11 = and i32 %7, %10
  %12 = trunc i32 %11 to i8
  store i8 %12, i8* %5, align 1
  %13 = load i8, i8* %5, align 1
  ret i8 %13
}

; Function Attrs: noinline nounwind optnone
define hidden zeroext i8 @getBit(i8 zeroext %0, i32 %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  store i8 %0, i8* %3, align 1
  store i32 %1, i32* %4, align 4
  %5 = load i8, i8* %3, align 1
  %6 = zext i8 %5 to i32
  %7 = load i32, i32* %4, align 4
  %8 = shl i32 1, %7
  %9 = and i32 %6, %8
  %10 = load i32, i32* %4, align 4
  %11 = ashr i32 %9, %10
  %12 = trunc i32 %11 to i8
  ret i8 %12
}

; Function Attrs: noinline nounwind optnone
define hidden zeroext i8 @counterProcess(i8 zeroext %0, i8 zeroext %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i8 %0, i8* %3, align 1
  store i8 %1, i8* %4, align 1
  %9 = load i8, i8* %4, align 1
  store i8 %9, i8* %5, align 1
  store i32 7, i32* %8, align 4
  br label %10

10:                                               ; preds = %73, %2
  %11 = load i32, i32* %8, align 4
  %12 = icmp sge i32 %11, 0
  br i1 %12, label %13, label %76

13:                                               ; preds = %10
  %14 = load i32, i32* %8, align 4
  store i32 %14, i32* %6, align 4
  %15 = load i8, i8* %3, align 1
  %16 = load i32, i32* %6, align 4
  %17 = call zeroext i8 @getBit(i8 zeroext %15, i32 %16)
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %20, label %31

20:                                               ; preds = %13
  %21 = load i32, i32* %6, align 4
  %22 = icmp slt i32 %21, 7
  br i1 %22, label %23, label %26

23:                                               ; preds = %20
  %24 = load i32, i32* %6, align 4
  %25 = add nsw i32 %24, 1
  br label %29

26:                                               ; preds = %20
  %27 = load i32, i32* %6, align 4
  %28 = sub nsw i32 %27, 7
  br label %29

29:                                               ; preds = %26, %23
  %30 = phi i32 [ %25, %23 ], [ %28, %26 ]
  store i32 %30, i32* %7, align 4
  br label %49

31:                                               ; preds = %13
  %32 = load i8, i8* %3, align 1
  %33 = load i32, i32* %6, align 4
  %34 = call zeroext i8 @getBit(i8 zeroext %32, i32 %33)
  %35 = zext i8 %34 to i32
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %48

37:                                               ; preds = %31
  %38 = load i32, i32* %6, align 4
  %39 = icmp slt i32 %38, 6
  br i1 %39, label %40, label %43

40:                                               ; preds = %37
  %41 = load i32, i32* %6, align 4
  %42 = add nsw i32 %41, 2
  br label %46

43:                                               ; preds = %37
  %44 = load i32, i32* %6, align 4
  %45 = sub nsw i32 %44, 6
  br label %46

46:                                               ; preds = %43, %40
  %47 = phi i32 [ %42, %40 ], [ %45, %43 ]
  store i32 %47, i32* %7, align 4
  br label %48

48:                                               ; preds = %46, %31
  br label %49

49:                                               ; preds = %48, %29
  %50 = load i8, i8* %5, align 1
  %51 = load i32, i32* %6, align 4
  %52 = call zeroext i8 @getBit(i8 zeroext %50, i32 %51)
  %53 = zext i8 %52 to i32
  %54 = load i8, i8* %5, align 1
  %55 = load i32, i32* %7, align 4
  %56 = call zeroext i8 @getBit(i8 zeroext %54, i32 %55)
  %57 = zext i8 %56 to i32
  %58 = xor i32 %53, %57
  %59 = icmp eq i32 %58, 1
  br i1 %59, label %60, label %65

60:                                               ; preds = %49
  %61 = load i8, i8* %5, align 1
  %62 = load i32, i32* %8, align 4
  %63 = call zeroext i8 @setBit(i8 zeroext %61, i32 %62)
  %64 = zext i8 %63 to i32
  br label %70

65:                                               ; preds = %49
  %66 = load i8, i8* %5, align 1
  %67 = load i32, i32* %8, align 4
  %68 = call zeroext i8 @clearBit(i8 zeroext %66, i32 %67)
  %69 = zext i8 %68 to i32
  br label %70

70:                                               ; preds = %65, %60
  %71 = phi i32 [ %64, %60 ], [ %69, %65 ]
  %72 = trunc i32 %71 to i8
  store i8 %72, i8* %5, align 1
  br label %73

73:                                               ; preds = %70
  %74 = load i32, i32* %8, align 4
  %75 = add nsw i32 %74, -1
  store i32 %75, i32* %8, align 4
  br label %10

76:                                               ; preds = %10
  %77 = load i8, i8* %5, align 1
  ret i8 %77
}

; Function Attrs: noinline nounwind optnone
define hidden zeroext i8 @sourceByteProcess(i8 zeroext %0, i8 zeroext %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8 %0, i8* %3, align 1
  store i8 %1, i8* %4, align 1
  %10 = load i8, i8* %3, align 1
  store i8 %10, i8* %5, align 1
  %11 = load i8, i8* %4, align 1
  %12 = zext i8 %11 to i32
  %13 = srem i32 %12, 9
  store i32 %13, i32* %6, align 4
  %14 = load i32, i32* %6, align 4
  %15 = icmp slt i32 %14, 3
  br i1 %15, label %16, label %53

16:                                               ; preds = %2
  store i32 0, i32* %7, align 4
  br label %17

17:                                               ; preds = %49, %16
  %18 = load i32, i32* %7, align 4
  %19 = icmp slt i32 %18, 8
  br i1 %19, label %20, label %52

20:                                               ; preds = %17
  %21 = load i32, i32* %7, align 4
  %22 = srem i32 %21, 2
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %48

24:                                               ; preds = %20
  %25 = load i8, i8* %4, align 1
  %26 = load i32, i32* %7, align 4
  %27 = call zeroext i8 @getBit(i8 zeroext %25, i32 %26)
  %28 = zext i8 %27 to i32
  %29 = load i8, i8* %5, align 1
  %30 = load i32, i32* %7, align 4
  %31 = call zeroext i8 @getBit(i8 zeroext %29, i32 %30)
  %32 = zext i8 %31 to i32
  %33 = xor i32 %28, %32
  %34 = icmp eq i32 %33, 1
  br i1 %34, label %35, label %40

35:                                               ; preds = %24
  %36 = load i8, i8* %5, align 1
  %37 = load i32, i32* %7, align 4
  %38 = call zeroext i8 @setBit(i8 zeroext %36, i32 %37)
  %39 = zext i8 %38 to i32
  br label %45

40:                                               ; preds = %24
  %41 = load i8, i8* %5, align 1
  %42 = load i32, i32* %7, align 4
  %43 = call zeroext i8 @clearBit(i8 zeroext %41, i32 %42)
  %44 = zext i8 %43 to i32
  br label %45

45:                                               ; preds = %40, %35
  %46 = phi i32 [ %39, %35 ], [ %44, %40 ]
  %47 = trunc i32 %46 to i8
  store i8 %47, i8* %5, align 1
  br label %48

48:                                               ; preds = %45, %20
  br label %49

49:                                               ; preds = %48
  %50 = load i32, i32* %7, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %7, align 4
  br label %17

52:                                               ; preds = %17
  br label %53

53:                                               ; preds = %52, %2
  %54 = load i32, i32* %6, align 4
  %55 = icmp sge i32 %54, 3
  br i1 %55, label %56, label %97

56:                                               ; preds = %53
  %57 = load i32, i32* %6, align 4
  %58 = icmp sle i32 %57, 5
  br i1 %58, label %59, label %97

59:                                               ; preds = %56
  store i32 1, i32* %8, align 4
  br label %60

60:                                               ; preds = %93, %59
  %61 = load i32, i32* %8, align 4
  %62 = icmp slt i32 %61, 8
  br i1 %62, label %63, label %96

63:                                               ; preds = %60
  %64 = load i32, i32* %8, align 4
  %65 = add nsw i32 %64, 1
  %66 = srem i32 %65, 2
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %92

68:                                               ; preds = %63
  %69 = load i8, i8* %4, align 1
  %70 = load i32, i32* %8, align 4
  %71 = call zeroext i8 @getBit(i8 zeroext %69, i32 %70)
  %72 = zext i8 %71 to i32
  %73 = load i8, i8* %5, align 1
  %74 = load i32, i32* %8, align 4
  %75 = call zeroext i8 @getBit(i8 zeroext %73, i32 %74)
  %76 = zext i8 %75 to i32
  %77 = xor i32 %72, %76
  %78 = icmp eq i32 %77, 1
  br i1 %78, label %79, label %84

79:                                               ; preds = %68
  %80 = load i8, i8* %5, align 1
  %81 = load i32, i32* %8, align 4
  %82 = call zeroext i8 @setBit(i8 zeroext %80, i32 %81)
  %83 = zext i8 %82 to i32
  br label %89

84:                                               ; preds = %68
  %85 = load i8, i8* %5, align 1
  %86 = load i32, i32* %8, align 4
  %87 = call zeroext i8 @clearBit(i8 zeroext %85, i32 %86)
  %88 = zext i8 %87 to i32
  br label %89

89:                                               ; preds = %84, %79
  %90 = phi i32 [ %83, %79 ], [ %88, %84 ]
  %91 = trunc i32 %90 to i8
  store i8 %91, i8* %5, align 1
  br label %92

92:                                               ; preds = %89, %63
  br label %93

93:                                               ; preds = %92
  %94 = load i32, i32* %8, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %8, align 4
  br label %60

96:                                               ; preds = %60
  br label %97

97:                                               ; preds = %96, %56, %53
  %98 = load i32, i32* %6, align 4
  %99 = icmp sgt i32 %98, 5
  br i1 %99, label %100, label %132

100:                                              ; preds = %97
  store i32 0, i32* %9, align 4
  br label %101

101:                                              ; preds = %128, %100
  %102 = load i32, i32* %9, align 4
  %103 = icmp slt i32 %102, 8
  br i1 %103, label %104, label %131

104:                                              ; preds = %101
  %105 = load i8, i8* %4, align 1
  %106 = load i32, i32* %9, align 4
  %107 = call zeroext i8 @getBit(i8 zeroext %105, i32 %106)
  %108 = zext i8 %107 to i32
  %109 = load i8, i8* %5, align 1
  %110 = load i32, i32* %9, align 4
  %111 = call zeroext i8 @getBit(i8 zeroext %109, i32 %110)
  %112 = zext i8 %111 to i32
  %113 = xor i32 %108, %112
  %114 = icmp eq i32 %113, 1
  br i1 %114, label %115, label %120

115:                                              ; preds = %104
  %116 = load i8, i8* %5, align 1
  %117 = load i32, i32* %9, align 4
  %118 = call zeroext i8 @setBit(i8 zeroext %116, i32 %117)
  %119 = zext i8 %118 to i32
  br label %125

120:                                              ; preds = %104
  %121 = load i8, i8* %5, align 1
  %122 = load i32, i32* %9, align 4
  %123 = call zeroext i8 @clearBit(i8 zeroext %121, i32 %122)
  %124 = zext i8 %123 to i32
  br label %125

125:                                              ; preds = %120, %115
  %126 = phi i32 [ %119, %115 ], [ %124, %120 ]
  %127 = trunc i32 %126 to i8
  store i8 %127, i8* %5, align 1
  br label %128

128:                                              ; preds = %125
  %129 = load i32, i32* %9, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %9, align 4
  br label %101

131:                                              ; preds = %101
  br label %132

132:                                              ; preds = %131, %97
  %133 = load i8, i8* %5, align 1
  ret i8 %133
}

; Function Attrs: noinline nounwind optnone
define hidden void @encrypt(i8 zeroext %0, i8 zeroext %1, i8* %2) #0 {
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8*, align 4
  %7 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  store i8 %1, i8* %5, align 1
  store i8* %2, i8** %6, align 4
  store i32 0, i32* %7, align 4
  br label %8

8:                                                ; preds = %32, %3
  %9 = load i8*, i8** %6, align 4
  %10 = load i32, i32* %7, align 4
  %11 = getelementptr inbounds i8, i8* %9, i32 %10
  %12 = load i8, i8* %11, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %35

15:                                               ; preds = %8
  %16 = load i8, i8* %4, align 1
  %17 = load i8, i8* %5, align 1
  %18 = call zeroext i8 @counterProcess(i8 zeroext %16, i8 zeroext %17)
  store i8 %18, i8* %5, align 1
  %19 = load i8, i8* %5, align 1
  %20 = add i8 %19, 1
  store i8 %20, i8* %5, align 1
  %21 = load i8, i8* %4, align 1
  %22 = add i8 %21, 1
  store i8 %22, i8* %4, align 1
  %23 = load i8*, i8** %6, align 4
  %24 = load i32, i32* %7, align 4
  %25 = getelementptr inbounds i8, i8* %23, i32 %24
  %26 = load i8, i8* %25, align 1
  %27 = load i8, i8* %5, align 1
  %28 = call zeroext i8 @sourceByteProcess(i8 zeroext %26, i8 zeroext %27)
  %29 = load i8*, i8** %6, align 4
  %30 = load i32, i32* %7, align 4
  %31 = getelementptr inbounds i8, i8* %29, i32 %30
  store i8 %28, i8* %31, align 1
  br label %32

32:                                               ; preds = %15
  %33 = load i32, i32* %7, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %7, align 4
  br label %8

35:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone
define hidden void @decrypt(i8 zeroext %0, i8 zeroext %1, i32* %2) #0 {
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i32*, align 4
  %7 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  store i8 %1, i8* %5, align 1
  store i32* %2, i32** %6, align 4
  store i32 0, i32* %7, align 4
  br label %8

8:                                                ; preds = %38, %3
  %9 = load i32*, i32** %6, align 4
  %10 = load i32, i32* %7, align 4
  %11 = getelementptr inbounds i32, i32* %9, i32 %10
  %12 = load i32, i32* %11, align 4
  %13 = icmp ne i32 %12, -1
  br i1 %13, label %14, label %17

14:                                               ; preds = %8
  %15 = load i32, i32* %7, align 4
  %16 = icmp slt i32 %15, 256
  br label %17

17:                                               ; preds = %14, %8
  %18 = phi i1 [ false, %8 ], [ %16, %14 ]
  br i1 %18, label %19, label %41

19:                                               ; preds = %17
  %20 = load i8, i8* %4, align 1
  %21 = load i8, i8* %5, align 1
  %22 = call zeroext i8 @counterProcess(i8 zeroext %20, i8 zeroext %21)
  store i8 %22, i8* %5, align 1
  %23 = load i8, i8* %5, align 1
  %24 = add i8 %23, 1
  store i8 %24, i8* %5, align 1
  %25 = load i8, i8* %4, align 1
  %26 = add i8 %25, 1
  store i8 %26, i8* %4, align 1
  %27 = load i32*, i32** %6, align 4
  %28 = load i32, i32* %7, align 4
  %29 = getelementptr inbounds i32, i32* %27, i32 %28
  %30 = load i32, i32* %29, align 4
  %31 = trunc i32 %30 to i8
  %32 = load i8, i8* %5, align 1
  %33 = call zeroext i8 @sourceByteProcess(i8 zeroext %31, i8 zeroext %32)
  %34 = zext i8 %33 to i32
  %35 = load i32*, i32** %6, align 4
  %36 = load i32, i32* %7, align 4
  %37 = getelementptr inbounds i32, i32* %35, i32 %36
  store i32 %34, i32* %37, align 4
  br label %38

38:                                               ; preds = %19
  %39 = load i32, i32* %7, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %7, align 4
  br label %8

41:                                               ; preds = %17
  ret void
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
