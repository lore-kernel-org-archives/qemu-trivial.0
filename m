Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtB2o-0008VK-Mf
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2015 04:04:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZtB2l-0008SG-GO
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 04:04:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZtB2k-0000yy-MI
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 04:04:47 -0500
Received: from [59.151.112.132] (port=20610 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1ZtB2g-0000wI-3s; Mon, 02 Nov 2015 04:04:42 -0500
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="102552635"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Nov 2015 17:06:31 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id tA293kEU027054;
	Mon, 2 Nov 2015 17:03:46 +0800
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.57) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 2 Nov 2015 17:04:21 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 2 Nov 2015 17:04:24 +0800
Message-ID: <1446455064-1792-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.57]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH] qom/object: fix 2 comment typos
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
X-List-Received-Date: Mon, 02 Nov 2015 09:04:48 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 include/qom/object.h | 2 +-
 qom/object.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index be7280c..9e5162a 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -511,7 +511,7 @@ struct TypeInfo
 /**
  * OBJECT_CLASS_CHECK:
  * @class: The C type to use for the return value.
- * @obj: A derivative of @type to cast.
+ * @obj: A derivative class of @class to cast.
  * @name: the QOM typename of @class.
  *
  * A type safe version of @object_class_dynamic_cast_assert.  This macro is
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


