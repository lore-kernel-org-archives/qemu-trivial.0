Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dCtuq-00083j-Qi
	for mharc-qemu-trivial@gnu.org; Mon, 22 May 2017 16:26:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dCtuo-000826-D4
	for qemu-trivial@nongnu.org; Mon, 22 May 2017 16:26:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dCtun-0001aS-Ez
	for qemu-trivial@nongnu.org; Mon, 22 May 2017 16:26:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dCtuj-0001YY-39; Mon, 22 May 2017 16:26:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE6498046B;
	Mon, 22 May 2017 20:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EE6498046B
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com EE6498046B
Received: from thh440s.redhat.com (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE90A189DC;
	Mon, 22 May 2017 20:26:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 22 May 2017 22:26:45 +0200
Message-Id: <1495484805-4201-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 22 May 2017 20:26:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu-doc: Add hyperlinks to further license
 information
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
X-List-Received-Date: Mon, 22 May 2017 20:26:55 -0000

Add a link to the GPLv2 and a link to the LICENSE file in the
QEMU repository to fix the two TODO items in this appendix.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-doc.texi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index de0cc30..b0bfd84 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -3020,10 +3020,10 @@ Run the emulation in single step mode.
 
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
1.8.3.1


