Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLkS-0003KJ-9I
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:12:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkP-0003H4-IR
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:12:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkO-0004M0-NE
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:12:41 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35384)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkO-0004Lo-Jc; Tue, 18 Jul 2017 02:12:40 -0400
Received: by mail-qt0-x243.google.com with SMTP id p25so239353qtp.2;
	Mon, 17 Jul 2017 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=f9N2LC5mt56sCarJZS7rt+ABX27osCpuTncLUU6VqDA=;
	b=K9mehxD5i7V3hcestU/To22y0n3zewfG/XKGApGYeqhpulzon5zVrgRMi/1OldLaZQ
	RYQyZT9dwlhmQRF1DcGoRhhucts0975y7cRx05On/8rlW86RWo2v9XYkGSJuXR2dIcVv
	tgTd739SN+UAerxl48hEcjfKmAq18WrdRSq0+UxbJXmr9cJW8O207tviAF0TCaZAtK18
	/Ibq32hn/EvPtt2FwQn8DXBB26Ldpm7x0Jz8vZbOpAwL+Q5kq1cQWpT7nXZcrzKN2rSu
	Lzxk8fRpvyV9tLF539Qym8CQpbFUqmmzOU2MA4MOOnZHCrt/AUqPp0eaDr7Z0xWQvpJq
	rfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=f9N2LC5mt56sCarJZS7rt+ABX27osCpuTncLUU6VqDA=;
	b=krexAm3b7FlAIIarU2uRgPTHYjlQzYchG9WR2e7owjlu9BTVY8DNANTYL2ZJG2wkxG
	RAbsi1pYHqUvbEYkOCsyY6a6zXeMKL5AzXB2y95O6hhVfDDglS3HvuH7l3bHn+72hFrr
	fZHHs0MEkBW+EJVKRKT8uz8DIEGZ/e2OP7bnelATCgeHivQTA6krREZhjqNu/HKLPzta
	/nHfbCIyvjc8dBTGqpVSvs9+cJCsert6dmtSd5yujgE7pF/h4Vm7BPBpAD1iOHgrZWXS
	wkQFAVRiaS4p6Tyd9zqp+eoF9LSh0R5YugxBwSRzRZZ3Oh9PtZRYHU5ab1IixJK/5DXV
	73iw==
X-Gm-Message-State: AIVw110jG5SsE9FU6Zr3K0kLF8yc78BCiq+MAwaFyaJhqQI4cMQpZ9Tw
	6eTo7G/O+2noj0otxP6ryQ==
X-Received: by 10.237.38.71 with SMTP id z65mr57261qtc.21.1500358359965;
	Mon, 17 Jul 2017 23:12:39 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.12.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:12:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:39 -0300
Message-Id: <20170718061005.29518-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 03/29] qemu-img: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:12:42 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qemu-img.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index 182e697f81..6f5f956302 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3804,7 +3804,7 @@ static void bench_cb(void *opaque, int ret)
         b->in_flight--;
 
         /* Time for flush? Drain queue if requested, then flush */
-        if (b->flush_interval && remaining % b->flush_interval == 0) {
+        if (b->flush_interval && QEMU_IS_ALIGNED(remaining, b->flush_interval)) {
             if (!b->in_flight || !b->drain_on_flush) {
                 BlockCompletionFunc *cb;
 
-- 
2.13.2


