Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axU6A-00057o-DF
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 02:46:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOsW-0000mh-Ss
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:12:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOsK-0001hY-RJ
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:11:51 -0400
Received: from mail-ig0-x243.google.com ([2607:f8b0:4001:c05::243]:36765)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axOs1-0001V8-EB; Mon, 02 May 2016 21:11:26 -0400
Received: by mail-ig0-x243.google.com with SMTP id c3so706678igl.3;
	Mon, 02 May 2016 18:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=w9+fNwxhld3iZY8m6DAIDXwjqHf4k5YORMcW11n7eBE=;
	b=dpwsiOWWKjoJ4MwvLKkRA3aO/GL7dhm8mPvfzLdlApjwxmyzdL1ekerHL1MWNwldrI
	kiaHHltjTOUovSshpscc2r3ChMMMcUmjxoPzq6BiKOrM8bz4Zn/x3cTFtrU6jrqNSUzF
	3mwyq36sLpgBCUaVMUNz/058Bm7gSxCSc3pQ+9QBfOGBCLvDv2LA4s2mx907amofAJf/
	RoteZ9yIttWnpDQSpJglJ4XVDfcJSSIY84NUTBSI/JXSVuKVHsCEsrEqbiPka6zrGdqk
	X4Pq+uc36wTfE8D/dv8VhNYY2Oy1mbcv0aRHPx6MG3cDxSBtYYCHhi8OCwOHxILc5nnY
	rwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w9+fNwxhld3iZY8m6DAIDXwjqHf4k5YORMcW11n7eBE=;
	b=GEqjnApWQLQ1hD+xdG4v0WyTdNzv7e8TbvOUcEvsVqYvXOY/Q6BqFwP+F25n+KLlOo
	wpNqrG9g+nDKdrWaAjZjH3I5NFhFxTuGtrBt2o2sRz6sOKasp+YTW5iEQRoUOma1OfFT
	ARfyeMSfmxgkhZpWqUdq0vsTYHJNARUZG3lEBnx2JaMpQTGjHrjvpyFPfCJfzrYnaQtA
	DhnSyXKgpKKWL9gXYFJsUU9KW8KxHECbBn2rVGOaP+6RaPaPBJSVmBc9z7aLNelB4x7J
	RtdagjBCGMvPcHdRAmQeVY3TXozlFQsR6gjSjuNArlHd/Rs0b2yWBWHX6kIBysUblOw/
	uOfQ==
X-Gm-Message-State: AOPr4FXSMfqXFjRgYgMDAqj3A5CtcPWjmUbdsED5Odfa14n2OARDE94s0Lyu2U+tmMCKVg==
X-Received: by 10.50.119.67 with SMTP id ks3mr180351igb.78.1462237853866;
	Mon, 02 May 2016 18:10:53 -0700 (PDT)
Received: from localhost.localdomain (76-10-180-162.dsl.teksavvy.com.
	[76.10.180.162])
	by smtp.gmail.com with ESMTPSA id 11sm831450ioe.25.2016.05.02.18.10.52
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 02 May 2016 18:10:53 -0700 (PDT)
From: Christopher Friedt <chrisfriedt@gmail.com>
To: famz@redhat.com,
	mst@redhat.com
Cc: Christopher Friedt <chrisfriedt@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon,  2 May 2016 21:10:52 -0400
Message-Id: <1462237852-61856-1-git-send-email-chrisfriedt@gmail.com>
X-Mailer: git-send-email 2.6.4 (Apple Git-63)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::243
X-Mailman-Approved-At: Tue, 03 May 2016 02:46:21 -0400
Subject: [Qemu-trivial] [PATCH 1/2v2] [RESENT-INLINE] Use libtool instead of
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
X-List-Received-Date: Tue, 03 May 2016 01:12:03 -0000

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
+ifdef CONFIG_DARWIN
+	$(call quiet-command,rm -f $@ && libtool -static -o $@ $^,"  libtool    $(TARGET_DIR)$@")
+else
 	$(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"  AR    $(TARGET_DIR)$@")
+endif
 
 quiet-command = $(if $(V),$1,$(if $(2),@echo $2 && $1, @$1))
 
-- 
2.6.4 (Apple Git-63)


