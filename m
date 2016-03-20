Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ahS0p-0000mH-Ns
	for mharc-qemu-trivial@gnu.org; Sat, 19 Mar 2016 21:18:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1ahS0n-0000ld-7L
	for qemu-trivial@nongnu.org; Sat, 19 Mar 2016 21:18:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1ahS0j-0003aD-7e
	for qemu-trivial@nongnu.org; Sat, 19 Mar 2016 21:18:33 -0400
Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233]:33793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1ahS0j-0003a8-3M
	for qemu-trivial@nongnu.org; Sat, 19 Mar 2016 21:18:29 -0400
Received: by mail-qg0-x233.google.com with SMTP id w104so130451317qge.1
	for <qemu-trivial@nongnu.org>; Sat, 19 Mar 2016 18:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=QE82Z+hwKt8MnlcC1Z0Os2XzODqOkj0iddw2I6TVpZ0=;
	b=BIbNXXTGXBi2gn5Ft2Q6dJqHnKrSJScKHbfZR4uay9aMRng32U86mIdeS5VTeYiENe
	PRnegX6rL0UfO4L1KfVvHeJ+nZdqxwnyppktm10eNm6skECzhfDlqIluW8ixysTPlbt6
	v6XyvWzP3QKmrCyeZbb/jLwH+qleuTed45CLTaKtDENGwpuTrWbv4+coWf7SeprKuHDp
	XWaDmj+Wbzcjj1ccJiFQH7wICPPdXxLbXphBxp9kcGSlqjLUhqWb3QmvjFOm0Vw18x6f
	8HRXsd36uIqkNZTUipUv3+w0qqAUC/Rd61G0fHJ6NSbokBaVKblD6KwmqMTkbl37DjOA
	i4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QE82Z+hwKt8MnlcC1Z0Os2XzODqOkj0iddw2I6TVpZ0=;
	b=aITgFwZLOzqT48S8KfFmfOCf1wAUAp79bBgJIj0gyOBZpwyYOWzxGaFHttWDKSMO9l
	flNPHCotcI+djW+I0Exo/nb8lIa0rREMC9a3PPtYW6z8K3xu7aUuPawWmJK94gwAfhmA
	0gh2fPDLrGBUXkqDfdUZVrtjQiId8CbtU5EqzObv+1q6YS256NwYcAKiLErvplyvj+kO
	1cfUJj7FRHkZ2/nuwkNktpDiEqYpDYGBkI7AFnudCOLDvGFSelbU+xoCGvAmwcTHL1CQ
	YhQccKDgpU3SW8YjWIW+xSjJrubiaH4k/+o524I3gHYrdbgRc5G40DH35yMRGIzYDsXo
	Hnmg==
X-Gm-Message-State: AD7BkJKveGVUomoVfZwyMUvFzbunWGAx/aMfUq8r++fCMjwtBXHom1vwiTAmlZunUp/Q9Q==
X-Received: by 10.140.224.18 with SMTP id u18mr34235544qhb.10.1458436708197;
	Sat, 19 Mar 2016 18:18:28 -0700 (PDT)
Received: from ulmo.home (ool-4a58cb9c.dyn.optonline.net. [74.88.203.156])
	by smtp.gmail.com with ESMTPSA id
	f76sm9242714qhe.14.2016.03.19.18.18.27 for <qemu-trivial@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Mar 2016 18:18:27 -0700 (PDT)
From: Jan Vesely <jano.vesely@gmail.com>
To: qemu-trivial@nongnu.org
Date: Sat, 19 Mar 2016 21:18:26 -0400
Message-Id: <1458436706-20743-1-git-send-email-jano.vesely@gmail.com>
X-Mailer: git-send-email 2.7.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::233
Subject: [Qemu-trivial] [PATCH] configure: Check if struct fsxattr is
	available from linux header
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
X-List-Received-Date: Sun, 20 Mar 2016 01:18:34 -0000

Fixes build with new linux headers.

Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
---
linux-headers-4.5 and xfsprogs-3.2.4 in my case

 configure | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/configure b/configure
index b88d0db..bb64d6c 100755
--- a/configure
+++ b/configure
@@ -4474,6 +4474,21 @@ if test "$fortify_source" != "no"; then
   fi
 fi
 
+########################################
+# check if struct fsxattr is available
+
+have_fsxattr=no
+cat > $TMPC << EOF
+#include <linux/fs.h>
+struct fsxattr foo;
+int main(void) {
+  return 0;
+}
+EOF
+if compile_prog "" "" ; then
+    have_fsxattr=yes
+fi
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -5137,6 +5152,9 @@ fi
 if test "$have_ifaddrs_h" = "yes" ; then
     echo "HAVE_IFADDRS_H=y" >> $config_host_mak
 fi
+if test "$have_fsxattr" = "yes" ; then
+    echo "HAVE_FSXATTR=y" >> $config_host_mak
+fi
 if test "$vte" = "yes" ; then
   echo "CONFIG_VTE=y" >> $config_host_mak
   echo "VTE_CFLAGS=$vte_cflags" >> $config_host_mak
-- 
2.7.3


