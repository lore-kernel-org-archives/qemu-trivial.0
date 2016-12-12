Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cGVAy-00012G-US
	for mharc-qemu-trivial@gnu.org; Mon, 12 Dec 2016 13:18:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cGUSj-0004BE-Bf
	for qemu-trivial@nongnu.org; Mon, 12 Dec 2016 12:32:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cGUSe-00010h-7w
	for qemu-trivial@nongnu.org; Mon, 12 Dec 2016 12:32:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36022)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1cGUSc-0000yB-5z; Mon, 12 Dec 2016 12:32:22 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6316761BBB;
	Mon, 12 Dec 2016 17:32:21 +0000 (UTC)
Received: from localhost (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBCHWIG6030114; Mon, 12 Dec 2016 12:32:20 -0500
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Mon, 12 Dec 2016 20:31:51 +0300
Message-Id: <20161212173151.18092-3-marcandre.lureau@redhat.com>
In-Reply-To: <20161212173151.18092-1-marcandre.lureau@redhat.com>
References: <20161212173151.18092-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 12 Dec 2016 17:32:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 3/3] object: make some funcs static
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
X-List-Received-Date: Mon, 12 Dec 2016 17:32:30 -0000

There is no need to have those functions as public API.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 qom/object.c         |  4 ++--
 include/qom/object.h | 24 ------------------------
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 7a05e35ed9..eb3d0f64e4 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -351,7 +351,7 @@ static void object_post_init_with_type(Object *obj, T=
ypeImpl *ti)
     }
 }
=20
-void object_initialize_with_type(void *data, size_t size, TypeImpl *type=
)
+static void object_initialize_with_type(void *data, size_t size, TypeImp=
l *type)
 {
     Object *obj =3D data;
=20
@@ -467,7 +467,7 @@ static void object_finalize(void *data)
     }
 }
=20
-Object *object_new_with_type(Type type)
+static Object *object_new_with_type(Type type)
 {
     Object *obj;
=20
diff --git a/include/qom/object.h b/include/qom/object.h
index c5456db05d..e9791a210e 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -586,18 +586,6 @@ struct InterfaceClass
  */
 Object *object_new(const char *typename);
=20
-/**
- * object_new_with_type:
- * @type: The type of the object to instantiate.
- *
- * This function will initialize a new object using heap allocated memor=
y.
- * The returned object has a reference count of 1, and will be freed whe=
n
- * the last reference is dropped.
- *
- * Returns: The newly allocated and instantiated object.
- */
-Object *object_new_with_type(Type type);
-
 /**
  * object_new_with_props:
  * @typename:  The name of the type of the object to instantiate.
@@ -726,18 +714,6 @@ int object_set_propv(Object *obj,
                      Error **errp,
                      va_list vargs);
=20
-/**
- * object_initialize_with_type:
- * @data: A pointer to the memory to be used for the object.
- * @size: The maximum size available at @data for the object.
- * @type: The type of the object to instantiate.
- *
- * This function will initialize an object.  The memory for the object s=
hould
- * have already been allocated.  The returned object has a reference cou=
nt of 1,
- * and will be finalized when the last reference is dropped.
- */
-void object_initialize_with_type(void *data, size_t size, Type type);
-
 /**
  * object_initialize:
  * @obj: A pointer to the memory to be used for the object.
--=20
2.11.0


