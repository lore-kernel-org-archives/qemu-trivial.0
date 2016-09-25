Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1boGUw-0003KT-SS
	for mharc-qemu-trivial@gnu.org; Sun, 25 Sep 2016 16:58:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1boGUt-0003FO-Bf
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2016 16:58:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1boGUr-00079G-GK
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2016 16:58:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35664)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>)
	id 1boGUo-00078M-A7; Sun, 25 Sep 2016 16:57:58 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD5E581129;
	Sun, 25 Sep 2016 20:57:57 +0000 (UTC)
Received: from localhost (ovpn-116-27.phx2.redhat.com [10.3.116.27])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8PKvtmb018651; Sun, 25 Sep 2016 16:57:56 -0400
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Mon, 26 Sep 2016 00:57:48 +0400
Message-Id: <20160925205748.6280-2-marcandre.lureau@redhat.com>
In-Reply-To: <20160925205748.6280-1-marcandre.lureau@redhat.com>
References: <20160925205748.6280-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sun, 25 Sep 2016 20:57:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/2] build-sys: put glib_cflags in QEMU_CFLAGS
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
X-List-Received-Date: Sun, 25 Sep 2016 20:58:04 -0000

This way, overriding CFLAGS on make command line keeps glib-cflags
and doesn't break the build.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index c831600..5412d4f 100755
--- a/configure
+++ b/configure
@@ -2933,7 +2933,7 @@ for i in $glib_modules; do
     if $pkg_config --atleast-version=3D$glib_req_ver $i; then
         glib_cflags=3D$($pkg_config --cflags $i)
         glib_libs=3D$($pkg_config --libs $i)
-        CFLAGS=3D"$glib_cflags $CFLAGS"
+        QEMU_CFLAGS=3D"$glib_cflags $QEMU_CFLAGS"
         LIBS=3D"$glib_libs $LIBS"
         libs_qga=3D"$glib_libs $libs_qga"
     else
--=20
2.10.0


