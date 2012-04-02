Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SEiuh-0000f6-GI
	for mharc-qemu-trivial@gnu.org; Mon, 02 Apr 2012 11:11:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1SEiuW-000085-T5
	for qemu-trivial@nongnu.org; Mon, 02 Apr 2012 11:11:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1SEiuQ-0004P8-Oe
	for qemu-trivial@nongnu.org; Mon, 02 Apr 2012 11:11:12 -0400
Received: from smtp.citrix.com ([66.165.176.89]:60141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>)
	id 1SEiuC-0004NJ-VX; Mon, 02 Apr 2012 11:10:53 -0400
X-IronPort-AV: E=Sophos;i="4.75,357,1330923600"; d="scan'208";a="23784120"
Received: from ftlpmailmx02.citrite.net ([10.13.107.66])
	by FTLPIPO01.CITRIX.COM with ESMTP/TLS/RC4-MD5;
	02 Apr 2012 11:10:49 -0400
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.66) with Microsoft SMTP Server id 8.3.213.0;
	Mon, 2 Apr 2012 11:10:49 -0400
Received: from [10.80.3.61] (helo=perard.uk.xensource.com)	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<anthony.perard@citrix.com>)	id 1SEiu9-00047r-3U;
	Mon, 02 Apr 2012 16:10:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Mon, 2 Apr 2012 16:10:39 +0100
Message-ID: <1333379439-8688-1-git-send-email-anthony.perard@citrix.com>
X-Mailer: git-send-email 1.7.2.5
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	QEMU-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH trivial] make: fix clean rule by removing
	build file in qom/
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
X-List-Received-Date: Mon, 02 Apr 2012 15:11:22 -0000

Make clean does not clean the 'qom' directory, leaving *.o and *.d files. This
patch fixes this.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 35c7a2a..a78f53d 100644
--- a/Makefile
+++ b/Makefile
@@ -217,6 +217,7 @@ clean:
 	rm -f *.o *.d *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
 	rm -Rf .libs
 	rm -f slirp/*.o slirp/*.d audio/*.o audio/*.d block/*.o block/*.d net/*.o net/*.d fsdev/*.o fsdev/*.d ui/*.o ui/*.d qapi/*.o qapi/*.d qga/*.o qga/*.d
+	rm -f qom/*.o qom/*.d
 	rm -f qemu-img-cmds.h
 	rm -f trace/*.o trace/*.d
 	rm -f trace.c trace.h trace.c-timestamp trace.h-timestamp
-- 
tg: (a3b6181..) fix/make-clean (depends on: master)

