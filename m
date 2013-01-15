Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tuvl4-0004i8-JS
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2013 20:56:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Tuvl1-0004ZW-O8
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 20:56:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Tuvl0-0001ta-JM
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 20:56:07 -0500
Received: from cantor2.suse.de ([195.135.220.15]:55754 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Tuvky-0001m4-2f; Mon, 14 Jan 2013 20:56:04 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 37171A38EA;
	Tue, 15 Jan 2013 02:55:21 +0100 (CET)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Tue, 15 Jan 2013 02:55:10 +0100
Message-Id: <1358214910-12581-1-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, anthony@codemonkey.ws,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH for-1.4 v2] qom: Make
	object_resolve_path_component() path argument const
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
X-List-Received-Date: Tue, 15 Jan 2013 01:56:08 -0000

A usage with a hardcoded partial path such as

  object_resolve_path_component(obj, "foo")

is totally valid but currently leads to a compilation error. Fix this.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 include/qom/object.h |    2 +-
 qom/object.c         |    2 +-
 2 Dateien ge=C3=A4ndert, 2 Zeilen hinzugef=C3=BCgt(+), 2 Zeilen entfernt=
(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index d43b289..1ef2f0e 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -900,7 +900,7 @@ Object *object_resolve_path_type(const char *path, co=
nst char *typename,
  *
  * Returns: The resolved object or NULL on path lookup failure.
  */
-Object *object_resolve_path_component(Object *parent, gchar *part);
+Object *object_resolve_path_component(Object *parent, const gchar *part)=
;
=20
 /**
  * object_property_add_child:
diff --git a/qom/object.c b/qom/object.c
index 351b88c..03e6f24 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1017,7 +1017,7 @@ gchar *object_get_canonical_path(Object *obj)
     return newpath;
 }
=20
-Object *object_resolve_path_component(Object *parent, gchar *part)
+Object *object_resolve_path_component(Object *parent, const gchar *part)
 {
     ObjectProperty *prop =3D object_property_find(parent, part, NULL);
     if (prop =3D=3D NULL) {
--=20
1.7.10.4


