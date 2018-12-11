Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPR-00007p-RY
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPG-0008FP-Fg
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPD-0007ZP-Pb
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:18 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:40837)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmOx-0007Gz-D3; Tue, 11 Dec 2018 13:05:01 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MKMIR-1gkAwF3kdz-00Ll3a; Tue, 11 Dec 2018 19:04:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:36 +0100
Message-Id: <20181211180352.19644-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UNYSJX3WSFYRBpgLGOao3Q2FO9BDpV/T0teZnijP7Zw+QRYuJGw
	rjWt/vVHRTmI87pYuGne88Wyl9/3NUFP+3MO4+a4xIQFrwXeeJxWf5hgWh2qI+6ilygwwRt
	o6t08XPQ5Q5qhyfnyMwNVcybxuIRndDi+Z/AihnId5y6a6GAwKu+JJXLJADkcepPZc+CVH7
	cSkGT/3OePaKLsm9KPpmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dg58uJ2SIJw=:1NenE5IFm+/V01JX6v7u0g
	GkjMJ/mdRzVydCmMYwRUXGd8sh8Kkp0UFLKVE18ptuEpCm3r9YtQoQGqpxEKygtRTARFual7c
	EPvkSlAAF6zxk4UGmbtaI/55k2yVf5x38V0ZEvZmcFupLEZr3jDKt8qydV60Yb8Gj1QRkc4re
	z44KPrpiXJAbDPByYwPt6MywMDKmXmLwgf4rEgM8U9rYi1mYiMrHYw76E1koaCWYLDZymWG3o
	2HEHxjT1vplK4VYpBANfeegg8X6fyRbWo+LArLEDEcJuqFlb3//qWyZODr5HxsI+/tpl0vEB7
	bwDs9Rt3UDB+wfklVBsBd5qPmPeF0BSSmScNH+FPxI7ioeZyyDBqOUjqHOjt6PPE6XbGrDsQX
	FKTQrbtoe6lmZavT4g3wxLBKIAMuNKPFLEJ0IEyK0tmgAuYa4QJvX9bHzeR83dLGGqrhe17gY
	nz6nU1vbPHsjCf3Z55T0mffmek4xIlUNZ9EbUzLmW/nI9vaW7AA9Us0R6GCtLzsd3yf7BzEJe
	UubQce+OeYDFBwjU62PNqmz+DaEBJhp2SaPs+T/sSxM8pspC+2PJ15Z8uWe3mnZXm4MbURY9B
	QxR4EBWnQKyhKwY3zQ7tWvOHoPPpmRKDtvhgUJeLQilVjYusxyOlyO9SkCo5MXz0PFjGq6P9z
	64/+WMaYW+pgoqci/kh3vvbZTl7el8nlTXBz2zqtpcPZipsoNeXLSgEjDto6Ty0ynTffqniY8
	ZYpJSx99oGqG1Ssz0L6guEuIIfARL/leM8qBy2+9ZThOlj42Wtr1O3CVQFg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL 14/30] MAINTAINERS: Add a missing entry for
 the Xilinx S3A-DSP 1800 machine
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2018 18:05:20 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181125205000.10324-7-philmd@redhat.com>
[lv: added the missing 'F:' field]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c20fed4d4..4b66aca933 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -852,6 +852,7 @@ petalogix_s3adsp1800
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
 F: hw/microblaze/petalogix_s3adsp1800_mmu.c
+F: include/hw/char/xilinx_uartlite.h
 
 petalogix_ml605
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
-- 
2.19.2


