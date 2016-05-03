Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axU60-0004p1-NN
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 02:46:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOWQ-00060E-Ug
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 20:49:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOWF-00059q-5B
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 20:49:01 -0400
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243]:35443)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axOVv-0004xZ-Ky; Mon, 02 May 2016 20:48:36 -0400
Received: by mail-io0-x243.google.com with SMTP id u185so760569iod.2;
	Mon, 02 May 2016 17:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version; bh=GJNI622nbDgV8TrfGM04D69p0oSVMz1in8dgelWXZgk=;
	b=mIAQGHbxYYh9/jYlvXE6T1K6kQV7tiizjVk8RZ6JNqTJmvrZIKKu4NZShBFlpWjXfP
	hHF9MYMm5MbaVcdNrV6/kKCB9uvQ38bp7RWIn4FD+/BLRYVfwVdYdLhON/j2yARmPMVQ
	kVHGJTDYzKyumzbeAEF1lyG9/muBf6MsZiYRiAl+BSs0MBTbNiRfVAntLFvXxaeU7TM2
	RWMcqV3WMrGeVnFr1AG1deyqr7yL2v2USNvzBxqFgEb4LVFve+ktst1Uc66veFW11Nc3
	GvSpj2yjBDm4a6ndfHLQKrV9WMSejLA9eqgNtjfL57VOeUPBE1FGcR7Hj5bDvMR1n6T7
	UcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version;
	bh=GJNI622nbDgV8TrfGM04D69p0oSVMz1in8dgelWXZgk=;
	b=kWpooY5viNAxvo2RFEUZqfgdis1i5n5Try8GDe71EQahCiFjZe9MQNO5OjaPQbAMsq
	k83CEHi1BJMOseRk7EtzhC9mtC1z5CdKewvDadk55Nh+iwUy1OBRndja8pTWeCWpcVrZ
	rQjqxsGq2tShgPmFyNBGumgvaWrHGsoB8LE9Tp1bj0H2ZghX9EstyNL8LbFXLiFXrm+f
	Zz3LtkqpzKlPSaGT/5hMATMxT0ASHVxUCQCCFP60Ap1jsYiWtfgxhZkYQ1vvW+W/tka4
	t2BjMACN7yb+1U7dOVV3uf/G2tESMo2Z2802qknws7ugLh3HKYcl0MhmDefckWo1bIYG
	D8aQ==
X-Gm-Message-State: AOPr4FU/TeZfLWbCWdTyKfXlM9jhlz+MyRBZNlyF/0XPLAjLOKr+qAC8Jcnd9u6kpdFYsQ==
X-Received: by 10.107.137.19 with SMTP id l19mr36933iod.177.1462236483959;
	Mon, 02 May 2016 17:48:03 -0700 (PDT)
Received: from localhost.localdomain (76-10-180-162.dsl.teksavvy.com.
	[76.10.180.162])
	by smtp.gmail.com with ESMTPSA id u187sm815650iod.3.2016.05.02.17.48.02
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 02 May 2016 17:48:03 -0700 (PDT)
From: Christopher Friedt <chrisfriedt@gmail.com>
To: famz@redhat.com,
	mst@redhat.com
Cc: Christopher Friedt <chrisfriedt@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon,  2 May 2016 20:47:57 -0400
Message-Id: <1462236478-61645-2-git-send-email-chrisfriedt@gmail.com>
X-Mailer: git-send-email 2.6.4 (Apple Git-63)
In-Reply-To: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.6.4 (Apple Git-63)"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::243
X-Mailman-Approved-At: Tue, 03 May 2016 02:46:06 -0400
Subject: [Qemu-trivial] [PATCH 1/2] Use libtool instead of ar to create
 static libraries on Darwin.
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
X-List-Received-Date: Tue, 03 May 2016 00:49:15 -0000

This is a multi-part message in MIME format.
--------------2.6.4 (Apple Git-63)
Content-Type: text/plain; charset=UTF-8; format=fixed
Content-Transfer-Encoding: 8bit


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


--------------2.6.4 (Apple Git-63)
Content-Type: text/x-patch; name="0001-Use-libtool-instead-of-ar-to-create-static-libraries.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline; filename="0001-Use-libtool-instead-of-ar-to-create-static-libraries.patch"

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
 

--------------2.6.4 (Apple Git-63)--



