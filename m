Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSnaz-00039A-3l
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:28:57 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnH3-0007R0-8B
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGn-00068j-Ca
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:21 -0500
Received: from e28smtp09.in.ibm.com ([122.248.162.9]:41825)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGm-000618-QU
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:05 -0500
Received: from /spool/local
	by e28smtp09.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Tue, 22 Nov 2011 15:37:25 +0530
Received: from d28relay05.in.ibm.com ([9.184.220.62])
	by e28smtp09.in.ibm.com ([192.168.1.139]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 22 Nov 2011 15:37:22 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAMA7KIo4341976; Tue, 22 Nov 2011 15:37:20 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAMA7KKc027814; Tue, 22 Nov 2011 21:07:20 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAMA6u0M026400; Tue, 22 Nov 2011 21:07:19 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 18:06:19 +0800
Message-Id: <1321956386-12004-4-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
x-cbid: 11112210-2674-0000-0000-000001CF5644
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.9
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	stefanha@linux.vnet.ibm.com, Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH 04/11] fix spelling in QMP sub directory
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
X-List-Received-Date: Tue, 22 Nov 2011 10:28:55 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>


Cc: Luiz Capitulino <lcapitulino@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 QMP/qmp-events.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/QMP/qmp-events.txt b/QMP/qmp-events.txt
index 0ce5d4e..af586ec 100644
--- a/QMP/qmp-events.txt
+++ b/QMP/qmp-events.txt
@@ -126,7 +126,7 @@ the authentication ID is not provided.
 VNC_DISCONNECTED
 ----------------
 
-Emitted when the conection is closed.
+Emitted when the connection is closed.
 
 Data:
 
-- 
1.7.5.4


