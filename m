Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E2BC43458
	for <qemu-trivial@archiver.kernel.org>; Mon,  6 Jul 2026 08:50:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wgf22-0007V4-L1; Mon, 06 Jul 2026 04:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgf1q-0007P9-Bf
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2026 04:50:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgf1i-0005T0-1q
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2026 04:50:08 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66685B1Z4007065
 for <qemu-trivial@nongnu.org>; Mon, 6 Jul 2026 08:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yAJ/WAjBBhxnZrFkR8h9XF6NW8huKSmbSlUmWLT3HwE=; b=Nq3nCibUBPiKX0N5
 JOvPKou7H9zt1ggkgsVzQXc0XiHT/EeKAXEKDfBj3/8cft5XA1L8vMUjNrYZL6FR
 2HOLfdHEiYdO9o1tMAw55UV9umRC8COZ718V67CoJVmg3h7cRHbJGge2J2O7yC6T
 s0qtnAmClQMudQvgyq0s9rOdXXcdkkBJi24WSDzQU7xtyjd3Gln7ZAzLiPvrC+er
 WWzm2szzvnT93nVghP0opcSOEJqGhYS2OGW/nzFaKx15ii+xibKM5ziQe2rdOKqE
 iU6rXBQBLVTSJd9vAywbQ0s9LYD/jIaE/SGDTNtNw48EXcP69h7P5oQhOHVi7o+p
 kNHyEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs86hd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Mon, 06 Jul 2026 08:50:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e5e38fbc5so244325685a.2
 for <qemu-trivial@nongnu.org>; Mon, 06 Jul 2026 01:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783327804; x=1783932604; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yAJ/WAjBBhxnZrFkR8h9XF6NW8huKSmbSlUmWLT3HwE=;
 b=COQiJtnJVReEHiND70MybBIiiawInNLl86Qz351n/MMGmo2vtnAB9/1szMuk2CDzIZ
 C3BbjET/N/PHK9GMD8zcSiLcrZIo7YM7ySNE/ray4YwcXz1fhqEfSMlAugxsALIEyMaR
 z6ca8eOio6DVSqJuFKmQVY1iwnUS5HU0P74Lh/JqZhVN5I2xzR6OpIG0GOnR1s7bG0xA
 0FNjmZvfi8zNk0FoEa3pLOhSdPbQCFBMatJxwUIV77mZY6rVockPcEe2TAWX6W/jEzOT
 fsHy0zz8E8x8ewrz+nez5UQgOn0B0lVZbLlSdHNRI5vhdsrVG76WirsqeMHP25YEuaTN
 iC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783327804; x=1783932604;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yAJ/WAjBBhxnZrFkR8h9XF6NW8huKSmbSlUmWLT3HwE=;
 b=W1Tt9eddhk9NQ1G8lPooq97tKHUKBpOoe1++WuWa4nFYzE7SOwrEcWXVNt06rKcaxY
 MlTireavGxjWwq9rtrzmDrMLjhFTo2ehLoRT7m57IMvjORQqbzVj+2zJT0KKJ7BAqi7p
 bTTgSlaw8JlG1Zs/4VlHnWcV7PfxeP+ZYzjxsSj1EGpy4XdBsvVGoeu84HV4XWgn4mZT
 d/yXP/vQHfrM+avPaXvYoZMTq1mZ3q36hytKDKYPGbn35QglTRND3h3knS5/pK9LLJKo
 GLFIH5K/3NDqEP0HCznPBKp33dq24mcnUDuqvUFKMClOA4AY8J3lGtnFy3yjaxVsG2cD
 gT/Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrvHzaw4jfvAgaJ7PzuGG5xXXnTJxqqdjpEM2MZJTgl8rxBx2Aax++7YEO1MdJUaTc8vyUf9KW+JDOe49A=@nongnu.org
X-Gm-Message-State: AOJu0Ywq3aKSt5wcvY8IUUg7OEeGt13ufLVHQVRvgfrNI4cqPt5fdrue
 qn++g9YVvZijlXASx33+0Z3Yn1GVjRuSxUmZsgGUMuYZO7gmQkOtftT8YuY+SB0YwLnOYa18uSX
 QcWlQEmw5bI6f4LKcjpIfMtPhlhVWqPOdOO/FwgHT+//kxXzt3eJA2gxQ7/yN
X-Gm-Gg: AfdE7cmyR4yx+tMAWexXfaM8BDK2M/MVBttAWHZISL1cM4pL0yXAuSxu+jptjc+f4Gz
 5+hZuAxrS0Fv3N5DFigXTaegdmLKePd8fO7+1VPbIyurCjhMML6XTOcEyw5alx+FEsynjdGQ18S
 sfjfvTC+HnMspA0BJsDczoHjLMIgztAToOmuhyvFEs96OhEXXOXx/yi9bzpybCvVL6EvxooQkdS
 MObt8v6iB0ySoOpOtAMafgsFajsGdOvs++2Wa0WU3GbV2CkLaHR1cfwYvYUbBp7dAlR9RGylLB8
 VIbvmIIRT/YjPQi+k55mmDK2UQvcITGTeK4IriQUHK+bU4dR/VJrABAzVBcE5at1T7t5W28jygp
 3jTFYlikRcjRpe2oLT2jY/8At+1WR65gGi3hLy/cqcMLzpURuUdAHGnJ5ZhKxqg==
X-Received: by 2002:a05:620a:2946:b0:92e:6c15:24cd with SMTP id
 af79cd13be357-92e9a34ad8emr1317807285a.15.1783327801836; 
 Mon, 06 Jul 2026 01:50:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2946:b0:92e:6c15:24cd with SMTP id
 af79cd13be357-92e9a34ad8emr1317804985a.15.1783327801213; 
 Mon, 06 Jul 2026 01:50:01 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c12b62f54c8sm697370666b.55.2026.07.06.01.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 01:50:00 -0700 (PDT)
Message-ID: <d950f0c1-aad9-4fd2-9aaf-52edc8a1e2a7@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/sh4: add tests for sh4 fipr and ftrv
 instructions
Content-Language: en-US
To: Randy Schifflin <randy.schifflin@gmail.com>, qemu-devel@nongnu.org
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, qemu-trivial@nongnu.org
References: <20260629-fixup-sh4-tcg-fpu-instructions-b4-v1-0-4356b305f971@gmail.com>
 <20260629-fixup-sh4-tcg-fpu-instructions-b4-v1-1-4356b305f971@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629-fixup-sh4-tcg-fpu-instructions-b4-v1-1-4356b305f971@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rStFpmvwyDdymz_mK0Du5KZZ1PW1xx3B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX+tjNR28JV12T
 hYoXasUkoDH5ZekyEFH5JrtYKUxH4OQ6WMBH6P3N2sfZufM3vWR+C3vsrzcyCxOpepxw9Aw1b9G
 Ddb6yAzvS9s+O+0ytjxU3pBgPum/zXtbMkKjHgxiYgWsxWpPAw6aR+DKpodKbqFgcAO1aLpEE2E
 nwgz3ALCQLj8UJ8r+z/OqmIsIlTCI5rz9YWcDgCeY5ob0QBauVHn3xZ8riIxQlqvKhcOECehhgJ
 MRGWB+EcfZkJVZ6kYqWu+mwM9Nmn8KoQQxsqFChHQhuXsXUAR+z+cS51EI8MVlyo51NupZvaxCy
 9EFqbjHPLzJTOUGBJYyehmulxEtU0dcVuPgY0czbqPhkP0rIPfpKSeYjcjE+bEn3zBlWSuGnuGw
 DU8GVNVY5u2ZbRuVCFbKPpb8/zD1qLxjts7dXzB8hhgtaJ5rApe3CVhYsU73mXdyc3zVmeNPnaO
 H7o8iGsdpksQAH8Xbsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfXz2wF5t/XUjVJ
 PYArWaYnzMVIESbRw9l5qJcFhRL9A5Q7+NR9J3YiMsqP2unkDZ2FNotTPMjlvxph6xt6gphPNSN
 6hVzMkJYz0wC0eIfHPgEClSXPbw7Sxg=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b6c3c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=09hUy3Lx6XOzbbffWhEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rStFpmvwyDdymz_mK0Du5KZZ1PW1xx3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060088
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Hi,

On 29/6/26 23:49, Randy Schifflin wrote:
> Add tests for the TCG generation of the sh4-specific `fipr`
> and `ftrv` instructions.
> 
> Signed-off-by: Randy Schifflin <randy.schifflin@gmail.com>
> ---
>   tests/tcg/sh4/Makefile.target |  7 +++
>   tests/tcg/sh4/test-fpu-fipr.c | 64 ++++++++++++++++++++++++++++
>   tests/tcg/sh4/test-fpu-ftrv.c | 99 +++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 170 insertions(+)

Could you fix using the QEMU Coding Style (see docs/devel/style.rst)
and resubmit? Using ./scripts/checkpatch.pl triggers:

9/17 Checking commit 8a09e8d17f84 (target/sh4: add tests for sh4 fipr 
and ftrv instructions)
ERROR: open brace '{' following function declarations go on the next line
#32: FILE: tests/tcg/sh4/test-fpu-fipr.c:7:
+static void single_precision_mode(void) {

ERROR: do not use C99 // comments
#34: FILE: tests/tcg/sh4/test-fpu-fipr.c:9:
+    // Read FPSCR register

ERROR: do not use C99 // comments
#36: FILE: tests/tcg/sh4/test-fpu-fipr.c:11:
+    // Set precision mode to single-precision

ERROR: do not use C99 // comments
#38: FILE: tests/tcg/sh4/test-fpu-fipr.c:13:
+    // Write FPSCR register

ERROR: trailing whitespace
#39: FILE: tests/tcg/sh4/test-fpu-fipr.c:14:
+    asm volatile("lds %0, fpscr" : : "r" (fpscr)); $

ERROR: open brace '{' following function declarations go on the next line
#42: FILE: tests/tcg/sh4/test-fpu-fipr.c:17:
+static float fipr(const float v1[4], const float v2[4]) {

ERROR: do not use C99 // comments
#44: FILE: tests/tcg/sh4/test-fpu-fipr.c:19:
+    // Perform inner product of fv4 and fv8

ERROR: do not use C99 // comments
#45: FILE: tests/tcg/sh4/test-fpu-fipr.c:20:
+    // Result is stored in the last float register of the last vector 
argument

ERROR: code indent should never use tabs
#55: FILE: tests/tcg/sh4/test-fpu-fipr.c:30:
+        "fipr^Ifv4,fv8\n" // (fr4,fr5,fr6,fr7) dot (fr8,fr9,fr10,fr11)$

ERROR: do not use C99 // comments
#55: FILE: tests/tcg/sh4/test-fpu-fipr.c:30:
+        "fipr	fv4,fv8\n" // (fr4,fr5,fr6,fr7) dot (fr8,fr9,fr10,fr11)

ERROR: do not use C99 // comments
#56: FILE: tests/tcg/sh4/test-fpu-fipr.c:31:
+        "fmov fr11,%0\n"   // Result in fr11

ERROR: trailing whitespace
#57: FILE: tests/tcg/sh4/test-fpu-fipr.c:32:
+        : "=f" (fout) $

ERROR: line over 90 characters
#58: FILE: tests/tcg/sh4/test-fpu-fipr.c:33:
+        : "f" (v1[0]), "f" (v1[1]), "f" (v1[2]), "f" (v1[3]), "f" 
(v2[0]), "f" (v2[1]), "f" (v2[2]), "f" (v2[3]));

ERROR: line over 90 characters
#64: FILE: tests/tcg/sh4/test-fpu-fipr.c:39:
+    // The SH4 manual specifies `fipr` is only available when FPSCR 
register precision-mode (PR) bit is 0

ERROR: do not use C99 // comments
#64: FILE: tests/tcg/sh4/test-fpu-fipr.c:39:
+    // The SH4 manual specifies `fipr` is only available when FPSCR 
register precision-mode (PR) bit is 0

ERROR: open brace '{' following function declarations go on the next line
#101: FILE: tests/tcg/sh4/test-fpu-ftrv.c:6:
+static void single_precision_mode(void) {

ERROR: do not use C99 // comments
#103: FILE: tests/tcg/sh4/test-fpu-ftrv.c:8:
+    // Read FPSCR register

ERROR: do not use C99 // comments
#105: FILE: tests/tcg/sh4/test-fpu-ftrv.c:10:
+    // Set precision mode to single-precision

ERROR: do not use C99 // comments
#107: FILE: tests/tcg/sh4/test-fpu-ftrv.c:12:
+    // Write FPSCR register

ERROR: trailing whitespace
#108: FILE: tests/tcg/sh4/test-fpu-ftrv.c:13:
+    asm volatile("lds %0, fpscr" : : "r" (fpscr)); $

ERROR: do not use C99 // comments
#111: FILE: tests/tcg/sh4/test-fpu-ftrv.c:16:
+// Set XMTRX registers to a doubling scale matrix

ERROR: open brace '{' following function declarations go on the next line
#112: FILE: tests/tcg/sh4/test-fpu-ftrv.c:17:
+static void xmtrx_scale_2(void) {

ERROR: do not use C99 // comments
#114: FILE: tests/tcg/sh4/test-fpu-ftrv.c:19:
+        "fldi0 fr0\n" // Pair dr0 (fr0, fr1) = zero,zero

ERROR: do not use C99 // comments
#117: FILE: tests/tcg/sh4/test-fpu-ftrv.c:22:
+        "fadd fr2,fr2\n" // Pair dr2 (fr2,fr3) = two,zero

ERROR: do not use C99 // comments
#120: FILE: tests/tcg/sh4/test-fpu-ftrv.c:25:
+        "fmov fr2,fr5\n" // Pair dr4 (fr4, fr5) = zero,two

ERROR: do not use C99 // comments
#122: FILE: tests/tcg/sh4/test-fpu-ftrv.c:27:
+        // Enable pair-write

ERROR: trailing whitespace
#123: FILE: tests/tcg/sh4/test-fpu-ftrv.c:28:
+        "fschg\n" $

ERROR: do not use C99 // comments
#124: FILE: tests/tcg/sh4/test-fpu-ftrv.c:29:
+        // matrix[0][0] = 2.0

ERROR: do not use C99 // comments
#125: FILE: tests/tcg/sh4/test-fpu-ftrv.c:30:
+        // matrix[0][1] = 0.0

ERROR: trailing whitespace
#126: FILE: tests/tcg/sh4/test-fpu-ftrv.c:31:
+        "fmov dr2,xd0\n" $

ERROR: do not use C99 // comments
#127: FILE: tests/tcg/sh4/test-fpu-ftrv.c:32:
+        // matrix[0][2] = 0.0

ERROR: do not use C99 // comments
#128: FILE: tests/tcg/sh4/test-fpu-ftrv.c:33:
+        // matrix[0][3] = 0.0

ERROR: do not use C99 // comments
#130: FILE: tests/tcg/sh4/test-fpu-ftrv.c:35:
+        // matrix[1][0] = 0.0

ERROR: do not use C99 // comments
#131: FILE: tests/tcg/sh4/test-fpu-ftrv.c:36:
+        // matrix[1][1] = 2.0

ERROR: do not use C99 // comments
#133: FILE: tests/tcg/sh4/test-fpu-ftrv.c:38:
+        // matrix[1][2] = 0.0

ERROR: do not use C99 // comments
#134: FILE: tests/tcg/sh4/test-fpu-ftrv.c:39:
+        // matrix[1][3] = 0.0

ERROR: do not use C99 // comments
#136: FILE: tests/tcg/sh4/test-fpu-ftrv.c:41:
+        // matrix[2][0] = 0.0

ERROR: do not use C99 // comments
#137: FILE: tests/tcg/sh4/test-fpu-ftrv.c:42:
+        // matrix[2][1] = 0.0

ERROR: do not use C99 // comments
#139: FILE: tests/tcg/sh4/test-fpu-ftrv.c:44:
+        // matrix[2][2] = 2.0

ERROR: do not use C99 // comments
#140: FILE: tests/tcg/sh4/test-fpu-ftrv.c:45:
+        // matrix[2][3] = 0.0

ERROR: do not use C99 // comments
#142: FILE: tests/tcg/sh4/test-fpu-ftrv.c:47:
+        // matrix[3][0] = 0.0

ERROR: do not use C99 // comments
#143: FILE: tests/tcg/sh4/test-fpu-ftrv.c:48:
+        // matrix[3][1] = 0.0

ERROR: do not use C99 // comments
#145: FILE: tests/tcg/sh4/test-fpu-ftrv.c:50:
+        // matrix[3][2] = 0.0

ERROR: do not use C99 // comments
#146: FILE: tests/tcg/sh4/test-fpu-ftrv.c:51:
+        // matrix[3][3] = 2.0

ERROR: do not use C99 // comments
#148: FILE: tests/tcg/sh4/test-fpu-ftrv.c:53:
+        // Disable pair-write

ERROR: line over 90 characters
#155: FILE: tests/tcg/sh4/test-fpu-ftrv.c:60:
+// The SH4 manual specifies `ftrv` is only available when FPSCR 
register precision-mode (PR) bit is 0, aka single-precision

ERROR: do not use C99 // comments
#155: FILE: tests/tcg/sh4/test-fpu-ftrv.c:60:
+// The SH4 manual specifies `ftrv` is only available when FPSCR 
register precision-mode (PR) bit is 0, aka single-precision

ERROR: do not use C99 // comments
#156: FILE: tests/tcg/sh4/test-fpu-ftrv.c:61:
+// Transform vector vin by xmtrx; store result in vector vout

ERROR: open brace '{' following function declarations go on the next line
#157: FILE: tests/tcg/sh4/test-fpu-ftrv.c:62:
+static void ftrv(const float vin[4], float vout[4]) {

ERROR: trailing whitespace
#158: FILE: tests/tcg/sh4/test-fpu-ftrv.c:63:
+    asm volatile("fmov %4,fr0\n" $

ERROR: trailing whitespace
#159: FILE: tests/tcg/sh4/test-fpu-ftrv.c:64:
+                 "fmov %5,fr1\n" $

ERROR: trailing whitespace
#160: FILE: tests/tcg/sh4/test-fpu-ftrv.c:65:
+                 "fmov %6,fr2\n" $

ERROR: trailing whitespace
#161: FILE: tests/tcg/sh4/test-fpu-ftrv.c:66:
+                 "fmov %7,fr3\n" $

ERROR: trailing whitespace
#163: FILE: tests/tcg/sh4/test-fpu-ftrv.c:68:
+                 "fmov fr0,%0\n" $

ERROR: trailing whitespace
#164: FILE: tests/tcg/sh4/test-fpu-ftrv.c:69:
+                 "fmov fr1,%1\n" $

ERROR: trailing whitespace
#165: FILE: tests/tcg/sh4/test-fpu-ftrv.c:70:
+                 "fmov fr2,%2\n" $

ERROR: trailing whitespace
#166: FILE: tests/tcg/sh4/test-fpu-ftrv.c:71:
+                 "fmov fr3,%3" $

WARNING: line over 80 characters
#167: FILE: tests/tcg/sh4/test-fpu-ftrv.c:72:
+                 : "=f" (vout[0]), "=f" (vout[1]), "=f" (vout[2]), "=f" 
(vout[3])

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
   tests/tcg/sh4/test-fpu-fipr.c
   tests/tcg/sh4/test-fpu-ftrv.c
total: 57 errors, 2 warnings, 173 lines checked


