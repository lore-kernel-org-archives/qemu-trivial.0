Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cb7Ii-0007CG-Qj
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2017 10:03:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1castH-0001Jw-Iz
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2017 18:40:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1castG-0001Xz-CU
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2017 18:40:11 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36342)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1castE-0001We-Kz; Mon, 06 Feb 2017 18:40:08 -0500
Received: by mail-qk0-x241.google.com with SMTP id i34so10857703qkh.3;
	Mon, 06 Feb 2017 15:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Xf3c4J5d297luFoiOvz6DsQ481WXZgZNbb6h2ruzv3s=;
	b=LoNU5ksfADYV0XYmVZn+Fm+NvADvBJ/mpe2puZrHYsDlDO/OolKRwzmOEiFOD5MDA0
	q/BaO9VOgL1HxKV7e7pOj8qx5qXVW9GQToUiVIHUN0IF88O5S9gXOVKPzahgJX8mVpXU
	1q2FjziAC+jEc4xPhIUI1IfYPH6SUMvbnU1e7lRCKKktekRH68/jB11/ImeDJjRgt3Qj
	+LcK8LDF51YYKLhqX7jR3Y01GMrdJXni8/qUsTl/qaWH8Q3VZ3ZJmGryGkKIkYIxwadS
	LDu6SApVu08zto3KBtGfIyu6O2TNZ/4TNilyTMvO3XNZwEWs4HkEPX+FmoV7WQHw05jx
	yG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Xf3c4J5d297luFoiOvz6DsQ481WXZgZNbb6h2ruzv3s=;
	b=cgiLgsR1i6PiT/cPviT8zDavIf634tg+3CGyPNU7kck9MjUJuNdmfunXGobzAvoZ/j
	SHyDfmUkk2vxByXOYB5WdyAvIURg2sNTBd0XPVhPj1HqjIg0LWhN9rx22pfLNASluSMp
	dopeDXqFdtPP+9pcxTBNDShAGHWaWbqS9AEgC/0djSkulo+/1UySTjXrRmOveoL0AchB
	nvx5wQYUEjXdl+MIvEvAt+q8EhYTmKoeBcsCfLsRiOVvAnqgM5q6D6I0MmqcrvjeiWlo
	CkpquEQLjazrq0cnrXUPTLFCtggSO4pBCnkaoHnLyzIDRQHh+z/oPcjbXu5V1a0NjqCE
	a0LA==
X-Gm-Message-State: AMke39k6rB96nrVldCDo0YM5ruec30E2VKc9YYn+5N3YHadCBEb0qaEDHn+v5Hxni4cXAg==
X-Received: by 10.55.170.17 with SMTP id t17mr11380888qke.15.1486424408132;
	Mon, 06 Feb 2017 15:40:08 -0800 (PST)
Received: from yoga.lan ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id 37sm1817879qto.43.2017.02.06.15.40.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 15:40:07 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon,  6 Feb 2017 20:39:31 -0300
Message-Id: <20170206233931.14921-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170206233931.14921-1-f4bug@amsat.org>
References: <20170206233931.14921-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::241
X-Mailman-Approved-At: Tue, 07 Feb 2017 10:03:22 -0500
Subject: [Qemu-trivial] [PATCH 2/2] register: fix incorrect read mask
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
X-List-Received-Date: Mon, 06 Feb 2017 23:40:14 -0000

The register_read() function expects a bitmask argument.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/register.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/core/register.c b/hw/core/register.c
index 12f4c1e62d..482e3f827a 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -213,6 +213,7 @@ uint64_t register_read_memory(void *opaque, hwaddr addr,
     RegisterInfoArray *reg_array = opaque;
     RegisterInfo *reg = NULL;
     uint64_t read_val;
+    uint64_t re;
     int i;
 
     for (i = 0; i < reg_array->num_elements; i++) {
@@ -228,7 +229,10 @@ uint64_t register_read_memory(void *opaque, hwaddr addr,
         return 0;
     }
 
-    read_val = register_read(reg, size * 8, reg_array->prefix,
+    /* Generate appropriate read enable mask */
+    re = register_enabled_mask(reg->data_size, size);
+
+    read_val = register_read(reg, re, reg_array->prefix,
                              reg_array->debug);
 
     return extract64(read_val, 0, size * 8);
-- 
2.11.0


