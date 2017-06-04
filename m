Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXiw-0002Ov-LF
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 11:45:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXit-0002Mx-Nv
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:45:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXis-0005yF-Of
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:45:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41273)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXin-0005k2-9B; Sun, 04 Jun 2017 11:45:41 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C0252404E3;
	Sun,  4 Jun 2017 18:45:27 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9706C5E4;
	Sun,  4 Jun 2017 18:45:27 +0300 (MSK)
Received: (nullmailer pid 16358 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:06 +0300
Message-Id: <2f8d8f01c8a501e74a7911555587dbb79acae727.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 02/22] qemu-doc: Add hyperlinks to further
 license information
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
X-List-Received-Date: Sun, 04 Jun 2017 15:45:48 -0000

From: Thomas Huth <thuth@redhat.com>

Add a link to the GPLv2 and a link to the LICENSE file in the
QEMU repository to fix the two TODO items in this appendix.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-doc.texi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 3f4ed0aa9a..965ba5929e 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -3021,10 +3021,10 @@ Run the emulation in single step mode.
 
 QEMU is a trademark of Fabrice Bellard.
 
-QEMU is released under the GNU General Public License (TODO: add link).
-Parts of QEMU have specific licenses, see file LICENSE.
-
-TODO (refer to file LICENSE, include it, include the GPL?)
+QEMU is released under the
+@url{https://www.gnu.org/licenses/gpl-2.0.txt,GNU General Public License},
+version 2. Parts of QEMU have specific licenses, see file
+@url{http://git.qemu.org/?p=qemu.git;a=blob_plain;f=LICENSE,LICENSE}.
 
 @node Index
 @appendix Index
-- 
2.11.0


