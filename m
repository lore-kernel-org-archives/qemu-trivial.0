Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tgmym-00010j-OS
	for mharc-qemu-trivial@gnu.org; Thu, 06 Dec 2012 20:43:52 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zwu.kernel@gmail.com>) id 1Tgmyk-0000sh-1B
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 20:43:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zwu.kernel@gmail.com>) id 1Tgmyj-00053R-25
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 20:43:49 -0500
Received: from e8.ny.us.ibm.com ([32.97.182.138]:44448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zwu.kernel@gmail.com>) id 1Tgmyi-00052o-UZ
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 20:43:48 -0500
Received: from /spool/local
	by e8.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <zwu.kernel@gmail.com>;
	Thu, 6 Dec 2012 20:43:44 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e8.ny.us.ibm.com (192.168.1.108) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 6 Dec 2012 20:43:33 -0500
Received: from d01relay06.pok.ibm.com (d01relay06.pok.ibm.com [9.56.227.116])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 699F5C9003E;
	Thu,  6 Dec 2012 20:43:33 -0500 (EST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay06.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	qB71hXJQ30539832; Thu, 6 Dec 2012 20:43:33 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	qB71hWWb025007; Thu, 6 Dec 2012 20:43:33 -0500
Received: from us.ibm.com ([9.115.122.193])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with SMTP id
	qB71hTXj024642; Thu, 6 Dec 2012 20:43:30 -0500
Received: by us.ibm.com (sSMTP sendmail emulation);
	Fri,  7 Dec 2012 09:43:19 +0800
From: zwu.kernel@gmail.com
To: qemu-trivial@nongnu.org
Date: Fri,  7 Dec 2012 09:43:18 +0800
Message-Id: <1354844598-14092-1-git-send-email-zwu.kernel@gmail.com>
X-Mailer: git-send-email 1.7.6.5
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 12120701-9360-0000-0000-00000DA23405
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.138
Cc: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] net, hub: fix the indent in the comments
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
X-List-Received-Date: Fri, 07 Dec 2012 01:43:51 -0000

From: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>

  Remove some redundant blanks in the comments of
net_hub_id_for_client().

Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
---
 net/hub.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/hub.c b/net/hub.c
index be41301..3b2d1ff 100644
--- a/net/hub.c
+++ b/net/hub.c
@@ -256,7 +256,7 @@ void net_hub_info(Monitor *mon)
 /**
  * Get the hub id that a client is connected to
  *
- * @id              Pointer for hub id output, may be NULL
+ * @id: Pointer for hub id output, may be NULL
  */
 int net_hub_id_for_client(NetClientState *nc, int *id)
 {
-- 
1.7.6.5


