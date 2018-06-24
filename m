Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwIq-0004F7-4h
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:07:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIk-00048K-8C
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:07:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIj-0004F6-GR
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:58 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:42966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIh-0004E7-Hz; Sun, 24 Jun 2018 00:06:55 -0400
Received: by mail-qt0-x244.google.com with SMTP id y31-v6so9341255qty.9;
	Sat, 23 Jun 2018 21:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/GETBzD3viq9pszXR5PyIXw44iP0PfoCOiwkqQ3CKrA=;
	b=DpsKz51hoHH/hkFPla1/dZuFJzJoUfQDsCfMMeIcXIRIrfb9he+0m7oa6VJArjuW3R
	5CCtoBfNj/PsGVrV8kipBm54l0Ve3BWTjEPyVtvrinzlqKUl9VH7Ey/hNip9JfjCvQ2Q
	o/MWF+A23XSLUYfL4OZiPGGaBgdeneyvchfo1+H0/AK6kIATy/9FF3w6EBuizk8/EWLZ
	UbfY9kt1jCoSCXdHztSpbLyjwp784HV3/Fiv9dYfiPaaO53nI3sEwCzV+VItJo/Z+i3K
	A4yoWtL3ZGoJJWREVHrP9cBDZMVc/8QF/J4VYmxrr+zR9ydH6Cahk2VjqUYoJxWeigEL
	F+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/GETBzD3viq9pszXR5PyIXw44iP0PfoCOiwkqQ3CKrA=;
	b=VPZjXftfG02pGqC/7Ap9G6Hf8CAgYVHf2HOquoum6mysPQXARYuCevE6lxorRYbgP+
	+mI3bCkpK1HM0k57MSKqz0eETMDwwG7rxtq7gudFhzr1CVHZwhiW2OMOAXVCMPRviOyz
	zUsyutX812BUw9TL0lijVVMTJDrYLCizeSAyhWHDRIrxkcdT1q/Y8pvVTeCLvQbNHdqI
	+jVH9Zoc+1Vwi5MZ0wxnZ0dGERvSiGYBLH/mxnlfJOXRD2SpAsrqcG7jQvhOWbVCrr9f
	oU1K1pk0gMkLhQdXNavWXNqCvkFmD5je+v5BN2J15Ugn+vRZ6EWAPR2ODgGgDd6AFlqq
	oyUg==
X-Gm-Message-State: APt69E2c9Wmr5mupUlf1AyKk8G1Xe15wsF7pJWh+GDhPTfivasewOC5p
	5Xu3kxuHkwfQOFqXHvPKRAc=
X-Google-Smtp-Source: ADUXVKKNt6O/JDuf/yCMBZWzmiGiTwK3b4HRJ5s3k47QFOesWMRNEBz5CjKamORy2TZaTCmG7d4s8w==
X-Received: by 2002:ac8:2f2a:: with SMTP id
	j39-v6mr6709140qta.74.1529813215096; 
	Sat, 23 Jun 2018 21:06:55 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Date: Sun, 24 Jun 2018 01:06:04 -0300
Message-Id: <20180624040609.17572-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v3 11/16] hw/net/stellaris_enet: Fix a typo
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
X-List-Received-Date: Sun, 24 Jun 2018 04:07:03 -0000

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/stellaris_enet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 04bd10ada3..1e7329517c 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -340,7 +340,7 @@ static uint64_t stellaris_enet_read(void *opaque, hwaddr offset,
         return s->np;
     case 0x38: /* TR */
         return 0;
-    case 0x3c: /* Undocuented: Timestamp? */
+    case 0x3c: /* Undocumented: Timestamp? */
         return 0;
     default:
         hw_error("stellaris_enet_read: Bad offset %x\n", (int)offset);
-- 
2.18.0


