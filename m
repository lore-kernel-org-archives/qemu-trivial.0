Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL8se-0007vo-7V
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 06:21:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL8sb-0007qO-Cu
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 06:21:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL8sa-0007Qy-J7
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 06:21:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL8sL-0007MG-06; Tue, 10 Feb 2015 06:21:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BC8E5418E5;
	Tue, 10 Feb 2015 14:21:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1D79393A;
	Tue, 10 Feb 2015 09:34:45 +0300 (MSK)
Received: (nullmailer pid 9377 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:11 +0300
Message-Id: <96c044afdf600e9418b3e509e60ef51a841eed20.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 22/46] qemu-option: Replace pointless use of
	g_malloc0() by g_malloc()
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
X-List-Received-Date: Tue, 10 Feb 2015 11:21:22 -0000

From: Markus Armbruster <armbru@redhat.com>

get_opt_value() takes a write-only buffer, so zeroing it is pointless.
We don't do it elsewhere, either.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/qemu-option.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index a708241..c779150 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -213,7 +213,7 @@ void parse_option_size(const char *name, const char *value,
 bool has_help_option(const char *param)
 {
     size_t buflen = strlen(param) + 1;
-    char *buf = g_malloc0(buflen);
+    char *buf = g_malloc(buflen);
     const char *p = param;
     bool result = false;
 
@@ -237,7 +237,7 @@ out:
 bool is_valid_option_list(const char *param)
 {
     size_t buflen = strlen(param) + 1;
-    char *buf = g_malloc0(buflen);
+    char *buf = g_malloc(buflen);
     const char *p = param;
     bool result = true;
 
-- 
2.1.4


