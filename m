Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkie-0003lL-6g
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:33:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkiY-0003bW-Rt
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:33:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkiU-0001o8-GY
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:33:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40794)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSki8-0001gN-KS; Sun, 06 Oct 2013 05:33:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C7DD940CFD;
	Sun,  6 Oct 2013 13:33:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A35B750F;
	Sun,  6 Oct 2013 13:33:02 +0400 (MSK)
Received: (nullmailer pid 25801 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:47 +0400
Message-Id: <1381051979-25742-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 02/14] tests: Update .gitignore for
	test-int128 and test-bitops
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
X-List-Received-Date: Sun, 06 Oct 2013 09:33:43 -0000

From: Markus Armbruster <armbru@redhat.com>

Forgotten in commit 6046c62 and 3464700.

Cc: qemu-stable@nongnu.org
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/.gitignore |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index ae5280e..f94ce04 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -5,9 +5,11 @@ check-qjson
 check-qlist
 check-qstring
 test-aio
+test-bitops
 test-throttle
 test-cutils
 test-hbitmap
+test-int128
 test-iov
 test-mul64
 test-qapi-types.[ch]
--=20
1.7.10.4


