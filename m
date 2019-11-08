Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT2iA-0000N8-2r
	for mharc-qemu-trivial@gnu.org; Fri, 08 Nov 2019 06:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35673)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iT2i7-0000JY-5o
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:45:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iT2i6-0005QP-4q
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:45:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44477
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iT2i6-0005Q0-1Q
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573213549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJnWIXoyf8uDx5hjcLNg2oTG455ZakYUGaXxT7IgzWA=;
 b=cQk1z+sg0Ob+CM03R59+kO+lclAB3h0g6G0qIejfcYEm2i9gVHS6Ma1tl9yrRQTLPnGRvK
 NVDD1HtVTc665gpePbWCeDUhrnoOkbbcxjmZJqOyhCh3z1+T8ZnOSZ4CGAbbandENORdsn
 LtvgyuxaV3KVa4KZWyPwGq+jCsd97JQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-vL4eeN3yNE2xxX17VOv3mg-1; Fri, 08 Nov 2019 06:45:48 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EE3A477;
 Fri,  8 Nov 2019 11:45:47 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C2F7600C9;
 Fri,  8 Nov 2019 11:45:44 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 1/2] configure: Only decompress EDK2 blobs for X86/ARM
 targets
Date: Fri,  8 Nov 2019 12:45:30 +0100
Message-Id: <20191108114531.21518-2-philmd@redhat.com>
In-Reply-To: <20191108114531.21518-1-philmd@redhat.com>
References: <20191108114531.21518-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: vL4eeN3yNE2xxX17VOv3mg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Nov 2019 11:45:52 -0000

The EDK2 firmware blobs only target the X86/ARM architectures.
Define the DECOMPRESS_EDK2_BLOBS variable and only decompress
the blobs when the variable exists.

Fixes: 536d2173b2b
Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: new
---
 Makefile  |  2 ++
 configure | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Makefile b/Makefile
index aa9d1a42aa..3430eca532 100644
--- a/Makefile
+++ b/Makefile
@@ -480,7 +480,9 @@ $(SOFTMMU_ALL_RULES): $(chardev-obj-y)
 $(SOFTMMU_ALL_RULES): $(crypto-obj-y)
 $(SOFTMMU_ALL_RULES): $(io-obj-y)
 $(SOFTMMU_ALL_RULES): config-all-devices.mak
+ifdef DECOMPRESS_EDK2_BLOBS
 $(SOFTMMU_ALL_RULES): $(edk2-decompressed)
+endif
=20
 .PHONY: $(TARGET_DIRS_RULES)
 # The $(TARGET_DIRS_RULES) are of the form SUBDIR/GOAL, so that
diff --git a/configure b/configure
index efe165edf9..9b322284c3 100755
--- a/configure
+++ b/configure
@@ -427,6 +427,7 @@ softmmu=3D"yes"
 linux_user=3D"no"
 bsd_user=3D"no"
 blobs=3D"yes"
+edk2_blobs=3D"no"
 pkgversion=3D""
 pie=3D""
 qom_cast_debug=3D"yes"
@@ -2146,6 +2147,14 @@ case " $target_list " in
   ;;
 esac
=20
+for target in $target_list; do
+  case "$target" in
+    arm-softmmu | aarch64-softmmu | i386-softmmu | x86_64-softmmu)
+      edk2_blobs=3D"yes"
+      ;;
+  esac
+done
+
 feature_not_found() {
   feature=3D$1
   remedy=3D$2
@@ -7526,6 +7535,10 @@ if test "$libudev" !=3D "no"; then
     echo "LIBUDEV_LIBS=3D$libudev_libs" >> $config_host_mak
 fi
=20
+if test "$edk2_blobs" =3D "yes" ; then
+  echo "DECOMPRESS_EDK2_BLOBS=3Dy" >> $config_host_mak
+fi
+
 # use included Linux headers
 if test "$linux" =3D "yes" ; then
   mkdir -p linux-headers
--=20
2.21.0


