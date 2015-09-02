Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZX71T-000257-KQ
	for mharc-qemu-trivial@gnu.org; Wed, 02 Sep 2015 08:20:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jerome.forissier@linaro.org>) id 1ZX4AB-0002az-Kt
	for qemu-trivial@nongnu.org; Wed, 02 Sep 2015 05:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jerome.forissier@linaro.org>) id 1ZX4A7-0008LT-JL
	for qemu-trivial@nongnu.org; Wed, 02 Sep 2015 05:17:03 -0400
Received: from mail-wi0-f177.google.com ([209.85.212.177]:34700)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jerome.forissier@linaro.org>) id 1ZX4A7-0008J0-Dd
	for qemu-trivial@nongnu.org; Wed, 02 Sep 2015 05:16:59 -0400
Received: by wicfx3 with SMTP id fx3so10478189wic.1
	for <qemu-trivial@nongnu.org>; Wed, 02 Sep 2015 02:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e4Uy31FIQB+BWzGNx7kOOUMOlmp+gBHWeqtEU4Z64jo=;
	b=RTQ4tS70nQBnM6tJxg1KSZhigNWueBaIP+nUycpko4oIkhO8xGFEtEFMNa4Ja7E4U+
	9Wqe5/rl9mqB12CWT5174x0lPvOE5p6y4e2ErVPUtleo6N/qDvbN9GllvxC6S30BqQnB
	RgYNTbqjE0tqXJtkQbe7WU+yV9E6ZT5ma883bLFY9VCJdeeyCRh1A7Hlv1wG77Rn7xzU
	72wa16UhopZ7m0Ns8EVZ+LYMYZE0UMSpbSnesof7+bkp1ZmKqsL296iJ1Qnsbx+XKwkB
	h2QTyKyG511Rv8Y24z9QJs1f3CJXs+Wu8dmkPWWAu1zZDRKPd1nOedcuFo6nFmXxjFqX
	Z0zA==
X-Gm-Message-State: ALoCoQkhSXfwEYiMzgZ5zxbm15lOILGZP5gWIQMnZuLJjPZu0cPgdgPFJCMPUKF/h3MCRrRxoZ5/
X-Received: by 10.194.209.167 with SMTP id mn7mr37069013wjc.64.1441185418054; 
	Wed, 02 Sep 2015 02:16:58 -0700 (PDT)
Received: from localhost.localdomain (mou06-2-88-169-86-104.fbx.proxad.net.
	[88.169.86.104])
	by smtp.gmail.com with ESMTPSA id r8sm2583012wiz.2.2015.09.02.02.16.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 02:16:57 -0700 (PDT)
From: Jerome Forissier <jerome.forissier@linaro.org>
To: qemu-trivial@nongnu.org
Date: Wed,  2 Sep 2015 11:14:26 +0200
Message-Id: <1441185266-25643-1-git-send-email-jerome.forissier@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.177
X-Mailman-Approved-At: Wed, 02 Sep 2015 08:20:14 -0400
Cc: Jerome Forissier <jerome.forissier@linaro.org>
Subject: [Qemu-trivial] [PATCH] Makefile: suppress command echoing in silent
	mode (make -s)
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
X-List-Received-Date: Wed, 02 Sep 2015 09:17:04 -0000

Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
---
 rules.mak | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/rules.mak b/rules.mak
index 4551b9e..a44ba29 100644
--- a/rules.mak
+++ b/rules.mak
@@ -125,7 +125,18 @@ modules:
 %.a:
 	$(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"  AR    $(TARGET_DIR)$@")
 
-quiet-command = $(if $(V),$1,$(if $(2),@echo $2 && $1, @$1))
+# Suppress command echoing in silent mode (make -s)
+ifneq ($(filter 4.%,$(MAKE_VERSION)),)  # make-4
+ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
+SILENT := 1
+endif
+else                                    # make-3.8x
+ifneq ($(findstring s, $(MAKEFLAGS)),)
+SILENT := 1
+endif
+endif
+
+quiet-command = $(if $(V),$1,$(if $(2),$(if $(SILENT),@$1,@echo $2 && $1),@$1))
 
 # cc-option
 # Usage: CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
-- 
2.1.4


