Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZKXHB-0005rq-Ey
	for mharc-qemu-trivial@gnu.org; Wed, 29 Jul 2015 15:44:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <leonid@daynix.com>) id 1ZKUst-0007Ly-9h
	for qemu-trivial@nongnu.org; Wed, 29 Jul 2015 13:11:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <leonid@daynix.com>) id 1ZKUsn-0006z6-Op
	for qemu-trivial@nongnu.org; Wed, 29 Jul 2015 13:11:15 -0400
Received: from mail-wi0-f182.google.com ([209.85.212.182]:37556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <leonid@daynix.com>) id 1ZKUsn-0006yz-JB
	for qemu-trivial@nongnu.org; Wed, 29 Jul 2015 13:11:09 -0400
Received: by wibud3 with SMTP id ud3so35377794wib.0
	for <qemu-trivial@nongnu.org>; Wed, 29 Jul 2015 10:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tICQz1HsMFhjrRDbAiN/8KZICR+o9yxz+moqD899wDc=;
	b=kO9CSStrz7YY+CGjgTmvpsgs/hS9Y9tkP7+cBWhOxM8aEkvdPlw61JDCZRNwDMlN2B
	viqR22tEe6YXfjJkLyYv+YFCOTV3ihvhMKi3/wvAhaRGd4JTeNM7sRQk9VF072DkgyOm
	IZl/PT1yRpxDQDD2uv84r6NNb3rfrEjuC1tKh9poJOVZFYLFWvA2qO2E9I9Ufpf20vx6
	KkAUqZSHox8c6Jyt4yGx619/jdz2P8YG/17IyOQ6Npbf2zfEL0riFpg1VGZAKn/08Qyq
	cVQ2MXROK9kDhnH1GifcsjsWiIicsajjKYv5KzlAhXOISaNv82enAzneQAy3s6jzR2dg
	98Rg==
X-Gm-Message-State: ALoCoQm/yghAjb77L7fKVvMl57hDQ2EOsvH6x3y63vI0eC8bDP4Xurid7tgcphXTMFa6UyJ+dl/8
X-Received: by 10.180.83.72 with SMTP id o8mr8049501wiy.27.1438189869048;
	Wed, 29 Jul 2015 10:11:09 -0700 (PDT)
Received: from bark.daynix ([5.102.236.99]) by smtp.gmail.com with ESMTPSA id
	fb3sm25316946wib.21.2015.07.29.10.11.07 for <qemu-trivial@nongnu.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 10:11:08 -0700 (PDT)
From: Leonid Bloch <leonid@daynix.com>
To: qemu-trivial@nongnu.org
Date: Wed, 29 Jul 2015 20:10:51 +0300
Message-Id: <1438189851-688-2-git-send-email-leonid@daynix.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1438189851-688-1-git-send-email-leonid@daynix.com>
References: <1438189851-688-1-git-send-email-leonid@daynix.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.182
X-Mailman-Approved-At: Wed, 29 Jul 2015 15:44:27 -0400
Subject: [Qemu-trivial] [PATCH 2/2] qemu-ga: Two MSI related cosmetic changes
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
X-List-Received-Date: Wed, 29 Jul 2015 17:11:20 -0000

Signed-off-by: Leonid Bloch <leonid@daynix.com>
---
 Makefile                  | 2 +-
 qga/installer/qemu-ga.wxs | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index c9be643..fc22da5 100644
--- a/Makefile
+++ b/Makefile
@@ -295,7 +295,7 @@ qemu-ga$(EXESUF): $(qga-obj-y) libqemuutil.a libqemustub.a
 ifdef QEMU_GA_MSI_ENABLED
 QEMU_GA_MSI=qemu-ga-$(ARCH).msi
 
-msi: ${QEMU_GA_MSI}
+msi: $(QEMU_GA_MSI)
 
 $(QEMU_GA_MSI): qemu-ga.exe
 
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 2c43f1b..4e917a9 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -126,7 +126,8 @@
               Property="cmd"
               Impersonate="no"
               Return="check"
-              ></CustomAction>
+              >
+    </CustomAction>
     <?endif?>
 
     <Feature Id="QEMUFeature" Title="QEMU Guest Agent" Level="1">
-- 
2.4.3


