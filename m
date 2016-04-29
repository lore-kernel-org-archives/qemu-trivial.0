Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aw8Bf-0000x9-Bp
	for mharc-qemu-trivial@gnu.org; Fri, 29 Apr 2016 09:10:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1aw8BN-0000Jh-C2
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 09:10:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1aw8Ay-0004Ei-KR
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 09:10:03 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34305)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>)
	id 1aw89p-0003Ra-T0; Fri, 29 Apr 2016 09:08:35 -0400
Received: by mail-qk0-x244.google.com with SMTP id i7so4362900qkd.1;
	Fri, 29 Apr 2016 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=89cz2hoeF5gJ/HKYQzLsrlHaQbQO9UGOgbWcTfOjvSY=;
	b=LeaR297H1DSUTX+NPcR+/awjZ8Xca0+Y6gzXTTtiNQdyK0pE9QEEEHUQs2jf/ojh4h
	h7hgPOtGHbajIo0kHuZYxsWnud6eu8pTj6sEtIrfaqmH1HU07mYux024lTCBwDrWD/XU
	500uqW3XCfh99R5yX5TjhFHSjnzu1IgjHD1PfY+AawMmXcsoYXcTzsxU4uibLBrv50Z4
	855H1jkLCURECs0fimvO79BC+1y9OupMYz1/kGjCkcF4Qt9nSAPanIz9+SF5dWWicx3v
	Sk0d5wKTMd8DPkj7Gh9uuV+EzHnvkzj02+IVUHv6D+gZuptrd08dsV4+pHm2kAwEnx33
	XMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=89cz2hoeF5gJ/HKYQzLsrlHaQbQO9UGOgbWcTfOjvSY=;
	b=PmEPAky8eCBqCtDyJAfN95BYYM6lWDdGlLcs+GJ1PMg6V4qI3oGDMFWCrkysmhzOXl
	kBEbo36pAWFXQvvqGoWWTDu02Af9C1Bb5mSKb5bkze0gVQvrevndPOXEfKYneugInvl1
	fn/lDKTYxBd6hXgX0eT11H6jBkj9pC/7al/6QTUCO6Os0E+QATeIdwP77TiygcFWbz1E
	m8yeeksapljhDiKTJXlB6hM9rXUVwbHmaRAmam2vvWBEfu5uUcN/eh4JkFwAUnk/eDUe
	TuLtEI6Zl4slVgwa8sMDU7uKf4l8B0wZNJWcwLok9R3jcw7FyQMJJyUQHR0QzcEHIjoO
	IOxw==
X-Gm-Message-State: AOPr4FWSgc1U1jCVfWxX3tClFNiOKaQCA1y/T7BK9TP6Nj72yq/pIrbqsotDt0wAylkKSw==
X-Received: by 10.55.142.69 with SMTP id q66mr19552421qkd.180.1461935282260;
	Fri, 29 Apr 2016 06:08:02 -0700 (PDT)
Received: from ulmo.home (ool-4a58cb9c.dyn.optonline.net. [74.88.203.156])
	by smtp.gmail.com with ESMTPSA id f91sm4404177qgf.4.2016.04.29.06.08.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 06:08:01 -0700 (PDT)
From: Jan Vesely <jano.vesely@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>
Date: Fri, 29 Apr 2016 09:07:59 -0400
Message-Id: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH] configure: Check if struct fsxattr is
 available from linux header
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Apr 2016 13:10:23 -0000

Fixes build failure with --enable-xfsctl and
new linux headers (>=4.5) and older xfsprogs(<4.5):
In file included from /usr/include/xfs/xfs.h:38:0,
                 from /var/tmp/portage/app-emulation/qemu-2.5.0-r1/work/qemu-2.5.0/block/raw-posix.c:97:
/usr/include/xfs/xfs_fs.h:42:8: error: redefinition of ‘struct fsxattr’
 struct fsxattr {
        ^
In file included from /var/tmp/portage/app-emulation/qemu-2.5.0-r1/work/qemu-2.5.0/block/raw-posix.c:60:0:
/usr/include/linux/fs.h:155:8: note: originally defined here
 struct fsxattr {

CC: qemu-trivial@nongnu.org
CC: Markus Armbruster <armbru@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
---
One can argue that the failure only happens for invalid linux-headers,
xfsprogs combinations, feel free to reject the patch in that case.

This patch relies on functionality introduced in
559607ea173 io: add QIOChannelSocket class

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


