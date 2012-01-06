Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RjD7l-0002kX-8K
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jan 2012 11:58:37 -0500
Received: from eggs.gnu.org ([140.186.70.92]:39686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RjD7i-0002e6-7J
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2012 11:58:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RjD7h-000234-A9
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2012 11:58:34 -0500
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:51324)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RjD7g-00022p-Px
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2012 11:58:33 -0500
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanha@linux.vnet.ibm.com>;
	Fri, 6 Jan 2012 16:58:31 -0000
Received: from d06nrmr1806.portsmouth.uk.ibm.com ([9.149.39.193])
	by e06smtp12.uk.ibm.com ([192.168.101.142]) with IBM ESMTP SMTP
	Gateway: Authorized Use Only! Violators will be prosecuted; 
	Fri, 6 Jan 2012 16:57:55 -0000
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by d06nrmr1806.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q06Gvsfc2953446; Fri, 6 Jan 2012 16:57:54 GMT
Received: from d06av07.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q06GvsEb020390; Fri, 6 Jan 2012 09:57:54 -0700
Received: from localhost (stefanha-thinkpad.manchester-maybrook.uk.ibm.com
	[9.174.219.31])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q06GvrhQ020387; Fri, 6 Jan 2012 09:57:54 -0700
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: <qemu-devel@nongnu.org>
Date: Fri,  6 Jan 2012 16:57:43 +0000
Message-Id: <1325869065-32182-1-git-send-email-stefanha@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.7.3
x-cbid: 12010616-8372-0000-0000-000001492B0B
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 195.75.94.108
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 0/2] Fix fd leak in vvfat.c and strncmp()
	issue in vnc.c
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
X-List-Received-Date: Fri, 06 Jan 2012 16:58:35 -0000

Two unrelated bugs that David Gilbert had kicking around that are easy to fix.
Let's take care of them.

Stefan Hajnoczi (2):
  vvfat: avoid leaking file descriptor in commit_one_file()
  vnc: fix no-lock-key-sync strncmp() length

 block/vvfat.c |    3 +++
 ui/vnc.c      |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

-- 
1.7.7.3


