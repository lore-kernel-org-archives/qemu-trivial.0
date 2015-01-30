Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YHHOM-0000TR-IM
	for mharc-qemu-trivial@gnu.org; Fri, 30 Jan 2015 14:38:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YHHOK-0000SP-Q9
	for qemu-trivial@nongnu.org; Fri, 30 Jan 2015 14:38:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YHHOJ-0003oL-Vz
	for qemu-trivial@nongnu.org; Fri, 30 Jan 2015 14:38:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1YHHOF-0003Ve-Iq; Fri, 30 Jan 2015 14:38:03 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0UJc2hY023950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 30 Jan 2015 14:38:02 -0500
Received: from noname.redhat.com (ovpn-116-82.ams2.redhat.com [10.36.116.82])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id t0UJc06F027300; Fri, 30 Jan 2015 14:38:00 -0500
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Jan 2015 20:37:55 +0100
Message-Id: <1422646675-17657-1-git-send-email-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu-sockets: Fix buffer overflow in
	inet_parse()
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
X-List-Received-Date: Fri, 30 Jan 2015 19:38:09 -0000

The size of the stack allocated host[] array didn't account for the
terminating '\0' byte that sscanf() writes. Fix the array size.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 util/qemu-sockets.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index a76bb3c..aacf1fc 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -512,7 +512,7 @@ InetSocketAddress *inet_parse(const char *str, Error **errp)
 {
     InetSocketAddress *addr;
     const char *optstr, *h;
-    char host[64];
+    char host[65];
     char port[33];
     int to;
     int pos;
-- 
1.8.3.1


