Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnPhQ-0002YN-Tc
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 08:35:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1bnPhM-0002Um-RY
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 08:35:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1bnPhK-0008Sl-U1
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 08:35:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>)
	id 1bnPhD-0008PY-Ae; Fri, 23 Sep 2016 08:35:15 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2C5B1CCC40;
	Fri, 23 Sep 2016 12:35:14 +0000 (UTC)
Received: from localhost (ovpn-116-40.phx2.redhat.com [10.3.116.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8NCZCL7011375; Fri, 23 Sep 2016 08:35:13 -0400
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Fri, 23 Sep 2016 16:35:08 +0400
Message-Id: <20160923123508.27000-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 23 Sep 2016 12:35:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] build-sys: fix find-in-path
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
X-List-Received-Date: Fri, 23 Sep 2016 12:35:28 -0000

Fix spelling, the GNU make text functions is not called "find-string"
but "findstring".

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 rules.mak | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rules.mak b/rules.mak
index 5c82c19..f721988 100644
--- a/rules.mak
+++ b/rules.mak
@@ -132,7 +132,7 @@ endef
 # Looks in the PATH if the argument contains no slash, else only conside=
rs one
 # specific directory.  Returns an # empty string if the program doesn't =
exist
 # there.
-find-in-path =3D $(if $(find-string /, $1), \
+find-in-path =3D $(if $(findstring /, $1), \
         $(wildcard $1), \
         $(wildcard $(patsubst %, %/$1, $(subst :, ,$(PATH)))))
=20
--=20
2.10.0


