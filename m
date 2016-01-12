Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIyRx-00051v-Fb
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2016 07:53:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <w.bumiller@proxmox.com>) id 1aIyRv-0004yt-76
	for qemu-trivial@nongnu.org; Tue, 12 Jan 2016 07:53:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <w.bumiller@proxmox.com>) id 1aIyRu-0007tq-Bi
	for qemu-trivial@nongnu.org; Tue, 12 Jan 2016 07:53:23 -0500
Received: from proxmox.maurer-it.com ([94.136.31.133]:33331)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <w.bumiller@proxmox.com>)
	id 1aIyRp-0007rY-6z; Tue, 12 Jan 2016 07:53:17 -0500
Received: from proxmox.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox.maurer-it.com (Proxmox) with ESMTP id 2F274AD08F8;
	Tue, 12 Jan 2016 13:52:45 +0100 (CET)
From: Wolfgang Bumiller <w.bumiller@proxmox.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 12 Jan 2016 13:52:39 +0100
Message-Id: <1452603159-19782-1-git-send-email-w.bumiller@proxmox.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 94.136.31.133
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] vnc: clear vs->tlscreds after unparenting it
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
X-List-Received-Date: Tue, 12 Jan 2016 12:53:24 -0000

This pointer should be cleared in vnc_display_close()
otherwise a use-after-free can happen when when using the
old style 'x509' and 'tls' options rather than a persistent
tls-creds -object, by issuing monitor commands to change
the vnc server like so:

Start with: -vnc unix:test.socket,x509,tls
Then use the following monitor command:
  change vnc unix:test.socket

After this the pointer is still set but invalid and a crash
can be triggered for instance by issuing the same command a
second time which will try to object_unparent() the same
pointer again.
---
 ui/vnc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/vnc.c b/ui/vnc.c
index 09756cd..35843b5 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3134,6 +3134,7 @@ static void vnc_display_close(VncDisplay *vs)
     vs->subauth = VNC_AUTH_INVALID;
     if (vs->tlscreds) {
         object_unparent(OBJECT(vs->tlscreds));
+        vs->tlscreds = NULL;
     }
     g_free(vs->tlsaclname);
     vs->tlsaclname = NULL;
-- 
2.1.4



