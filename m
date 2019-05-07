Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hO68p-00012d-Hp
	for mharc-qemu-trivial@gnu.org; Tue, 07 May 2019 15:52:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ramirose@gmail.com>) id 1hO524-0004FJ-Bo
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 14:41:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ramirose@gmail.com>) id 1hO523-0001jo-CF
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 14:41:40 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46525)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ramirose@gmail.com>) id 1hO523-0001h5-5h
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 14:41:39 -0400
Received: by mail-wr1-x443.google.com with SMTP id r7so23686118wrr.13
	for <qemu-trivial@nongnu.org>; Tue, 07 May 2019 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qA6m0zxtlI55+GoJPK2BmvdH5Onhm1PGA43KFFA58Hk=;
	b=kxWxjCpu9RoeIudWSJyCDH+NRY9jIJpzo7vMjfMKhaK3hadzJyc97/UipTdaMSsICh
	lzmXRR4Ur0etjJI6/IMUq650HwTsDrsiDdyZY1LkSmGWECMbPm8n62dCAoWn9XU1P3Qo
	iTt05IQ6+zkdBPbRiQVnQchdZ8FKTHjjCsrCPp4n/S9PcWX0nJIRJgrdnQI24AaH8Pbf
	woM9CDSErmq2rwSsxvbbaCsy0fcgv3YzjATh0dJtFFa5xMED29dgF3FC9h6G7aXy2Hhv
	RaDJowPbiikazQgl0X0Nr+oHjVmrngQN6cq5yWHN9V5wCHbBV3q84KPe4oQUm10qCWag
	HqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qA6m0zxtlI55+GoJPK2BmvdH5Onhm1PGA43KFFA58Hk=;
	b=OeE8mD7Z1h41Y49SC852aRpSwuji2+8L9+wlTsa8XARjTMjoM35b6YNi7IVIY/CFnk
	dYlTBgyKDJYlevf2oGIzdgFRvdE/abgWZRgruVq9HUEszlVFZKE/CTJFjjvkIw2fGz97
	f2YF85Kha+A9K2bQ3dIz9pK9w2N6TeE1BPSsXHgRa1SZ0vGa6DMZ7CV8yvBZQnyig8I8
	WlpR4U/tw6dRJKrh8ma5fkuq80KW04HYmHjR2bj0+VUZ4uZwmTyqdvpfom2YxovKrmqf
	RQngJD29oSSqOlZq2Rni32hYdI3VC2P/C35ysB1WvWq0m19E4VhVMwuF5LFq/T53D661
	EGWQ==
X-Gm-Message-State: APjAAAXf+tTtazJawSqpjhe7jI8qXyg3bYmA02M13+rSEumqNNg1EUvU
	w+zE36w/YX1+U05k/5IcvWZKLc3w9xQ=
X-Google-Smtp-Source: APXvYqw+JRQ/OLCjNk9L/IiXan3/G+iTA0Rx5xjuQuqzAZMtmZ0uAzxffySNMoGS8UYfSl8D0r9zxA==
X-Received: by 2002:a05:6000:1201:: with SMTP id
	e1mr7725956wrx.136.1557254497260; 
	Tue, 07 May 2019 11:41:37 -0700 (PDT)
Received: from localhost.localdomain (bzq-79-179-9-126.red.bezeqint.net.
	[79.179.9.126]) by smtp.gmail.com with ESMTPSA id
	v184sm21382113wma.6.2019.05.07.11.41.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 11:41:36 -0700 (PDT)
From: Rami Rosen <ramirose@gmail.com>
To: qemu-trivial@nongnu.org
Cc: Rami Rosen <ramirose@gmail.com>
Date: Tue,  7 May 2019 21:41:02 +0300
Message-Id: <20190507184102.4258-1-ramirose@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
X-Mailman-Approved-At: Tue, 07 May 2019 15:52:42 -0400
Subject: [Qemu-trivial] [PATCH] scripts/qmp: fix deleted link in
 qemu-ga-client script
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
X-List-Received-Date: Tue, 07 May 2019 18:41:41 -0000

This patch fixes a deleted link in qemu-ga-client script.
According to the old link, the page moved to 
https://wiki.qemu.org/Features/QAPI/GuestAgent.

Signed-off-by: Rami Rosen <ramirose@gmail.com>
---
 scripts/qmp/qemu-ga-client | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
index 30cf8a9..50efc21 100755
--- a/scripts/qmp/qemu-ga-client
+++ b/scripts/qmp/qemu-ga-client
@@ -33,7 +33,7 @@
 # $ qemu-ga-client fsfreeze freeze
 # 2 filesystems frozen
 #
-# See also: https://wiki.qemu.org/Features/QAPI/GuestAgent
+# See also: https://wiki.qemu.org/Features/GuestAgent
 #
 
 from __future__ import print_function
-- 
1.8.3.1


