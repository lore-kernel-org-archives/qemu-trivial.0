Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhDJE-0007WE-R8
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 07:13:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDJC-0007T8-9D
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:13:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDJB-0007XH-DH
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:13:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dhDJ6-0007UR-T1; Mon, 14 Aug 2017 07:13:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6EF2D40D4F;
	Mon, 14 Aug 2017 14:07:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D7A49B78;
	Mon, 14 Aug 2017 14:07:43 +0300 (MSK)
Received: (nullmailer pid 31403 invoked by uid 1000);
	Mon, 14 Aug 2017 11:07:46 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 14 Aug 2017 14:07:40 +0300
Message-Id: <88552b553b0f2d75f0f91a247f19c2e3b81ed5aa.1502708830.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 3/7] qemu-doc: Fix "-net van" typo
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
X-List-Received-Date: Mon, 14 Aug 2017 11:13:23 -0000

From: Thomas Huth <thuth@redhat.com>

While Andrew S. Tanenbaum has a point by saying "Never underestimate the
bandwidth of a station wagon full of tapes hurtling down the highway",
we don't support that way of transportation in QEMU yet, so replace the
typo with the correct word "vlan".

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-doc.texi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index aeb7bc52f5..4fc6b6f077 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -3243,7 +3243,7 @@ the ``-netdev user,guestfwd=ARGS'' argument instead.
 
 @subsection -net vlan (since 2.9.0)
 
-The ``-net van=NN'' argument is partially replaced with the
+The ``-net vlan=NN'' argument is partially replaced with the
 new ``-netdev'' argument. The remaining use cases will no
 longer be directly supported in QEMU.
 
-- 
2.11.0


