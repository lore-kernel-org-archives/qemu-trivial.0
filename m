Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW39P-00051r-HB
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 13:13:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39N-0004zx-Jb
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39M-0002FB-HB
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:37 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:40696)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39J-0002Cy-37; Thu, 21 Jun 2018 13:13:33 -0400
Received: by mail-qk0-x244.google.com with SMTP id b129-v6so2165011qke.7;
	Thu, 21 Jun 2018 10:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fhKVXKgJcleUU2612zexva/vYuIk9xiQ98uXDyn6FF8=;
	b=A5OxAbVXEk50KM0ad7JcqaBEKX5tIm5codEidduM3B6ozW48b0369KG5s3hwbuo/bL
	6QSSTP5gPB6u3aWF6hwlWvQM1VuuF0S0kPmYKHRTbqFHwI32Gf8MFiRVfXLBfY8RCbst
	gKjHfLHAPzTPgbTt5W92CED2SNqd2c48DSPyptxMoYCpgr4tAibSVk2ELuwsBJXprYrp
	EERVSkpyM2wuBhqfnZ7LwwZLcyOwd/hyMN4TjdKCuBS+QvR749K3GCruMwel7SEIiBah
	2f6RIy8gr917I6zXH29zj6MqczO6Wl+Da0Ipi4uJDu/qI3G3jizaRMP1gSo0X7nyVhKG
	Z6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=fhKVXKgJcleUU2612zexva/vYuIk9xiQ98uXDyn6FF8=;
	b=FLI7rGO3vSJMw0GB9ot8YOCO49r6NRwcIzdMvWpIWwGTGtjbj0T1iRkOWyYVFI6rrj
	8XoxknspezH/T74LgWGV5f/0SVwlshB3tAokTndxwKhSXZIAN4HME1OKGMB3hCwnUmvF
	UG1ry8hdIexJNSV+ba8aKlday2xVvtquLS6qj4bq/C5GwKLEPOAvfUCsnQGE1WvKLTqJ
	yvaTbIXfsmvnh5AcKbngYaOhEsNvKqp42obZPmyV2ZSGNsm+JW5DyhkOWc8VpiTuyqLw
	SKAPpUrc4e3E0U+yQ/k8Ru3rAdTts0qP5Tmj/8efRrzDTlgH2GA+AuqL3QmZzweZJBrV
	+e1A==
X-Gm-Message-State: APt69E329ue+Mg2J1Jsw6+GA07l1SkcRBmGOQ0wnT1YmekK9WNghf8uJ
	PUnoKx/jIt9kkabsnUZAwS0=
X-Google-Smtp-Source: ADUXVKLdncNls1bOZg0r8X8jspAdxVGDZv4FN58mvy+TNEH7vDetyq4lOLeRZ7q1v1MZJgpXzwK+sg==
X-Received: by 2002:a37:bf42:: with SMTP id
	p63-v6mr22538818qkf.240.1529601212336; 
	Thu, 21 Jun 2018 10:13:32 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	t14-v6sm3166159qtp.65.2018.06.21.10.13.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 10:13:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	Alistair Francis <alistair@alistair23.me>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jason Wang <jasowang@redhat.com>
Date: Thu, 21 Jun 2018 14:12:55 -0300
Message-Id: <20180621171257.14897-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621171257.14897-1-f4bug@amsat.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 09/11] hw/net/etraxfs_eth: Convert printf()
 calls to trace events
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
X-List-Received-Date: Thu, 21 Jun 2018 17:13:38 -0000

Suggested-by: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/etraxfs_eth.c | 8 ++++----
 hw/net/trace-events  | 5 +++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index 013c8d0a41..a6932432b1 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -27,6 +27,7 @@
 #include "net/net.h"
 #include "hw/cris/etraxfs.h"
 #include "qemu/error-report.h"
+#include "trace.h"
 
 #define D(x)
 
@@ -106,7 +107,7 @@ static unsigned int tdk_read(struct qemu_phy *phy, unsigned int req)
         r = phy->regs[regnum];
         break;
     }
-    D(printf("\n%s %x = reg[%d]\n", __func__, r, regnum));
+    trace_mdio_phy_read(regnum, r);
     return r;
 }
 
@@ -116,7 +117,7 @@ tdk_write(struct qemu_phy *phy, unsigned int req, unsigned int data)
     int regnum;
 
     regnum = req & 0x1f;
-    D(printf("%s reg[%d] = %x\n", __func__, regnum, data));
+    trace_mdio_phy_write(regnum, data);
     switch (regnum) {
     default:
         phy->regs[regnum] = data;
@@ -206,8 +207,7 @@ static void mdio_cycle(struct qemu_mdio *bus)
 {
     bus->cnt++;
 
-    D(printf("mdc=%d mdio=%d state=%d cnt=%d drv=%d\n",
-        bus->mdc, bus->mdio, bus->state, bus->cnt, bus->drive));
+    trace_mdio_bitbang(bus->mdc, bus->mdio, bus->state, bus->cnt, bus->drive);
 #if 0
     if (bus->mdc) {
         printf("%d", bus->mdio);
diff --git a/hw/net/trace-events b/hw/net/trace-events
index f57010df37..663bea1b74 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -1,5 +1,10 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
+# hw/net/etraxfs_eth.c
+mdio_phy_read(int regnum, uint16_t value) "read phy_reg:%d value:0x%04x"
+mdio_phy_write(int regnum, uint16_t value) "write phy_reg:%d value:0x%04x"
+mdio_bitbang(bool mdc, bool mdio, int state, uint16_t cnt, unsigned int drive) "bitbang mdc=%u mdio=%u state=%d cnt=%u drv=%d"
+
 # hw/net/lance.c
 lance_mem_readw(uint64_t addr, uint32_t ret) "addr=0x%"PRIx64"val=0x%04x"
 lance_mem_writew(uint64_t addr, uint32_t val) "addr=0x%"PRIx64"val=0x%04x"
-- 
2.18.0.rc2


