Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4kRD-0006fJ-RY
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2015 02:05:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kR9-0006WG-Mv
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 02:05:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kR8-0004B5-TF
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 02:05:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42720)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a4kR2-00048o-SU; Fri, 04 Dec 2015 02:05:41 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 091664068A;
	Fri,  4 Dec 2015 10:05:38 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 6FB62AAE;
	Fri,  4 Dec 2015 09:57:43 +0300 (MSK)
Received: (nullmailer pid 7957 invoked by uid 1000);
	Fri, 04 Dec 2015 06:57:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  4 Dec 2015 09:57:33 +0300
Message-Id: <e0df8f18f755d8c976db9bca2faabb763ad98ff2.1449211229.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
References: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 2/9] bt: avoid unintended sign extension
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
X-List-Received-Date: Fri, 04 Dec 2015 07:05:49 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

In the case of a 4-byte length, shifting a value by 24 may cause
an unintended sign extension when converting from int to size_t.
Use a uint32_t variable instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/bt/sdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/bt/sdp.c b/hw/bt/sdp.c
index b9bcdcc..04eaeca 100644
--- a/hw/bt/sdp.c
+++ b/hw/bt/sdp.c
@@ -42,7 +42,7 @@ struct bt_l2cap_sdp_state_s {
 
 static ssize_t sdp_datalen(const uint8_t **element, ssize_t *left)
 {
-    size_t len = *(*element) ++ & SDP_DSIZE_MASK;
+    uint32_t len = *(*element) ++ & SDP_DSIZE_MASK;
 
     if (!*left)
         return -1;
-- 
2.1.4


