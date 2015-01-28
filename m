Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGU0f-000828-5j
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 09:54:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YGU0Y-0007oL-58
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 09:54:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YGU0X-0006Iu-9N
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 09:54:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45581)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YGU0P-0006Gc-4p; Wed, 28 Jan 2015 09:54:09 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0SEs7fu021491
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 28 Jan 2015 09:54:08 -0500
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0SEs557021854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 28 Jan 2015 09:54:06 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 010CF30000B4; Wed, 28 Jan 2015 15:54:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Jan 2015 15:54:01 +0100
Message-Id: <1422456844-13043-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1422456844-13043-1-git-send-email-armbru@redhat.com>
References: <1422456844-13043-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/4] qemu-option: Replace pointless use of
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
X-List-Received-Date: Wed, 28 Jan 2015 14:54:23 -0000

get_opt_value() takes a write-only buffer, so zeroing it is pointless.
We don't do it elsewhere, either.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
1.9.3


