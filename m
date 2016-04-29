Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1awC1u-0000y2-BL
	for mharc-qemu-trivial@gnu.org; Fri, 29 Apr 2016 13:16:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1awC1l-0000cR-K1
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 13:16:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1awC1Z-0000T1-WB
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 13:16:24 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>)
	id 1awC1G-0000GT-2o; Fri, 29 Apr 2016 13:15:59 -0400
Received: by mail-qk0-x241.google.com with SMTP id q184so8535193qkf.0;
	Fri, 29 Apr 2016 10:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4LNGBwgBSAPJIui/rG+oibbUparMQKPv1pgCMU3myKI=;
	b=kgjYWJhS0BkV3VyIEGkghaBbwf7ddgsE0JidcDXp0yGEYNXnjGCvbd+tL9tDxlEGz8
	sdMLXLLiUm25yOoMNsqh3J6aYmv+cJvI01LXUJAa/JdLHtCnxkUwaWaQwrn4WBUqG3x8
	ow452f4OuTISFr/2zUXnDVvkJcuyzbMv7c58LbstiQ/ulFFCv00UWADRpyE7q9FCqpxx
	QI1qojPWQKXxr3Noga22ZmYZRBiZMCd8Oex7n/N22DUZBTq0RHwVeDdLNK83qfrPNZHT
	ERUjsI1Z4JWURPpEpjFThhsEVc3TxQcBY3JJAF7DCRaE3IwZ+zB4BeAQFyt/R2uYHA8A
	6UPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4LNGBwgBSAPJIui/rG+oibbUparMQKPv1pgCMU3myKI=;
	b=JxtCC9CvvF0VYO7hbDkrc7WnrxSP/dMkNFFogrQ4k5UwrM2VroSe1XZr3nkC9napNa
	4N17tAaHg4vaAJKltc+9t1u9J9yaXa2ZkkChVKDrQLCDkYFeBVf7GFeptagqkwXIUlv2
	gLECYHpOtH1w8HKvERbm5ZTWdFfp7RWuNRfK+PzJdsPSwCDoSPqOPIN5vlLVMVBJh7Vz
	7yr8rjqsR3Lpyu9WlBe7nmqnU+Ghg6OuBj2MWjbXWS3u8mh1Pn+0zz0lDOTTmPr28cHf
	sIie4aiPNWJEmnHRploIPzH/F+vsmiY8GAk2aZ+kuXWnA8ZKMxBzRvpPbpM9JubI2c9x
	dwPg==
X-Gm-Message-State: AOPr4FXC5hp2Q8mXOe7BYd76LxtGb492l4ebtXL7unCYqZxJWKXap7OPXmh8FJDLNahnGw==
X-Received: by 10.55.186.132 with SMTP id k126mr21003988qkf.176.1461950126659; 
	Fri, 29 Apr 2016 10:15:26 -0700 (PDT)
Received: from ulmo.rutgers.edu (lawn-gw.rutgers.edu. [128.6.168.245])
	by smtp.gmail.com with ESMTPSA id
	y129sm4722661qka.33.2016.04.29.10.15.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 10:15:25 -0700 (PDT)
From: Jan Vesely <jano.vesely@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>
Date: Fri, 29 Apr 2016 13:15:23 -0400
Message-Id: <1461950123-5498-1-git-send-email-jano.vesely@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAFEAcA-gYp9TS=JrEGgnP8uwXGuhcUzq5+wgdTDhigTyDNND9w@mail.gmail.com>
References: <CAFEAcA-gYp9TS=JrEGgnP8uwXGuhcUzq5+wgdTDhigTyDNND9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v2] configure: Check if struct fsxattr is
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
X-List-Received-Date: Fri, 29 Apr 2016 17:16:36 -0000

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

v2: Add explanatory comment

CC: qemu-trivial@nongnu.org
CC: Markus Armbruster <armbru@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
---
 configure | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/configure b/configure
index ab54f3c..2c3585c 100755
--- a/configure
+++ b/configure
@@ -4493,6 +4493,21 @@ if test "$fortify_source" != "no"; then
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
@@ -5160,6 +5175,12 @@ fi
 if test "$have_ifaddrs_h" = "yes" ; then
     echo "HAVE_IFADDRS_H=y" >> $config_host_mak
 fi
+
+# xfs headers will try to redefine structs from linux headers
+# if this macro is not set
+if test "$have_fsxattr" = "yes" ; then
+    echo "HAVE_FSXATTR=y" >> $config_host_mak
+fi
 if test "$vte" = "yes" ; then
   echo "CONFIG_VTE=y" >> $config_host_mak
   echo "VTE_CFLAGS=$vte_cflags" >> $config_host_mak
-- 
2.7.4


