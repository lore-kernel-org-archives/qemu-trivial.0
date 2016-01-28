Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aOnUE-000411-Bc
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jan 2016 09:23:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aOnUA-0003u1-BV
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 09:23:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aOnU8-000106-VL
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 09:23:46 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:34670)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aOnU8-0000zl-Oh
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 09:23:44 -0500
Received: by mail-wm0-x235.google.com with SMTP id 128so12777430wmz.1
	for <qemu-trivial@nongnu.org>; Thu, 28 Jan 2016 06:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=fsZ4GFrSUtk7rh2CPKv1o8refFUGCa84BaoF5qFGfbk=;
	b=d+hHbo2QynqfM6uKvawCnXHvlWem++t5cDhWkM1cQiEIsrBgiF1+ylAEO69ErPmLRz
	UYg51mwKR0++pkzlUdWXLSxWG3H8JmT7VIRc7gehs6f6gtOS4ymvVjd1ENXZJs0C+z/O
	3i3ZInK9wbGpsIqNTdIPJXNIS57FrwNaT1tbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=fsZ4GFrSUtk7rh2CPKv1o8refFUGCa84BaoF5qFGfbk=;
	b=FgOxxM0bQ8CihkodVDukjSttpJbqrWs6boNHyJ/wpCWyfjTpydxcIAHZHqLkBzr1r7
	CZ4LVbaTPCZcKMsoFbMp4jFFp+RglMzVVGVge/Ner0giyYdsvhGsjdCb8H07I9a0i6P4
	qZBYy/D8QND4D++M9X0+LldrERrdYV9AS/AKd6nQ5WHIyyoNL9UnN6fpZyVOtdd4Xtkg
	+IOspC2UuHE2P5pky6IntDn0YG4yz393ovYbL9IqEsyfkVf/gSyJizN53jx2XOLy48hI
	pm9B9kPehnIR4FvHWKYDc1rb2Cs3YG45rr5SBOPA3E+34s74YTb5tevkAutHXBMwWDZW
	FePw==
X-Gm-Message-State: AG10YOQmIBobx0cUUYjIZwwAyfIkMvgfmsi+BujVE+caGDIE1odLLwmrYOOyuYyh8U7tW8km
X-Received: by 10.28.211.136 with SMTP id k130mr3610905wmg.84.1453991024164;
	Thu, 28 Jan 2016 06:23:44 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	i2sm11244010wjx.42.2016.01.28.06.23.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jan 2016 06:23:40 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id D92EE3E0770;
	Thu, 28 Jan 2016 14:23:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 28 Jan 2016 14:23:28 +0000
Message-Id: <1453991009-32736-3-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
References: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, stefanha@redhat.com,
	pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	david@gibson.dropbear.id.au
Subject: [Qemu-trivial] [PATCH v3 2/3] .travis.yml: run make check for all
	matrix targets
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
X-List-Received-Date: Thu, 28 Jan 2016 14:23:47 -0000

We only ran make check once before it used to be an unreliable target.
It was only a stop gap measure and we should be able to revert it now.
This also stops us needing a large all-MMU build.

We disable "make check" for a couple of the extra config targets which
are currently broken.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 4a0c23a..16be23f 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -40,7 +40,7 @@ notifications:
     on_failure: always
 env:
   global:
-    - TEST_CMD=""
+    - TEST_CMD="make check"
     - EXTRA_CONFIG=""
   matrix:
     # Group major targets together with their linux-user counterparts
@@ -73,17 +73,14 @@ script:
 matrix:
   # We manually include a number of additional build for non-standard bits
   include:
-    # Make check target (we only do this once)
-    - env:
-        - TARGETS=alpha-softmmu,arm-softmmu,aarch64-softmmu,cris-softmmu,i386-softmmu,x86_64-softmmu,m68k-softmmu,microblaze-softmmu,microblazeel-softmmu,mips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmmu,or32-softmmu,ppc-softmmu,ppc64-softmmu,ppcemb-softmmu,s390x-softmmu,sh4-softmmu,sh4eb-softmmu,sparc-softmmu,sparc64-softmmu,unicore32-softmmu,lm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmmu,xtensaeb-softmmu
-          TEST_CMD="make check"
-      compiler: gcc
     # Debug related options
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-debug"
       compiler: gcc
+    # We currently disable "make check"
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-debug --enable-tcg-interpreter"
+           TEST_CMD=""
       compiler: gcc
     # Disable a few of the optional features
     - env: TARGETS=i386-softmmu,x86_64-softmmu
@@ -104,11 +101,15 @@ matrix:
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-trace-backends=simple"
       compiler: gcc
+    # We currently disable "make check"
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-trace-backends=ftrace"
+           TEST_CMD=""
       compiler: gcc
+    # We currently disable "make check"
     - env: TARGETS=i386-softmmu,x86_64-softmmu
-          EXTRA_CONFIG="--enable-trace-backends=ust"
+           EXTRA_CONFIG="--enable-trace-backends=ust"
+           TEST_CMD=""
       compiler: gcc
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-modules"
-- 
2.7.0


