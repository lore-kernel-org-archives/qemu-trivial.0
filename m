Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UwaBT-0004AT-8v
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jul 2013 11:50:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1UwYaN-0002yJ-9q
	for qemu-trivial@nongnu.org; Tue, 09 Jul 2013 10:08:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1UwYaL-0006Z0-LD
	for qemu-trivial@nongnu.org; Tue, 09 Jul 2013 10:08:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1UwYaL-0006Yn-D6; Tue, 09 Jul 2013 10:08:05 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r69E84qJ010408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 9 Jul 2013 10:08:04 -0400
Received: from colepc.redhat.com (ovpn-113-136.phx2.redhat.com [10.3.113.136])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id r69E82YN029324; Tue, 9 Jul 2013 10:08:02 -0400
From: Cole Robinson <crobinso@redhat.com>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Tue,  9 Jul 2013 10:07:53 -0400
Message-Id: <bf191bb787ac58df8e34e988bad62ffd130856e0.1373378873.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 09 Jul 2013 11:50:29 -0400
Cc: qemu-devel@nongnu.org, Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PATCH] Fix command example in qemu.sasl
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
X-List-Received-Date: Tue, 09 Jul 2013 14:08:10 -0000

sasldblistusers2 doesn't have a '-a' option

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 qemu.sasl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu.sasl b/qemu.sasl
index cf19cf8..9dc8323 100644
--- a/qemu.sasl
+++ b/qemu.sasl
@@ -26,7 +26,7 @@ keytab: /etc/qemu/krb5.tab
 
 # If using digest-md5 for username/passwds, then this is the file
 # containing the passwds. Use 'saslpasswd2 -a qemu [username]'
-# to add entries, and 'sasldblistusers2 -a qemu' to browse it
+# to add entries, and 'sasldblistusers2 -f [sasldb_path]' to browse it
 sasldb_path: /etc/qemu/passwd.db
 
 
-- 
1.8.3.1


