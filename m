Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZuCx5-0005t1-OD
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2015 00:19:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZuCx4-0005sV-8Z
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 00:19:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZuCx3-0000TO-H3
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 00:19:10 -0500
Received: from [59.151.112.132] (port=49823 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1ZuCwz-0000RW-19; Thu, 05 Nov 2015 00:19:05 -0500
X-IronPort-AV: E=Sophos;i="5.20,242,1444665600"; 
   d="scan'208";a="118742"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Nov 2015 13:18:49 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id tA55IOtL015145;
	Thu, 5 Nov 2015 13:18:24 +0800
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.57) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 5 Nov 2015 13:19:00 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 5 Nov 2015 13:19:14 +0800
Message-ID: <1446700754-16219-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.57]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH] object_new_with_type: remove redundant code
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
X-List-Received-Date: Thu, 05 Nov 2015 05:19:11 -0000

g_assert & type_initialize are called in object_initialize_with_type

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 qom/object.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index fc6e161..43ac2dd 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -423,9 +423,6 @@ Object *object_new_with_type(Type type)
 {
     Object *obj;
 
-    g_assert(type != NULL);
-    type_initialize(type);
-
     obj = g_malloc(type->instance_size);
     object_initialize_with_type(obj, type->instance_size, type);
     obj->free = g_free;
-- 
2.1.0


