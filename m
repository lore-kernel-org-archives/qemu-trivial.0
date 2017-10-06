Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cR2-0000uP-Ei
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cR1-0000so-1p
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cR0-0006hq-Ce
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:39 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33099)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQv-0006fD-W9; Fri, 06 Oct 2017 19:53:34 -0400
Received: by mail-qk0-x244.google.com with SMTP id z12so9700654qkb.0;
	Fri, 06 Oct 2017 16:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=K11BF4s8VQOqU6nEorWyCTrelnBi8QPU65wJU5KBOvQ=;
	b=iaqz5SlRs2WeBmN3/1CEh38Cll16nB1xATBjYxS/1uKy+OiTMFIuM2WJkNIQxXKLJR
	ZIN4j5E2bNZCHiTn6bSTdLtuCJ5Y71LKwdhMErVEOTiLnn1IwrWZXDSEnJWRF+SyUFz0
	en6/LCQvt08ML+ce1qbEn+4DTi5hw4zt+RsqeDs0MZWLGSNEGWUTGM3jZOKHIMXK+3+8
	tT/3FEL1dJixGgjOoVDLZ906gS0u2SPcYCETyhsGwIl7B7e7gUjwG+wObBaCd7bYbnd0
	NC40TXs4ApTsWA+RPXo+pYw+e2yFNF/qKyYEPoSpoYtmUo5qGQgTXYkX1puPsC42Gajf
	pdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=K11BF4s8VQOqU6nEorWyCTrelnBi8QPU65wJU5KBOvQ=;
	b=Ch/jlhXD8F22dd3hQP+RneVxRQ/7RodELMSPxTDCOmII1VQeyIjGAoS7Lq+le6YOyw
	s0g0uu8DZKX4mygxPrPHV5x5BIn2FTg1SiyCPDqBNXP8dhuIDy6KXwV2d520Nw4BpUMJ
	ngTrGmxAHcVh+wi+YOHdgxIU9ggDhuibe8G0jOXDV8E2B2pSj+n8zKS1UC3KlrRS3kE3
	JH2qFw6HDpfk/PTGlV5bw4rwKB0ZmIVYtIQdxKypxIfh9WqFcwlka5uHrTSGgrjoCer9
	0sb971LLiNB+/xcf8bs/eT+09mxjOD3wa9MjVZOxRXmKmuToZYILAWaRQfIAJOlLmt6m
	lsLQ==
X-Gm-Message-State: AMCzsaUe4FplMtOIHiam4Utdc/KAbUmivvBMsWH0weQ5vkBQAJKpbS24
	3xHpuq1xjOYOJHhEDz2AAyU=
X-Google-Smtp-Source: AOwi7QCVN20tIASnmxLG1u0cgLNgyEj8L9oOsss9VN33Wu+viT4+9h780aY53U6Wq1YTm9Wp6u08VA==
X-Received: by 10.55.25.85 with SMTP id k82mr624058qkh.223.1507334013457;
	Fri, 06 Oct 2017 16:53:33 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Peter Chubb <peter.chubb@nicta.com.au>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-arm@nongnu.org
Date: Fri,  6 Oct 2017 20:49:47 -0300
Message-Id: <20171006235023.11952-53-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 52/88] i.MX31: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:40 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/misc/imx6_src.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index cfb08710fb..9342bce6de 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -149,7 +149,7 @@ static void imx6_defer_clear_reset_bit(int cpuid,
         return;
     }
 
-    ri = g_malloc(sizeof(struct SRCSCRResetInfo));
+    ri = g_new(struct SRCSCRResetInfo, 1);
     ri->s = s;
     ri->reset_bit = reset_shift;
 
-- 
2.14.2


