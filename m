Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YV1W4-0003MI-Cf
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2015 13:30:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vx-00037L-3s
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vl-0005WV-1l
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:49 -0400
Received: from e06smtp11.uk.ibm.com ([195.75.94.107]:40401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vk-0005Tt-Ak
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:36 -0400
Received: from /spool/local
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 9 Mar 2015 17:30:34 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 9 Mar 2015 17:30:31 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 903371B0805F; 
	Mon,  9 Mar 2015 17:30:51 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t29HUVPu64553026; Mon, 9 Mar 2015 17:30:31 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t29HURgN024516; Mon, 9 Mar 2015 11:30:28 -0600
Received: from oc7435384737.ibm.com (sig-9-81-34-230.evts.uk.ibm.com
	[9.81.34.230])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t29HUF7l024224; Mon, 9 Mar 2015 11:30:16 -0600
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Mon,  9 Mar 2015 18:30:07 +0100
Message-Id: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15030917-0041-0000-0000-000003A4D4A7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.107
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 0/8] Remove more unused functions
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
X-List-Received-Date: Mon, 09 Mar 2015 17:30:54 -0000

Here are some more patches to remove completely unused functions
from QEMU. Please review carefully, some of the functions might
still get usefull in the future again, so if you discover one,
please let me know, then I'll remove it from the patch series
again.

Thomas Huth (8):
  migration: Remove unused functions
  vmxnet: Remove unused function vmxnet_rx_pkt_get_num_frags()
  pci: Remove unused functions
  monitor: Remove unused functions
  ioport: Remove unused functions
  usb: Remove unused functions
  util: Remove unused functions
  Remove various unused functions

 backends/tpm.c                   |   11 ------
 hmp.h                            |    1 -
 hw/char/serial.c                 |    7 ----
 hw/net/vmxnet_rx_pkt.c           |    7 ----
 hw/net/vmxnet_rx_pkt.h           |    9 -----
 hw/pci-bridge/i82801b11.c        |   21 ------------
 hw/pci/pcie.c                    |   25 --------------
 hw/usb/core.c                    |   41 -----------------------
 include/exec/ioport.h            |    2 -
 include/hw/char/serial.h         |    1 -
 include/hw/i386/ich9.h           |    1 -
 include/hw/pci/pcie.h            |    3 --
 include/hw/usb.h                 |    5 ---
 include/migration/migration.h    |    1 -
 include/migration/qemu-file.h    |    2 -
 include/monitor/monitor.h        |    1 -
 include/qemu-common.h            |    4 --
 include/qemu/compatfd.h          |    1 -
 include/sysemu/iothread.h        |    1 -
 include/sysemu/tpm_backend_int.h |    2 -
 ioport.c                         |   24 --------------
 iothread.c                       |   12 -------
 migration/migration.c            |    9 -----
 migration/qemu-file-buf.c        |   53 ------------------------------
 monitor.c                        |   13 -------
 util/compatfd.c                  |   19 -----------
 util/osdep.c                     |   66 --------------------------------------
 27 files changed, 0 insertions(+), 342 deletions(-)


