Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWfQN-0006LM-NQ
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 02:19:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQL-0006GZ-8d
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQC-0004BR-G6
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:49 -0400
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:38770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQC-0004Am-62
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:40 -0400
Received: from /spool/local
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Sat, 14 Mar 2015 06:19:39 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 14 Mar 2015 06:19:35 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 06F5C1B0804B; 
	Sat, 14 Mar 2015 06:19:57 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2E6JZq78585686; Sat, 14 Mar 2015 06:19:35 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2E6JZpZ013373; Sat, 14 Mar 2015 02:19:35 -0400
Received: from oc7435384737.ibm.com (sig-9-84-84-76.evts.de.ibm.com
	[9.84.84.76])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2E6JYkS013361; Sat, 14 Mar 2015 02:19:34 -0400
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sat, 14 Mar 2015 07:19:27 +0100
Message-Id: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031406-0013-0000-0000-0000034D613E
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.109
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 0/7] Remove more unused functions
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
X-List-Received-Date: Sat, 14 Mar 2015 06:19:50 -0000

Here are some more patches to remove completely unused functions
from QEMU. Please review carefully, some of the functions might
still get usefull in the future again, so if you discover one,
please let me know, then I'll remove it from the patch series
again.

v2: Changed series according to review comment from v1:
- Dropped the patch to remove portio_list_destroy() and portio_list_del()
- Keep the ARI functions in the pci patch since they might get useful again

Thomas Huth (7):
  migration: Remove unused functions
  vmxnet: Remove unused function vmxnet_rx_pkt_get_num_frags()
  pci: Remove unused function ich9_d2pbr_init()
  monitor: Remove unused functions
  usb: Remove unused functions
  util: Remove unused functions
  Remove various unused functions

 backends/tpm.c                   |   11 ------
 hmp.h                            |    1 -
 hw/char/serial.c                 |    7 ----
 hw/net/vmxnet_rx_pkt.c           |    7 ----
 hw/net/vmxnet_rx_pkt.h           |    9 -----
 hw/pci-bridge/i82801b11.c        |   21 ------------
 hw/usb/core.c                    |   41 -----------------------
 include/hw/char/serial.h         |    1 -
 include/hw/i386/ich9.h           |    1 -
 include/hw/usb.h                 |    5 ---
 include/migration/migration.h    |    1 -
 include/migration/qemu-file.h    |    2 -
 include/monitor/monitor.h        |    1 -
 include/qemu-common.h            |    4 --
 include/qemu/compatfd.h          |    1 -
 include/sysemu/iothread.h        |    1 -
 include/sysemu/tpm_backend_int.h |    2 -
 iothread.c                       |   12 -------
 migration/migration.c            |    9 -----
 migration/qemu-file-buf.c        |   53 ------------------------------
 monitor.c                        |   13 -------
 util/compatfd.c                  |   19 -----------
 util/osdep.c                     |   66 --------------------------------------
 23 files changed, 0 insertions(+), 288 deletions(-)


