Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqnC7-0003zX-Dx
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2017 16:49:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqnC5-0003xa-4E
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 16:49:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqnC2-0000VG-1B
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 16:49:21 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34127)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqnC0-0000UC-2f; Wed, 22 Mar 2017 16:49:16 -0400
Received: by mail-qt0-x244.google.com with SMTP id x35so26891985qtc.1;
	Wed, 22 Mar 2017 13:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LIMA2wvKe270j63sGVKHnGpcmb+TjhsBtlsud8HbtA8=;
	b=fi0XQnp+ywGZ3nbakOCGELXyXWCFWqDsSp1dJPzvtXNWqcRODNvvfyqae6gx7Zc9TV
	rlIyL4u9Pn7sOWTq/RZ1300HECJIEcDs91zLanV5VsYXelOlTCFo1XKMXdYcTJo2m8x1
	lsZ3d+KraQ5+KBFLlMx3qXMsO9lUhqd8kSyKU6LuN0OukCBYvirbZTdPDC7QYSTAALdE
	M22Xp2x9oH9toRAY0b9ruTq5a8NvRR+UlPLi3fkXzb90eQ31o4Bp2OlgU0SoSzbBsDeI
	BcDitmfoPRDyeeTkw7BuazTSYqrit3Zy+VhuCESOZsx1gPIe6WvF1UxYwNoZCtD7FW9B
	1FAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=LIMA2wvKe270j63sGVKHnGpcmb+TjhsBtlsud8HbtA8=;
	b=d9jE5RqgQQOnhjl+yODaKu62G3gsYIaxEKNA9+goG6ATw/iMVs/oGAgiGaNdDwWt5r
	T1pnn9wgdjNAjRIbkUAzmC1r6kNvS39KfmX9mqJzvXiv+VoWYIoFBd2E25iatCw6Bx1H
	fEgOdhi/vhApmOtCcKVe/V2jf6mpIVG3JFRds0HJx4GXSpeLbeVxl9tuIq+WpLq2SFWh
	uuNydBjl2BtmSiW08alcsN6SmDXd/V76JwEJ11gGYiFMhcqWx5FQ1zjbvyrzfO1Bsjhb
	sAQXRRM6L44QpLOMcLjCvtgfWJZlIpgxLxhJUpdltmwUS/F1aSFkkzYZ+0Ux7GEn8f75
	Pj1A==
X-Gm-Message-State: AFeK/H06/U/bssJgFMavLkJcQKKaA1HrpogFGWy9BHVWENlYccJ6+wERHqHM7c8nU3QIjQ==
X-Received: by 10.237.35.83 with SMTP id i19mr39424459qtc.70.1490215754472;
	Wed, 22 Mar 2017 13:49:14 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	u43sm1767263qtc.11.2017.03.22.13.49.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 13:49:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Roth <mdroth@linux.vnet.ibm.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 22 Mar 2017 17:48:42 -0300
Message-Id: <20170322204844.446-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170322204844.446-1-f4bug@amsat.org>
References: <20170322204844.446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH RESEND 1/3] usb-ccid: make
 ccid_write_data_block() cope with null buffers
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
X-List-Received-Date: Wed, 22 Mar 2017 20:49:22 -0000

static code analyzer complain:

hw/usb/dev-smartcard-reader.c:816:5: warning: Null pointer passed as an argument to a 'nonnull' parameter
    memcpy(p->abData, data, len);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/usb/dev-smartcard-reader.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 757b8b3f5a..c38a4e5886 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -799,8 +799,14 @@ static void ccid_write_parameters(USBCCIDState *s, CCID_Header *recv)
 static void ccid_write_data_block(USBCCIDState *s, uint8_t slot, uint8_t seq,
                                   const uint8_t *data, uint32_t len)
 {
-    CCID_DataBlock *p = ccid_reserve_recv_buf(s, sizeof(*p) + len);
+    CCID_DataBlock *p;
 
+    if (len == 0) {
+        return;
+    }
+    g_assert(data != NULL);
+
+    p = ccid_reserve_recv_buf(s, sizeof(*p) + len);
     if (p == NULL) {
         return;
     }
-- 
2.11.0


