Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRFhF-0002Jm-HF
	for mharc-qemu-trivial@gnu.org; Fri, 27 Feb 2015 02:50:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhC-0002Fq-Ss
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFh8-0007VJ-2w
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:50 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:59894)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRFh7-0007UG-9x; Fri, 27 Feb 2015 02:50:46 -0500
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCJ70325; Fri, 27 Feb 2015 15:50:34 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 27 Feb 2015 15:50:27 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 27 Feb 2015 15:50:13 +0800
Message-ID: <1425023419-12244-4-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.54F021CB.00A0, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 3647aedb134fc1631470d71f5ef690a9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 3/9] sparc/leon3.c: fix memory leak
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
X-List-Received-Date: Fri, 27 Feb 2015 07:50:52 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/sparc/leon3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 751392e..e41ec0b 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -186,6 +186,7 @@ static void leon3_generic_hw_init(MachineState *machine)
         fprintf(stderr, "Can't read bios image %s\n", filename);
         exit(1);
     }
+    g_free(filename);
 
     /* Can directly load an application. */
     if (kernel_filename != NULL) {
-- 
1.7.12.4



