Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rn5d3-0004Ov-EJ
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2012 04:46:57 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Rn5cw-0003xu-GV
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2012 04:46:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Rn5cr-0003U2-VE
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2012 04:46:50 -0500
Received: from cantor2.suse.de ([195.135.220.15]:43554 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Rn5ci-0003Ss-VJ; Tue, 17 Jan 2012 04:46:37 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 1F1B78FFDD;
	Tue, 17 Jan 2012 10:46:35 +0100 (CET)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Tue, 17 Jan 2012 10:44:40 +0100
Message-Id: <1326793481-3967-1-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1326674823-13069-2-git-send-email-afaerber@suse.de>
References: <1326674823-13069-2-git-send-email-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [Qemu-trivial] [PATCH v2] lm32: Fix mixup of uint32 and uint32_t
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
X-List-Received-Date: Tue, 17 Jan 2012 09:46:56 -0000

Commit d23948b15a9920fb7f6374b55a6db1ecff81f3ee (lm32: add Milkymist
VGAFB support) introduced a stray usage of the softfloat uint32 type.

Use uint32_t instead.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
Acked-by: Michael Walle <michael@walle.cc>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/milkymist-vgafb_template.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/milkymist-vgafb_template.h b/hw/milkymist-vgafb_template.=
h
index 69af9ef..1d33ee8 100644
--- a/hw/milkymist-vgafb_template.h
+++ b/hw/milkymist-vgafb_template.h
@@ -39,7 +39,7 @@
 #elif BITS =3D=3D 24
 #define COPY_PIXEL(to, r, g, b)                    \
     do {                                           \
-        uint32 tmp =3D rgb_to_pixel24(r, g, b);      \
+        uint32_t tmp =3D rgb_to_pixel24(r, g, b);    \
         *(to++) =3D         tmp & 0xff;              \
         *(to++) =3D  (tmp >> 8) & 0xff;              \
         *(to++) =3D (tmp >> 16) & 0xff;              \
--=20
1.7.7


