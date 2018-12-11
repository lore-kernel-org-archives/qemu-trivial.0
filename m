Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPT-0000A5-Og
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPL-0008Nh-Ir
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPH-0007dN-GE
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:23 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:43359)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmPB-0007Ox-1R; Tue, 11 Dec 2018 13:05:13 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M9ZRc-1ga3eP04Ki-005dDF; Tue, 11 Dec 2018 19:04:17 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:41 +0100
Message-Id: <20181211180352.19644-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Gov3coqgc6gxvlk5FmhhSkkirBkcYzvYKQanTnV72/5ehKYRGya
	CvdyBc1eVwdoI6DEqTHaHoMavlVfrwZnsd8jEW8LVg/7dRNJInCJvqUCy+wNrjR1gpmf1JE
	GWpvxFyS60URGLcJZggyW3YzUUvrsxJOqlX96wgKWvYE0YcK5Bb01QpTHjzBCuCXC1y2/8H
	902DJiQnfXyB4kVfONIqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sdkvSAAjV6s=:OAS8nCfVXGeXVu/qcy/YBT
	7flYTcoSNJry5saNiIxC30j/Gw/q6ULLmyJD6XTDLdfybgXfsDPzfRFNGEMesh4A6112g67/1
	usswTg/q8/Tlk8DzmittWWPxWzi3t0kQ3phn83psm0yXTdptbsUn9tSmhPhRRMX912u3dCgty
	rg0Tjt/6GmE4QUh5agXE6BtfAGIi4U+nKkNOcmTJHaajC6MtYDt1R7yNkt1/HeTGyqKnZaZgJ
	hTivey9qfLspYy48zzEXm4weFtImxe5KFuB6OcB7D4GQ9CNzMgUQQHW36HpIfC57Q0HrcAPg/
	zXK5adNGMIa8igDNePgAqsa8xWYc3l+Kdv0124Yh26kL3gTNzwdG2GxQqY764d7JhpGrlfqVG
	0lWrwSbJAyFvbt7OozJJxK28rindifkZ7il4DLGLh7EGLxIkJOIptTXAeBEiQbzxnEEwJfSdJ
	9V7BJ09Yu9DG6n0uH0ZlALhvjcl5d5zvU1rnERew/8xmBKIzZRhoZoa3WHaVlpT5s5D1v1+un
	pcgm/yR2SmWWv3Nq/KWfPsZevGC24+hZpzBe4DyVOo6nKNFSLv1lwv604j4Mn/CcR5C9inbll
	3WLp59XFnyR4lzu664kjfKtItVqn45bSKmbe7cqHq8ZJLVRGvV1QUnqQHD+63HxWEKgVNNByn
	Vf1PPfmtqfBU1a13rpki288BWABtncVMDrlA5UhafNC+lIhSR0jNJnx/MwY17ZvXWMA3zlzSo
	okONCPzna05w98VfpOo+M0RZ21/BdAFbyfOlOGF4/+l8hyczmjGYnkPEppw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 19/30] MAINTAINERS: Add missing entries for
 the Canon DIGIC machine
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:27 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

This pattern now also matches:
- include/hw/timer/digic-timer.h
- include/hw/char/digic-uart.h

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20181125205000.10324-16-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 381c39b6d8..68ff5ee413 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -541,6 +541,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: include/hw/arm/digic.h
 F: hw/*/digic*
+F: include/hw/*/digic*
 
 Gumstix
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.19.2


