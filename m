Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ff9eA-0005d2-Mp
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jul 2018 15:59:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ff9e8-0005bw-K7
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 15:59:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ff9e7-00012W-Vy
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 15:59:00 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:25194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1ff9e2-00010g-Ri; Mon, 16 Jul 2018 15:58:55 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 2B6B17456B9;
	Mon, 16 Jul 2018 21:58:51 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 0FE177456B7; Mon, 16 Jul 2018 21:58:51 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Mon, 16 Jul 2018 21:47:37 +0200
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20180716195851.0FE177456B7@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-trivial] [PATCH] Do not enable QOM debugging by default
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
X-List-Received-Date: Mon, 16 Jul 2018 19:59:01 -0000

Commit 3556c233d 5 years ago added an option to disable QOM debugging,
noting that it can have high performance cost but left the default to on.
Change the default to off and only enable it when debugging is requested
to avoid the performance penalty for those compiling without debug options.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 configure | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 2a7796e..a8fc1ed 100755
--- a/configure
+++ b/configure
@@ -415,7 +415,7 @@ bsd_user="no"
 blobs="yes"
 pkgversion=""
 pie=""
-qom_cast_debug="yes"
+qom_cast_debug="no"
 trace_backends="log"
 trace_file="trace"
 spice=""
@@ -1062,6 +1062,7 @@ for opt do
       debug_tcg="yes"
       debug_mutex="yes"
       debug="yes"
+      qom_cast_debug="yes"
       strip_opt="no"
       fortify_source="no"
   ;;
-- 
2.7.6


