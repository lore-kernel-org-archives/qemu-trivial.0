Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCihR-0008BL-3y
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jun 2016 03:23:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bCihN-00085r-M6
	for qemu-trivial@nongnu.org; Tue, 14 Jun 2016 03:23:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bCihL-00051C-21
	for qemu-trivial@nongnu.org; Tue, 14 Jun 2016 03:23:44 -0400
Received: from [59.151.112.132] (port=19313 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bCihD-0004yl-KY; Tue, 14 Jun 2016 03:23:36 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7666943"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Jun 2016 15:23:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 75FF641C0B9A;
	Tue, 14 Jun 2016 15:23:23 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 14 Jun 2016 15:23:22 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: qemu trival <qemu-trivial@nongnu.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?=
	<afaerber@suse.de>, qemu devel <qemu-devel@nongnu.org>
CC: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Date: Tue, 14 Jun 2016 15:27:49 +0800
Message-ID: <1465889269-7226-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 75FF641C0B9A.AFBFA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] qom/object: fix comment typo
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
X-List-Received-Date: Tue, 14 Jun 2016 07:23:47 -0000

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 include/qom/object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 99de539..925c279 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -901,7 +901,7 @@ GSList *object_class_get_list(const char *implements_type,
 void object_ref(Object *obj);
 
 /**
- * qdef_unref:
+ * object_unref:
  * @obj: the object
  *
  * Decrease the reference count of a object.  A object cannot be freed as long
-- 
1.9.3




