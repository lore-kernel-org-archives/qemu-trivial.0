Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwWxU-0002BF-Uu
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 09:00:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XwWxJ-00022G-MQ
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 09:00:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XwWxD-0001de-IX
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 09:00:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XwWww-0001AQ-H7; Thu, 04 Dec 2014 09:00:06 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB4E05Ra023334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 4 Dec 2014 09:00:05 -0500
Received: from blackfin.pond.sub.org (ovpn-116-62.ams2.redhat.com
	[10.36.116.62])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB4E04Fw020336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 4 Dec 2014 09:00:05 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9B32D30411A5; Thu,  4 Dec 2014 15:00:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Dec 2014 15:00:02 +0100
Message-Id: <1417701603-26388-3-git-send-email-armbru@redhat.com>
In-Reply-To: <1417701603-26388-1-git-send-email-armbru@redhat.com>
References: <1417701603-26388-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/3] Fuse g_malloc(); memset() into g_new0()
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
X-List-Received-Date: Thu, 04 Dec 2014 14:00:36 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/uri.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/uri.c b/util/uri.c
index 01dc09e..918d235 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -1004,8 +1004,7 @@ URI *
 uri_new(void) {
     URI *ret;
 
-    ret = (URI *) g_malloc(sizeof(URI));
-    memset(ret, 0, sizeof(URI));
+    ret = g_new0(URI, 1);
     return(ret);
 }
 
-- 
1.9.3


