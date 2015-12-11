Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a7Ndc-0006lT-H8
	for mharc-qemu-trivial@gnu.org; Fri, 11 Dec 2015 08:21:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jonathan.ashley@altran.com>) id 1a7Lt9-0003dS-E0
	for qemu-trivial@nongnu.org; Fri, 11 Dec 2015 06:29:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jonathan.ashley@altran.com>) id 1a7Lt8-0000HP-Kw
	for qemu-trivial@nongnu.org; Fri, 11 Dec 2015 06:29:27 -0500
Received: from smtp3.altran.com ([194.98.79.84]:47702 helo=smtp5.altran.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jonathan.ashley@altran.com>)
	id 1a7Lt2-0000GY-Ir; Fri, 11 Dec 2015 06:29:20 -0500
Received: from XCH-DCFR-34.europe.corp.altran.com (unknown [10.0.6.14])
	by Websense Email Security Gateway with ESMTPS id 0F8FBBA5719BE;
	Fri, 11 Dec 2015 12:29:15 +0100 (CET)
Received: from XMB-DCFR-37.europe.corp.altran.com
	([fe80::80ba:99a3:be27:fa11]) by XCH-DCFR-34.europe.corp.altran.com
	([10.0.6.14]) with mapi id 14.03.0248.002;
	Fri, 11 Dec 2015 12:29:16 +0100
From: Ashley Jonathan <jonathan.ashley@altran.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH] Keep pty slave file descriptor open until the master
	is closed
Thread-Index: AdE0BeDuGw5r/QTuRKe5Y8+l1lqE9A==
Date: Fri, 11 Dec 2015 11:29:16 +0000
Message-ID: <AC19797808C8D548ABDE0CA4A97AA30A30DEB409@XMB-DCFR-37.europe.corp.altran.com>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.6.253]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.79.84
X-Mailman-Approved-At: Fri, 11 Dec 2015 08:21:30 -0500
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] Keep pty slave file descriptor open until
 the master is closed
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
X-List-Received-Date: Fri, 11 Dec 2015 11:29:28 -0000

I have experienced a minor difficulty using QEMU with the "-serial pty" opt=
ion:

If a process opens the slave pts device, writes data to it, then immediatel=
y closes it, the data doesn't reliably get delivered to the emulated serial=
 port. This seems to be because a read of the master pty device returns EIO=
 on Linux if no process has the pts device open, even when data is waiting =
"in the pipe".

A fix seems to be for QEMU to keep the pts file descriptor open until the p=
ty is closed, as per the below patch.

---
 qemu-char.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/qemu-char.c b/qemu-char.c
index 2969c44..ed03ba0 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1198,6 +1198,7 @@ typedef struct {
     int connected;
     guint timer_tag;
     guint open_tag;
+    int slave_fd;
 } PtyCharDriver;
=20
 static void pty_chr_update_read_handler_locked(CharDriverState *chr);
@@ -1373,6 +1374,7 @@ static void pty_chr_close(struct CharDriverState *chr=
)
=20
     qemu_mutex_lock(&chr->chr_write_lock);
     pty_chr_state(chr, 0);
+    close(s->slave_fd);
     fd =3D g_io_channel_unix_get_fd(s->fd);
     g_io_channel_unref(s->fd);
     close(fd);
@@ -1401,7 +1403,6 @@ static CharDriverState *qemu_chr_open_pty(const char =
*id,
         return NULL;
     }
=20
-    close(slave_fd);
     qemu_set_nonblock(master_fd);
=20
     chr =3D qemu_chr_alloc();
@@ -1422,6 +1423,7 @@ static CharDriverState *qemu_chr_open_pty(const char =
*id,
     chr->explicit_be_open =3D true;
=20
     s->fd =3D io_channel_from_fd(master_fd);
+    s->slave_fd =3D slave_fd;
     s->timer_tag =3D 0;
=20
     return chr;
--=20
2.1.4



---
Jonathan Ashley=20
jonathan.ashley AT altran.com

