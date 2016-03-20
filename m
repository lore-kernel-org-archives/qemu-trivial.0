Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ahSdy-0002Gf-09
	for mharc-qemu-trivial@gnu.org; Sat, 19 Mar 2016 21:59:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1ahSdw-0002GZ-6b
	for qemu-trivial@nongnu.org; Sat, 19 Mar 2016 21:59:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1ahSdt-0003rl-1I
	for qemu-trivial@nongnu.org; Sat, 19 Mar 2016 21:59:00 -0400
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f]:34437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1ahSds-0003rh-T5
	for qemu-trivial@nongnu.org; Sat, 19 Mar 2016 21:58:56 -0400
Received: by mail-qk0-x22f.google.com with SMTP id p130so10629357qke.1
	for <qemu-trivial@nongnu.org>; Sat, 19 Mar 2016 18:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=3zXl0t5xdoppDc/ANb3ld8l4I8/JMEWNJ8Es0mH4Qtg=;
	b=yZ9x76ngaI1Vrg5TAP62YGHTQwfyGRxife4/9nwrUFZSfy6kj0ufqV2jV7EyqQ5bNr
	LLVp7LbTIo+BTYzozXrG/S7DyYUuc9HcbttvsslCnzRmoP3a9Vhk0n0QCD+KN09W+7SF
	QnodC3vklCbBWPfmNvB1QR2n+lH+vwccr5leQgMZ3+NrYjwJKKCF0yiD1ObpvLeClo6d
	VBmr5aNgmJCcnfE5DavnzXX3lCeAbEA+Mhm+csO8gKJYpQ/UJQJuskQGUE+n4vldX3JO
	YS+6gj+VOdvFJifLMZpM9EOuCyajXgq69GmhSbFHTBPJPgjNE6Si549luncp17YKWDCJ
	EaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3zXl0t5xdoppDc/ANb3ld8l4I8/JMEWNJ8Es0mH4Qtg=;
	b=SoutsbHXHp9nYbsunXiKohCTWIAX+DTN8sOtdGSNxudGnjqB3f797nTKvKsbPKoL7C
	Bcsl7i1g3YVOC+vE4i7OCguaaTwPq7EhE9tviWqCmc8u5UcFbEVO0BTBVwBVZVeflSzL
	waNmUUAmK/DqnmsnWEC0yxcyROsPzCKMzJT/I39miLF+ypofXUKIDfjDPO0i86alV/pq
	VakuejXMJwD0zRMmkXEgyyK9wAFDEO4rzrYSjvkgSnrdQWCCiLBIatbGQwwkfzAoZoXR
	kmYvNBnT0y4Y1knfHtoucDjioSvUIWcgg3jXfz4+6/p+LLvCEbNWnXJTOLeUB/ZfHNS0
	NUAA==
X-Gm-Message-State: AD7BkJKW99teT5SWcpQgTCH0iMab/g+qjY4VTxQsPRewGSMldSNaaw7TuOH0gr8qrQuvsQ==
X-Received: by 10.55.78.207 with SMTP id c198mr31705291qkb.34.1458439136426;
	Sat, 19 Mar 2016 18:58:56 -0700 (PDT)
Received: from ulmo.home (ool-4a58cb9c.dyn.optonline.net. [74.88.203.156])
	by smtp.gmail.com with ESMTPSA id
	c190sm9334823qkb.27.2016.03.19.18.58.55 for <qemu-trivial@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Mar 2016 18:58:55 -0700 (PDT)
From: Jan Vesely <jano.vesely@gmail.com>
To: qemu-trivial@nongnu.org
Date: Sat, 19 Mar 2016 21:58:54 -0400
Message-Id: <1458439134-28726-1-git-send-email-jano.vesely@gmail.com>
X-Mailer: git-send-email 2.7.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22f
Subject: [Qemu-trivial] [PATCH] po/Makefile: call rm -f directly
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
X-List-Received-Date: Sun, 20 Mar 2016 01:59:01 -0000

Default variables are undefined in rules.mak and this is what the rest
of the build system uses.
Fixes make clean in ./po/

Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
---
 po/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/po/Makefile b/po/Makefile
index b271f79..7bab09d 100644
--- a/po/Makefile
+++ b/po/Makefile
@@ -32,7 +32,7 @@ update: $(SRCS)
 build: $(OBJS)
 
 clean:
-	$(RM) $(OBJS)
+	rm -f $(OBJS)
 
 install: $(OBJS)
 	for obj in $(OBJS); do \
-- 
2.7.3


