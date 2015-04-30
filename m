Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynj1w-0002QM-Le
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 03:37:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynj1r-0002E8-JO
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 03:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynj1q-0006CA-Pu
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 03:37:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynj1l-00069C-VT; Thu, 30 Apr 2015 03:36:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A760F42BAC;
	Thu, 30 Apr 2015 10:36:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2598A94E;
	Thu, 30 Apr 2015 08:08:58 +0300 (MSK)
Received: (nullmailer pid 4300 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:17 +0300
Message-Id: <a0b0d12282cec4b26f96ac54a4d960863c4580d6.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chih-Min Chao <cmchao@gmail.com>
Subject: [Qemu-trivial] [PULL 04/42] ui/vnc : fix coding style
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
X-List-Received-Date: Thu, 30 Apr 2015 07:37:05 -0000

From: Chih-Min Chao <cmchao@gmail.com>

    reported by checkpatch.pl

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/vnc-auth-vencrypt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/ui/vnc-auth-vencrypt.c b/ui/vnc-auth-vencrypt.c
index a420ccb..65f1afa 100644
--- a/ui/vnc-auth-vencrypt.c
+++ b/ui/vnc-auth-vencrypt.c
@@ -65,7 +65,8 @@ static void start_auth_vencrypt_subauth(VncState *vs)
 
 static void vnc_tls_handshake_io(void *opaque);
 
-static int vnc_start_vencrypt_handshake(struct VncState *vs) {
+static int vnc_start_vencrypt_handshake(struct VncState *vs)
+{
     int ret;
 
     if ((ret = gnutls_handshake(vs->tls.session)) < 0) {
@@ -100,7 +101,8 @@ static int vnc_start_vencrypt_handshake(struct VncState *vs) {
     return 0;
 }
 
-static void vnc_tls_handshake_io(void *opaque) {
+static void vnc_tls_handshake_io(void *opaque)
+{
     struct VncState *vs = (struct VncState *)opaque;
 
     VNC_DEBUG("Handshake IO continue\n");
-- 
2.1.4


