Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRdMs-0004qe-4t
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:07:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YRdMq-0004li-07
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:07:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YRdMl-0004Ss-Vg
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:07:23 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:7566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YRdMl-0004OC-JK; Sat, 28 Feb 2015 04:07:19 -0500
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHU78961; Sat, 28 Feb 2015 17:07:15 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 17:07:06 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Sat, 28 Feb 2015 17:05:22 +0800
Message-ID: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, peter.huangpeng@huawei.com,
	eblake@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH RFC 0/5] Another patchset try to clean up
	around qerror_report_err()
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
X-List-Received-Date: Sat, 28 Feb 2015 09:07:25 -0000

Hi,

I have noticed Markus's previous patchset 
"Clean up around error_get_pretty(), qerror_report_err()".

This is another patch series trying to do the same thing.
I'm not sure if he has missed this places or these modifies are false.

So, please review... 

Thanks.

zhanghailiang (5):
  serial-pci: Avoid qerror_report_err() outside QMP command handlers
  qdev: Avoid qerror_report_err() outside QMP command handlers
  pci-hotplug-old: Avoid qerror_report_err() outside QMP command
    handlers
  pci-assign: Avoid qerror_report_err() outside QMP command handlers
  savevm: Replace error_report() & error_free() with error_report_err()

 hw/char/serial-pci.c     | 7 ++-----
 hw/core/qdev.c           | 6 ++----
 hw/i386/kvm/pci-assign.c | 3 +--
 hw/pci/pci-hotplug-old.c | 3 +--
 savevm.c                 | 3 +--
 5 files changed, 7 insertions(+), 15 deletions(-)

-- 
1.7.12.4



