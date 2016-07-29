Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bSxDu-00070n-1J
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jul 2016 22:08:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bSxDr-0006zO-RW
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 22:08:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bSxDp-0007UE-Ri
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 22:08:22 -0400
Received: from [59.151.112.132] (port=62297 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bSxDj-0007Re-2S; Thu, 28 Jul 2016 22:08:16 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9281968"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2016 10:08:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 64DCB42984D8;
	Fri, 29 Jul 2016 10:08:09 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 29 Jul 2016 10:08:09 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, "Daniel P. Berrange" <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>
Date: Fri, 29 Jul 2016 10:15:46 +0800
Message-ID: <1469758546-21040-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 64DCB42984D8.ADB21
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v2] util/qemu-sockets: revert Yoda Conditions
 to normal
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
X-List-Received-Date: Fri, 29 Jul 2016 02:08:24 -0000

Follow CODING_STYLE

Cc: Daniel P. Berrange <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 util/qemu-sockets.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

v2 changelog:
1. fix to Eric's comments.

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 5e08723..2d48629 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -386,7 +386,8 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
         goto err;
     }
 
-    if (0 != (rc = getaddrinfo(addr, port, &ai, &peer))) {
+    rc = getaddrinfo(addr, port, &ai, &peer);
+    if (rc != 0) {
         error_setg(errp, "address resolution failed for %s:%s: %s", addr, port,
                    gai_strerror(rc));
         goto err;
@@ -412,7 +413,8 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
         port = "0";
     }
 
-    if (0 != (rc = getaddrinfo(addr, port, &ai, &local))) {
+    rc = getaddrinfo(addr, port, &ai, &local);
+    if (rc != 0) {
         error_setg(errp, "address resolution failed for %s:%s: %s", addr, port,
                    gai_strerror(rc));
         goto err;
@@ -472,20 +474,20 @@ InetSocketAddress *inet_parse(const char *str, Error **errp)
     if (str[0] == ':') {
         /* no host given */
         host[0] = '\0';
-        if (1 != sscanf(str, ":%32[^,]%n", port, &pos)) {
+        if (sscanf(str, ":%32[^,]%n", port, &pos) != 1) {
             error_setg(errp, "error parsing port in address '%s'", str);
             goto fail;
         }
     } else if (str[0] == '[') {
         /* IPv6 addr */
-        if (2 != sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos)) {
+        if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) != 2) {
             error_setg(errp, "error parsing IPv6 address '%s'", str);
             goto fail;
         }
         addr->ipv6 = addr->has_ipv6 = true;
     } else {
         /* hostname or IPv4 addr */
-        if (2 != sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos)) {
+        if (sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos) != 2) {
             error_setg(errp, "error parsing address '%s'", str);
             goto fail;
         }
-- 
2.1.0




