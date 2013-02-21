Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8e95-0006qa-AP
	for mharc-qemu-trivial@gnu.org; Thu, 21 Feb 2013 16:57:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1U8e91-0006eZ-AO
	for qemu-trivial@nongnu.org; Thu, 21 Feb 2013 16:57:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1U8e8z-0004Qc-Sp
	for qemu-trivial@nongnu.org; Thu, 21 Feb 2013 16:57:35 -0500
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10]:39219)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1U8e8v-0004LK-G5; Thu, 21 Feb 2013 16:57:30 -0500
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id C53AE94003C;
	Thu, 21 Feb 2013 22:57:15 +0100 (CET)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Thu, 21 Feb 2013 22:58:08 +0100
Message-Id: <1361483888-8976-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::10
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] xhci: fix bad print specifier
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
X-List-Received-Date: Thu, 21 Feb 2013 21:57:38 -0000

This fixes the following compilation error:
hw/usb/hcd-xhci.c:1156:17: error: format =E2=80=98%llx=E2=80=99 expects a=
rgument of type
=E2=80=98long long unsigned int=E2=80=99, but argument 4 has type =E2=80=98=
unsigned int=E2=80=99

Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 hw/usb/hcd-xhci.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 5796102..07afdee 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -1152,8 +1152,8 @@ static XHCIStreamContext *xhci_find_stream(XHCIEPCo=
ntext *epctx,
=20
     if (sctx->sct =3D=3D -1) {
         xhci_dma_read_u32s(epctx->xhci, sctx->pctx, ctx, sizeof(ctx));
-        fprintf(stderr, "%s: init sctx #%d @ %lx: %08x %08x\n", __func__=
,
-                streamid, sctx->pctx, ctx[0], ctx[1]);
+        fprintf(stderr, "%s: init sctx #%d @ " DMA_ADDR_FMT ": %08x %08x=
\n",
+                __func__, streamid, sctx->pctx, ctx[0], ctx[1]);
         sct =3D (ctx[0] >> 1) & 0x07;
         if (epctx->lsa && sct !=3D 1) {
             *cc_error =3D CC_INVALID_STREAM_TYPE_ERROR;
--=20
1.7.10.4


