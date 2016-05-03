Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axU64-0004x3-WD
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 02:46:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOjE-00050m-Kp
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:02:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOit-0007t0-Lw
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:02:15 -0400
Received: from mail-ig0-x241.google.com ([2607:f8b0:4001:c05::241]:33474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axOiZ-0007kZ-9y; Mon, 02 May 2016 21:01:41 -0400
Received: by mail-ig0-x241.google.com with SMTP id rc4so706343igc.0;
	Mon, 02 May 2016 18:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pRiv8VXs5QtJw1Ttw/UAZloKs2vGbhWtgc3I3oe4h3I=;
	b=EHV3wDiKd/wUCCbOBqb1sn2ZtmNKYdB3LePWEgqYHPqVsDLWR4LFjmmMc8aegNG+nQ
	tMavEYxWioCtpXLNlm1VcUDOXfJO2EfQhvKz+R5QgYTx3tFp8L2w3wAuKVfyFxzWZ1Ad
	5v3kNnSKR5m0OcR/Tcm8wVB/lieTdJ9HWcRZ/sbu0GbvorBf000WMHF/JKycxoF/xZyM
	9pc72/uG4/9bm3Xh2wXh7jTIbktEOfqHdDr07mlNFz0qDuxucp+mbu1AtJlG9erR2uhB
	GEucpaPR+/y5n5ASCC8VqLIi1Zl+K+Um+J7he1BntkCIUUWtAFUMtkDSI0iwBQv5lvGI
	7omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pRiv8VXs5QtJw1Ttw/UAZloKs2vGbhWtgc3I3oe4h3I=;
	b=hyPMjfnrR3mnYqvk5oIGzWSs+8itxcRP16kLziMiUm1kzo4Le/R1PT5HfnXJ6ifsrR
	4jqXFpeYDFH7rIKeC5Tjsp6A2gt0AzGsq+xoRj8tPkPUJcSSCETtTf0uKWm1EBMmHgDs
	HOG3lGo0VpfY49ddZGBogQIzAYL+y7wv64DMhE6WlLhbCnLbmZKwae6dYr2FehIxfL8Z
	/UD07zC1wF5DWqMsjSvx3jS4gkMEnEmYcCLv4Cwo5JCSL5bXIf6QTYh03Gr0GOYr+zxu
	tYCTuk7b9jNaDvw2MpygbxwMhAT5RJecv4Vggj417b5/CvGTKe9GjcGf/UATGw6Uk85H
	l0Yw==
X-Gm-Message-State: AOPr4FUNSkl28eW9zNcVXmugd4yI+QEbxnn+mtmE/jCKfaeBM3CEjM7PpVSTF8NtXlbiWA==
X-Received: by 10.50.134.37 with SMTP id ph5mr158414igb.8.1462237267509;
	Mon, 02 May 2016 18:01:07 -0700 (PDT)
Received: from localhost.localdomain (76-10-180-162.dsl.teksavvy.com.
	[76.10.180.162])
	by smtp.gmail.com with ESMTPSA id i14sm803917iod.34.2016.05.02.18.01.06
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 02 May 2016 18:01:06 -0700 (PDT)
From: Christopher Friedt <chrisfriedt@gmail.com>
To: famz@redhat.com,
	mst@redhat.com
Cc: Christopher Friedt <chrisfriedt@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon,  2 May 2016 21:01:04 -0400
Message-Id: <1462237265-61763-2-git-send-email-chrisfriedt@gmail.com>
X-Mailer: git-send-email 2.6.4 (Apple Git-63)
In-Reply-To: <1462237265-61763-1-git-send-email-chrisfriedt@gmail.com>
References: <1462237265-61763-1-git-send-email-chrisfriedt@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::241
X-Mailman-Approved-At: Tue, 03 May 2016 02:46:15 -0400
Subject: [Qemu-trivial] [PATCH 1/2] [RESENT-INLINE] Use libtool instead of
 ar to create static libraries on Darwin.
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
X-List-Received-Date: Tue, 03 May 2016 01:02:27 -0000

Currently, at least on Mac OS X 10.11.4 (El Capitan), Qemu fails to build for a few reasons.

One of those reasons is that Apple's ld (at least ld64) does not properly process archive files created with ar (even Apple's ar).

After some RTFM'ing, I came upon this tidbit, which is unfortunate. Luckily, autotools packages are not broken.

"Libtool with -static is intended to replace ar(5) and ranlib."
http://www.manpages.info/macosx/libtool.1.html

In any case, this change takes Apple's recommendations into account and allows Qemu to build on Mac OS X El Capitan.

Signed-off-by: Christopher Friedt <chrisfriedt@gmail.com>
---
 rules.mak | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rules.mak b/rules.mak
index d1ff311..44421af 100644
--- a/rules.mak
+++ b/rules.mak
@@ -105,7 +105,11 @@ modules:
 	$(call LINK,$(filter %.o %.a %.mo, $^))
 
 %.a:
+ifeq ($(shell uname),Darwin)
+	$(call quiet-command,rm -f $@ && libtool -static -o $@ $^,"  libtool    $(TARGET_DIR)$@")
+else
 	$(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"  AR    $(TARGET_DIR)$@")
+endif
 
 quiet-command = $(if $(V),$1,$(if $(2),@echo $2 && $1, @$1))
 
-- 
2.6.4 (Apple Git-63)


