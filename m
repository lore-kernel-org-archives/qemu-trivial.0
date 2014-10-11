Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcxF4-0000ng-7r
	for mharc-qemu-trivial@gnu.org; Sat, 11 Oct 2014 10:01:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcxEu-0000n1-5R
	for qemu-trivial@nongnu.org; Sat, 11 Oct 2014 10:01:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcxEl-0002qp-3z
	for qemu-trivial@nongnu.org; Sat, 11 Oct 2014 10:01:44 -0400
Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235]:37553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XcxEk-0002qi-OK; Sat, 11 Oct 2014 10:01:35 -0400
Received: by mail-pd0-f181.google.com with SMTP id z10so3202526pdj.40
	for <multiple recipients>; Sat, 11 Oct 2014 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=CLmLpb/Eh+cL6Ygj6xBYP3rLoLfKt6LCwHymMwW/cs8=;
	b=XD/Ya+S4ZFxQ5dA4f+5S34wCPrCq+Rc6FOQOyuiqkL4QVzttM3uGSzWSWxduzk3M6Y
	WULxvx7J9cJ12qkZhXYSkHqCSklyEjeanQKkwgS8LMNVXyX31wY4JO3V5DNUWptEryQL
	FZ4MKOcrHj3MWUCUmLdCnwdYn8PbWC/pGcHrZxPq6dDISY0bphq96iFIjAv3ImxmdCqN
	kzEKyoncP2A+YHTJReaK77hQE94+1OpPVWco5v8ebVhkc11yfyoJ73/Qd4n0QfwWFzKY
	mpcqJPrXIFq/lRxfH9rePHwD9vaUE/Mr58OIRIpKcSJICIrz+F40ws/ONqOG/sUjcxYE
	exJA==
X-Received: by 10.70.125.225 with SMTP id mt1mr931056pdb.164.1413036092565;
	Sat, 11 Oct 2014 07:01:32 -0700 (PDT)
Received: from ShengShiZhuChengdeMacBook-Pro.local ([223.72.65.81])
	by mx.google.com with ESMTPSA id ad6sm6359598pac.30.2014.10.11.07.01.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Oct 2014 07:01:31 -0700 (PDT)
Message-ID: <5439399D.4020004@gmail.com>
Date: Sat, 11 Oct 2014 22:07:25 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: peter.maydell@linaro.org, rth@twiddle.net, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::235
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH v2] libvixl: a64: Skip "-Wunused-variable"
 for gcc 5.0.0 or higher
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Oct 2014 14:01:53 -0000

'instructions-a64.h' has unused variables for qemu which can be found by
gcc 5.0.0 or higher. and qemu needs "-Werror", and cause building break.
But they may be used by another projects (not qemu).

So for gcc 5.0.0 or higher, need still keep them, but ignore diagnostic
(still print warning, but not break building). The related warnings:

    CXX   disas/arm-a64.o
  In file included from /upstream/qemu/disas/libvixl/a64/disasm-a64.h:32:0,
                   from disas/arm-a64.cc:20:
  disas/libvixl/a64/instructions-a64.h:98:13: error: 'vixl::kFP32PositiveInfinity' defined but not used [-Werror=unused-variable]
   const float kFP32PositiveInfinity = rawbits_to_float(0x7f800000);
               ^
  disas/libvixl/a64/instructions-a64.h:99:13: error: 'vixl::kFP32NegativeInfinity' defined but not used [-Werror=unused-variable]
   const float kFP32NegativeInfinity = rawbits_to_float(0xff800000);
               ^
  disas/libvixl/a64/instructions-a64.h:100:14: error: 'vixl::kFP64PositiveInfinity' defined but not used [-Werror=unused-variable]
   const double kFP64PositiveInfinity =
                ^
  disas/libvixl/a64/instructions-a64.h:102:14: error: 'vixl::kFP64NegativeInfinity' defined but not used [-Werror=unused-variable]
   const double kFP64NegativeInfinity =
                ^
  disas/libvixl/a64/instructions-a64.h:107:21: error: 'vixl::kFP64SignallingNaN' defined but not used [-Werror=unused-variable]
   static const double kFP64SignallingNaN =
                       ^
  disas/libvixl/a64/instructions-a64.h:109:20: error: 'vixl::kFP32SignallingNaN' defined but not used [-Werror=unused-variable]
   static const float kFP32SignallingNaN = rawbits_to_float(0x7f800001);
                      ^
  disas/libvixl/a64/instructions-a64.h:112:21: error: 'vixl::kFP64QuietNaN' defined but not used [-Werror=unused-variable]
   static const double kFP64QuietNaN =
                       ^
  disas/libvixl/a64/instructions-a64.h:114:20: error: 'vixl::kFP32QuietNaN' defined but not used [-Werror=unused-variable]
   static const float kFP32QuietNaN = rawbits_to_float(0x7fc00001);
                      ^
  disas/libvixl/a64/instructions-a64.h:117:21: error: 'vixl::kFP64DefaultNaN' defined but not used [-Werror=unused-variable]
   static const double kFP64DefaultNaN =
                       ^
  disas/libvixl/a64/instructions-a64.h:119:20: error: 'vixl::kFP32DefaultNaN' defined but not used [-Werror=unused-variable]
   static const float kFP32DefaultNaN = rawbits_to_float(0x7fc00000);
                      ^
  cc1plus: all warnings being treated as errors
  make: *** [disas/arm-a64.o] Error 1

After this patch, can pass upstream gcc 5.0.0 building (print warning,
but not break building), and fedora 20 gcc 4.8.1 building (not find
warnings).

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 disas/libvixl/a64/instructions-a64.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/disas/libvixl/a64/instructions-a64.h b/disas/libvixl/a64/instructions-a64.h
index d5b90c5..5f707f3 100644
--- a/disas/libvixl/a64/instructions-a64.h
+++ b/disas/libvixl/a64/instructions-a64.h
@@ -95,6 +95,12 @@ const unsigned kDoubleExponentBits = 11;
 const unsigned kFloatMantissaBits = 23;
 const unsigned kFloatExponentBits = 8;
 
+/* For QEMU, gcc 5.0.0 or higher finds unused variables, so ignore diagnostic */
+#if __GNUC__ >= 5
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wunused-variable"
+#endif
+
 const float kFP32PositiveInfinity = rawbits_to_float(0x7f800000);
 const float kFP32NegativeInfinity = rawbits_to_float(0xff800000);
 const double kFP64PositiveInfinity =
@@ -118,6 +124,9 @@ static const double kFP64DefaultNaN =
     rawbits_to_double(UINT64_C(0x7ff8000000000000));
 static const float kFP32DefaultNaN = rawbits_to_float(0x7fc00000);
 
+#if __GNUC__ >= 5
+#pragma GCC diagnostic pop
+#endif
 
 enum LSDataSize {
   LSByte        = 0,
-- 
1.9.3

