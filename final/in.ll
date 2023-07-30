; ModuleID = 'in.c'
source_filename = "in.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%struct._opaque_pthread_t = type { i64, %struct.__darwin_pthread_handler_rec*, [8176 x i8] }
%struct.__darwin_pthread_handler_rec = type { void (i8*)*, i8*, %struct.__darwin_pthread_handler_rec* }
%struct._opaque_pthread_attr_t = type { i64, [56 x i8] }

@.str = private unnamed_addr constant [38 x i8] c"python3 write_in_flag.py %s > flag.bc\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"./flag.bc\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@cache = global i32 0, align 4
@TSX = global i32 0, align 4
@.str.4 = private unnamed_addr constant [7 x i8] c"\0A<N> {\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"\0A<Y> {\00", align 1
@mutex = global i32* null, align 8
@.str.6 = private unnamed_addr constant [12 x i8] c"} cache:%d\0A\00", align 1
@__func__.a = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@__func__.b = private unnamed_addr constant [2 x i8] c"b\00", align 1
@__func__.c = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"/semaphore\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @getflag(i8* noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca [256 x i8], align 1
  %5 = alloca %struct.__sFILE*, align 8
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  %7 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i64 0, i64 0
  %8 = load i8*, i8** %3, align 8
  %9 = call i32 (i8*, i32, i64, i8*, ...) @__sprintf_chk(i8* noundef %7, i32 noundef 0, i64 noundef 256, i8* noundef getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), i8* noundef %8)
  %10 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i64 0, i64 0
  %11 = call i32 @"\01_system"(i8* noundef %10)
  %12 = call %struct.__sFILE* @"\01_fopen"(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  store %struct.__sFILE* %12, %struct.__sFILE** %5, align 8
  %13 = load %struct.__sFILE*, %struct.__sFILE** %5, align 8
  %14 = icmp eq %struct.__sFILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %1
  store i32 1, i32* %2, align 4
  br label %20

16:                                               ; preds = %1
  store i32 0, i32* %6, align 4
  %17 = load %struct.__sFILE*, %struct.__sFILE** %5, align 8
  %18 = call i32 (%struct.__sFILE*, i8*, ...) @fscanf(%struct.__sFILE* noundef %17, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), i32* noundef %6)
  %19 = load i32, i32* %6, align 4
  store i32 %19, i32* %2, align 4
  br label %20

20:                                               ; preds = %16, %15
  %21 = load i32, i32* %2, align 4
  ret i32 %21
}

declare i32 @__sprintf_chk(i8* noundef, i32 noundef, i64 noundef, i8* noundef, ...) #1

declare i32 @"\01_system"(i8* noundef) #1

declare %struct.__sFILE* @"\01_fopen"(i8* noundef, i8* noundef) #1

declare i32 @fscanf(%struct.__sFILE* noundef, i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @before() #0 {
  %1 = load i32, i32* @TSX, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0))
  br label %8

5:                                                ; preds = %0
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0))
  %7 = call i32 @"\01_sem_wait"(i32* noundef bitcast (i32** @mutex to i32*))
  br label %8

8:                                                ; preds = %5, %3
  ret void
}

declare i32 @printf(i8* noundef, ...) #1

declare i32 @"\01_sem_wait"(i32* noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @after() #0 {
  %1 = load i32, i32* @TSX, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %6

3:                                                ; preds = %0
  %4 = load i32, i32* @cache, align 4
  %5 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i64 0, i64 0), i32 noundef %4)
  br label %11

6:                                                ; preds = %0
  %7 = call i32 @"\01_sleep"(i32 noundef 5)
  %8 = load i32, i32* @cache, align 4
  %9 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i64 0, i64 0), i32 noundef %8)
  %10 = call i32 @sem_post(i32* noundef bitcast (i32** @mutex to i32*))
  br label %11

11:                                               ; preds = %6, %3
  ret void
}

declare i32 @"\01_sleep"(i32 noundef) #1

declare i32 @sem_post(i32* noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @a(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %4 = call i32 @getflag(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @__func__.a, i64 0, i64 0))
  store i32 %4, i32* @TSX, align 4
  store i32 0, i32* %3, align 4
  br label %5

5:                                                ; preds = %12, %1
  %6 = load i32, i32* %3, align 4
  %7 = icmp slt i32 %6, 1
  br i1 %7, label %8, label %15

8:                                                ; preds = %5
  %9 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @__func__.a, i64 0, i64 0))
  %10 = load i8*, i8** %2, align 8
  %11 = ptrtoint i8* %10 to i32
  store i32 %11, i32* @cache, align 4
  br label %12

12:                                               ; preds = %8
  %13 = load i32, i32* %3, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %3, align 4
  br label %5, !llvm.loop !9

15:                                               ; preds = %5
  ret i8* null
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @b(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %4 = call i32 @getflag(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @__func__.b, i64 0, i64 0))
  store i32 %4, i32* @TSX, align 4
  store i32 0, i32* %3, align 4
  br label %5

5:                                                ; preds = %12, %1
  %6 = load i32, i32* %3, align 4
  %7 = icmp slt i32 %6, 1
  br i1 %7, label %8, label %15

8:                                                ; preds = %5
  %9 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @__func__.b, i64 0, i64 0))
  %10 = load i8*, i8** %2, align 8
  %11 = ptrtoint i8* %10 to i32
  store i32 %11, i32* @cache, align 4
  br label %12

12:                                               ; preds = %8
  %13 = load i32, i32* %3, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %3, align 4
  br label %5, !llvm.loop !11

15:                                               ; preds = %5
  ret i8* null
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @c(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %4 = call i32 @getflag(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @__func__.c, i64 0, i64 0))
  store i32 %4, i32* @TSX, align 4
  store i32 0, i32* %3, align 4
  br label %5

5:                                                ; preds = %10, %1
  %6 = load i32, i32* %3, align 4
  %7 = icmp slt i32 %6, 1
  br i1 %7, label %8, label %13

8:                                                ; preds = %5
  %9 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @__func__.c, i64 0, i64 0))
  br label %10

10:                                               ; preds = %8
  %11 = load i32, i32* %3, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %3, align 4
  br label %5, !llvm.loop !12

13:                                               ; preds = %5
  ret i8* null
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._opaque_pthread_t*, align 8
  %3 = alloca %struct._opaque_pthread_t*, align 8
  %4 = alloca %struct._opaque_pthread_t*, align 8
  %5 = alloca %struct._opaque_pthread_t*, align 8
  %6 = alloca %struct._opaque_pthread_t*, align 8
  %7 = alloca %struct._opaque_pthread_t*, align 8
  store i32 0, i32* %1, align 4
  %8 = call i32* (i8*, i32, ...) @sem_open(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i64 0, i64 0), i32 noundef 512, i32 noundef 420, i32 noundef 1)
  %9 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %2, align 8
  %10 = bitcast %struct._opaque_pthread_t* %9 to i8*
  %11 = call i32 @pthread_create(%struct._opaque_pthread_t** noundef %2, %struct._opaque_pthread_attr_t* noundef null, i8* (i8*)* noundef @a, i8* noundef %10)
  %12 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %2, align 8
  %13 = call i32 @"\01_pthread_join"(%struct._opaque_pthread_t* noundef %12, i8** noundef null)
  %14 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %3, align 8
  %15 = bitcast %struct._opaque_pthread_t* %14 to i8*
  %16 = call i32 @pthread_create(%struct._opaque_pthread_t** noundef %3, %struct._opaque_pthread_attr_t* noundef null, i8* (i8*)* noundef @c, i8* noundef %15)
  %17 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %3, align 8
  %18 = call i32 @"\01_pthread_join"(%struct._opaque_pthread_t* noundef %17, i8** noundef null)
  %19 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %4, align 8
  %20 = bitcast %struct._opaque_pthread_t* %19 to i8*
  %21 = call i32 @pthread_create(%struct._opaque_pthread_t** noundef %4, %struct._opaque_pthread_attr_t* noundef null, i8* (i8*)* noundef @b, i8* noundef %20)
  %22 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %4, align 8
  %23 = call i32 @"\01_pthread_join"(%struct._opaque_pthread_t* noundef %22, i8** noundef null)
  %24 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %5, align 8
  %25 = bitcast %struct._opaque_pthread_t* %24 to i8*
  %26 = call i32 @pthread_create(%struct._opaque_pthread_t** noundef %5, %struct._opaque_pthread_attr_t* noundef null, i8* (i8*)* noundef @b, i8* noundef %25)
  %27 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %5, align 8
  %28 = call i32 @"\01_pthread_join"(%struct._opaque_pthread_t* noundef %27, i8** noundef null)
  %29 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %6, align 8
  %30 = bitcast %struct._opaque_pthread_t* %29 to i8*
  %31 = call i32 @pthread_create(%struct._opaque_pthread_t** noundef %6, %struct._opaque_pthread_attr_t* noundef null, i8* (i8*)* noundef @c, i8* noundef %30)
  %32 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %6, align 8
  %33 = call i32 @"\01_pthread_join"(%struct._opaque_pthread_t* noundef %32, i8** noundef null)
  %34 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %7, align 8
  %35 = bitcast %struct._opaque_pthread_t* %34 to i8*
  %36 = call i32 @pthread_create(%struct._opaque_pthread_t** noundef %7, %struct._opaque_pthread_attr_t* noundef null, i8* (i8*)* noundef @a, i8* noundef %35)
  %37 = load %struct._opaque_pthread_t*, %struct._opaque_pthread_t** %7, align 8
  %38 = call i32 @"\01_pthread_join"(%struct._opaque_pthread_t* noundef %37, i8** noundef null)
  store i32 0, i32* @TSX, align 4
  %39 = call i32 @sem_close(i32* noundef bitcast (i32** @mutex to i32*))
  %40 = call i32 @sem_unlink(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i64 0, i64 0))
  ret i32 0
}

declare i32* @sem_open(i8* noundef, i32 noundef, ...) #1

declare i32 @pthread_create(%struct._opaque_pthread_t** noundef, %struct._opaque_pthread_attr_t* noundef, i8* (i8*)* noundef, i8* noundef) #1

declare i32 @"\01_pthread_join"(%struct._opaque_pthread_t* noundef, i8** noundef) #1

declare i32 @sem_close(i32* noundef) #1

declare i32 @sem_unlink(i8* noundef) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"branch-target-enforcement", i32 0}
!2 = !{i32 1, !"sign-return-address", i32 0}
!3 = !{i32 1, !"sign-return-address-all", i32 0}
!4 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 1}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
