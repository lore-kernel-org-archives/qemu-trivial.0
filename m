Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcEHn-0008Q7-Un
	for mharc-qemu-trivial@gnu.org; Thu, 09 Oct 2014 10:01:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcEHc-0008BM-Ke
	for qemu-trivial@nongnu.org; Thu, 09 Oct 2014 10:01:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcEHT-0005R4-GZ
	for qemu-trivial@nongnu.org; Thu, 09 Oct 2014 10:01:32 -0400
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f]:64322)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XcEH9-0005OS-AV; Thu, 09 Oct 2014 10:01:03 -0400
Received: by mail-oi0-f47.google.com with SMTP id a141so3135413oig.6
	for <multiple recipients>; Thu, 09 Oct 2014 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=hC8m32Qz/yDBug9a7ZrtR8VsMV3JbYE+fhZXl419g5M=;
	b=yzntXRXnD3bxYgLNR0eEbe/YeRumQ2AYZPwAS7Uhr/KBGYj0it2fzGt0cr4aAE1GQE
	QmcBFgR58gvyTLClXToraXa5wcO41gKlToGBepMR9GeupzpYem5uj6neH5hZA6O+qlKW
	O1/mAXeDwIfA0H7m2EvUDAEciylb2bAxnoP6gi6hOZnEBIk0fKsyoaaIgic8yuRP81/X
	EWE3FbplzBlqG+SqYVQ9n1V74DMLIXulJO5YdoukU/pfuNiwOQs1/Bj5XlgKast8EBHA
	PArTTs+A/c0IiDsc6CbEXUWvJuTqK/Y1MU1m/yIB5GnEey16OvEfqZL8pcaxE8ZsH1Wo
	UrQg==
X-Received: by 10.202.215.214 with SMTP id o205mr149478oig.15.1412863260952;
	Thu, 09 Oct 2014 07:01:00 -0700 (PDT)
Received: from [192.168.1.103] ([223.72.65.126])
	by mx.google.com with ESMTPSA id l127sm375753oif.13.2014.10.09.07.00.57
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 09 Oct 2014 07:00:59 -0700 (PDT)
Message-ID: <54369514.5000004@gmail.com>
Date: Thu, 09 Oct 2014 22:00:52 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: peter.maydell@linaro.org, "rth@twiddle.net" <rth@twiddle.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c06::22f
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] disas/libvixl/a64/instructions-a64.h: Remove
 useless varialbe to avoid building break with '-Werror'
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
X-List-Received-Date: Thu, 09 Oct 2014 14:01:41 -0000

The related variables are useless, need be removed, or can not pass
microblaze building, after fix it, can build microblaze, successfully.

The related configuration:

 ./configure --target-list="arm-softmmu,microblazeel-softmmu" --enable-fdt --disable-kvm

The related compiling error:

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


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 disas/libvixl/a64/instructions-a64.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/disas/libvixl/a64/instructions-a64.h b/disas/libvixl/a64/instructions-a64.h
index d5b90c5..1eea851 100644
--- a/disas/libvixl/a64/instructions-a64.h
+++ b/disas/libvixl/a64/instructions-a64.h
@@ -95,30 +95,6 @@ const unsigned kDoubleExponentBits = 11;
 const unsigned kFloatMantissaBits = 23;
 const unsigned kFloatExponentBits = 8;
 
-const float kFP32PositiveInfinity = rawbits_to_float(0x7f800000);
-const float kFP32NegativeInfinity = rawbits_to_float(0xff800000);
-const double kFP64PositiveInfinity =
-    rawbits_to_double(UINT64_C(0x7ff0000000000000));
-const double kFP64NegativeInfinity =
-    rawbits_to_double(UINT64_C(0xfff0000000000000));
-
-// This value is a signalling NaN as both a double and as a float (taking the
-// least-significant word).
-static const double kFP64SignallingNaN =
-    rawbits_to_double(UINT64_C(0x7ff000007f800001));
-static const float kFP32SignallingNaN = rawbits_to_float(0x7f800001);
-
-// A similar value, but as a quiet NaN.
-static const double kFP64QuietNaN =
-    rawbits_to_double(UINT64_C(0x7ff800007fc00001));
-static const float kFP32QuietNaN = rawbits_to_float(0x7fc00001);
-
-// The default NaN values (for FPCR.DN=1).
-static const double kFP64DefaultNaN =
-    rawbits_to_double(UINT64_C(0x7ff8000000000000));
-static const float kFP32DefaultNaN = rawbits_to_float(0x7fc00000);
-
-
 enum LSDataSize {
   LSByte        = 0,
   LSHalfword    = 1,
-- 
1.9.3

