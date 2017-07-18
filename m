Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLt2-0002CW-1w
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsx-00028F-MS
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsw-0001Pj-Qi
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:31 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36398)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsw-0001Ot-Lw; Tue, 18 Jul 2017 02:21:30 -0400
Received: by mail-qt0-x242.google.com with SMTP id l55so1329887qtl.3;
	Mon, 17 Jul 2017 23:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XRiqa4SJVxOvHW7cR2seAc9WCD8BwW3dKj5N+dFnVXM=;
	b=b6SEfTR/aHwU6+v2+8hMKUx+MaPLcF7dLqDdRd4Z2re3mI2pah5JF1GJ1+bNnuNG6Z
	o6dEEsGrAuWWoIU7tTWzjeahzKK4ki9nxArUM+fEEON2DXAecUh18D29J4F/TI33yqos
	uvEjgz+9Rc8frwN0kZcr0VE89OX6YvV44BBU8o2X34Ks+ZjtDU7fXUgnc7tJs0KloEUz
	C9Yxw1BY8yw5akc604iXvVKS258Rv4hWwU+R7RbsiJspx6lMSCO/f4h4qdTK6i9B+zwV
	znNtuANLUK1VU6sAFdCUbZbW/ZKC9tSk8acOR23XwikxUcC2xMTrFMQrrPJiSE+dURcU
	w/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=XRiqa4SJVxOvHW7cR2seAc9WCD8BwW3dKj5N+dFnVXM=;
	b=Xxux/NZuXwSXe04aB1kvYzxOW221SShBa20D7dGhC/8jtHAenrXFbxAZCh1v/jXuFv
	G6e3R4pIZJkdAscnbWAz/lsrKa5s4DIOIb4DcwP3Or5zs2bP6lpmzvsaKDaLueiznVSL
	PKPpihpFThgwazWKDcaXqe/tgmRIS0teUooj8RBVYMXT3xmbXfSL00a7tyQYfRu9cHyw
	QjctGGeBoQaAAZ4Duj1myVezLDiJLw+nteS8foo+/zkG/siVZTaVCPuEW+XPK7fvLAQO
	Ys2EQFF5qONHKuRyuOa7x0NIlfUznAC9BKzFC87gYEUsZHXAjOlkjoFe9muNIWHXvZDu
	mrnA==
X-Gm-Message-State: AIVw110J1hqcaGL3R03+bvrBs1fUP7/aAZL1kgnxCF5EPWhe09lyvbGf
	Gy762rXMoAj9oHyBzpDVwg==
X-Received: by 10.200.34.248 with SMTP id g53mr47847qta.65.1500358890104;
	Mon, 17 Jul 2017 23:21:30 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry@daynix.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:58 -0300
Message-Id: <20170718061005.29518-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 22/29] vmsvga: use ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:34 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

No entry in MAINTAINERS, should it go under Graphics or Vmware?

 hw/display/vmware_vga.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 4a64b41259..ff8130ff70 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -679,10 +679,9 @@ static void vmsvga_fifo_run(struct vmsvga_state_s *s)
             if (cursor.width > 256
                 || cursor.height > 256
                 || cursor.bpp > 32
-                || SVGA_BITMAP_SIZE(x, y)
-                    > sizeof(cursor.mask) / sizeof(cursor.mask[0])
+                || SVGA_BITMAP_SIZE(x, y) > ARRAY_SIZE(cursor.mask)
                 || SVGA_PIXMAP_SIZE(x, y, cursor.bpp)
-                    > sizeof(cursor.image) / sizeof(cursor.image[0])) {
+                    > ARRAY_SIZE(cursor.image)) {
                     goto badcmd;
             }
 
-- 
2.13.2


