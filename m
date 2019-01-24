Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmhn0-0002jP-Pc
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2019 11:23:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gmhmx-0002c9-LQ
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 11:23:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gmhkS-0002lP-HR
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 11:21:02 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sourav.jb1988@gmail.com>)
	id 1gmhkQ-0002hx-NL; Thu, 24 Jan 2019 11:21:00 -0500
Received: by mail-pl1-x643.google.com with SMTP id g9so3115660plo.3;
	Thu, 24 Jan 2019 08:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=C1/OVx9jhzQY9srDTsbkiILPvLM0EPwbG6g6z79K6R0=;
	b=YNoOalJ8sfOgAnxlwIGjBH93Z+pCf1/GzRtRILJUsmbCfZ1eYsllcDuTzW1x/Wfq+J
	R52N3n019zSPFpGY/TibDRmzLhUB02OCCKbbtvfhZBjm1hjfX0613NfGyEGuZFN20oKr
	JvASTnZuUPt9AyRUPQS8P/0hgKzUewrYLUpxAd05a3gBwlLUuxocrH9TBEKrX7kHimVP
	bA102s+khhOVVEbwAMFNeUb3uHRkkIpUGqhvZXNnDf2+MJfvzgalvvAudDIYiG6PkKV4
	Q+ml/e3F66Rn828CfUDX8x0uvTUXtae7AvB0X7Q9HPPYdbUIIxP8RJ+13twxsR4V0GAW
	TL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C1/OVx9jhzQY9srDTsbkiILPvLM0EPwbG6g6z79K6R0=;
	b=bcrhf53LW4GSkTrywOhdEo144B27r+ZzgCQVssqJKVYIddDP/AmEPhqLvY0qqbazY9
	x3RQwexns8oWeM3y2xAynYoaNb0KdL17e9qZryXyHP+TwP59pi3jRfihEGR63buaQPL8
	tk1VhhXKxQDNwatG4tvRQ7txVbIkNPL2cGs+qtMU4lGN3k18WHoBisldUCB76QvPq9tA
	tsGG6qDUG9SwQTDeNV+T160evHpbXd7h6H8n1zUzXBiAYOOOHExT7zIp34d1z15aNcJH
	KT3uC5auORuzbKIUpcLgpNaDW+eglHBxXK1l4sF2r0/LtZzBVbEIMkr9Fw5dBKS5kIcq
	xZiA==
X-Gm-Message-State: AJcUukc64doYOSJT3BIL6kmjSO5kctmXuUZprklZErxAr/k3dlcGv5As
	fwg8S4e+o7GRXui9rY4BiYHgPbtFYa4=
X-Google-Smtp-Source: ALg8bN4dGKXKW5JaDAwQzGEdS4yvTdR2TPazCWdQjGXV2I5354NQfEUyvAERKozqJMz1NnbPkqx6vA==
X-Received: by 2002:a17:902:9047:: with SMTP id
	w7mr7236359plz.270.1548346856617; 
	Thu, 24 Jan 2019 08:20:56 -0800 (PST)
Received: from localhost.localdomain ([27.7.213.28])
	by smtp.gmail.com with ESMTPSA id
	n78sm45621244pfk.19.2019.01.24.08.20.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jan 2019 08:20:56 -0800 (PST)
From: kumar sourav <sourav.jb1988@gmail.com>
To: qemu-trivial@nongnu.org
Cc: f4bug@amsat.org,
	qemu-devel@nongnu.org,
	thuth@redhat.com
Date: Thu, 24 Jan 2019 21:50:45 +0530
Message-Id: <20190124162045.10474-1-sourav.jb1988@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-trivial] [PATCH] hw: sd: set category of the sd memory card
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
X-List-Received-Date: Thu, 24 Jan 2019 16:23:37 -0000

Sets the category of the sd memory card as DEVICE_CATEGORY_STORAGE.
Devices should be assigned to one of DEVICE_CATEGORY_XXXX.

Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
---
 hw/sd/sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index d4356e9b73..aaab15f386 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2121,6 +2121,7 @@ static void sd_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &sd_vmstate;
     dc->reset = sd_reset;
     dc->bus_type = TYPE_SD_BUS;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 
     sc->set_voltage = sd_set_voltage;
     sc->get_dat_lines = sd_get_dat_lines;
-- 
2.17.1


