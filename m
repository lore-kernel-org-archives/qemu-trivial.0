Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSndU-00049v-Pk
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:31:32 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGt-0007BA-AS
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGr-00069W-Vx
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:11 -0500
Received: from e28smtp04.in.ibm.com ([122.248.162.4]:60726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGq-000628-7b
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:09 -0500
Received: from /spool/local
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Tue, 22 Nov 2011 15:37:32 +0530
Received: from d28relay05.in.ibm.com ([9.184.220.62])
	by e28smtp04.in.ibm.com ([192.168.1.134]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 22 Nov 2011 15:37:27 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAMA7PtU3747976; Tue, 22 Nov 2011 15:37:26 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAMA7PJN028219; Tue, 22 Nov 2011 21:07:25 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAMA6u0Q026400; Tue, 22 Nov 2011 21:07:24 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 18:06:23 +0800
Message-Id: <1321956386-12004-8-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
x-cbid: 11112210-5564-0000-0000-0000003477F5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.4
Cc: qemu-trivial@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 08/11] fix spelling in tests sub directory
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
X-List-Received-Date: Tue, 22 Nov 2011 10:31:30 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>


Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 tests/cris/check_glibc_kernelversion.c |    2 +-
 tests/cris/check_moveq.c               |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/cris/check_glibc_kernelversion.c b/tests/cris/check_glibc_kernelversion.c
index fcbc7b0..0744872 100644
--- a/tests/cris/check_glibc_kernelversion.c
+++ b/tests/cris/check_glibc_kernelversion.c
@@ -70,7 +70,7 @@
                                                                               \
         /* Now we can test with the required version.  */                     \
         if (version < __LINUX_KERNEL_VERSION)                                 \
-          /* Not sufficent.  */                                               \
+          /* Not sufficient.  */                                               \
           FATAL ("FATAL: kernel too old\n");                                  \
                                                                               \
         _dl_osversion = version;                                              \
diff --git a/tests/cris/check_moveq.c b/tests/cris/check_moveq.c
index 9f71194..80f2dff 100644
--- a/tests/cris/check_moveq.c
+++ b/tests/cris/check_moveq.c
@@ -20,7 +20,7 @@ int main(void)
 	if (t != 10)
 		err();
 
-	/* make sure moveq doesnt clobber the zflag.  */
+	/* make sure moveq doesn't clobber the zflag.  */
 	cris_tst_cc_init();
 	asm volatile ("setf vnc\n");
 	asm volatile ("clearf z\n");
@@ -29,7 +29,7 @@ int main(void)
 	if (t != 0)
 		err();
 
-	/* make sure moveq doesnt clobber the nflag.
+	/* make sure moveq doesn't clobber the nflag.
 	   Also check large immediates  */
 	cris_tst_cc_init();
 	asm volatile ("setf zvc\n");
-- 
1.7.5.4


