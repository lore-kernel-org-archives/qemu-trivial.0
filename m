Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtVcK-00053J-MD
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 02:02:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZtVcI-0004zQ-AC
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 02:02:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZtVcH-0006JN-Bx
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 02:02:50 -0500
Received: from [59.151.112.132] (port=2842 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1ZtVc0-0006Bh-Q5; Tue, 03 Nov 2015 02:02:44 -0500
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Nov 2015 15:01:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id tA32a7cx021150;
	Tue, 3 Nov 2015 10:36:07 +0800
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.57) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 3 Nov 2015 10:36:43 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 3 Nov 2015 10:36:42 +0800
Message-ID: <1446518202-12162-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.57]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH v2] qom/object: fix 2 comment typos
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
X-List-Received-Date: Tue, 03 Nov 2015 07:02:51 -0000

Also change the misleading definition of macro OBJECT_CLASS_CHECK

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
changelog v2:
    modified according to peter`s suggestion

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
2.1.0


