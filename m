Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSD-00026j-Vo
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:54:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSC-00024c-Ab
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSB-0007of-LE
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:52 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:45336)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cS9-0007lV-8L; Fri, 06 Oct 2017 19:54:49 -0400
Received: by mail-qt0-x244.google.com with SMTP id k1so23357071qti.2;
	Fri, 06 Oct 2017 16:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0SlLnLJcX/VNhTn/Pv3q2kxSYf9mux0RFGXK0zBZWdQ=;
	b=Tmb8ujB10YBqr/RXE8wmggLeSAfCmR/GV9GnGJUzvz76PbYw5VlGzG9/Zuj6ywd3Hv
	BROdJ67ISn4ZYFFXAJGiuZnEluABZie6Ua+avmNd9aYQ+02oPc4ebFSrn8sLSkRsBTVL
	r0sOkq/W+QfVSE9f3dPl4xxOin3Kfb+GfCL+n09H9H7nGjVOZ3mz8jwGhvDQwZW9KBxO
	FyKk7mhIn2WCcpaReJmJxEY82fHqaLwspzitR55Ps6FxTHB8XtNk53ko+zDAfIyjNfiB
	SpxQamnK4WAJ3pwIv4Ge+GomyLBbMyxfbZJ44Wlv8EOae3PLfRiQ/+LqQ4ZCBrVYJkSu
	7WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=0SlLnLJcX/VNhTn/Pv3q2kxSYf9mux0RFGXK0zBZWdQ=;
	b=pmHFfQEZG+NG0kofPzhML1IIjJVrfeCwAibtsuokpvoPJ835bbuFilp71f+GIfSLv6
	DiLq5P4Gi3b7iJ5l4cioO3fQHT41HzTSUAgtgfwvPUdkjBy3eN0F0lWNk/N2tOyHkrBV
	/avOxY/KSH8LJq3+SoXTcU15H21+EU+7rUwRTI9wpymEHim5HVtF9PpRmD+y/y/RJnVo
	JAEedYcba8fCnH0ah0tJWkB423RTzANnyoyk5wCgnvR498WRfvmh+hjFlWxMy8ZY/DyL
	uuatomSw79qRETVFmm/8d5cr3EdZmoHM5CJ+XrCkgH+1UB0NL22aYEX73JVnB7MNJfO7
	XtBA==
X-Gm-Message-State: AMCzsaWqTPZ+D88XF11XkDisGf6eFSMKlpqq7EQUlhpfaH+0syh2dyMJ
	4mXGhRhV79dRKz3uN1XHwbQ=
X-Google-Smtp-Source: AOwi7QCMY3BkpVqvaSK1RjfDhhCAvr3Zrtbv3DNwjzMAsbquAXcBuKI2ND8GRyHCrA9c6fe5JTLC3Q==
X-Received: by 10.237.34.118 with SMTP id o51mr5156020qtc.36.1507334088700;
	Fri, 06 Oct 2017 16:54:48 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-block@nongnu.org
Date: Fri,  6 Oct 2017 20:50:07 -0300
Message-Id: <20171006235023.11952-73-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 72/88] hw/block/nvme: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:53 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/nvme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9aa32692a3..ff712fa8cc 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -454,7 +454,7 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeCmd *cmd)
     if (!(NVME_SQ_FLAGS_PC(qflags))) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
-    sq = g_malloc0(sizeof(*sq));
+    sq = g_new0(NvmeSQueue, 1);
     nvme_init_sq(sq, n, prp1, sqid, cqid, qsize + 1);
     return NVME_SUCCESS;
 }
@@ -532,7 +532,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *cmd)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    cq = g_malloc0(sizeof(*cq));
+    cq = g_new0(NvmeCQueue, 1);
     nvme_init_cq(cq, n, prp1, cqid, vector, qsize + 1,
         NVME_CQ_FLAGS_IEN(qflags));
     return NVME_SUCCESS;
-- 
2.14.2


