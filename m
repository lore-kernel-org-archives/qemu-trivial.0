Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ag7xM-0005D6-HL
	for mharc-qemu-trivial@gnu.org; Wed, 16 Mar 2016 05:41:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1ag7xG-00051o-Pu
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 05:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1ag7xF-0003h0-Ul
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 05:41:26 -0400
Received: from [59.151.112.132] (port=13749 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1ag7x9-0003dr-Fv; Wed, 16 Mar 2016 05:41:19 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="4636606"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Mar 2016 17:41:17 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C3D7442C80FF;
	Wed, 16 Mar 2016 17:41:16 +0800 (CST)
Received: from localhost.localdomain (10.167.226.50) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 16 Mar 2016 17:41:16 +0800
From: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 16 Mar 2016 17:40:40 +0800
Message-ID: <1458121240-2490-1-git-send-email-weijg.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.50]
X-yoursite-MailScanner-ID: C3D7442C80FF.A02E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, aliguori@us.ibm.com,
	Wei Jiangang <weijg.fnst@cn.fujitsu.com>, ehabkost@redhat.com
Subject: [Qemu-trivial] [Qemu-devel][PATCH] vl: fix comment about when
	parsing cpu definitions
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
X-List-Received-Date: Wed, 16 Mar 2016 09:41:31 -0000

machine->init() was replaced with machine_class->init().

Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
---
 vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 7a28982..3c403d1 100644
--- a/vl.c
+++ b/vl.c
@@ -4079,7 +4079,7 @@ int main(int argc, char **argv, char **envp)
     /* Init CPU def lists, based on config
      * - Must be called after all the qemu_read_config_file() calls
      * - Must be called before list_cpus()
-     * - Must be called before machine->init()
+     * - Must be called before machine_class->init()
      */
     cpudef_init();
 
-- 
1.9.3




