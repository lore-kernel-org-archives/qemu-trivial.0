Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugSl-0005TR-Aw
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:49:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugSh-0005MZ-J6
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:49:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugSg-0001Xd-LW
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:49:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44930)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugSb-0001TQ-4z; Fri, 06 Nov 2015 07:49:41 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 31C2340DD4;
	Fri,  6 Nov 2015 15:49:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BC6E6ACD;
	Fri,  6 Nov 2015 15:44:05 +0300 (MSK)
Received: (nullmailer pid 31707 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:54 +0300
Message-Id: <b30d80546421c6ea919096b596887f496c80af0a.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 17/24] qom/object: fix 2 comment typos
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
X-List-Received-Date: Fri, 06 Nov 2015 12:49:48 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Also change the misleading definition of macro OBJECT_CLASS_CHECK

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qom/object.h | 10 +++++-----
 qom/object.c         |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index be7280c..0bb89d4 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -510,16 +510,16 @@ struct TypeInfo
 
 /**
  * OBJECT_CLASS_CHECK:
- * @class: The C type to use for the return value.
- * @obj: A derivative of @type to cast.
- * @name: the QOM typename of @class.
+ * @class_type: The C type to use for the return value.
+ * @class: A derivative class of @class_type to cast.
+ * @name: the QOM typename of @class_type.
  *
  * A type safe version of @object_class_dynamic_cast_assert.  This macro is
  * typically wrapped by each type to perform type safe casts of a class to a
  * specific class type.
  */
-#define OBJECT_CLASS_CHECK(class, obj, name) \
-    ((class *)object_class_dynamic_cast_assert(OBJECT_CLASS(obj), (name), \
+#define OBJECT_CLASS_CHECK(class_type, class, name) \
+    ((class_type *)object_class_dynamic_cast_assert(OBJECT_CLASS(class), (name), \
                                                __FILE__, __LINE__, __func__))
 
 /**
diff --git a/qom/object.c b/qom/object.c
index 11cd86b..fc6e161 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -204,7 +204,7 @@ static bool type_is_ancestor(TypeImpl *type, TypeImpl *target_type)
 {
     assert(target_type);
 
-    /* Check if typename is a direct ancestor of type */
+    /* Check if target_type is a direct ancestor of type */
     while (type) {
         if (type == target_type) {
             return true;
-- 
2.1.4


