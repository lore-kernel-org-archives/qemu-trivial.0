Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iJBaa-0003t3-OU
	for mharc-qemu-trivial@gnu.org; Sat, 12 Oct 2019 03:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iJBaY-0003pb-H4
 for qemu-trivial@nongnu.org; Sat, 12 Oct 2019 03:13:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iJBaX-0006yA-DZ
 for qemu-trivial@nongnu.org; Sat, 12 Oct 2019 03:13:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33030)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iJBaV-0006wb-0j; Sat, 12 Oct 2019 03:13:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2DF2C18CB8F0;
 Sat, 12 Oct 2019 07:13:14 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-46.brq.redhat.com [10.40.204.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08D415C1B2;
 Sat, 12 Oct 2019 07:13:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] MAINTAINERS: Replace tab indent by spaces in the Status
 description
Date: Sat, 12 Oct 2019 09:13:07 +0200
Message-Id: <20191012071307.14314-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Sat, 12 Oct 2019 07:13:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Oct 2019 07:13:19 -0000

The Status description has a mix of tabs and spaces and displays
unaligned. Unify using spaces.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ca814850e..b9093e4dac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24,15 +24,15 @@ Descriptions of section entries:
 	Q: Patchwork web based patch tracking system site
 	T: SCM tree type and location.  Type is one of: git, hg, quilt, stgit.
 	S: Status, one of the following:
-	   Supported:	Someone is actually paid to look after this.
-	   Maintained:	Someone actually looks after it.
-	   Odd Fixes:	It has a maintainer but they don't have time to do
-			much other than throw the odd patch in. See below.
-	   Orphan:	No current maintainer [but maybe you could take the
-			role as you write your new code].
-	   Obsolete:	Old code. Something tagged obsolete generally means
-			it has been replaced by a better system and you
-			should be using that.
+          Supported:   Someone is actually paid to look after this.
+          Maintained:  Someone actually looks after it.
+          Odd Fixes:   It has a maintainer but they don't have time to d=
o
+                       much other than throw the odd patch in. See below=
.
+          Orphan:      No current maintainer [but maybe you could take t=
he
+                       role as you write your new code].
+          Obsolete:    Old code. Something tagged obsolete generally mea=
ns
+                       it has been replaced by a better system and you
+                       should be using that.
 	F: Files and directories with wildcard patterns.
 	   A trailing slash includes all files and subdirectory files.
 	   F:	drivers/net/	all files in and below drivers/net
--=20
2.21.0


