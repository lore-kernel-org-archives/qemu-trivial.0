Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dau2i-0002gh-B6
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 21:26:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2g-0002eC-5X
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:26:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2c-00029d-UA
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:26:14 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:32780)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2a-00028I-SU; Thu, 27 Jul 2017 21:26:08 -0400
Received: by mail-qk0-x243.google.com with SMTP id d145so17397234qkc.0;
	Thu, 27 Jul 2017 18:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=D8luNx0z/vW6ZhXsbMdvwYCims9sVN4h95xeled4/Wc=;
	b=VHIQfPtPOyq7jz8zYjTHPqqBBouPFeFrYr28/u0igVX7rK497jtZn6W7lpxF7pf1ZN
	8kG+ZrTnjxmYsHrOv5fsorFo7Qy77NZzcgvkfzrnwsDwA+ztw2P4svRq99G9KsKyQTXt
	/28kqxMIzQ5GT5sYPkbh3rrsM2tONMN4zFvZF1Ry82cxQtdKW4FkNQtB8lNwokxWja8g
	6rpf4yCykXGEK3ji29VXFEd+J+N7as1MTGco7UPrzIfkgsOLMLV8WEau9oqwMWAbjnC8
	xlv05Ec3FvsXrx9AlDp3tTujoGFAF9O2DyBWoEsmCPVAgApDhbU3npMOtzbpof9aLnC0
	EsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=D8luNx0z/vW6ZhXsbMdvwYCims9sVN4h95xeled4/Wc=;
	b=OQGdvNHmzv1odhPAaylUCd2Neqea84DzEV6clzIXNwgAt04jOUCRy+n3GLJHoItw9L
	RleWLVaj7B8aAXdRqknNwddS97nkhD6Py5lxPh5TpVQv5WXbF6P3i4aeKO+5BHa8zT8c
	K8l9APY5fqqUitVDXWKKQCkjJSn30ss6lSoxz46S3RQG0eZGqaAhNNzBDTPoEW8M6ZmG
	BneicAl1g1eGp2etKxLXcWaw8t+/Grh/6AhXZ3eI5xH2o+ImUePGCD/u2wgi28+ZFeU/
	yA9cMOLdk1v/lRb+bpWjQXuS/J/ex/JVIhqdnYeYPVfTK5MLjS/XoYWygTlxgoMc2IiC
	BzAg==
X-Gm-Message-State: AIVw113vAeiTAWx5O7nYrDreNXO+DXqYelNhzYGBbVkMeoFEUhY0Xvgm
	v+TdwZDeUlrboA==
X-Received: by 10.55.207.18 with SMTP id e18mr8645099qkj.82.1501205168373;
	Thu, 27 Jul 2017 18:26:08 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	o97sm15010202qte.56.2017.07.27.18.26.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 18:26:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 27 Jul 2017 22:25:40 -0300
Message-Id: <20170728012542.29975-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728012542.29975-1-f4bug@amsat.org>
References: <20170728012542.29975-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH for 2.10 6/8] docs: fix broken paths to
 docs/config/ich9-ehci-uhci.cfg
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
X-List-Received-Date: Fri, 28 Jul 2017 01:26:15 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/usb2.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/usb2.txt b/docs/usb2.txt
index b9e7548073..09df45b5b1 100644
--- a/docs/usb2.txt
+++ b/docs/usb2.txt
@@ -50,7 +50,7 @@ companion controllers with two ports each.
 There is a config file in docs which will do all this for you, just
 try ...
 
-    qemu -readconfig docs/ich9-ehci-uhci.cfg
+    qemu -readconfig docs/config/ich9-ehci-uhci.cfg
 
 ... then use "bus=ehci.0" to assign your usb devices to that bus.
 
-- 
2.13.3


