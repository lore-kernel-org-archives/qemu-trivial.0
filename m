Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaGI-00050p-R6
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:22:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGD-0004xU-7C
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGB-0003kV-VO
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:05 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG6-0003hk-FP; Wed, 06 Jun 2018 11:21:58 -0400
Received: by mail-qt0-x241.google.com with SMTP id s9-v6so6748471qtg.2;
	Wed, 06 Jun 2018 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pIzqXMv5y97bxVBxOZNplXo6uoqRSFYTQLCPiICefwU=;
	b=DOwDeYtosH5wyTvxWWL/sqJle42wiCUxT1WsSpVK7+GnKEPGDmVDU5DBDSUhslPG39
	k2fGksd/+gyjL+2pFtjdyz3P/0ZjYZIBOHucg4FuPEixafzJkCvcVXF1E82DYTLeQFMl
	gGwdrL0bJdAgzcHtzmkttv+7UKZSYCHyPKhc2rzSrbG9VLVQ0KHYVr+wD8oxB8wOgRwY
	9jm0ZY6whFGXqZLKH/xiB/AY2SnsMIiwWpxx2j7CsvjJnk9b78AWGMbypNa6A6F7cnLl
	arndLGx95nscPNT4ifv7pFVNQax+fLDjP83mjuZvXqy8N6GGQ5SP/hOn++cWMBPZmJND
	lX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pIzqXMv5y97bxVBxOZNplXo6uoqRSFYTQLCPiICefwU=;
	b=FvIE44rA3GIFs/+aeSlTBOGlMOLExa4hDG9nvEySmrd4Wp/z+//ge5BVRtxNn3KtxH
	4b19kqFFEzdhFV3LlVlXIdDFH2g1Add6bdXPxHOGGu7qftwrLZwb7BfuszE11Vb47EYH
	cmmpDKQETc791jYfIo+qAGKGNu36PJMTCQ8gs+gk5sMtJ3/J3J+WTZ+oECANtxOpDDx4
	c/Cw1WrSGoUv6K2A8AGrVS/bjE4KTAVf/nP9EHMeASP0N918zH2r8RC0KR/f6gR2QFpY
	Y1MtqRhbWwqa0kyL4mxU9aDVSXSmqg0qmppM/+xPxtF3LvPWNb2X9kpp+sDsGGJPUZS5
	9uTw==
X-Gm-Message-State: APt69E1jlv2G1386GV01DTZX8H15gk4IJNB32mer0m0XTVjf1C8JqTY8
	tGdgxmMEt+EGl3revoLjiWQ=
X-Google-Smtp-Source: ADUXVKIhf6szdiq8VYYTlGLGopsMAQS7eU1EtEh5PYKCh7K9TKglx60+G5IMdmXwMdnPEW6IvlyBVA==
X-Received: by 2002:a0c:90e1:: with SMTP id
	p88-v6mr3073549qvp.145.1528298517966; 
	Wed, 06 Jun 2018 08:21:57 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Wed,  6 Jun 2018 12:21:24 -0300
Message-Id: <20180606152128.449-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 07/11] stellaris: Add trailing '\n' to
 qemu_log() calls
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
X-List-Received-Date: Wed, 06 Jun 2018 15:22:06 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index e886f54976..502a20842c 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -203,11 +203,11 @@ static uint64_t gptm_read(void *opaque, hwaddr offset,
             return s->rtc;
         }
         qemu_log_mask(LOG_UNIMP,
-                      "GPTM: read of TAR but timer read not supported");
+                      "GPTM: read of TAR but timer read not supported\n");
         return 0;
     case 0x4c: /* TBR */
         qemu_log_mask(LOG_UNIMP,
-                      "GPTM: read of TBR but timer read not supported");
+                      "GPTM: read of TBR but timer read not supported\n");
         return 0;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -836,11 +836,12 @@ static void stellaris_i2c_write(void *opaque, hwaddr offset,
         break;
     case 0x20: /* MCR */
         if (value & 1) {
-            qemu_log_mask(LOG_UNIMP, "stellaris_i2c: Loopback not implemented");
+            qemu_log_mask(LOG_UNIMP,
+                          "stellaris_i2c: Loopback not implemented\n");
         }
         if (value & 0x20) {
             qemu_log_mask(LOG_UNIMP,
-                          "stellaris_i2c: Slave mode not implemented");
+                          "stellaris_i2c: Slave mode not implemented\n");
         }
         s->mcr = value & 0x31;
         break;
@@ -1124,7 +1125,7 @@ static void stellaris_adc_write(void *opaque, hwaddr offset,
         s->sspri = value;
         break;
     case 0x28: /* PSSI */
-        qemu_log_mask(LOG_UNIMP, "ADC: sample initiate unimplemented");
+        qemu_log_mask(LOG_UNIMP, "ADC: sample initiate unimplemented\n");
         break;
     case 0x30: /* SAC */
         s->sac = value;
-- 
2.17.1


