Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aOnUF-00043Q-M6
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jan 2016 09:23:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aOnUA-0003u8-CP
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 09:23:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aOnU7-0000zT-Oz
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 09:23:46 -0500
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:34656)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aOnU7-0000z8-EQ
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 09:23:43 -0500
Received: by mail-wm0-x22b.google.com with SMTP id 128so12776580wmz.1
	for <qemu-trivial@nongnu.org>; Thu, 28 Jan 2016 06:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=rRl09XFMuCdb74mxlDud/xZG7XgQye8sCJnMhKWF2yM=;
	b=CErNh3xnP52TcZbvYPt+2A24gvaVMTs5WT4Jb9iGPIWm7wmxcojNdVHd0VzCXwNeGJ
	/2Y0v8+BFon6VWZhBo0a7nxwENJsNrxbxPA3ppZX9Jp84hhTTvRza3nrrFRV6yxK8WQx
	FYsxITbUIlETO6VI4jVaP8+NDzh+zWYZK8kJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=rRl09XFMuCdb74mxlDud/xZG7XgQye8sCJnMhKWF2yM=;
	b=NRveteYN30srM8+R2+O+UYL3wxQwePbbcz2vyLQQ3oRg0sq1mN7z9ZZ5cgx181DE/D
	0thsAX+OwEGmTV2e/ND3VL18rosk8N5uXv1rvicD/9RiYVs6kWiCzeU7FMt2SdQbS3N6
	Jo8bbg/YRClBlgvG2JInnwhADS8pSYyuZ/eHHsvKy1/NMypiQ/BPB187u/f+hNx56UgB
	oj15PQsdaQu0KCIc+d7eG78PDaToEUmIMe5ElUZlQeeGDxCxzxTBtJ2RVVJrUcYSGbCe
	vjJF0UzCRNx75IPcAJWJXkCJxef/iVrGswEdAC9Y8EnNpRwBEzxVoxn0qkmrjDzb6Qd0
	AM5g==
X-Gm-Message-State: AG10YOSfOx8/tkCqStHz269T2sbC6u3rnstEMNe0NVAxHOP16k3275ETkynyleEsECnYTN0m
X-Received: by 10.28.99.69 with SMTP id x66mr3539750wmb.10.1453991022846;
	Thu, 28 Jan 2016 06:23:42 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	xx3sm11292015wjc.32.2016.01.28.06.23.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jan 2016 06:23:40 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id C73A63E0593;
	Thu, 28 Jan 2016 14:23:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 28 Jan 2016 14:23:27 +0000
Message-Id: <1453991009-32736-2-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
References: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, stefanha@redhat.com,
	pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	david@gibson.dropbear.id.au
Subject: [Qemu-trivial] [PATCH v3 1/3] .travis.yml: migrate to container
	builds
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
X-List-Received-Date: Thu, 28 Jan 2016 14:23:48 -0000

This moves the Travis tests from the legacy VM infrastructure (which
only seems to run 5-6 jobs at once) to the new container based approach.

The principle difference is there is no sudo in the containers so all
packages are installed using the apt add-on. This means one of the build
combinations can be dropped as it was only for checking the build with
additional packages.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

--
v2
  - re-enabled the user-space-tracing build
  - disable optional extras (instead of having optional build)
  - remove stray linux-user target from make check target
v3
  - Add Dave's t-b and rb tags
---
 .travis.yml | 44 ++++++++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 6ca0260..4a0c23a 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -1,9 +1,37 @@
+sudo: false
 language: c
 python:
   - "2.4"
 compiler:
   - gcc
   - clang
+addons:
+  apt:
+    packages:
+      - libaio-dev
+      - libattr1-dev
+      - libbrlapi-dev
+      - libcap-ng-dev
+      - libgnutls-dev
+      - libgtk-3-dev
+      - libiscsi-dev
+      - liblttng-ust-dev
+      - libncurses5-dev
+      - libnss3-dev
+      - libpixman-1-dev
+      - libpng12-dev
+      - librados-dev
+      - libsdl1.2-dev
+      - libseccomp-dev
+      - libspice-protocol-dev
+      - libspice-server-dev
+      - libssh2-1-dev
+      - liburcu-dev
+      - libusb-1.0-0-dev
+      - libvte-2.90-dev
+      - sparse
+      - uuid-dev
+
 notifications:
   irc:
     channels:
@@ -14,11 +42,6 @@ env:
   global:
     - TEST_CMD=""
     - EXTRA_CONFIG=""
-    # Development packages, EXTRA_PKGS saved for additional builds
-    - CORE_PKGS="libusb-1.0-0-dev libiscsi-dev librados-dev libncurses5-dev"
-    - NET_PKGS="libseccomp-dev libgnutls-dev libssh2-1-dev  libspice-server-dev libspice-protocol-dev libnss3-dev"
-    - GUI_PKGS="libgtk-3-dev libvte-2.90-dev libsdl1.2-dev libpng12-dev libpixman-1-dev"
-    - EXTRA_PKGS=""
   matrix:
     # Group major targets together with their linux-user counterparts
     - TARGETS=alpha-softmmu,alpha-linux-user
@@ -43,8 +66,6 @@ git:
 before_install:
   - wget -O - http://people.linaro.org/~alex.bennee/qemu-submodule-git-seed.tar.xz | tar -xvJ
   - git submodule update --init --recursive
-  - sudo apt-get update -qq
-  - sudo apt-get install -qq ${CORE_PKGS} ${NET_PKGS} ${GUI_PKGS} ${EXTRA_PKGS}
 before_script:
   - ./configure --target-list=${TARGETS} --enable-debug-tcg ${EXTRA_CONFIG}
 script:
@@ -54,7 +75,7 @@ matrix:
   include:
     # Make check target (we only do this once)
     - env:
-        - TARGETS=alpha-softmmu,arm-softmmu,aarch64-softmmu,cris-softmmu,i386-softmmu,x86_64-softmmu,m68k-softmmu,microblaze-softmmu,microblazeel-softmmu,mips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmmu,or32-softmmu,ppc-softmmu,ppc64-softmmu,ppcemb-softmmu,s390x-softmmu,sh4-softmmu,sh4eb-softmmu,sparc-softmmu,sparc64-softmmu,unicore32-softmmu,unicore32-linux-user,lm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmmu,xtensaeb-softmmu
+        - TARGETS=alpha-softmmu,arm-softmmu,aarch64-softmmu,cris-softmmu,i386-softmmu,x86_64-softmmu,m68k-softmmu,microblaze-softmmu,microblazeel-softmmu,mips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmmu,or32-softmmu,ppc-softmmu,ppc64-softmmu,ppcemb-softmmu,s390x-softmmu,sh4-softmmu,sh4eb-softmmu,sparc-softmmu,sparc64-softmmu,unicore32-softmmu,lm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmmu,xtensaeb-softmmu
           TEST_CMD="make check"
       compiler: gcc
     # Debug related options
@@ -64,16 +85,16 @@ matrix:
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-debug --enable-tcg-interpreter"
       compiler: gcc
-    # All the extra -dev packages
+    # Disable a few of the optional features
     - env: TARGETS=i386-softmmu,x86_64-softmmu
-           EXTRA_PKGS="libaio-dev libcap-ng-dev libattr1-dev libbrlapi-dev uuid-dev libusb-1.0.0-dev"
+           EXTRA_CONFIG="--disable-linux-aio --disable-cap-ng --disable-attr --disable-brlapi --disable-uuid --disable-libusb"
       compiler: gcc
     # Currently configure doesn't force --disable-pie
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-gprof --enable-gcov --disable-pie"
       compiler: gcc
+    # Sparse
     - env: TARGETS=i386-softmmu,x86_64-softmmu
-           EXTRA_PKGS="sparse"
            EXTRA_CONFIG="--enable-sparse"
       compiler: gcc
     # All the trace backends (apart from dtrace)
@@ -87,7 +108,6 @@ matrix:
            EXTRA_CONFIG="--enable-trace-backends=ftrace"
       compiler: gcc
     - env: TARGETS=i386-softmmu,x86_64-softmmu
-          EXTRA_PKGS="liblttng-ust-dev liburcu-dev"
           EXTRA_CONFIG="--enable-trace-backends=ust"
       compiler: gcc
     - env: TARGETS=i386-softmmu,x86_64-softmmu
-- 
2.7.0


