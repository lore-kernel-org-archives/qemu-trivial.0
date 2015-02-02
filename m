Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIImG-0001et-9f
	for mharc-qemu-trivial@gnu.org; Mon, 02 Feb 2015 10:19:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.ostapenko@partner.samsung.com>) id 1YIImB-0001Yt-UN
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 10:19:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <m.ostapenko@partner.samsung.com>) id 1YIIm5-0000MH-MK
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 10:18:58 -0500
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.ostapenko@partner.samsung.com>)
	id 1YIIlt-0000IL-4n; Mon, 02 Feb 2015 10:18:41 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
	by mailout3.w1.samsung.com
	(Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit
	(built Nov
	17 2011)) with ESMTP id <0NJ5007FYHDT6A60@mailout3.w1.samsung.com>; Mon,
	02 Feb 2015 15:22:41 +0000 (GMT)
X-AuditID: cbfec7f4-b7f126d000001e9a-dc-54cf94bca958
Received: from eusync1.samsung.com ( [203.254.199.211])
	by eucpsbgm1.samsung.com (EUCPMTA) with SMTP id FD.AB.07834.CB49FC45;
	Mon, 02 Feb 2015 15:16:12 +0000 (GMT)
Received: from [106.109.130.26] by eusync1.samsung.com
	(Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit
	(built Aug
	10 2011)) with ESMTPA id <0NJ500HZ9H705220@eusync1.samsung.com>; Mon,
	02 Feb 2015 15:18:37 +0000 (GMT)
Message-id: <54CF8735.3080806@partner.samsung.com>
Date: Mon, 02 Feb 2015 18:18:29 +0400
From: Maxim Ostapenko <m.ostapenko@partner.samsung.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:24.0) Gecko/20100101
	Thunderbird/24.1.0
MIME-version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHLMWRmVeSWpSXmKPExsVy+t/xy7p7ppwPMTi1jcNizpkHLBbHe3ew
	WKw9M5fV4uSGS2wWJ7ftYLU49HkxkwObx+GvC1k87lzbw+bx5NpmJo++LasYA1iiuGxSUnMy
	y1KL9O0SuDKe3NrFUtDPVXFn+wPWBsaDHF2MnBwSAiYSh0/vY4ewxSQu3FvP1sXIxSEksJRR
	4tjRVnYI5xOjxNyNhxlBqngFjCS+TT/LDGKzCKhKvPo+hwXEZhMwl5ixehHYJFGBCImjq5+x
	QtQLSvyYfA+sRkRAR+LK9c1MIEOZBY4xSly+sBhskLBAusTcufvBmpkFrCVWTtrGCGHLS2xe
	85Z5AiPfLCSzZiEpm4WkbAEj8ypG0dTS5ILipPRcQ73ixNzi0rx0veT83E2MkDD9soNx8TGr
	Q4wCHIxKPLwPuM+FCLEmlhVX5h5ilOBgVhLh1bA4HyLEm5JYWZValB9fVJqTWnyIkYmDU6qB
	cZPTyob09gP79j7fX61ibb5qkkLmJ7kb2yccC4z8JRbSJHNX0fqTBUPOWv9HzpySVZ/e320Q
	/y3UE18yPX9G1ByF8uosi+npnLva+KwS816dU4s9kMFkc/XqfdMHlv+95PTLdXns5zyVPd5e
	1XcutcevQvnoX27N5fUlNxxMPdku21dMddmsxFKckWioxVxUnAgAqUQvwjECAAA=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 210.118.77.13
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Slava Garbuzov <v.garbuzov@samsung.com>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developers <qemu-devel@nongnu.org>, Yury Gribov <y.gribov@samsung.com>
Subject: [Qemu-trivial] [PATCH v2] Fix ABI incompatibility between
 Qemu-aarch64 and Linux Kernel in signal handling.
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
X-List-Received-Date: Mon, 02 Feb 2015 15:19:01 -0000

Thanks again,

I've updated the patch. Is this correct now?

-Maxim

 From 5b035df58f9f17e64b35311b6b5f55097c7f8ce1 Mon Sep 17 00:00:00 2001
From: Max Ostapenko <m.ostapenko@partner.samsung.com>
Date: Mon, 2 Feb 2015 12:03:20 +0400
Subject: [PATCH] linux-user: wrong TARGET_SI_PAD_SIZE value for some 
targets.

Fix TARGET_SI_PAD_SIZE calculation to match the way the kernel does it.
Use different TARGET_SI_PREAMBLE_SIZE for 32-bit and 64-bit targets.

Signed-off-by: Maxim Ostapenko <m.ostapenko@partner.samsung.com>
---
  linux-user/syscall_defs.h | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index ebb3be1..9ed6de8 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -655,7 +655,14 @@ typedef struct {
  #endif

  #define TARGET_SI_MAX_SIZE    128
-#define TARGET_SI_PAD_SIZE    ((TARGET_SI_MAX_SIZE/sizeof(int)) - 3)
+
+#if TARGET_ABI_BITS == 32
+#define TARGET_SI_PREAMBLE_SIZE (3 * sizeof(int))
+#else
+#define TARGET_SI_PREAMBLE_SIZE (4 * sizeof(int))
+#endif
+
+#define TARGET_SI_PAD_SIZE ((TARGET_SI_MAX_SIZE - 
TARGET_SI_PREAMBLE_SIZE) / sizeof(int))

  typedef struct target_siginfo {
  #ifdef TARGET_MIPS
-- 
1.8.5.2.2930.gf745acb

