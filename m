Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WGpM0-0000oM-9F
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2014 07:37:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WGpLs-0000dq-NA
	for qemu-trivial@nongnu.org; Fri, 21 Feb 2014 07:37:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WGpLm-0005mf-Mq
	for qemu-trivial@nongnu.org; Fri, 21 Feb 2014 07:37:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:64254)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WGpLa-0005ke-Ad; Fri, 21 Feb 2014 07:36:54 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1LCapDI006723
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Feb 2014 07:36:52 -0500
Received: from blackfin.pond.sub.org (ovpn-116-49.ams2.redhat.com
	[10.36.116.49])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1LCao7w011395
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 21 Feb 2014 07:36:51 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6A1EE200CF; Fri, 21 Feb 2014 13:36:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Feb 2014 13:36:49 +0100
Message-Id: <1392986209-32162-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qga: Fix memory allocation pasto
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
X-List-Received-Date: Fri, 21 Feb 2014 12:37:18 -0000

qmp_guest_file_seek() allocates memory for a GuestFileRead object
instead of the GuestFileSeek object it actually uses.  Harmless,
because the GuestFileRead is slightly larger.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qga/commands-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index cae4171..2c496b6 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -525,7 +525,7 @@ struct GuestFileSeek *qmp_guest_file_seek(int64_t handle, int64_t offset,
     if (ret == -1) {
         error_setg_errno(err, errno, "failed to seek file");
     } else {
-        seek_data = g_malloc0(sizeof(GuestFileRead));
+        seek_data = g_new0(GuestFileSeek, 1);
         seek_data->position = ftell(fh);
         seek_data->eof = feof(fh);
     }
-- 
1.8.1.4


