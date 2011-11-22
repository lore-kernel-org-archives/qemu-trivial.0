Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSnGt-0007Co-Nh
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:08:11 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGi-0006fZ-Ev
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGW-00064z-76
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:07:55 -0500
Received: from e28smtp04.in.ibm.com ([122.248.162.4]:60712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGT-00061k-J2
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:07:48 -0500
Received: from /spool/local
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Tue, 22 Nov 2011 15:37:31 +0530
Received: from d28relay01.in.ibm.com ([9.184.220.58])
	by e28smtp04.in.ibm.com ([192.168.1.134]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 22 Nov 2011 15:37:28 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay01.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAMA7Q6j282736; Tue, 22 Nov 2011 15:37:27 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAMA7QAQ028282; Tue, 22 Nov 2011 21:07:26 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAMA6u0R026400; Tue, 22 Nov 2011 21:07:25 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 18:06:24 +0800
Message-Id: <1321956386-12004-9-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
x-cbid: 11112210-5564-0000-0000-0000003477F7
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.4
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 09/11] fix spelling in ui sub directory
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
X-List-Received-Date: Tue, 22 Nov 2011 10:08:07 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>


Cc: Anthony Liguori <aliguori@us.ibm.com>
Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 ui/vnc.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 40018f7..e85ee66 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1732,7 +1732,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
 
     /*
      * Start from the end because the encodings are sent in order of preference.
-     * This way the prefered encoding (first encoding defined in the array)
+     * This way the preferred encoding (first encoding defined in the array)
      * will be set at the end of the loop.
      */
     for (i = n_encodings - 1; i >= 0; i--) {
@@ -2117,7 +2117,7 @@ static int protocol_client_auth_vnc(VncState *vs, uint8_t *data, size_t len)
 
     /* Compare expected vs actual challenge response */
     if (memcmp(response, data, VNC_AUTH_CHALLENGE_SIZE) != 0) {
-        VNC_DEBUG("Client challenge reponse did not match\n");
+        VNC_DEBUG("Client challenge response did not match\n");
         goto reject;
     } else {
         VNC_DEBUG("Accepting VNC challenge response\n");
-- 
1.7.5.4


