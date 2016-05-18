Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30Mw-0000Fc-BW
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:14:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Mq-00009N-Rj
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:14:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Mp-00031t-SB
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:14:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49470)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30Mk-00030Q-93; Wed, 18 May 2016 08:14:18 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 02ED3417A0;
	Wed, 18 May 2016 15:14:17 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id AC5D7AE2;
	Wed, 18 May 2016 15:06:11 +0300 (MSK)
Received: (nullmailer pid 12392 invoked by uid 1000);
	Wed, 18 May 2016 12:06:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:06:01 +0300
Message-Id: <de4905f4bc645ad2991b9b535e8902f81abaf8c7.1463573089.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
References: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/13] qdict: fix unbounded stack warning for
 qdict_array_entries
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
X-List-Received-Date: Wed, 18 May 2016 12:14:29 -0000

From: Peter Xu <peterx@redhat.com>

Here we use one g_strdup_printf() to replace the two stack allocated
array, considering it's more convenient, safe, and as long as it's
called rarely only when quorum device opens. This will remove the
unbound stack warning when compiling with "-Wstack-usage=1000000".

Reviewed-by:   Eric Blake <eblake@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qobject/qdict.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/qobject/qdict.c b/qobject/qdict.c
index a128536..60f158c 100644
--- a/qobject/qdict.c
+++ b/qobject/qdict.c
@@ -705,19 +705,16 @@ int qdict_array_entries(QDict *src, const char *subqdict)
     for (i = 0; i < INT_MAX; i++) {
         QObject *subqobj;
         int subqdict_entries;
-        size_t slen = 32 + subqdict_len;
-        char indexstr[slen], prefix[slen];
-        size_t snprintf_ret;
+        char *prefix = g_strdup_printf("%s%u.", subqdict, i);
 
-        snprintf_ret = snprintf(indexstr, slen, "%s%u", subqdict, i);
-        assert(snprintf_ret < slen);
+        subqdict_entries = qdict_count_prefixed_entries(src, prefix);
 
-        subqobj = qdict_get(src, indexstr);
+        /* Remove ending "." */
+        prefix[strlen(prefix) - 1] = 0;
+        subqobj = qdict_get(src, prefix);
 
-        snprintf_ret = snprintf(prefix, slen, "%s%u.", subqdict, i);
-        assert(snprintf_ret < slen);
+        g_free(prefix);
 
-        subqdict_entries = qdict_count_prefixed_entries(src, prefix);
         if (subqdict_entries < 0) {
             return subqdict_entries;
         }
-- 
2.1.4


