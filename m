Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKjPG-0007F4-Bb
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 02:04:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKijL-0000d6-RF
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:21:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKijH-0003NW-LZ
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:21:31 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKij9-0003Ld-0D; Tue, 04 Mar 2014 01:21:19 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E6D314084F;
	Tue,  4 Mar 2014 10:16:03 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C126C651;
	Tue,  4 Mar 2014 10:16:03 +0400 (MSK)
Received: (nullmailer pid 16571 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:15:50 +0400
Message-Id: <1393913761-16516-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Hani Benhabiles <hani@linux.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Hani Benhabiles <kroosec@gmail.com>
Subject: [Qemu-trivial] [PULL 02/13] object: Report type in error when not
	user creatable.
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
X-List-Received-Date: Tue, 04 Mar 2014 07:04:47 -0000

From: Hani Benhabiles <kroosec@gmail.com>

Signed-off-by: Hani Benhabiles <hani@linux.com>
Reviewed-by: Hu Tao <hutao@cn.fujitsu.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qmp.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qmp.c b/qmp.c
index d0d98e7..f556a04 100644
--- a/qmp.c
+++ b/qmp.c
@@ -556,8 +556,8 @@ void object_add(const char *type, const char *id, const QDict *qdict,
     }
 
     if (!object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
-        error_setg(&local_err, "object '%s' isn't supported by object-add",
-                   id);
+        error_setg(&local_err, "object type '%s' isn't supported by object-add",
+                   type);
         goto out;
     }
 
-- 
1.7.10.4


