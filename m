Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWLTS-0007JM-En
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 08:47:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWLTN-0007HT-Gd
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 08:47:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWLTM-0007G9-Lo
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 08:47:29 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:43607)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWLTI-000780-5a; Fri, 22 Jun 2018 08:47:24 -0400
Received: by mail-qk0-x244.google.com with SMTP id s190-v6so3565215qke.10;
	Fri, 22 Jun 2018 05:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4Rp1wIOKleO2N0z1Lv5Zo6ySubXVZy8oOCEXAQbAeq8=;
	b=jiUE9cnwA4sN6h1Z3/5VE1FgI//F6Go3DKSMO+fHBtaL/cJdTXPBsVaoRTl/FzOrJl
	SB76apeeU1uBjB0aUKwN7SL7/HIrfbsesD6YaxceoaHguinbVQTuzZTImeBHFJiT25Jp
	sLj/bp2DK+mWel7+6x08/y0oDOnsOAZ70PM82fXRJfusEo9yo2re3EsFGOxz81w55Ge7
	wlgaioH1UmEXqK26JhimN7Jvz4a27RCvvlqEPPUwcAsRh7bpDvzBHyTf8mDJ3XmaVeGQ
	0KYtFT69UrJPoj7hwIC8p73gqtiLzlUyQDz6h34gn9Hk+3FKIkYKq2qu56JwMMeQsKqY
	SqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=4Rp1wIOKleO2N0z1Lv5Zo6ySubXVZy8oOCEXAQbAeq8=;
	b=W3/pDZq/T1PC0qQ7XQ9psgf3jLQvSKzOeq0uWdPB1o/Nc1CJUgsU1ckZG/1OtpUYo9
	+Zk4Rk1RkawV4fhZG4rDY7+a+hrLePE5ETv/4iVYXyPMwKsTCZp/Xtcdf5IT76lteR3x
	tPhV86MgpxKu5f3whcso+vSqvXEYDqfyCG6SNduLnp3FVOzKHoUqSpDaRUXCOOhaXXop
	kFr9Ux98TY5CHilEnkSwqz4GwIqjQ2irEjWPEbEXpVQLV0/o3YZpwl+fDZwcPzeSpCO2
	LLNshhBNYDIqmk3VLIlGXcriUuxoCfyyTh5665x6W4J5KZq2YyGpcfkXCnE0D/oxcDMu
	56FA==
X-Gm-Message-State: APt69E1Pjln8f1mVIk9jbv9DI1vMIXlLV0ECfbKzil0Gpaqnq3BSRLyF
	Ab/+TTXxsjgn4wveXFfRc58=
X-Google-Smtp-Source: AAOMgpfingX8EXk1X/Qjy2KD41rpBLVEKZvQK762cTH61Q0GF6Vrp9hpJ3HvIc1+h7kR0rrOaUUBjA==
X-Received: by 2002:a37:85c5:: with SMTP id
	h188-v6mr1196632qkd.40.1529671643583; 
	Fri, 22 Jun 2018 05:47:23 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m128-v6sm5280884qkd.33.2018.06.22.05.47.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 05:47:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Jun 2018 09:47:16 -0300
Message-Id: <20180622124716.9179-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH] hw/core/register: Log unimplemented access
 via the 'unimp' debug level
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
X-List-Received-Date: Fri, 22 Jun 2018 12:47:30 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/register.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/register.c b/hw/core/register.c
index d2d1636250..8ed7c6b927 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -203,7 +203,7 @@ void register_write_memory(void *opaque, hwaddr addr,
     }
 
     if (!reg) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: write to unimplemented register " \
+        qemu_log_mask(LOG_UNIMP, "%s: write to unimplemented register " \
                       "at address: %#" PRIx64 "\n", reg_array->prefix, addr);
         return;
     }
@@ -232,7 +232,7 @@ uint64_t register_read_memory(void *opaque, hwaddr addr,
     }
 
     if (!reg) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s:  read to unimplemented register " \
+        qemu_log_mask(LOG_UNIMP, "%s:  read to unimplemented register " \
                       "at address: %#" PRIx64 "\n", reg_array->prefix, addr);
         return 0;
     }
-- 
2.18.0.rc2


