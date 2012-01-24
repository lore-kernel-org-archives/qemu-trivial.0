Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RpkKb-00036i-Vu
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2012 12:38:53 -0500
Received: from eggs.gnu.org ([140.186.70.92]:58495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <slyfox@gentoo.org>) id 1RpkKY-0002s2-6c
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 12:38:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <slyfox@gentoo.org>) id 1RpkKW-0003uf-8a
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 12:38:49 -0500
Received: from smtp.gentoo.org ([140.211.166.183]:52917)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <slyfox@gentoo.org>)
	id 1RpkKM-0003oW-A8; Tue, 24 Jan 2012 12:38:38 -0500
Received: from sf.home (unknown [178.125.150.85])
	(using TLSv1 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: slyfox)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C92161B4003;
	Tue, 24 Jan 2012 17:38:36 +0000 (UTC)
Received: by sf.home (Postfix, from userid 1000)
	id A07DE1254725; Tue, 24 Jan 2012 20:42:45 +0300 (FET)
From: Sergei Trofimovich <slyfox@inbox.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jan 2012 20:42:40 +0300
Message-Id: <1327426960-29196-1-git-send-email-slyfox@inbox.ru>
X-Mailer: git-send-email 1.7.8.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.211.166.183
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>,
	Sergei Trofimovich <slyfox@gentoo.org>
Subject: [Qemu-trivial] [PATCH] ./configure: export xfs config via --{enable,
	disable}-xfsctl
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
X-List-Received-Date: Tue, 24 Jan 2012 17:38:51 -0000

From: Sergei Trofimovich <slyfox@gentoo.org>

Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
---
 configure |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/configure b/configure
index 9d72145..bca1943 100755
--- a/configure
+++ b/configure
@@ -771,6 +771,10 @@ for opt do
   ;;
   --enable-rbd) rbd="yes"
   ;;
+  --disable-xfsctl) xfs="no"
+  ;;
+  --enable-xfsctl) xfs="yes"
+  ;;
   --disable-smartcard) smartcard="no"
   ;;
   --enable-smartcard) smartcard="yes"
-- 
1.7.8.3


