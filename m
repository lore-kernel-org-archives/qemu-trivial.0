Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur0Ro-0004sS-DK
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 02:40:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rc-0004Oj-QB
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Ra-0007FF-Tz
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ur0RS-0006xI-PP; Mon, 24 Jun 2013 02:39:58 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O6dwgO011840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 02:39:58 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5O6dv88025568; Mon, 24 Jun 2013 02:39:57 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id D302F416EE; Mon, 24 Jun 2013 08:39:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2013 08:39:47 +0200
Message-Id: <1372055996-4072-5-git-send-email-kraxel@redhat.com>
In-Reply-To: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 04/13] qemu-char: check optional fields
	using has_*
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
X-List-Received-Date: Mon, 24 Jun 2013 06:40:12 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-char.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 2c3cfe6..ee7c70e 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3500,7 +3500,7 @@ static CharDriverState *qmp_chardev_open_file(ChardevFile *file, Error **errp)
 {
     HANDLE out;
 
-    if (file->in) {
+    if (file->has_in) {
         error_setg(errp, "input file not supported");
         return NULL;
     }
@@ -3551,7 +3551,7 @@ static CharDriverState *qmp_chardev_open_file(ChardevFile *file, Error **errp)
         return NULL;
     }
 
-    if (file->in) {
+    if (file->has_in) {
         flags = O_RDONLY;
         in = qmp_chardev_open_file_source(file->in, flags, errp);
         if (error_is_set(errp)) {
-- 
1.7.9.7


