Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG8mM-0007dp-Eh
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 11:14:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YG8mJ-0007Z6-P2
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 11:14:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YG8mE-0002c1-RB
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 11:14:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YG8m3-0002an-PQ; Tue, 27 Jan 2015 11:13:55 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0RGDsrH032622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 27 Jan 2015 11:13:55 -0500
Received: from blackfin.pond.sub.org (ovpn-116-17.ams2.redhat.com
	[10.36.116.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0RGDrjZ000740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 27 Jan 2015 11:13:54 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BFEED30A4C15; Tue, 27 Jan 2015 17:13:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Jan 2015 17:13:52 +0100
Message-Id: <1422375232-29283-4-git-send-email-armbru@redhat.com>
In-Reply-To: <1422375232-29283-1-git-send-email-armbru@redhat.com>
References: <1422375232-29283-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH 3/3] util/uri: URI member path can be null,
	compare more carfully
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
X-List-Received-Date: Tue, 27 Jan 2015 16:14:13 -0000

uri_resolve_relative() calls strcmp(bas->path, ref->path).  However,
either argument could be null!  Evidence: the code checks for null
after the comparison.  Spotted by Coverity.

I suspect this was screwed up when we stole the code from libxml2.
There the conditional reads

    xmlStrEqual((xmlChar *)bas->path, (xmlChar *)ref->path)

with

    int
    xmlStrEqual(const xmlChar *str1, const xmlChar *str2) {
	if (str1 == str2) return(1);
	if (str1 == NULL) return(0);
	if (str2 == NULL) return(0);
	do {
	    if (*str1++ != *str2) return(0);
	} while (*str2++);
	return(1);
    }

Fix by replicating libxml2's logic faithfully.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/uri.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/uri.c b/util/uri.c
index b9a7b54..1cfd78b 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -1935,7 +1935,8 @@ uri_resolve_relative (const char *uri, const char * base)
 	val = g_strdup (uri);
 	goto done;
     }
-    if (!strcmp(bas->path, ref->path)) {
+    if (bas->path == ref->path ||
+        (bas->path && ref->path && !strcmp(bas->path, ref->path))) {
 	val = g_strdup("");
 	goto done;
     }
-- 
1.9.3


