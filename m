Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgE8x-0007t2-6i
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jun 2019 16:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hgE8t-0007rf-7t
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 16:03:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hgE8n-00015U-P4
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 16:03:41 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:39059)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1hgE8h-00010g-Q1; Wed, 26 Jun 2019 16:03:32 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MUXlG-1i6afb2Boe-00QVok; Wed, 26 Jun 2019 22:02:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Wed, 26 Jun 2019 22:02:52 +0200
Message-Id: <20190626200252.30220-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626200252.30220-1-laurent@vivier.eu>
References: <20190626200252.30220-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cQo9I9915l39aZW5pN7DwI9aoDDmMMA4BAwJgMd9BUnEdo9A8ei
 ciZplMaFL5CA6vtmh0i/yOijbrPPPgBnkUO93gx/XH/47IWYLyJQLsfqTLXY0D29VE6avvr
 +AOS3sYPye/At0RQQQle1AfuOxj8aBeRFPlViRJMj4jkYDrhdIRK03nj3YRES4fNlxLfp+w
 IQFtatYWUFqnjw6Nv+W0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q2iA9gR+3js=:tMArK/VrQ5+N2hkljgr5sl
 ACoSz2Y4Dy2oMx7MzjhiYadF9QpO39PbstIkys6uSDih1nxLCDws7XE8X9WNGEOdCwdm/cp+o
 k3fZtQjuk0GTXgjBj40HrRgb1HcTcNpd9JsSjaI8KjeH9euVma2+zC/DTY6m+ctKRFiNFIezT
 UOxBIEKz8Sru1wROvSnRx8Mu+OZkPn1da1wHulvrTBJHyqgDq3tDAnp2B9ATlot/j5VJvocg2
 6FDR4JiCrcavZAWoJPeCkBklgArIjjb9xl12PLT/P416osh78mhjvprpDm1T+Q6LHHYqecwwP
 HFwgQClWB3xBhCVRj+jwyGADMf1Jlr2EsWfaHjxHftO65OuUIY00bRXP097/D5500dll9EmGH
 ZqBAH68kSjmzy/+cpR+OkUlE8pWsmzsl+Vs+0rS3LUvIO+Np3803znF/9p0Tf8BlVp7vaV4ju
 4D2qlA55HV6PC3Ttjafmc6reoiTdIDsW8N5igmxNioScIg/y88qYBdkshZTqDdgZIVZoazhtp
 38LmoAu5QnHZZsz7uFFEmxY5wXQ6hYSCAt4YSa0Q6FZlJSpozyFysK3W2tdEi6BpWyAYZ+2EB
 5Wi3LG63oWgY7fp6QB4d5sBN7jNyo/mJ0wcDQqAhSwUiCbeoZ2iOID6XCKX2rkhbm7EBVjFEX
 XeHEXivyMHturRK3Du/9JlSgqnpKbHuYs22ZU6+ewF8W/QxFg0Be4smXU6MX8v8KaL+CpA8DI
 zIi6DF+9+NJFrmADzxI8q7JP126rxBHxS62eskZvylIIHeYpTQuctQpICRM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL 4/4] MAINTAINERS: Change maintership of Xen
 code under hw/9pfs
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 20:03:45 -0000

From: Greg Kurz <groug@kaod.org>

Xen folks are the actual maintainers for this.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Paul Durrant <paul.durrant@citrix.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <155912548463.2019004.3515830305299809902.stgit@bahia.lan>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cad58b948791..8206fc51dbbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -408,7 +408,7 @@ M: Paul Durrant <paul.durrant@citrix.com>
 L: xen-devel@lists.xenproject.org
 S: Supported
 F: */xen*
-F: hw/9pfs/xen-9p-backend.c
+F: hw/9pfs/xen-9p*
 F: hw/char/xen_console.c
 F: hw/display/xenfb.c
 F: hw/net/xen_nic.c
@@ -1498,6 +1498,7 @@ virtio-9p
 M: Greg Kurz <groug@kaod.org>
 S: Supported
 F: hw/9pfs/
+X: hw/9pfs/xen-9p*
 F: fsdev/
 F: tests/virtio-9p-test.c
 T: git https://github.com/gkurz/qemu.git 9p-next
-- 
2.21.0


