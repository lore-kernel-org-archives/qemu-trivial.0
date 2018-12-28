Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gctbF-0000Aw-5A
	for mharc-qemu-trivial@gnu.org; Fri, 28 Dec 2018 09:58:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>) id 1gctbA-00007E-Ru
	for qemu-trivial@nongnu.org; Fri, 28 Dec 2018 09:58:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>) id 1gctTg-0004pC-29
	for qemu-trivial@nongnu.org; Fri, 28 Dec 2018 09:51:08 -0500
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:40716)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcfaracco@gmail.com>)
	id 1gctTc-0004m6-OI; Fri, 28 Dec 2018 09:51:04 -0500
Received: by mail-qt1-x844.google.com with SMTP id k12so23547953qtf.7;
	Fri, 28 Dec 2018 06:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LZwaqyqDnOHYgyr8uzKi105IWbd382DvxwYMDiRi5as=;
	b=nxLxcH1dWNTduAacngIghe5u2JAUNbKSsts5zw3U86L2fWTp3WCAg5B+YVBJlECH5C
	TdxMhMSGwrEyQlzjHEVV86uSIzV/EN1tB7S45+UEdgyPwX5QRjghnspl48u//hr5giUS
	zkeyfbfEnl6GPLjryyBawtC7lvuojnBPQFoYTKXm4UVdwpua3gPCRUK860W9MfEYiYA+
	Rvav1nWzBuH5zk9S4rezAvcXHRnBINGXqOQxs3mX+jexoaNr8xI9kquhFynpmbH9vV9h
	VW1dkN2p63UXyvvlsGM96gUzsl1tlxY6gXgQknZNHNzqNmDalzHX7QVKHancyG9zSQMd
	7yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LZwaqyqDnOHYgyr8uzKi105IWbd382DvxwYMDiRi5as=;
	b=QST4Gpsd6eL23hqkPH3k0JE0UKtKh8g9LgcJDNTbjxsx5OlpM2HylJBARmZiEWEln1
	VdD/gm7RzrxcpaIAWdfj1eBKJf5fy6mW51+onMhR1ubKaatqt/syOtzFIUpVQX5HcY8v
	KM9UaosOt0QRPY9lEPBr6GTkpkE/CoKVCxLDhomKOcR/ePUHkMiqq/51rHb3Vmiy/jq+
	BylRC5vokoBNJi5noUfRxTWxG/y2wwvrltLxVtQepAnl2tNmIk7stHQeDbbCbSl8MMP7
	7TAaz6VIhohJypgE27Z3J2jZ2Pgekcp82plfbhcLkeYK0mUSdGmco4l1qDLpe7p4SL4R
	wCQg==
X-Gm-Message-State: AA+aEWY6XoKvzEtz1x+/QX9a9dDwDaHc8PoAuoTyqd/d58K00n/rB8t7
	uDXeldfAdQAmrnBJy4ORZ+WsOEZ3
X-Google-Smtp-Source: AFSGD/XHjPGc89zx2hZWIRROrm6R45n13a3ScYDU468P5sXjlmeK/eczwrwHPAknzOgMAawBDaXKUA==
X-Received: by 2002:ac8:7250:: with SMTP id l16mr25713419qtp.348.1546008663833;
	Fri, 28 Dec 2018 06:51:03 -0800 (PST)
Received: from localhost.localdomain (200-100-184-135.dial-up.telesp.net.br.
	[200.100.184.135]) by smtp.gmail.com with ESMTPSA id
	o27sm21752053qkh.35.2018.12.28.06.51.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Dec 2018 06:51:03 -0800 (PST)
From: Julio Faracco <jcfaracco@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
	mreitz@redhat.com, qemu-block@nongnu.org
Date: Fri, 28 Dec 2018 12:50:55 -0200
Message-Id: <20181228145055.18039-1-jcfaracco@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: [Qemu-trivial] [PATCH] dmg: Fixing wrong dmg block type value for
 block terminator.
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
X-List-Received-Date: Fri, 28 Dec 2018 14:58:56 -0000

This is a trivial patch to fix a wrong value for block terminator.
The old value was 0x7fffffff which is wrong. It was not affecting the
code because QEMU dmg block is not handling block terminator right now.
Neverthless, it should be fixed.

Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
---
 block/dmg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/dmg.c b/block/dmg.c
index 50e91aef6d..2c806e3389 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -54,7 +54,7 @@ enum {
     UDBZ,
     ULFO,
     UDCM = 0x7ffffffe, /* Comments */
-    UDLE               /* Last Entry */
+    UDLE = 0xffffffff  /* Last Entry */
 };
 
 static int dmg_probe(const uint8_t *buf, int buf_size, const char *filename)
-- 
2.19.1


