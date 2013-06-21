Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Upyk0-00067a-IC
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 06:38:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjo-0005jr-34
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyji-0007nA-PF
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Upyjd-0007j4-0D; Fri, 21 Jun 2013 06:38:29 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5LAcSZj017651
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Jun 2013 06:38:28 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5LAcReR025411; Fri, 21 Jun 2013 06:38:27 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id E489943274; Fri, 21 Jun 2013 12:38:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2013 12:38:21 +0200
Message-Id: <1371811105-730-10-git-send-email-kraxel@redhat.com>
In-Reply-To: <1371811105-730-1-git-send-email-kraxel@redhat.com>
References: <1371811105-730-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH 09/13] qemu-char: use ChardevBackendKind in
	in CharDriver
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
X-List-Received-Date: Fri, 21 Jun 2013 10:38:44 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-char.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-char.c b/qemu-char.c
index 5751391..1c0903f 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3127,7 +3127,7 @@ typedef struct CharDriver {
     /* old, pre qapi */
     CharDriverState *(*open)(QemuOpts *opts);
     /* new, qapi-based */
-    int kind;
+    ChardevBackendKind kind;
     void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 } CharDriver;
 
-- 
1.7.9.7


