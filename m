Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSK-0002F4-9T
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSI-0002BU-32
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSF-0007up-N0
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:58 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:48156)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSD-0007qI-Bi; Fri, 06 Oct 2017 19:54:53 -0400
Received: by mail-qt0-x241.google.com with SMTP id d13so33663634qta.5;
	Fri, 06 Oct 2017 16:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=k2Vi1Bv+CSnDlN/GqBVXgQT24hAmoOQo6hWaGCQbWSg=;
	b=Z2R2VpTLQQR4vQma8rLCVSMqzIsI3f9ghDqoSZ3+1zP5H3cCtGGlCN5cJ89EJXIfgT
	PxWn9rZ4RSkjwyTz4i7gagqUYNV0aVFcpLWvmGtlajQLI3vOTqJbIfS6+Ri0M+2Z/W/C
	HoB4G1RiLHYbrqfM51QPmHpjdfTc5dhF7/KzM2en8caSXwWuQ8yNpSztja9D95cS59+4
	QjGkWrHQyGJZsRr/kgbj4vp4xl31lIVRTHlpXFFhcW54UkH19hVl2P0E0qd8Y2jA78IG
	mGpSX7568nidmdKbZmzhb34e6Ju7iG711yQOk2fX5MCoU0sBDRokm8pckeP8tmlTCOL8
	Gm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=k2Vi1Bv+CSnDlN/GqBVXgQT24hAmoOQo6hWaGCQbWSg=;
	b=TMZ8IERjt8KBHK9G+jM1mI+JeOhzqOrL1W/dfXt7GVJ8l0iqiuBLZ/YIm1cWbY5PwX
	Uxb9QQ8aayoXB2jpTmSiwpb9jftijkmEc1x2O8lD6WyP5n1DfjXp8o4pfDs9P8Cbufss
	uoJyjguFCSJ4/NZJgK9sx/jKS3p4SJCc7+Z0XOMQewg/+LrtfbEM0ImlFTSn1/rpkVrX
	VSc4LwO/q9qb6P6L5lW5XkQfXq7NURn403l7vEEyae03QRAIKU2XOgIkacHA17ZzUjF1
	qSF4Ns/h14L/Oyj8yxuqWxxWWbHMh63v64tYEfwJ+0bfJ45YXG8+4cur+4T5dL6WPEyY
	ac2Q==
X-Gm-Message-State: AMCzsaXFHJZUcRudyJCxPOSbkZhM8pRbCGQJAuOlKK2nhXIW0oZUZMoR
	Jzi9xKKHhDxwe/gBXUrhq3s=
X-Google-Smtp-Source: AOwi7QBg2rh6AWlX8NBOKIwboSyFpaIm9jTe7ZXke+7eecUEoqHGdte7EGD/iW51XCxlMVpaypat6A==
X-Received: by 10.200.8.109 with SMTP id x42mr5782429qth.54.1507334092820;
	Fri, 06 Oct 2017 16:54:52 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Jan Beulich <jbeulich@suse.com>
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-block@nongnu.org,
	Paul Durrant <paul.durrant@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:50:08 -0300
Message-Id: <20171006235023.11952-74-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 73/88] hw/block/xen_disk: avoid use of
 g_new0()
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:59 -0000

From: Jan Beulich <jbeulich@suse.com>

Prefer g_new() / g_new0() to be farther backwards compatible with older
glib versions. As there's no point in zeroing the allocation here (the
loop right afterwards fully initializes the memory), use the former.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul.durrant@citrix.com>
Acked-by: Anthony Perard <anthony.perard@citrix.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: rebase & subject tweak]
---
 hw/block/xen_disk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/xen_disk.c b/hw/block/xen_disk.c
index 536e2ee735..6d2fd4d284 100644
--- a/hw/block/xen_disk.c
+++ b/hw/block/xen_disk.c
@@ -1232,7 +1232,7 @@ static int blk_connect(struct XenDevice *xendev)
         return -1;
     }
 
-    domids = g_new0(uint32_t, blkdev->nr_ring_ref);
+    domids = g_new(uint32_t, blkdev->nr_ring_ref);
     for (i = 0; i < blkdev->nr_ring_ref; i++) {
         domids[i] = blkdev->xendev.dom;
     }
-- 
2.14.2


