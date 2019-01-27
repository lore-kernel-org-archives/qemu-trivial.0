Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gnhWf-00045c-29
	for mharc-qemu-trivial@gnu.org; Sun, 27 Jan 2019 05:18:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gnhWc-00044M-Nx
	for qemu-trivial@nongnu.org; Sun, 27 Jan 2019 05:18:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gnhWc-0008Qw-3i
	for qemu-trivial@nongnu.org; Sun, 27 Jan 2019 05:18:50 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43018)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sourav.jb1988@gmail.com>)
	id 1gnhWb-0008Q5-Sy; Sun, 27 Jan 2019 05:18:50 -0500
Received: by mail-pg1-x544.google.com with SMTP id v28so5983999pgk.10;
	Sun, 27 Jan 2019 02:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1LkqHkWFxYZLLQ5/6p+blvTeA+TrR597emoIx0TQLmE=;
	b=Ha4xbtkPY0fHRb3hDPPN0FKGGwtd2j1CmHYUHLq+lZXxBEH4MiEuiCanxvdzF7Hbff
	5fk4llMHowCrCe82NmbGrJvGW7gRmRNGKsraLaBA1WbWd+C4IyD4B+xOQjb0hdcEznI9
	6virEQn2ucmvsIg7mbnH3OZn4UM7iE2LhBineJ8PU7/aYnPCZ0MkwbGPQjGzVbfz1gWE
	fzZQRWjhX9hS7lufNr43qLqbRQ+ra8pOEVDw4nUebu9oPBsdFCeLrxvoUKsGbsfZ9yh5
	v7MIJUc3DHw+tTLcXphC4W/g7UMlnW5ed4LVXOeZWpWShWdo6laZ6Be/+VWB5GN8zM54
	JIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1LkqHkWFxYZLLQ5/6p+blvTeA+TrR597emoIx0TQLmE=;
	b=sZDvzIQMR2B59NsQ0dWOEnzJUAiulUCEwus+jpP7T/vM81k+zjLeznTiR5S63X3iBU
	5wcZG7+T42jEp05BatM+Je5QLL9ctFOHxEd0Cd6uS7B8ywIZEkelMwByOpwV72wMu2K3
	LuHR3HHE1j2D6jjoitol4FVfKAqMgwD8naxfsxSqrvTbgSvzbf4pZKmmORys1yLmLqP8
	XzIoMbhvugrL3tjdQ8IiKea9OnxmDJgPJ8KKJS+6RzF/IjFIQQ34Jk4snOye0Cu/h74S
	p9T/zdz20SWYvMlhXn+tv4HJv4vuRVbkoLhV1bQT0/m5yqe5YiNCBZJXg9UF54AswXLN
	Cqrw==
X-Gm-Message-State: AJcUukfouUMtoghHg2YEwQSwBR//x9YpnerGsmcIMajT9pM6XKZ2aHTm
	7k6GXFfbZ8v1nMHiLRvy5P4lfUpQZwg=
X-Google-Smtp-Source: ALg8bN6yempHrN9qsPiP47NyVgrpR1sJnbI8leu3sre8IpEZRto0fzCLyTob6T4aUnm5KfJLqka3NQ==
X-Received: by 2002:a62:7086:: with SMTP id l128mr17705200pfc.68.1548584327969;
	Sun, 27 Jan 2019 02:18:47 -0800 (PST)
Received: from localhost.localdomain ([27.7.213.28])
	by smtp.gmail.com with ESMTPSA id
	d6sm42723458pgc.89.2019.01.27.02.18.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 02:18:47 -0800 (PST)
From: kumar sourav <sourav.jb1988@gmail.com>
To: qemu-trivial@nongnu.org
Cc: balrogg@gmail.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sun, 27 Jan 2019 15:48:36 +0530
Message-Id: <20190127101836.15451-1-sourav.jb1988@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-trivial] [PATCH] hw/input/lm832x: set device category of
 lm832x
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
X-List-Received-Date: Sun, 27 Jan 2019 10:18:51 -0000

Sets the category of lm832x as DEVICE_CATEGORY_INPUT
Devices should be assigned to one of DEVICE_CATEGORY_XXXX

Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
---
 hw/input/lm832x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index cffbf586d4..07ae5e0aee 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -509,6 +509,7 @@ static void lm8323_class_init(ObjectClass *klass, void *data)
     k->recv = lm_i2c_rx;
     k->send = lm_i2c_tx;
     dc->vmsd = &vmstate_lm_kbd;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
 static const TypeInfo lm8323_info = {
-- 
2.17.1


