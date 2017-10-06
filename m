Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQk-0000fL-0f
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQi-0000dc-AK
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQh-0006Ys-J1
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:20 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37988)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQd-0006WG-FB; Fri, 06 Oct 2017 19:53:15 -0400
Received: by mail-qk0-x244.google.com with SMTP id 17so5919173qkq.5;
	Fri, 06 Oct 2017 16:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=edaFnNj2NF0wlhE1awkFNUNVg++iVsowZaQaA7wkc9E=;
	b=MptSe0SBhxG38ezA0ohkTGQJeE1uDM4bMsjdT0bhbWhT8XjVhdQZgpRPYHuAfAjtKG
	HUCFw6J35ZmwUIoi3VurB8PcYRbbkXI6c9kDi0xI8reimteBV4cdF4ndH0iN4aJkXtCl
	boosc+WG78/U5lMBh/+r7c0le5jPtJvBH+IA+IrA9+lx/knOxjaVlbupp1jIbLX77vWi
	6DhqXw+Z0EUXf80fiK4iOOCSvmtcO1VQG7s/KsjmWEGrJexu1+XrDhXfLAN4FieA4cgb
	vOacKlZAR+mQzT1+7qHLEk2MzWR7JIkThW9mDoSb2H9B5q00Moa7+IFltZokeWKctER2
	YOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=edaFnNj2NF0wlhE1awkFNUNVg++iVsowZaQaA7wkc9E=;
	b=MRhX7yXqcKEbcpxIg2U3wr+8a4IRg8dnvROvRkV/DWsIuiSZ3EIvTxG85GtL1oj/AB
	tLpXr4hkb8t+0zNmQAomAmwwNSeeDH0OaWS3jNHi3m1pUyoJXcTESLAbU11IRIvkDjVn
	+fA3bwUz1oIxHggru20Bx9RookFFMTN3212OcyjUFJ3YPbeBHeLT2L8tZOX/xu3MklN7
	LZdFKyxg7kkXugvhZXQYzmswPsVXCken2T9HjsG/K1gl85fK2sw7iRNbWQkcMiEZ/HXt
	XXQ9iT+FxFQgrUjMmTLnreR1KA61+fvnIDhzXEnJ5Egc0VWPAqrnQIzVfGECUHWcYpXs
	c29A==
X-Gm-Message-State: AMCzsaUquvujW49ckykGKjFUWYM8Nc3oAbK6Ccu2wa9mbp7fPhv7rp60
	zBwKSq3+QK7zpLNdgGyPt4Q=
X-Google-Smtp-Source: AOwi7QBdS+ObTpGGO6M8+pWFV9EwfsNDfXKXj5KCI49czkQjM3yRhBwn6KyuwGW3AjuqS9EmMPzGJA==
X-Received: by 10.55.181.129 with SMTP id e123mr765446qkf.128.1507333994896;
	Fri, 06 Oct 2017 16:53:14 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Corey Minyard <cminyard@mvista.com>, Andrzej Zaborowski <balrogg@gmail.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:42 -0300
Message-Id: <20171006235023.11952-48-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 47/88] hw/i2c: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:21 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/i2c/bitbang_i2c.c | 2 +-
 hw/i2c/core.c        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index 8be88ee265..20a9deef1a 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -186,7 +186,7 @@ bitbang_i2c_interface *bitbang_i2c_init(I2CBus *bus)
 {
     bitbang_i2c_interface *s;
 
-    s = g_malloc0(sizeof(bitbang_i2c_interface));
+    s = g_new0(bitbang_i2c_interface, 1);
 
     s->bus = bus;
     s->last_data = 1;
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 59068f157e..be84d6735f 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -132,7 +132,7 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
             DeviceState *qdev = kid->child;
             I2CSlave *candidate = I2C_SLAVE(qdev);
             if ((candidate->address == address) || (bus->broadcast)) {
-                node = g_malloc(sizeof(struct I2CNode));
+                node = g_new(struct I2CNode, 1);
                 node->elt = candidate;
                 QLIST_INSERT_HEAD(&bus->current_devs, node, next);
                 if (!bus->broadcast) {
@@ -258,7 +258,7 @@ static int i2c_slave_post_load(void *opaque, int version_id)
     bus = I2C_BUS(qdev_get_parent_bus(DEVICE(dev)));
     if ((bus->saved_address == dev->address) ||
         (bus->saved_address == I2C_BROADCAST)) {
-        node = g_malloc(sizeof(struct I2CNode));
+        node = g_new(struct I2CNode, 1);
         node->elt = dev;
         QLIST_INSERT_HEAD(&bus->current_devs, node, next);
     }
-- 
2.14.2


