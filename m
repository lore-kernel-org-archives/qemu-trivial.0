Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZaVe-0004Gq-95
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2017 04:50:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cZaVc-0004FX-Eb
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 04:50:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cZaVb-0002fF-GG
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 04:50:24 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cZaVS-0002OI-Vr; Fri, 03 Feb 2017 04:50:15 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E3848406CC;
	Fri,  3 Feb 2017 12:50:04 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 4701E23;
	Fri,  3 Feb 2017 12:50:04 +0300 (MSK)
Received: (nullmailer pid 9329 invoked by uid 1000);
	Fri, 03 Feb 2017 09:50:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-stable@nongnu.org
Date: Fri,  3 Feb 2017 12:50:02 +0300
Message-Id: <1486115402-9288-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH] vnc: do not disconnect on EAGAIN
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
X-List-Received-Date: Fri, 03 Feb 2017 09:50:25 -0000

When qemu vnc server is trying to send large update to clients,
there might be a situation when system responds with something
like EAGAIN, indicating that there's no system memory to send
that much data (depending on the network speed, client and server
and what is happening).  In this case, something like this happens
on qemu side (from strace):

sendmsg(16, {msg_name(0)=NULL,
        msg_iov(1)=[{"\244\"..., 729186}],
        msg_controllen=0, msg_flags=0}, 0) = 103950
sendmsg(16, {msg_name(0)=NULL,
        msg_iov(1)=[{"lz\346"..., 1559618}],
        msg_controllen=0, msg_flags=0}, 0) = -1 EAGAIN
sendmsg(-1, {msg_name(0)=NULL,
        msg_iov(1)=[{"lz\346"..., 1559618}],
        msg_controllen=0, msg_flags=0}, 0) = -1 EBADF

qemu closes the socket before the retry, and obviously it gets EBADF
when trying to send to -1.

This is because there WAS a special handling for EAGAIN, but now it doesn't
work anymore, after commit 04d2529da27db512dcbd5e99d0e26d333f16efcc, because
now in all error-like cases we initiate vnc disconnect.

This change were introduced in qemu 2.6, and caused numerous grief for many
people, resulting in their vnc clients reporting sporadic random disconnects
from vnc server.

Fix that by doing the disconnect only when necessary, i.e. omitting this
very case of EAGAIN.

Hopefully the existing condition (comparing with QIO_CHANNEL_ERR_BLOCK)
is sufficient, as the original code (before the above commit) were
checking for other errno values too.

Apparently there's another (semi?)bug exist somewhere here, since the
code tries to write to fd# -1, it probably should check if the connection
is open before. But this isn't important.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Fixes: 04d2529da27db512dcbd5e99d0e26d333f16efcc
Cc: Daniel P. Berrange <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-stable@nongnu.org
---
 ui/vnc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index cdeb79c..66fde39 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1256,12 +1256,13 @@ ssize_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp)
     if (ret <= 0) {
         if (ret == 0) {
             VNC_DEBUG("Closing down client sock: EOF\n");
+	    vnc_disconnect_start(vs);
         } else if (ret != QIO_CHANNEL_ERR_BLOCK) {
             VNC_DEBUG("Closing down client sock: ret %zd (%s)\n",
                       ret, errp ? error_get_pretty(*errp) : "Unknown");
+	    vnc_disconnect_start(vs);
         }
 
-        vnc_disconnect_start(vs);
         if (errp) {
             error_free(*errp);
             *errp = NULL;
-- 
2.1.4


