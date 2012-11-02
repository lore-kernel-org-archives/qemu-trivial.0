Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TUBhZ-00011v-EW
	for mharc-qemu-trivial@gnu.org; Fri, 02 Nov 2012 03:30:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TUBhW-0000tz-UE
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2012 03:29:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TUBhW-0001aB-0V
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2012 03:29:58 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:38597)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TUBhT-0001Yy-Ht; Fri, 02 Nov 2012 03:29:55 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C0857728003A; Fri,  2 Nov 2012 08:29:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id gyUr4R+NjLN7; Fri,  2 Nov 2012 08:29:54 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 1B1B3728003D; Fri,  2 Nov 2012 08:29:54 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  2 Nov 2012 08:29:53 +0100
Message-Id: <1351841393-32625-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Fix comments (adress -> address,
	layed -> laid, wierd -> weird)
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
X-List-Received-Date: Fri, 02 Nov 2012 07:30:00 -0000

Remove also a duplicated 'the'.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 slirp/ip_icmp.c |    2 +-
 tcg/tcg.h       |    4 ++--
 uri.c           |    4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/slirp/ip_icmp.c b/slirp/ip_icmp.c
index d571fd0..9f1cb08 100644
--- a/slirp/ip_icmp.c
+++ b/slirp/ip_icmp.c
@@ -352,7 +352,7 @@ icmp_error(struct mbuf *msrc, u_char type, u_char code, int minsize,
 
   ip->ip_ttl = MAXTTL;
   ip->ip_p = IPPROTO_ICMP;
-  ip->ip_dst = ip->ip_src;    /* ip adresses */
+  ip->ip_dst = ip->ip_src;    /* ip addresses */
   ip->ip_src = m->slirp->vhost_addr;
 
   (void ) ip_output((struct socket *)NULL, m);
diff --git a/tcg/tcg.h b/tcg/tcg.h
index a6c9256..db86a73 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -272,8 +272,8 @@ typedef int TCGv_i64;
 #define TCG_CALL_DUMMY_TCGV     MAKE_TCGV_I32(-1)
 #define TCG_CALL_DUMMY_ARG      ((TCGArg)(-1))
 
-/* Conditions.  Note that these are layed out for easy manipulation by
-   the the functions below:
+/* Conditions.  Note that these are laid out for easy manipulation by
+   the functions below:
      bit 0 is used for inverting;
      bit 1 is signed,
      bit 2 is unsigned,
diff --git a/uri.c b/uri.c
index dd922de..138547b 100644
--- a/uri.c
+++ b/uri.c
@@ -432,7 +432,7 @@ rfc3986_parse_host(URI *uri, const char **str)
 
     host = cur;
     /*
-     * IPv6 and future adressing scheme are enclosed between brackets
+     * IPv6 and future addressing scheme are enclosed between brackets
      */
     if (*cur == '[') {
         cur++;
@@ -1917,7 +1917,7 @@ done:
  *     http://site1.com/docs/pic1.gif   http://site1.com/docs/pic1.gif
  *
  *
- * Note: if the URI reference is really wierd or complicated, it may be
+ * Note: if the URI reference is really weird or complicated, it may be
  *       worthwhile to first convert it into a "nice" one by calling
  *       uri_resolve (using 'base') before calling this routine,
  *       since this routine (for reasonable efficiency) assumes URI has
-- 
1.7.10.4


