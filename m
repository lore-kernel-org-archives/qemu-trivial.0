Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uoq8S-0002PT-Cg
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 03:15:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uomtk-0002US-JN
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:48:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uomtj-0000UR-Ky
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:48:00 -0400
Received: from [222.73.24.84] (port=50940 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Uomtj-0000U5-9t; Mon, 17 Jun 2013 23:47:59 -0400
X-IronPort-AV: E=Sophos;i="4.87,886,1363104000"; 
   d="scan'208";a="7584433"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 18 Jun 2013 11:45:00 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5I3lsxq016477;
	Tue, 18 Jun 2013 11:47:54 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061811455223-2222870 ;
	Tue, 18 Jun 2013 11:45:52 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 18 Jun 2013 11:45:33 +0800
Message-Id: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/18 11:45:52,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/18 11:45:52
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
X-Mailman-Approved-At: Tue, 18 Jun 2013 03:15:21 -0400
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH_v2_1/5=5D_vnc=3A_pass_bool_para?=
	=?utf-8?q?meter_for_some_functions?=
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
X-List-Received-Date: Tue, 18 Jun 2013 03:48:01 -0000

last parameters of vnc=5Flisten=5Fread,vnc=5Fconnect are bool,
so pass 'false/true' instead of '0/1' for them.

Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 ui/vnc.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index dfc7459..1a8b940 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2889,13 +2889,13 @@ static void vnc=5Flisten=5Fread(void *opaque, bool =
websocket)
=20
 static void vnc=5Flisten=5Fregular=5Fread(void *opaque)
 {
-    vnc=5Flisten=5Fread(opaque, 0);
+    vnc=5Flisten=5Fread(opaque, false);
 }
=20
 #ifdef CONFIG=5FVNC=5FWS
 static void vnc=5Flisten=5Fwebsocket=5Fread(void *opaque)
 {
-    vnc=5Flisten=5Fread(opaque, 1);
+    vnc=5Flisten=5Fread(opaque, true);
 }
 #endif /* CONFIG=5FVNC=5FWS */
=20
@@ -3283,7 +3283,7 @@ void vnc=5Fdisplay=5Fopen(DisplayState *ds, const cha=
r *display, Error **errp)
         if (csock < 0) {
             goto fail;
         }
-        vnc=5Fconnect(vs, csock, 0, 0);
+        vnc=5Fconnect(vs, csock, 0, false);
     } else {
         /* listen for connects */
         char *dpy;
@@ -3345,5 +3345,5 @@ void vnc=5Fdisplay=5Fadd=5Fclient(DisplayState *ds, i=
nt csock, int skipauth)
 {
     VncDisplay *vs =3D vnc=5Fdisplay;
=20
-    vnc=5Fconnect(vs, csock, skipauth, 0);
+    vnc=5Fconnect(vs, csock, skipauth, false);
 }
--=20
1.7.2.5

=

