Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zys-0005R3-Tf
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:33:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zym-0005EQ-I6
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zyl-0008B4-Ez
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:33:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zyf-00088J-8b; Mon, 22 Jun 2015 07:33:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 314D140C2D;
	Mon, 22 Jun 2015 14:33:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 01E8BA5E;
	Mon, 22 Jun 2015 14:16:32 +0300 (MSK)
Received: (nullmailer pid 9270 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:22 +0300
Message-Id: <959ece8dc8c377b5d16bd6199ca2c52d07197328.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 15/21] qemu-options: Improve -global
	documentation
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
X-List-Received-Date: Mon, 22 Jun 2015 11:33:33 -0000

From: Markus Armbruster <armbru@redhat.com>

Recent commit 3751d7c "vl: allow full-blown QemuOpts syntax for
-global" overloaded its existing argument syntax DRIVER.PROP=VALUE
with QemuOpts syntax.  Unambigious as long as no DRIVER contains '='.

Its documentation claims that "the two syntaxes are equivalent."
Improve it to spell out how exactly the old syntax gets desugared into
the new one.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 7959dd0..39a472e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -189,8 +189,9 @@ In particular, you can use this to set driver properties for devices which are
 created automatically by the machine model. To create a device which is not 
 created automatically and set properties on it, use -@option{device}.
 
-The two syntaxes are equivalent.  The longer one works for drivers whose name
-contains a dot.
+-global @var{driver}.@var{prop}=@var{value} is shorthand for -global
+driver=@var{driver},property=@var{prop},value=@var{value}.  The
+longhand syntax works even when @var{driver} contains a dot.
 ETEXI
 
 DEF("boot", HAS_ARG, QEMU_OPTION_boot,
-- 
2.1.4


