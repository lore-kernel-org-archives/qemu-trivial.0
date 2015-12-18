Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9rvn-00071J-GL
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2015 05:06:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1a9rvg-0006qi-7j
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 05:06:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1a9rvf-0006wF-7P
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 05:06:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>)
	id 1a9rva-0006vb-QQ; Fri, 18 Dec 2015 05:06:22 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 6FAAE19CF99;
	Fri, 18 Dec 2015 10:06:22 +0000 (UTC)
Received: from localhost (dhcp-193-106.cdg.redhat.com [10.32.193.106])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBIA6Le3001146; Fri, 18 Dec 2015 05:06:22 -0500
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Date: Fri, 18 Dec 2015 11:06:12 +0100
Message-Id: <1450433172-1175-1-git-send-email-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [Qemu-trivial] [PATCH] misc: spelling
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
X-List-Received-Date: Fri, 18 Dec 2015 10:06:33 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
 monitor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor.c b/monitor.c
index e7e7ae2..51ec4c3 100644
--- a/monitor.c
+++ b/monitor.c
@@ -311,7 +311,7 @@ static void monitor_flush_locked(Monitor *mon)
             return;
         }
         if (rc > 0) {
-            /* partinal write */
+            /* partial write */
             QString *tmp =3D qstring_from_str(buf + rc);
             QDECREF(mon->outbuf);
             mon->outbuf =3D tmp;
--=20
2.5.0


