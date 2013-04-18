Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1USw5U-0004SF-NX
	for mharc-qemu-trivial@gnu.org; Thu, 18 Apr 2013 17:09:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1USw5S-0004S7-2a
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 17:09:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1USw5R-0000bZ-6U
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 17:09:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1USw5Q-0000aU-Va; Thu, 18 Apr 2013 17:09:45 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3IL9ijA028587
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 18 Apr 2013 17:09:44 -0400
Received: from choo.home.annexia.org (vpn1-7-56.ams2.redhat.com [10.36.7.56])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id r3IL9gqd007137; Thu, 18 Apr 2013 17:09:43 -0400
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-trivial@nongnu.org
Date: Thu, 18 Apr 2013 22:09:33 +0100
Message-Id: <1366319373-12926-1-git-send-email-rjones@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] ssh: Remove unnecessary use of strlen
	function.
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
X-List-Received-Date: Thu, 18 Apr 2013 21:09:47 -0000

From: "Richard W.M. Jones" <rjones@redhat.com>

---
 block/ssh.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/block/ssh.c b/block/ssh.c
index 8f78e2e..7bc008d 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -387,15 +387,13 @@ static int check_host_key(BDRVSSHState *s, const char *host, int port,
     }
 
     /* host_key_check=md5:xx:yy:zz:... */
-    if (strlen(host_key_check) >= 4 &&
-        strncmp(host_key_check, "md5:", 4) == 0) {
+    if (strncmp(host_key_check, "md5:", 4) == 0) {
         return check_host_key_hash(s, &host_key_check[4],
                                    LIBSSH2_HOSTKEY_HASH_MD5, 16);
     }
 
     /* host_key_check=sha1:xx:yy:zz:... */
-    if (strlen(host_key_check) >= 5 &&
-        strncmp(host_key_check, "sha1:", 5) == 0) {
+    if (strncmp(host_key_check, "sha1:", 5) == 0) {
         return check_host_key_hash(s, &host_key_check[5],
                                    LIBSSH2_HOSTKEY_HASH_SHA1, 20);
     }
-- 
1.8.1.4


