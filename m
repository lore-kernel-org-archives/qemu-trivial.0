Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQT-0000QH-CY
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQQ-0000NP-UT
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQQ-0006Jb-2u
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:03 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQN-0006FV-If; Fri, 06 Oct 2017 19:52:59 -0400
Received: by mail-qk0-x243.google.com with SMTP id z12so9700171qkb.0;
	Fri, 06 Oct 2017 16:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lb06OpFKlDd2si1bCa/v31LPELPQMFq165WGDCaTpuo=;
	b=mOXs3INIvgK01Z/B11zrHB7XftPVW5D8AyVi75aQafYX4nyPT2rS+jxjdvybZMx87v
	NJ/mjUhQOYlVYoQGDo65S9bzubaArsQk/1gNK9GfUdZQd2GB8aAMqcBvI8Ppen9vXp0x
	KT0FMoZQlAuSJf8A0SUfFOJTAFLmUagbYSA1dJ5Pc/WF+//+HmKX8wT7vkKztGKCvL9K
	6e9Eu/i4VqU3aD8WPC73tbJOosVA1iz9L/WzgLM7AkqJej4LvxToxmm5c/NMMo4sTXqF
	e29rJ1zfzB4qk+wa189q7P3j58BcmtP2bvUu79BvA1PJTCy8vbTqkljabG2ZY7H7P6w0
	ygMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=lb06OpFKlDd2si1bCa/v31LPELPQMFq165WGDCaTpuo=;
	b=qA0w1JV5wYDVx34fKL6ptIW75cBycuBncOMfzy6/Pgax01V0gRTXCegC0qpwLr6ors
	FvpWGc3tqsCrXC5ue+xj3FCt6F7HX0XP4ULXIt/ctGYdQJFdl92I6bujCxWA3YRbq1rm
	G4pRhtavhZUtUsToYMuLGvQIx4nBAG1QJ72uHVPPdEFTVEG4Gktqd4/zI/JkOngF6/Q1
	1m0FgtUjWXpYkCoFx1+qAQ/QVu2o37xdqFjjILf4DxdaMqUJt7Le18GBSvOCnG66m685
	BYvI+FZ5+x1AaH009RDHQQ+3ccdWzazspr4y/Uw1l0BQfJjJhYEpiu+qPiAb1YViTPEf
	zJdQ==
X-Gm-Message-State: AMCzsaXjfnPbZzOljkOT9f8fUgku03AN7m/xFNGwGAzo92jmxU9US1AO
	zgtJZkucUf8JGSScfix2HnM=
X-Google-Smtp-Source: AOwi7QBMJ7NvWoDe3OucoxsRZi8sAXV14ssk1Ukhy6ZXNJg9pkXFvfTFfo6zUYMadpkammFLsM7ZNg==
X-Received: by 10.55.183.134 with SMTP id h128mr710005qkf.96.1507333979057;
	Fri, 06 Oct 2017 16:52:59 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:37 -0300
Message-Id: <20171006235023.11952-43-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 42/88] XTFPGA: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:03 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/xtensa/xtfpga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index a19ccebdba..c54a09df83 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -115,7 +115,7 @@ static const MemoryRegionOps lx60_fpga_ops = {
 static Lx60FpgaState *lx60_fpga_init(MemoryRegion *address_space,
         hwaddr base)
 {
-    Lx60FpgaState *s = g_malloc(sizeof(Lx60FpgaState));
+    Lx60FpgaState *s = g_new(Lx60FpgaState, 1);
 
     memory_region_init_io(&s->iomem, NULL, &lx60_fpga_ops, s,
             "lx60.fpga", 0x10000);
-- 
2.14.2


