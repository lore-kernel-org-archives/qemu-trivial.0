Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aRWta-0006y6-67
	for mharc-qemu-trivial@gnu.org; Thu, 04 Feb 2016 22:17:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <daniel.serpell@gmail.com>) id 1aRPCL-0001YE-Ff
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 14:04:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <daniel.serpell@gmail.com>) id 1aRPCH-0005gl-JW
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 14:04:09 -0500
Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c]:33973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <daniel.serpell@gmail.com>)
	id 1aRPCD-0005g2-A5; Thu, 04 Feb 2016 14:04:01 -0500
Received: by mail-qg0-x22c.google.com with SMTP id u30so49729612qge.1;
	Thu, 04 Feb 2016 11:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1PvTU9HwvajqWM05WevGdlLG9j4sXx1iyBPLBx+L92g=;
	b=jiREB2nLpuSAPFz5fJVQDhGtFOSxnONgvA1SusJuOoM3/MsyqHoBHSMrk4WllS17t+
	PhFOdniyGT4d+cgS3tKUt4ccJ5owUbwaj7QihQwfL/kvYFV/V7ZeGXN8jigGxvzT6jnT
	1+tTGjYvkx6GS3HkHWuI/xGCevgCNRB08z7Nj1N6zeHIUbsM+jSKLQeuOuwnSxOwDIQ5
	0KjJYVfc4sZd8tua0EfNYTwSlQiyLeFiPDHy4FT+tF9JX5zo9N6LqC8IjnrvrLiCtJJ1
	S8rw2+XOzU7ltTcT3k/hDIsn2irWCqBJLXdqSc2N+McTLzYFHlzGIwgTs13cHG0Y0uIW
	TUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1PvTU9HwvajqWM05WevGdlLG9j4sXx1iyBPLBx+L92g=;
	b=NL1PWDxMwnMdQVwAz/fJ/zVroy8uXOO8V8IRzQh0dhTJAzkQISlsUtUvN0uT/f1tQa
	EqvemLrKHiz6ZXX8t/aYZ5IK5TPaWMW8xMKivuln9Dv4XypdHxz+W20gvpsFnb737WEY
	g+tyqOHeTxdIYngJZxITEcLXYOktCJheqCos+MrzoRZ+RJ15l2bDXYbuYVGL9VaHP3/M
	fh8AAdxL2P00xjYaPRIDbZMcByFiPQz/ERvDzL4rUsYJRagCxj8mqotZDftuI+zVw1pM
	HspXj5Emxw/0Lg4WlRdprNKmgs3qXCaShuEuE3flC3B/CRhhqoVv+feo+OF3coiAh4+2
	aigw==
X-Gm-Message-State: AG10YOSAM99AiVS6uaD90vmq5Unch0naIz072FojzY7oDgQ5Rak5TlV1ELWppp1pSm+lEA==
X-Received: by 10.140.138.71 with SMTP id 68mr12117656qhk.8.1454612640821;
	Thu, 04 Feb 2016 11:04:00 -0800 (PST)
Received: from pcdaniel.aplik (pc-203-22-241-201.cm.vtr.net. [201.241.22.203])
	by smtp.gmail.com with ESMTPSA id
	x76sm5821827qhb.19.2016.02.04.11.03.58
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 11:04:00 -0800 (PST)
Received: by pcdaniel.aplik (sSMTP sendmail emulation);
	Thu, 04 Feb 2016 16:04:30 -0300
From: Daniel Serpell <daniel.serpell@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Feb 2016 16:03:40 -0300
Message-Id: <1454612620-7819-2-git-send-email-daniel.serpell@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1454612620-7819-1-git-send-email-daniel.serpell@gmail.com>
References: <1454612620-7819-1-git-send-email-daniel.serpell@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::22c
X-Mailman-Approved-At: Thu, 04 Feb 2016 22:17:16 -0500
Cc: qemu-trivial@nongnu.org, Daniel Serpell <daniel.serpell@gmail.com>
Subject: [Qemu-trivial] [PATCH] Adds keycode 86 to the hid_usage_keys
	translation table.
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
X-List-Received-Date: Thu, 04 Feb 2016 19:04:10 -0000

This key is present in international keyboards, between left shift and
the 'Z' key, ant is described in the HID usage tables as "Keyboard
Non-US \ and |": http://www.usb.org/developers/hidpage/Hut1_12v2.pdf

This patch fixes the usb-kbd devices.

Signed-off-by: Daniel Serpell <daniel.serpell@gmail.com>
---
 hw/input/hid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/hid.c b/hw/input/hid.c
index a11e2bc..b41efbb 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -45,7 +45,7 @@ static const uint8_t hid_usage_keys[0x100] = {
     0xe2, 0x2c, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e,
     0x3f, 0x40, 0x41, 0x42, 0x43, 0x53, 0x47, 0x5f,
     0x60, 0x61, 0x56, 0x5c, 0x5d, 0x5e, 0x57, 0x59,
-    0x5a, 0x5b, 0x62, 0x63, 0x00, 0x00, 0x00, 0x44,
+    0x5a, 0x5b, 0x62, 0x63, 0x00, 0x00, 0x64, 0x44,
     0x45, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e,
     0xe8, 0xe9, 0x71, 0x72, 0x73, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x85, 0x00, 0x00, 0x00, 0x00,
-- 
2.7.0


