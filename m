Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V06is-0005b5-LF
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2013 05:11:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V06ip-0005Wv-6r
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 05:11:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V06io-00027U-4G
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 05:11:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V06il-000240-52; Fri, 19 Jul 2013 05:11:27 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1D2C241D86;
	Fri, 19 Jul 2013 13:11:18 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 878C01D8; Fri, 19 Jul 2013 13:11:16 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 19 Jul 2013 13:11:11 +0400
Message-Id: <1374225073-12959-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PULL trivial 3/5] Fix command example in qemu.sasl
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
X-List-Received-Date: Fri, 19 Jul 2013 09:11:32 -0000

From: Cole Robinson <crobinso@redhat.com>

sasldblistusers2 doesn't have a '-a' option

Signed-off-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu.sasl |    2 +-
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
1.7.10.4


