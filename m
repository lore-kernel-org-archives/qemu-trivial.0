Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7myL-0006O9-CL
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 14:01:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1d7myH-0006JS-JZ
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 14:01:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1d7myG-0003wF-PR
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 14:01:21 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:36037)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1d7myA-0003ux-L8; Mon, 08 May 2017 14:01:14 -0400
Received: by mail-wr0-x244.google.com with SMTP id v42so9744760wrc.3;
	Mon, 08 May 2017 11:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EK3UStvTbHb0GLOr/S0OVuh+3HqmJipnnHupQ2xoRHY=;
	b=hQ7hIFbhDTgYYxiCbifGw1xtnT/qa+e0r9yRPnBSOQTQWDd929aERa3Dr9B1klsIfc
	fXxYUol/zwpkD1c+QttU9fIjJKxcdLsUuwornV1ahcmUCxn/9DyJ7MBRSGPpNzY2tlKN
	zgpXF8G41o44P8OavYT/KRD72AM+Woo/Bqh2Rth7xYyNZgOzyA+5D8j/losUvg4h514L
	jfmlFUhioAunax7+NlTR9c2EdPXNooZPlAYUVSzefGrRGd/bR1CsZUN5k85K99DvLbmX
	i0eydjXyWDA5qxuenbylc2q3PwR3My/OR/0XsFgShfjQJCS1ROVlUE6tPyTO5Wc6TIHT
	7Elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EK3UStvTbHb0GLOr/S0OVuh+3HqmJipnnHupQ2xoRHY=;
	b=l6EGwS0CAUFwbvGa5Vv4cjg2yI2rNOXlS1qkF0eE58sNN3AHYU9UxIaCKuDbwr+shk
	t7kMIrrdGtyVSpPJ6jaQNBC0xqrZX3KmBIMG+T6G4TLAyQ1qnKv1C5aN85jc2vOQG6p4
	VnHxuNJxAO2Dk9DUk+56zhkLkS7AcX/Aqk7ph1ocz2W3x9RBtm64h8ynmIboMR0qyhq3
	opnId1UWiKZvzvRSwXwi+U67Rrw1UEHZQm/pDK1p258Mg0hgq27ndZdGJ48gbYL6ffUF
	BHlgMM1Lpkg5e5p22cAfZ3Qg5VP/moxVY/xgeYEkkiTcftZeONP0YPaiv8IbzgmarF8Z
	BNlA==
X-Gm-Message-State: AODbwcAsW7hacGWqSoiDINAgNc4y1vA39h+u1RSvSb2c0kUuXldE6jdJ
	C7ZK/jVbmTED8A==
X-Received: by 10.46.69.66 with SMTP id s63mr6851800lja.88.1494266473443;
	Mon, 08 May 2017 11:01:13 -0700 (PDT)
Received: from octofox.metropolis ([5.19.183.212])
	by smtp.gmail.com with ESMTPSA id
	s126sm1645874lja.43.2017.05.08.11.01.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 May 2017 11:01:12 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>
Date: Mon,  8 May 2017 11:00:56 -0700
Message-Id: <1494266456-2251-1-git-send-email-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: [Qemu-trivial] [PATCH] hw/xtensa: sim: use g_string/g_new
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
X-List-Received-Date: Mon, 08 May 2017 18:01:23 -0000

Replace malloc/free/sprintf with g_string/g_string_printf/g_string_free.
Replace g_malloc with g_new when allocating the MemoryRegion to get more
type safety.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 hw/xtensa/sim.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index d2d1d3a..b27e28d 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -41,21 +41,21 @@ static void xtensa_create_memory_regions(const XtensaMemory *memory,
                                          const char *name)
 {
     unsigned i;
-    char *num_name = malloc(strlen(name) + sizeof(i) * 3 + 1);
+    GString *num_name = g_string_new(NULL);
 
     for (i = 0; i < memory->num; ++i) {
         MemoryRegion *m;
 
-        sprintf(num_name, "%s%u", name, i);
-        m = g_malloc(sizeof(*m));
-        memory_region_init_ram(m, NULL, num_name,
+        g_string_printf(num_name, "%s%u", name, i);
+        m = g_new(MemoryRegion, 1);
+        memory_region_init_ram(m, NULL, num_name->str,
                                memory->location[i].size,
                                &error_fatal);
         vmstate_register_ram_global(m);
         memory_region_add_subregion(get_system_memory(),
                                     memory->location[i].addr, m);
     }
-    free(num_name);
+    g_string_free(num_name, true);
 }
 
 static uint64_t translate_phys_addr(void *opaque, uint64_t addr)
-- 
2.1.4


