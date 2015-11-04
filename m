Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtyQu-00084d-9N
	for mharc-qemu-trivial@gnu.org; Wed, 04 Nov 2015 08:49:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZtyQp-0007zA-Gr
	for qemu-trivial@nongnu.org; Wed, 04 Nov 2015 08:48:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZtyQo-0002QE-Je
	for qemu-trivial@nongnu.org; Wed, 04 Nov 2015 08:48:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33934)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZtyQk-0002Pl-Tf; Wed, 04 Nov 2015 08:48:50 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 5F8F68FAA6;
	Wed,  4 Nov 2015 13:48:50 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-70.ams2.redhat.com
	[10.36.112.70])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA4DmluG029836; Wed, 4 Nov 2015 08:48:48 -0500
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Nov 2015 14:48:47 +0100
Message-Id: <1446644927-8764-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, armbru@redhat.com,
	crobinso@redhat.com
Subject: [Qemu-trivial] [PATCH v2] qemu-sockets: do not test path with
	access() before unlinking
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
X-List-Received-Date: Wed, 04 Nov 2015 13:48:59 -0000

Using access() is a time-of-check/time-of-use race condition.  It is
okay to use them to provide better error messages, but that is pretty
much it.

This is not one such case; on the other hand, access() *will* skip
unlink() for a non-existent path, so ignore ENOENT return values from
the unlink() system call.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-sockets.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 9142917..de9145a 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -751,8 +751,7 @@ int unix_listen_opts(QemuOpts *opts, Error **errp)
         qemu_opt_set(opts, "path", un.sun_path, &error_abort);
     }
 
-    if ((access(un.sun_path, F_OK) == 0) &&
-        unlink(un.sun_path) < 0) {
+    if (unlink(un.sun_path) < 0 && errno != ENOENT) {
         error_setg_errno(errp, errno,
                          "Failed to unlink socket %s", un.sun_path);
         goto err;
-- 
2.5.0


