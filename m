Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TWnCB-0003OW-Ib
	for mharc-qemu-trivial@gnu.org; Fri, 09 Nov 2012 06:56:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1TWnC3-00032G-8j
	for qemu-trivial@nongnu.org; Fri, 09 Nov 2012 06:56:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1TWnBx-0000TU-Jf
	for qemu-trivial@nongnu.org; Fri, 09 Nov 2012 06:56:15 -0500
Received: from smtp.citrix.com ([66.165.176.89]:8119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>)
	id 1TWnBq-0000RX-JV; Fri, 09 Nov 2012 06:56:02 -0500
X-IronPort-AV: E=Sophos;i="4.80,744,1344211200"; d="scan'208";a="44057280"
Received: from ftlpmailmx02.citrite.net ([10.13.107.66])
	by FTLPIPO01.CITRIX.COM with ESMTP/TLS/RC4-MD5;
	09 Nov 2012 11:56:00 +0000
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.66) with Microsoft SMTP Server id 8.3.279.1;
	Fri, 9 Nov 2012 06:56:00 -0500
Received: from [10.80.3.61] (helo=perard.uk.xensource.com)	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<anthony.perard@citrix.com>)	id 1TWnBn-0007bR-Ob;
	Fri, 09 Nov 2012 11:55:59 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: QEMU-devel <qemu-devel@nongnu.org>
Date: Fri, 9 Nov 2012 11:50:54 +0000
Message-ID: <1352461854-18195-1-git-send-email-anthony.perard@citrix.com>
X-Mailer: git-send-email 1.8.0
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH V2] qemu-sockets: Fix parsing of the inet
	option 'to'.
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
X-List-Received-Date: Fri, 09 Nov 2012 11:56:21 -0000

Having a qemu command line argument like "-vnc 127.0.0.1:0,to=99" is broken.
This have been break with commit 879e45c72da1569e07fbbc6a1aa2a708ea796044.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

---
 qemu-sockets.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/qemu-sockets.c b/qemu-sockets.c
index abcd791..03ca98d 100644
--- a/qemu-sockets.c
+++ b/qemu-sockets.c
@@ -551,8 +551,9 @@ static InetSocketAddress *inet_parse(const char *str, Error **errp)
     optstr = str + pos;
     h = strstr(optstr, ",to=");
     if (h) {
-        if (1 != sscanf(str, "%d%n", &to, &pos) ||
-            (str[pos] != '\0' && str[pos] != ',')) {
+        h += 4;
+        if (sscanf(h, "%d%n", &to, &pos) != 1 ||
+            (h[pos] != '\0' && h[pos] != ',')) {
             error_setg(errp, "error parsing to= argument");
             goto fail;
         }
-- 
Anthony PERARD

