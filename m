Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnElD-0002f3-M9
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jun 2013 17:08:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1Un59D-0001me-8x
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 06:52:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1Un59C-0007t8-64
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 06:52:55 -0400
Received: from [222.73.24.84] (port=16628 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1Un598-0007ri-NI; Thu, 13 Jun 2013 06:52:50 -0400
X-IronPort-AV: E=Sophos;i="4.87,858,1363104000"; 
   d="scan'208";a="7536756"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 13 Jun 2013 18:49:42 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5DAqZDu009320;
	Thu, 13 Jun 2013 18:52:35 +0800
Received: from G08FNSTD100614.fnst.cn.fujitsu.com ([10.167.233.156])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061318504091-2095060 ;
	Thu, 13 Jun 2013 18:50:40 +0800 
From: Hu Tao <hutao@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 13 Jun 2013 18:51:49 +0800
Message-Id: <1371120709-18923-3-git-send-email-hutao@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
References: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/13 18:50:41,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/13 18:50:41,
	Serialize complete at 2013/06/13 18:50:41
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
X-Mailman-Approved-At: Thu, 13 Jun 2013 17:08:43 -0400
Subject: [Qemu-trivial] [PATCH] remove call to type_initialize in
	object_new_with_type
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
X-List-Received-Date: Thu, 13 Jun 2013 10:52:56 -0000

Since it's called in object_initialize_with_type later.

Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
---
 qom/object.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 803b94b..38dc45e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -406,9 +406,6 @@ Object *object_new_with_type(Type type)
 {
     Object *obj;
 
-    g_assert(type != NULL);
-    type_initialize(type);
-
     obj = g_malloc(type->instance_size);
     object_initialize_with_type(obj, type);
     obj->free = g_free;
-- 
1.8.2.3


