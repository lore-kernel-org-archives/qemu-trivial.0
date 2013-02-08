Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3msE-0000wP-4Z
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 07:16:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3ms5-0000Wd-N8
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:16:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3ms2-0007CL-HW
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:16:01 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:38996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1U3mrw-00079k-O2; Fri, 08 Feb 2013 07:15:53 -0500
Received: from blackfin.pond.sub.org (p5B32B25A.dip.t-dialin.net
	[91.50.178.90])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 2A6A39FE6C;
	Fri,  8 Feb 2013 13:15:49 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 43733200AA; Fri,  8 Feb 2013 13:15:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Feb 2013 13:15:43 +0100
Message-Id: <1360325749-1989-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH for-1.4 0/6] Error reporting fixes
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
X-List-Received-Date: Fri, 08 Feb 2013 12:16:04 -0000

I tagged this for 1.4 because the patches improve the user experience
a bit, and are all low risk.

Markus Armbruster (6):
  error: Clean up error strings with embedded newlines
  error: Clean up abuse of error_report() for help
  error: Strip trailing '\n' from error string arguments (again)
  qemu-option: Disable two helpful messages that got broken recently
  vl: Drop redundant "parse error" reports
  vl: Exit unsuccessfully on option argument syntax error

 block/gluster.c             |   2 +-
 hmp.c                       |   2 +-
 hw/9pfs/virtio-9p-proxy.c   |   2 +-
 hw/kvm/pci-assign.c         |  10 ++--
 hw/pci/pci.c                |   2 +-
 hw/qdev.c                   |   4 +-
 hw/qxl.c                    |   2 +-
 hw/vfio_pci.c               | 114 ++++++++++++++++++++++----------------------
 hw/vhost_net.c              |   4 +-
 migration.c                 |   2 +-
 qemu-char.c                 |   8 ++--
 target-i386/cpu.c           |  10 ++--
 target-ppc/translate_init.c |   2 +-
 ui/console.c                |   2 +-
 ui/input.c                  |   2 +-
 util/qemu-config.c          |   6 +--
 util/qemu-option.c          |   4 ++
 util/qemu-sockets.c         |   6 +--
 vl.c                        |  14 +++---
 19 files changed, 102 insertions(+), 96 deletions(-)

-- 
1.7.11.7


