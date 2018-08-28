Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fufYV-0005Ui-8C
	for mharc-qemu-trivial@gnu.org; Tue, 28 Aug 2018 11:05:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tgfbeta@me.com>) id 1fue6o-0008Jd-Bj
	for qemu-trivial@nongnu.org; Tue, 28 Aug 2018 09:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tgfbeta@me.com>) id 1fue6n-0003M9-Ns
	for qemu-trivial@nongnu.org; Tue, 28 Aug 2018 09:32:38 -0400
Received: from pv33p36im-asmtp002.me.com ([17.142.213.63]:36911)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tgfbeta@me.com>)
	id 1fue6j-0003Es-Er; Tue, 28 Aug 2018 09:32:33 -0400
Received: from process-dkim-sign-daemon.pv33p36im-asmtp002.me.com by
	pv33p36im-asmtp002.me.com
	(Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built
	May 31 2018)) id <0PE6009009MTXU00@pv33p36im-asmtp002.me.com>; Tue,
	28 Aug 2018 13:32:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=04042017;
	t=1535463151; bh=bVPQ/HkMrJdwrmHFmYF+diAc/R+NBaEYk3ewIGAqpiM=;
	h=From:Content-type:MIME-version:Subject:Message-id:Date:To;
	b=DOSdteOjWOGXITHiu+0EeDF59ybU/0NQBRChmMYmDYMiv+JnI2bv2ng+1uK0k/o60
	5/+W4EFxACfOlkbeNp+ECWSoZkWqiQI9BRBvlYIvNn6SyUvZjgbTetUxA7X9JFNlBW
	aV7UQumft17x7f2j6AL9gJjeIXWiFHnY1gVVtSXuK7Opow2gBinW99x+EDlb93RFdw
	5f+vlMyVzXiDJlUXdHap71Ov2dnhSUaNk1T5PjIEBTFwCEfef4u1sGRh3tWcAtSP0o
	BcyGLN4w282IC5v0uyuO5VqeWorsSkXstylQF1HwHY1mWEY3w34RjoaFivI6fTkhw9
	MuJpEJmJBLN7g==
Received: from icloud.com ([127.0.0.1]) by pv33p36im-asmtp002.me.com
	(Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built
	May 31
	2018)) with ESMTPSA id <0PE600MVLAXV1M00@pv33p36im-asmtp002.me.com>;
	Tue, 28 Aug 2018 13:32:27 +0000 (GMT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	clxscore=1011 suspectscore=1 malwarescore=0 phishscore=0 adultscore=0
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1808280137
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
	definitions=2018-08-28_06:,, signatures=0
From: Chen Zhang <tgfbeta@me.com>
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: quoted-printable
MIME-version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Message-id: <23DA939E-B500-4ABE-A484-1FE1CB43B48A@me.com>
Date: Tue, 28 Aug 2018 21:32:18 +0800
Cc: qemu-trivial@nongnu.org, ehabkost@redhat.com
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3445.9.1)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 17.142.213.63
X-Mailman-Approved-At: Tue, 28 Aug 2018 11:05:14 -0400
Subject: [Qemu-trivial] [PATCH] Add support for TCP path/QMP_PATH in
 scripts/qmp/qmp
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
X-List-Received-Date: Tue, 28 Aug 2018 13:32:39 -0000

=46rom a1f93198020b8c043edab5292db39b52ac77f78b Mon Sep 17 00:00:00 2001

Signed-off-by: Zhang Chen <tgfbeta@me.com>
---
 scripts/qmp/qmp | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/qmp/qmp b/scripts/qmp/qmp
index 6cb46fd..0e8ed19 100755
--- a/scripts/qmp/qmp
+++ b/scripts/qmp/qmp
@@ -63,6 +63,16 @@ def main(args):
     if not path:
         print("QMP path isn't set, use --path=3Dqmp-monitor-address or =
set QMP_PATH")
         return 1
+    tcp_addr =3D path.split(':')
+    if len(tcp_addr) =3D=3D 2:
+        try:
+            port =3D int(tcp_addr[1])
+        except ValueError:
+            print("QMP path contains a non-numeric TCP port")
+            return 1
+        addr =3D ( tcp_addr[0], port )
+    else:
+        addr =3D path
=20
     if len(args):
         command, args =3D args[0], args[1:]
@@ -74,7 +84,7 @@ def main(args):
     if command in ['help']:
         os.execlp('man', 'man', 'qmp')
=20
-    srv =3D QEMUMonitorProtocol(path)
+    srv =3D QEMUMonitorProtocol(addr)
     srv.connect()
=20
     def do_command(srv, cmd, **kwds):
@@ -99,7 +109,7 @@ def main(args):
             raise
         return 0
=20
-    srv =3D QEMUMonitorProtocol(path)
+    srv =3D QEMUMonitorProtocol(addr)
     srv.connect()
=20
     arguments =3D {}
--=20
2.7.4


