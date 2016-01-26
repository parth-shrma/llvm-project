; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+sse2 | FileCheck %s --check-prefix=SSE --check-prefix=SSE2
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+sse4.1 | FileCheck %s --check-prefix=SSE --check-prefix=SSE41
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx | FileCheck %s --check-prefix=AVX --check-prefix=AVX1
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx2 | FileCheck %s --check-prefix=AVX --check-prefix=AVX2

define <2 x double> @merge_2f64_f64_23(double* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_2f64_f64_23:
; SSE:       # BB#0:
; SSE-NEXT:    movups 16(%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_2f64_f64_23:
; AVX:       # BB#0:
; AVX-NEXT:    vmovups 16(%rdi), %xmm0
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds double, double* %ptr, i64 2
  %ptr1 = getelementptr inbounds double, double* %ptr, i64 3
  %val0 = load double, double* %ptr0
  %val1 = load double, double* %ptr1
  %res0 = insertelement <2 x double> undef, double %val0, i32 0
  %res1 = insertelement <2 x double> %res0, double %val1, i32 1
  ret <2 x double> %res1
}

define <2 x i64> @merge_2i64_i64_12(i64* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_2i64_i64_12:
; SSE:       # BB#0:
; SSE-NEXT:    movups 8(%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_2i64_i64_12:
; AVX:       # BB#0:
; AVX-NEXT:    vmovups 8(%rdi), %xmm0
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds i64, i64* %ptr, i64 1
  %ptr1 = getelementptr inbounds i64, i64* %ptr, i64 2
  %val0 = load i64, i64* %ptr0
  %val1 = load i64, i64* %ptr1
  %res0 = insertelement <2 x i64> undef, i64 %val0, i32 0
  %res1 = insertelement <2 x i64> %res0, i64 %val1, i32 1
  ret <2 x i64> %res1
}

define <4 x float> @merge_4f32_f32_2345(float* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_4f32_f32_2345:
; SSE:       # BB#0:
; SSE-NEXT:    movups 8(%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_4f32_f32_2345:
; AVX:       # BB#0:
; AVX-NEXT:    vmovups 8(%rdi), %xmm0
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds float, float* %ptr, i64 2
  %ptr1 = getelementptr inbounds float, float* %ptr, i64 3
  %ptr2 = getelementptr inbounds float, float* %ptr, i64 4
  %ptr3 = getelementptr inbounds float, float* %ptr, i64 5
  %val0 = load float, float* %ptr0
  %val1 = load float, float* %ptr1
  %val2 = load float, float* %ptr2
  %val3 = load float, float* %ptr3
  %res0 = insertelement <4 x float> undef, float %val0, i32 0
  %res1 = insertelement <4 x float> %res0, float %val1, i32 1
  %res2 = insertelement <4 x float> %res1, float %val2, i32 2
  %res3 = insertelement <4 x float> %res2, float %val3, i32 3
  ret <4 x float> %res3
}

define <4 x float> @merge_4f32_f32_3zuu(float* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_4f32_f32_3zuu:
; SSE:       # BB#0:
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_4f32_f32_3zuu:
; AVX:       # BB#0:
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds float, float* %ptr, i64 3
  %val0 = load float, float* %ptr0
  %res0 = insertelement <4 x float> undef, float %val0, i32 0
  %res1 = insertelement <4 x float> %res0, float 0.0, i32 1
  ret <4 x float> %res1
}

define <4 x float> @merge_4f32_f32_34uu(float* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_4f32_f32_34uu:
; SSE:       # BB#0:
; SSE-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_4f32_f32_34uu:
; AVX:       # BB#0:
; AVX-NEXT:    vmovq {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds float, float* %ptr, i64 3
  %ptr1 = getelementptr inbounds float, float* %ptr, i64 4
  %val0 = load float, float* %ptr0
  %val1 = load float, float* %ptr1
  %res0 = insertelement <4 x float> undef, float %val0, i32 0
  %res1 = insertelement <4 x float> %res0, float %val1, i32 1
  ret <4 x float> %res1
}

define <4 x float> @merge_4f32_f32_34z6(float* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_4f32_f32_34z6:
; SSE:       # BB#0:
; SSE-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,1],xmm1[1,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_4f32_f32_34z6:
; AVX:       # BB#0:
; AVX-NEXT:    vmovq {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    vmovss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; AVX-NEXT:    vshufps {{.*#+}} xmm0 = xmm0[0,1],xmm1[1,0]
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds float, float* %ptr, i64 3
  %ptr1 = getelementptr inbounds float, float* %ptr, i64 4
  %ptr3 = getelementptr inbounds float, float* %ptr, i64 6
  %val0 = load float, float* %ptr0
  %val1 = load float, float* %ptr1
  %val3 = load float, float* %ptr3
  %res0 = insertelement <4 x float> zeroinitializer, float %val0, i32 0
  %res1 = insertelement <4 x float> %res0, float %val1, i32 1
  %res3 = insertelement <4 x float> %res1, float %val3, i32 3
  ret <4 x float> %res3
}

define <4 x float> @merge_4f32_f32_45zz(float* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_4f32_f32_45zz:
; SSE:       # BB#0:
; SSE-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_4f32_f32_45zz:
; AVX:       # BB#0:
; AVX-NEXT:    vmovq {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds float, float* %ptr, i64 4
  %ptr1 = getelementptr inbounds float, float* %ptr, i64 5
  %val0 = load float, float* %ptr0
  %val1 = load float, float* %ptr1
  %res0 = insertelement <4 x float> zeroinitializer, float %val0, i32 0
  %res1 = insertelement <4 x float> %res0, float %val1, i32 1
  ret <4 x float> %res1
}
define <4 x float> @merge_4f32_f32_012u(float* %ptr) nounwind uwtable noinline ssp {
; SSE2-LABEL: merge_4f32_f32_012u:
; SSE2:       # BB#0:
; SSE2-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; SSE2-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE2-NEXT:    movss {{.*#+}} xmm2 = mem[0],zero,zero,zero
; SSE2-NEXT:    unpcklps {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; SSE2-NEXT:    unpcklps {{.*#+}} xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
; SSE2-NEXT:    retq
;
; SSE41-LABEL: merge_4f32_f32_012u:
; SSE41:       # BB#0:
; SSE41-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; SSE41-NEXT:    insertps {{.*#+}} xmm0 = xmm0[0,1],mem[0],xmm0[3]
; SSE41-NEXT:    retq
;
; AVX-LABEL: merge_4f32_f32_012u:
; AVX:       # BB#0:
; AVX-NEXT:    vmovq {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = xmm0[0,1],mem[0],xmm0[3]
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds float, float* %ptr, i64 0
  %ptr1 = getelementptr inbounds float, float* %ptr, i64 1
  %ptr2 = getelementptr inbounds float, float* %ptr, i64 2
  %val0 = load float, float* %ptr0
  %val1 = load float, float* %ptr1
  %val2 = load float, float* %ptr2
  %res0 = insertelement <4 x float> undef, float %val0, i32 0
  %res1 = insertelement <4 x float> %res0, float %val1, i32 1
  %res2 = insertelement <4 x float> %res1, float %val2, i32 2
  %res3 = insertelement <4 x float> %res2, float undef, i32 3
  ret <4 x float> %res3
}

define <4 x float> @merge_4f32_f32_019u(float* %ptr) nounwind uwtable noinline ssp {
; SSE2-LABEL: merge_4f32_f32_019u:
; SSE2:       # BB#0:
; SSE2-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; SSE2-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE2-NEXT:    movss {{.*#+}} xmm2 = mem[0],zero,zero,zero
; SSE2-NEXT:    unpcklps {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; SSE2-NEXT:    unpcklps {{.*#+}} xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
; SSE2-NEXT:    retq
;
; SSE41-LABEL: merge_4f32_f32_019u:
; SSE41:       # BB#0:
; SSE41-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; SSE41-NEXT:    insertps {{.*#+}} xmm0 = xmm0[0,1],mem[0],xmm0[3]
; SSE41-NEXT:    retq
;
; AVX-LABEL: merge_4f32_f32_019u:
; AVX:       # BB#0:
; AVX-NEXT:    vmovq {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = xmm0[0,1],mem[0],xmm0[3]
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds float, float* %ptr, i64 0
  %ptr1 = getelementptr inbounds float, float* %ptr, i64 1
  %ptr2 = getelementptr inbounds float, float* %ptr, i64 9
  %val0 = load float, float* %ptr0
  %val1 = load float, float* %ptr1
  %val2 = load float, float* %ptr2
  %res0 = insertelement <4 x float> undef, float %val0, i32 0
  %res1 = insertelement <4 x float> %res0, float %val1, i32 1
  %res2 = insertelement <4 x float> %res1, float %val2, i32 2
  %res3 = insertelement <4 x float> %res2, float undef, i32 3
  ret <4 x float> %res3
}

define <4 x i32> @merge_4i32_i32_23u5(i32* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_4i32_i32_23u5:
; SSE:       # BB#0:
; SSE-NEXT:    movups 8(%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_4i32_i32_23u5:
; AVX:       # BB#0:
; AVX-NEXT:    vmovups 8(%rdi), %xmm0
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds i32, i32* %ptr, i64 2
  %ptr1 = getelementptr inbounds i32, i32* %ptr, i64 3
  %ptr3 = getelementptr inbounds i32, i32* %ptr, i64 5
  %val0 = load i32, i32* %ptr0
  %val1 = load i32, i32* %ptr1
  %val3 = load i32, i32* %ptr3
  %res0 = insertelement <4 x i32> undef, i32 %val0, i32 0
  %res1 = insertelement <4 x i32> %res0, i32 %val1, i32 1
  %res3 = insertelement <4 x i32> %res1, i32 %val3, i32 3
  ret <4 x i32> %res3
}

define <4 x i32> @merge_4i32_i32_3zuu(i32* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_4i32_i32_3zuu:
; SSE:       # BB#0:
; SSE-NEXT:    movd {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_4i32_i32_3zuu:
; AVX:       # BB#0:
; AVX-NEXT:    vmovd {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds i32, i32* %ptr, i64 3
  %val0 = load i32, i32* %ptr0
  %res0 = insertelement <4 x i32> undef, i32 %val0, i32 0
  %res1 = insertelement <4 x i32> %res0, i32     0, i32 1
  ret <4 x i32> %res1
}

define <4 x i32> @merge_4i32_i32_34uu(i32* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_4i32_i32_34uu:
; SSE:       # BB#0:
; SSE-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_4i32_i32_34uu:
; AVX:       # BB#0:
; AVX-NEXT:    vmovq {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds i32, i32* %ptr, i64 3
  %ptr1 = getelementptr inbounds i32, i32* %ptr, i64 4
  %val0 = load i32, i32* %ptr0
  %val1 = load i32, i32* %ptr1
  %res0 = insertelement <4 x i32> undef, i32 %val0, i32 0
  %res1 = insertelement <4 x i32> %res0, i32 %val1, i32 1
  ret <4 x i32> %res1
}

define <4 x i32> @merge_4i32_i32_45zz(i32* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_4i32_i32_45zz:
; SSE:       # BB#0:
; SSE-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_4i32_i32_45zz:
; AVX:       # BB#0:
; AVX-NEXT:    vmovq {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds i32, i32* %ptr, i64 4
  %ptr1 = getelementptr inbounds i32, i32* %ptr, i64 5
  %val0 = load i32, i32* %ptr0
  %val1 = load i32, i32* %ptr1
  %res0 = insertelement <4 x i32> zeroinitializer, i32 %val0, i32 0
  %res1 = insertelement <4 x i32> %res0, i32 %val1, i32 1
  ret <4 x i32> %res1
}

define <8 x i16> @merge_8i16_i16_23u567u9(i16* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_8i16_i16_23u567u9:
; SSE:       # BB#0:
; SSE-NEXT:    movups 4(%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_8i16_i16_23u567u9:
; AVX:       # BB#0:
; AVX-NEXT:    vmovups 4(%rdi), %xmm0
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds i16, i16* %ptr, i64 2
  %ptr1 = getelementptr inbounds i16, i16* %ptr, i64 3
  %ptr3 = getelementptr inbounds i16, i16* %ptr, i64 5
  %ptr4 = getelementptr inbounds i16, i16* %ptr, i64 6
  %ptr5 = getelementptr inbounds i16, i16* %ptr, i64 7
  %ptr7 = getelementptr inbounds i16, i16* %ptr, i64 9
  %val0 = load i16, i16* %ptr0
  %val1 = load i16, i16* %ptr1
  %val3 = load i16, i16* %ptr3
  %val4 = load i16, i16* %ptr4
  %val5 = load i16, i16* %ptr5
  %val7 = load i16, i16* %ptr7
  %res0 = insertelement <8 x i16> undef, i16 %val0, i32 0
  %res1 = insertelement <8 x i16> %res0, i16 %val1, i32 1
  %res3 = insertelement <8 x i16> %res1, i16 %val3, i32 3
  %res4 = insertelement <8 x i16> %res3, i16 %val4, i32 4
  %res5 = insertelement <8 x i16> %res4, i16 %val5, i32 5
  %res7 = insertelement <8 x i16> %res5, i16 %val7, i32 7
  ret <8 x i16> %res7
}

define <8 x i16> @merge_8i16_i16_34uuuuuu(i16* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_8i16_i16_34uuuuuu:
; SSE:       # BB#0:
; SSE-NEXT:    pinsrw $0, 6(%rdi), %xmm0
; SSE-NEXT:    pinsrw $1, 8(%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_8i16_i16_34uuuuuu:
; AVX:       # BB#0:
; AVX-NEXT:    vpinsrw $0, 6(%rdi), %xmm0, %xmm0
; AVX-NEXT:    vpinsrw $1, 8(%rdi), %xmm0, %xmm0
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds i16, i16* %ptr, i64 3
  %ptr1 = getelementptr inbounds i16, i16* %ptr, i64 4
  %val0 = load i16, i16* %ptr0
  %val1 = load i16, i16* %ptr1
  %res0 = insertelement <8 x i16> undef, i16 %val0, i32 0
  %res1 = insertelement <8 x i16> %res0, i16 %val1, i32 1
  ret <8 x i16> %res1
}

define <8 x i16> @merge_8i16_i16_45u7zzzz(i16* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_8i16_i16_45u7zzzz:
; SSE:       # BB#0:
; SSE-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_8i16_i16_45u7zzzz:
; AVX:       # BB#0:
; AVX-NEXT:    vmovq {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds i16, i16* %ptr, i64 4
  %ptr1 = getelementptr inbounds i16, i16* %ptr, i64 5
  %ptr3 = getelementptr inbounds i16, i16* %ptr, i64 7
  %val0 = load i16, i16* %ptr0
  %val1 = load i16, i16* %ptr1
  %val3 = load i16, i16* %ptr3
  %res0 = insertelement <8 x i16> undef, i16 %val0, i32 0
  %res1 = insertelement <8 x i16> %res0, i16 %val1, i32 1
  %res3 = insertelement <8 x i16> %res1, i16 %val3, i32 3
  %res4 = insertelement <8 x i16> %res3, i16     0, i32 4
  %res5 = insertelement <8 x i16> %res4, i16     0, i32 5
  %res6 = insertelement <8 x i16> %res5, i16     0, i32 6
  %res7 = insertelement <8 x i16> %res6, i16     0, i32 7
  ret <8 x i16> %res7
}

define <16 x i8> @merge_16i8_i8_01u3456789ABCDuF(i8* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_16i8_i8_01u3456789ABCDuF:
; SSE:       # BB#0:
; SSE-NEXT:    movups (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_16i8_i8_01u3456789ABCDuF:
; AVX:       # BB#0:
; AVX-NEXT:    vmovups (%rdi), %xmm0
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds i8, i8* %ptr, i64 0
  %ptr1 = getelementptr inbounds i8, i8* %ptr, i64 1
  %ptr3 = getelementptr inbounds i8, i8* %ptr, i64 3
  %ptr4 = getelementptr inbounds i8, i8* %ptr, i64 4
  %ptr5 = getelementptr inbounds i8, i8* %ptr, i64 5
  %ptr6 = getelementptr inbounds i8, i8* %ptr, i64 6
  %ptr7 = getelementptr inbounds i8, i8* %ptr, i64 7
  %ptr8 = getelementptr inbounds i8, i8* %ptr, i64 8
  %ptr9 = getelementptr inbounds i8, i8* %ptr, i64 9
  %ptrA = getelementptr inbounds i8, i8* %ptr, i64 10
  %ptrB = getelementptr inbounds i8, i8* %ptr, i64 11
  %ptrC = getelementptr inbounds i8, i8* %ptr, i64 12
  %ptrD = getelementptr inbounds i8, i8* %ptr, i64 13
  %ptrF = getelementptr inbounds i8, i8* %ptr, i64 15
  %val0 = load i8, i8* %ptr0
  %val1 = load i8, i8* %ptr1
  %val3 = load i8, i8* %ptr3
  %val4 = load i8, i8* %ptr4
  %val5 = load i8, i8* %ptr5
  %val6 = load i8, i8* %ptr6
  %val7 = load i8, i8* %ptr7
  %val8 = load i8, i8* %ptr8
  %val9 = load i8, i8* %ptr9
  %valA = load i8, i8* %ptrA
  %valB = load i8, i8* %ptrB
  %valC = load i8, i8* %ptrC
  %valD = load i8, i8* %ptrD
  %valF = load i8, i8* %ptrF
  %res0 = insertelement <16 x i8> undef, i8 %val0, i32 0
  %res1 = insertelement <16 x i8> %res0, i8 %val1, i32 1
  %res3 = insertelement <16 x i8> %res1, i8 %val3, i32 3
  %res4 = insertelement <16 x i8> %res3, i8 %val4, i32 4
  %res5 = insertelement <16 x i8> %res4, i8 %val5, i32 5
  %res6 = insertelement <16 x i8> %res5, i8 %val6, i32 6
  %res7 = insertelement <16 x i8> %res6, i8 %val7, i32 7
  %res8 = insertelement <16 x i8> %res7, i8 %val8, i32 8
  %res9 = insertelement <16 x i8> %res8, i8 %val9, i32 9
  %resA = insertelement <16 x i8> %res9, i8 %valA, i32 10
  %resB = insertelement <16 x i8> %resA, i8 %valB, i32 11
  %resC = insertelement <16 x i8> %resB, i8 %valC, i32 12
  %resD = insertelement <16 x i8> %resC, i8 %valD, i32 13
  %resF = insertelement <16 x i8> %resD, i8 %valF, i32 15
  ret <16 x i8> %resF
}

define <16 x i8> @merge_16i8_i8_01u3uuzzuuuuuzzz(i8* %ptr) nounwind uwtable noinline ssp {
; SSE2-LABEL: merge_16i8_i8_01u3uuzzuuuuuzzz:
; SSE2:       # BB#0:
; SSE2-NEXT:    movzbl (%rdi), %eax
; SSE2-NEXT:    movzbl 1(%rdi), %ecx
; SSE2-NEXT:    shll $8, %ecx
; SSE2-NEXT:    orl %eax, %ecx
; SSE2-NEXT:    pxor %xmm0, %xmm0
; SSE2-NEXT:    pinsrw $0, %ecx, %xmm0
; SSE2-NEXT:    movzbl 3(%rdi), %eax
; SSE2-NEXT:    shll $8, %eax
; SSE2-NEXT:    pinsrw $1, %eax, %xmm0
; SSE2-NEXT:    retq
;
; SSE41-LABEL: merge_16i8_i8_01u3uuzzuuuuuzzz:
; SSE41:       # BB#0:
; SSE41-NEXT:    pxor %xmm0, %xmm0
; SSE41-NEXT:    pinsrb $0, (%rdi), %xmm0
; SSE41-NEXT:    pinsrb $1, 1(%rdi), %xmm0
; SSE41-NEXT:    pinsrb $3, 3(%rdi), %xmm0
; SSE41-NEXT:    retq
;
; AVX-LABEL: merge_16i8_i8_01u3uuzzuuuuuzzz:
; AVX:       # BB#0:
; AVX-NEXT:    vpxor %xmm0, %xmm0, %xmm0
; AVX-NEXT:    vpinsrb $0, (%rdi), %xmm0, %xmm0
; AVX-NEXT:    vpinsrb $1, 1(%rdi), %xmm0, %xmm0
; AVX-NEXT:    vpinsrb $3, 3(%rdi), %xmm0, %xmm0
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds i8, i8* %ptr, i64 0
  %ptr1 = getelementptr inbounds i8, i8* %ptr, i64 1
  %ptr3 = getelementptr inbounds i8, i8* %ptr, i64 3
  %val0 = load i8, i8* %ptr0
  %val1 = load i8, i8* %ptr1
  %val3 = load i8, i8* %ptr3
  %res0 = insertelement <16 x i8> undef, i8 %val0, i32 0
  %res1 = insertelement <16 x i8> %res0, i8 %val1, i32 1
  %res3 = insertelement <16 x i8> %res1, i8 %val3, i32 3
  %res6 = insertelement <16 x i8> %res3, i8     0, i32 6
  %res7 = insertelement <16 x i8> %res6, i8     0, i32 7
  %resD = insertelement <16 x i8> %res7, i8     0, i32 13
  %resE = insertelement <16 x i8> %resD, i8     0, i32 14
  %resF = insertelement <16 x i8> %resE, i8     0, i32 15
  ret <16 x i8> %resF
}

define <16 x i8> @merge_16i8_i8_0123uu67uuuuuzzz(i8* %ptr) nounwind uwtable noinline ssp {
; SSE-LABEL: merge_16i8_i8_0123uu67uuuuuzzz:
; SSE:       # BB#0:
; SSE-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: merge_16i8_i8_0123uu67uuuuuzzz:
; AVX:       # BB#0:
; AVX-NEXT:    vmovq {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    retq
  %ptr0 = getelementptr inbounds i8, i8* %ptr, i64 0
  %ptr1 = getelementptr inbounds i8, i8* %ptr, i64 1
  %ptr2 = getelementptr inbounds i8, i8* %ptr, i64 2
  %ptr3 = getelementptr inbounds i8, i8* %ptr, i64 3
  %ptr6 = getelementptr inbounds i8, i8* %ptr, i64 6
  %ptr7 = getelementptr inbounds i8, i8* %ptr, i64 7
  %val0 = load i8, i8* %ptr0
  %val1 = load i8, i8* %ptr1
  %val2 = load i8, i8* %ptr2
  %val3 = load i8, i8* %ptr3
  %val6 = load i8, i8* %ptr6
  %val7 = load i8, i8* %ptr7
  %res0 = insertelement <16 x i8> undef, i8 %val0, i32 0
  %res1 = insertelement <16 x i8> %res0, i8 %val1, i32 1
  %res2 = insertelement <16 x i8> %res1, i8 %val2, i32 2
  %res3 = insertelement <16 x i8> %res2, i8 %val3, i32 3
  %res6 = insertelement <16 x i8> %res3, i8 %val6, i32 6
  %res7 = insertelement <16 x i8> %res6, i8 %val7, i32 7
  %resD = insertelement <16 x i8> %res7, i8     0, i32 13
  %resE = insertelement <16 x i8> %resD, i8     0, i32 14
  %resF = insertelement <16 x i8> %resE, i8     0, i32 15
  ret <16 x i8> %resF
}
