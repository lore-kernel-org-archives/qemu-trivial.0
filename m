Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fDVlJ-0003R4-Lc
	for mharc-qemu-trivial@gnu.org; Tue, 01 May 2018 09:56:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fDVlH-0003Pj-Jz
	for qemu-trivial@nongnu.org; Tue, 01 May 2018 09:56:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fDVlD-0007xd-Fb
	for qemu-trivial@nongnu.org; Tue, 01 May 2018 09:56:07 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:42801)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fDVlD-0007vk-5f; Tue, 01 May 2018 09:56:03 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue007 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 0MPeNx-1fIASH35TF-004lvA; Tue, 01 May 2018 15:56:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <huth@tuxfamily.org>, Michael Tokarev <mjt@tls.msk.ru>
Date: Tue,  1 May 2018 15:55:47 +0200
Message-Id: <20180501135547.12414-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180501135547.12414-1-laurent@vivier.eu>
References: <20180501135547.12414-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:lfptg0V/NAx9CaMsam3DUaPSynDSIPOSc96SLynWVMh5/FQ8N0h
	qOdCV2z6m9KXdv6KBjpQ8V7U6n23PCHTeIHMuhW1Dzxwlx0rqw2uGxYT25o2RTi1GNgy/lg
	+Ob7YLwbmjoSiF/jU+OUGfxkcUHF+3qxDkjstoScCeCl3YOQTuOrZ5m8Q5HEN/oIDdzpQU7
	fktBs7lK/P4ZB1j0Ozplg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:+FK/SwCxydc=:WkeLwaeIvHIDMB14vBDTYH
	wwmF5xL3NQLu/uH6UQvQUpSVvUuMvFon4ZampvdFMUFYxpFI/7kDbuaHxlpogmySMmKAkGocW
	UPDS5PKZ1jLxQyn1xXa0AZ94GNvEMyC72Pr3SjYPAJcwLkxI3PgA0ALke/XLidOFcmteLdyKB
	xlj22b05LwPFlC+4PAUPdGrg7NBcutnWFr05R4tx8c2sep46mj9mVCCFchHzjPsINUvYdtpby
	0KrKrPPLtGNChTPLvXH1U29/XLmv0Ml54IwNvoHWSL25sziPjhfoC/9MwOsrwqlHPR+ivA54t
	tnWLBpJbtQ2kCZC8zgc7D15w3O+3Px/KmvmZROFxRsrWDlROY2MTZ/IEPRBwkxVR/DO+jiu+Y
	3Lbpmu0+g/rS/cjYFeN1jy/YYeAB3rRccxmzHFr6KMZ4dQOvn3NcKyVdLyxrni/odEQyfjSkI
	FEkgr7f+mmxBgNe8GW2YT/hnmF28KC09auHLUGWjb6ZMY+gRK3dZXy6u9ySNR+dErlK4BIose
	nzyvvI/KHaBteYQjEcLAjIZaJv/bDHhoal0FnujcY/i/cAXeT9L+dhxYhNNBCyIYS3tsoXwn1
	oqkjxa3ZTkRev/kCNJblERrdfpLA/Oe1R2Mk0s2nmRvcroRdGgHAvOOubEFYLz9T9ov29AfpB
	PDzznNK+j8/1hanqmPfAy98+XFCwcryQZ+DbcxtZ3pAddVfObhNnAFJFnbrjrMcSzwXs=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 4/4] hw/m68k/mcf5208: Fix trivial typo in
 board description
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
X-List-Received-Date: Tue, 01 May 2018 13:56:08 -0000

From: Thomas Huth <huth@tuxfamily.org>

It's the MCF5208 evaluation board, not the MCF5206 eval board.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20180429094002.3293c9de@thl530.multi.box>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/mcf5208.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 7aca58542e..ae3dcc98c3 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -315,7 +315,7 @@ static void mcf5208evb_init(MachineState *machine)
 
 static void mcf5208evb_machine_init(MachineClass *mc)
 {
-    mc->desc = "MCF5206EVB";
+    mc->desc = "MCF5208EVB";
     mc->init = mcf5208evb_init;
     mc->is_default = 1;
     mc->default_cpu_type = M68K_CPU_TYPE_NAME("m5208");
-- 
2.14.3


