Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekQ7w-0000Fa-CF
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 03:03:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ7s-00008h-4P
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 03:03:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ7q-0000fJ-Kk
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 03:03:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41955)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekQ7k-0000Ux-61; Sat, 10 Feb 2018 03:03:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5A2BB40C55;
	Sat, 10 Feb 2018 11:03:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B65577B7;
	Sat, 10 Feb 2018 10:55:16 +0300 (MSK)
Received: (nullmailer pid 22807 invoked by uid 1000);
	Sat, 10 Feb 2018 07:55:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat, 10 Feb 2018 10:55:05 +0300
Message-Id: <a348f64d4652d68212886019ca74825aa1667969.1518249254.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/17] maint: Mention web site maintenance in
 README
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
X-List-Received-Date: Sat, 10 Feb 2018 08:03:14 -0000

From: Eric Blake <eblake@redhat.com>

Now that we have a website that accepts patches on the list, the
main project should make it easier to find information about that
process.

Signed-off-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Fam Zheng <famz@redhat.com>
---
 README | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/README b/README
index b92a07a61a..2c8e1c8cc4 100644
--- a/README
+++ b/README
@@ -68,6 +68,10 @@ the QEMU website
   https://qemu.org/Contribute/SubmitAPatch
   https://qemu.org/Contribute/TrivialPatches
 
+The QEMU website is also maintained under source control.
+
+  git clone git://git.qemu.org/qemu-web.git
+  https://www.qemu.org/2017/02/04/the-new-qemu-website-is-up/
 
 Bug reporting
 =============
-- 
2.11.0


