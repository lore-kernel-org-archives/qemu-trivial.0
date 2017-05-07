Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GL3-0006k0-DX
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:10:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GL0-0006gl-Vu
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:10:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GL0-0000kD-4n
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:10:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7GKw-0000iJ-6V; Sun, 07 May 2017 03:10:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 15CAE40483;
	Sun,  7 May 2017 10:10:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B04AA3F8;
	Sun,  7 May 2017 10:02:30 +0300 (MSK)
Received: (nullmailer pid 26550 invoked by uid 1000);
	Sun, 07 May 2017 07:02:28 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:09 +0300
Message-Id: <6b1de1484ee2f80d5795358ea79e90c3ceb64167.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/23] usb-ccid: make ccid_write_data_block()
 cope with null buffers
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
X-List-Received-Date: Sun, 07 May 2017 07:10:40 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

static code analyzer complain:

hw/usb/dev-smartcard-reader.c:816:5: warning: Null pointer passed as an a=
rgument to a 'nonnull' parameter
    memcpy(p->abData, data, len);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/dev-smartcard-reader.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.=
c
index 757b8b3f5a..49cb1829b5 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -813,7 +813,10 @@ static void ccid_write_data_block(USBCCIDState *s, u=
int8_t slot, uint8_t seq,
     if (p->b.bError) {
         DPRINTF(s, D_VERBOSE, "error %d\n", p->b.bError);
     }
-    memcpy(p->abData, data, len);
+    if (len) {
+        g_assert_nonnull(data);
+        memcpy(p->abData, data, len);
+    }
     ccid_reset_error_status(s);
     usb_wakeup(s->bulk, 0);
 }
--=20
2.11.0


