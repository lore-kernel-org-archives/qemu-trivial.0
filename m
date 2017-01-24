Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVzqN-0000mX-Ir
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 07:04:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVzqI-0000hI-J6
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 07:04:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVzqH-00009a-Ml
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 07:04:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53915)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVzqC-00005Q-B1; Tue, 24 Jan 2017 07:04:48 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CB0D34212B;
	Tue, 24 Jan 2017 15:04:47 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 23318569;
	Tue, 24 Jan 2017 12:39:43 +0300 (MSK)
Received: (nullmailer pid 12628 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:14 +0300
Message-Id: <35109e5b912c2c6658e9f6873da9c9f193a7083e.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/31] object: make some funcs static
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
X-List-Received-Date: Tue, 24 Jan 2017 12:04:58 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

There is no need to have those functions as public API.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qom/object.h | 24 ------------------------
 qom/object.c         |  4 ++--
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index c5e6fc1..cd0f412 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -587,18 +587,6 @@ struct InterfaceClass
 Object *object_new(const char *typename);
=20
 /**
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
-/**
  * object_new_with_props:
  * @typename:  The name of the type of the object to instantiate.
  * @parent: the parent object
@@ -727,18 +715,6 @@ int object_set_propv(Object *obj,
                      va_list vargs);
=20
 /**
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
-/**
  * object_initialize:
  * @obj: A pointer to the memory to be used for the object.
  * @size: The maximum size available at @obj for the object.
diff --git a/qom/object.c b/qom/object.c
index 760fafb..eb4bc92 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -357,7 +357,7 @@ static void object_post_init_with_type(Object *obj, T=
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
@@ -473,7 +473,7 @@ static void object_finalize(void *data)
     }
 }
=20
-Object *object_new_with_type(Type type)
+static Object *object_new_with_type(Type type)
 {
     Object *obj;
=20
--=20
2.1.4


