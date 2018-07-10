Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fcrpp-0003Bw-Ng
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jul 2018 08:33:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <douly.fnst@cn.fujitsu.com>) id 1fcqFJ-00037G-Ub
	for qemu-trivial@nongnu.org; Tue, 10 Jul 2018 06:51:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <douly.fnst@cn.fujitsu.com>) id 1fcqFJ-0000Rq-6B
	for qemu-trivial@nongnu.org; Tue, 10 Jul 2018 06:51:50 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:26873
	helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <douly.fnst@cn.fujitsu.com>)
	id 1fcqFD-0000Pe-Lo; Tue, 10 Jul 2018 06:51:43 -0400
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42061765"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2018 18:51:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 892E64B445CB;
	Tue, 10 Jul 2018 18:51:37 +0800 (CST)
Received: from localhost.localdomain (10.167.226.106) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 10 Jul 2018 18:51:35 +0800
From: Dou Liyang <douly.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, <ehabkost@redhat.com>, <imammedo@redhat.com>,
	Dou Liyang <douly.fnst@cn.fujitsu.com>
Date: Tue, 10 Jul 2018 18:51:29 +0800
Message-ID: <20180710105129.23296-1-douly.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.106]
X-yoursite-MailScanner-ID: 892E64B445CB.A21E2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: douly.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 183.91.158.132
X-Mailman-Approved-At: Tue, 10 Jul 2018 08:33:36 -0400
Subject: [Qemu-trivial] [PATCH] hw/machine: Remove the Zero check of
 nb_numa_nodes for numa_complete_configuration() follow-up
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
X-List-Received-Date: Tue, 10 Jul 2018 10:51:50 -0000

This Commit 7747abf11487 misses the curly brackets. Follow Igor's and Eduardo's suggestion,

Add a follow-up patch for it.

Signed-off-by: Dou Liyang <douly.fnst@cn.fujitsu.com>
---
 hw/core/machine.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index a9aeb22f03..6b68e1218f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -793,8 +793,9 @@ void machine_run_board_init(MachineState *machine)
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
 
     numa_complete_configuration(machine);
-    if (nb_numa_nodes)
+    if (nb_numa_nodes) {
         machine_numa_finish_cpu_init(machine);
+    }
 
     /* If the machine supports the valid_cpu_types check and the user
      * specified a CPU with -cpu check here that the user CPU is supported.
-- 
2.14.3




