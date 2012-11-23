Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tbxju-0002YU-W4
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 13:12:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Tbxjm-00025m-8v
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 13:12:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Tbxjl-0001XF-6l
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 13:12:26 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:53002)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Tbxjj-0001Wb-3c; Fri, 23 Nov 2012 13:12:23 -0500
Received: from blackfin.pond.sub.org (p57B0F971.dip.t-dialin.net
	[87.176.249.113])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 827779FE48;
	Fri, 23 Nov 2012 19:12:19 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B51502009B; Fri, 23 Nov 2012 19:12:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2012 19:12:16 +0100
Message-Id: <1353694338-13162-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, jordan.l.justen@intel.com
Subject: [Qemu-trivial] [PATCH 0/2] pc_fw_add_pflash_drv() fixes
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
X-List-Received-Date: Fri, 23 Nov 2012 18:12:27 -0000

Straightforward bug fixes, so they could qualify for 1.3.  But since
the bugs are fairly harmless, we might want to postpone to 1.4
regardless.  If we do, perhaps qemu-trivial could pick them up.

Markus Armbruster (2):
  pc_sysfw: Check for qemu_find_file() failure
  pc_sysfw: Plug memory leak on pc_fw_add_pflash_drv() error path

 hw/pc_sysfw.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
1.7.11.7


