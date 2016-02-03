Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQnyi-0005il-VL
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2016 22:19:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQnyg-0005hE-QO
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 22:19:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQnyg-0004nF-0A
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 22:19:34 -0500
Received: from [59.151.112.132] (port=34070 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aQnyb-0004mS-Fr; Tue, 02 Feb 2016 22:19:29 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3258635"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Feb 2016 11:19:27 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 3F530418AD4D;
	Wed,  3 Feb 2016 11:18:32 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 3 Feb 2016 11:19:23 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 3 Feb 2016 11:19:43 +0800
Message-ID: <1454469583-15753-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 3F530418AD4D.AA23F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] Fix inconsistency between comment and
	variable name
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
X-List-Received-Date: Wed, 03 Feb 2016 03:19:35 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 include/hw/qdev-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index abcdee8..42fa5db 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -221,7 +221,7 @@ typedef struct BusChild {
 
 /**
  * BusState:
- * @hotplug_device: link to a hotplug device associated with bus.
+ * @hotplug_handler: link to a hotplug device associated with bus.
  */
 struct BusState {
     Object obj;
-- 
2.1.0




