Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RBlin-00005Q-KN
	for mharc-qemu-trivial@gnu.org; Thu, 06 Oct 2011 07:02:37 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RBl7z-0005sD-NM
	for qemu-trivial@nongnu.org; Thu, 06 Oct 2011 06:24:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RBl7y-0002WM-PL
	for qemu-trivial@nongnu.org; Thu, 06 Oct 2011 06:24:35 -0400
Received: from mtagate1.uk.ibm.com ([194.196.100.161]:59991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>)
	id 1RBl7w-0002Vj-G2; Thu, 06 Oct 2011 06:24:32 -0400
Received: from d06nrmr1707.portsmouth.uk.ibm.com
	(d06nrmr1707.portsmouth.uk.ibm.com [9.149.39.225])
	by mtagate1.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p96AOU8F020757;
	Thu, 6 Oct 2011 10:24:30 GMT
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com
	[9.149.37.249])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id p96AOUJk2359390; Thu, 6 Oct 2011 11:24:30 +0100
Received: from d06av08.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id p96AOUxV016659; Thu, 6 Oct 2011 11:24:30 +0100
Received: from localhost (dyn-9-174-219-31.manchester-maybrook.uk.ibm.com
	[9.174.219.31])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id p96AOTxg016637; Thu, 6 Oct 2011 11:24:30 +0100
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: <qemu-devel@nongnu.org>
Date: Thu,  6 Oct 2011 11:24:12 +0100
Message-Id: <1317896652-3393-1-git-send-email-stefanha@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.6.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 194.196.100.161
Cc: qemu-trivial@nongnu.org, Alon Levy <alevy@redhat.com>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] qemu-options: avoid #if in spicevmc texi help
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
X-List-Received-Date: Thu, 06 Oct 2011 11:02:35 -0000

Preprocessor directives cannot be used in STEXI/ETEXI sections since
they are not passed through the preprocessor.  The spicevmc chardev
option help currently uses #if, which is included verbatim in the man
page output.

Fix this by simply stating that spicevmc chardevs are available only in
builds with spice support.

Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
---
 qemu-options.hx |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index dfbabd0..d4fe990 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1673,15 +1673,15 @@ Connect to a local parallel port.
 @option{path} specifies the path to the parallel port device. @option{path} is
 required.
 
-#if defined(CONFIG_SPICE)
 @item -chardev spicevmc ,id=@var{id} ,debug=@var{debug}, name=@var{name}
 
+@option{spicevmc} is only available when spice support is built in.
+
 @option{debug} debug level for spicevmc
 
 @option{name} name of spice channel to connect to
 
 Connect to a spice virtual machine channel, such as vdiport.
-#endif
 
 @end table
 ETEXI
-- 
1.7.6.3


