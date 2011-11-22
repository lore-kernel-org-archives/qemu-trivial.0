Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSnHD-0007Wf-UB
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:08:31 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGz-0007OE-Pe
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGa-000665-WD
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:07:57 -0500
Received: from e28smtp02.in.ibm.com ([122.248.162.2]:51606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGZ-00061s-GL
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:07:52 -0500
Received: from /spool/local
	by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Tue, 22 Nov 2011 15:37:31 +0530
Received: from d28relay03.in.ibm.com ([9.184.220.60])
	by e28smtp02.in.ibm.com ([192.168.1.132]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 22 Nov 2011 15:37:26 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAMA7ObY4161744; Tue, 22 Nov 2011 15:37:26 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAMA7OlU028155; Tue, 22 Nov 2011 21:07:24 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAMA6u0P026400; Tue, 22 Nov 2011 21:07:23 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 18:06:22 +0800
Message-Id: <1321956386-12004-7-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
x-cbid: 11112210-5816-0000-0000-00000025676E
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.2
Cc: qemu-trivial@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 07/11] fix spelling in tcg sub directory
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
X-List-Received-Date: Tue, 22 Nov 2011 10:08:30 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>


Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 tcg/tcg.c |    2 +-
 tcg/tcg.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 77bd6ef..d43fa4a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1555,7 +1555,7 @@ static void temp_save(TCGContext *s, int temp, TCGRegSet allocated_regs)
     }
 }
 
-/* save globals to their cannonical location and assume they can be
+/* save globals to their canonical location and assume they can be
    modified be the following code. 'allocated_regs' is used in case a
    temporary registers needs to be allocated to store a constant. */
 static void save_globals(TCGContext *s, TCGRegSet allocated_regs)
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 755a8b3..175000f 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -178,7 +178,7 @@ typedef tcg_target_ulong TCGArg;
 /* Define a type and accessor macros for variables.  Using a struct is
    nice because it gives some level of type safely.  Ideally the compiler
    be able to see through all this.  However in practice this is not true,
-   expecially on targets with braindamaged ABIs (e.g. i386).
+   especially on targets with braindamaged ABIs (e.g. i386).
    We use plain int by default to avoid this runtime overhead.
    Users of tcg_gen_* don't need to know about any of this, and should
    treat TCGv as an opaque type.
-- 
1.7.5.4


