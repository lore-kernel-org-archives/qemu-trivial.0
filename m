Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bARyK-0001BX-Et
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 21:07:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyE-00016b-G2
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyA-0007O4-O8
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:46 -0400
Received: from [59.151.112.132] (port=5480 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bARxz-0007It-FS; Tue, 07 Jun 2016 21:07:32 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7473515"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jun 2016 09:07:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DF27041C0B98;
	Wed,  8 Jun 2016 09:07:21 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 8 Jun 2016 09:07:21 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Jeff Cody
	<jcody@redhat.com>
CC: qemu block <qemu-block@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
	Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert"
	<dgilbert@redhat.com>, Dong Eddie <eddie.dong@intel.com>, Jiang Yunhong
	<yunhong.jiang@intel.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, 
	Gonglei <arei.gonglei@huawei.com>, Wen Congyang <wency@cn.fujitsu.com>, 
	Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Date: Wed, 8 Jun 2016 09:11:26 +0800
Message-ID: <1465348292-26750-5-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: DF27041C0B98.AF50A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v20 04/10] Link backup into block core
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
X-List-Received-Date: Wed, 08 Jun 2016 01:07:51 -0000

From: Wen Congyang <wency@cn.fujitsu.com>

Some programs that add a dependency on it will use
the block layer directly.

Signed-off-by: Wen Congyang <wency@cn.fujitsu.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Jeff Cody <jcody@redhat.com>
---
 block/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/Makefile.objs b/block/Makefile.objs
index 44a5416..fbfe647 100644
--- a/block/Makefile.objs
+++ b/block/Makefile.objs
@@ -22,12 +22,12 @@ block-obj-$(CONFIG_ARCHIPELAGO) += archipelago.o
 block-obj-$(CONFIG_LIBSSH2) += ssh.o
 block-obj-y += accounting.o dirty-bitmap.o
 block-obj-y += write-threshold.o
+block-obj-y += backup.o
 
 block-obj-y += crypto.o
 
 common-obj-y += stream.o
 common-obj-y += commit.o
-common-obj-y += backup.o
 
 iscsi.o-cflags     := $(LIBISCSI_CFLAGS)
 iscsi.o-libs       := $(LIBISCSI_LIBS)
-- 
1.9.3




