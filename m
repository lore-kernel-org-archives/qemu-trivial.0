Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLkX-0003QS-RG
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:12:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkR-0003Jx-U5
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:12:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkR-0004NN-2M
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:12:43 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35993)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkQ-0004NA-Uv; Tue, 18 Jul 2017 02:12:43 -0400
Received: by mail-qt0-x244.google.com with SMTP id l55so1315190qtl.3;
	Mon, 17 Jul 2017 23:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NTybGDlzYVbV4mP0eDm4vky0nFinOBagMhAJoPAf5qs=;
	b=sh7mntwP0dLXH58Fur4FPxcrIwcvGFPmBIDVD1SR20butaDU98bKLzDjTRklVTsrPb
	TRXpxFRzpW12FkQDy8rO9Z/3aBS+XZZFiFMdrtVIeak2ZUmp6nI4YzlaGDI/pxHVDguG
	DHrMGS4WkdbCl6Q+s3sfs1bmxctlI2X5Sk0QHyOM7nf/kFoH1I6slYgGPIGlxcXnzim7
	Jof7sVyZv2RxJXr5brBvvSkV1QfcJqCaGF65fcyCpQEMo4S7+pzeSRT5I0B9Pxl9CGXS
	/sjNZPS38xL+Vgv/o9shH+tkvSAKcpZk/knbop/kwhkYXqYIaNhzJaimBbXwGbCyqbDA
	6BxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NTybGDlzYVbV4mP0eDm4vky0nFinOBagMhAJoPAf5qs=;
	b=QY/Rtjr881uREKvA3N/Si4r9GueOuaSlq66j5Xwu9CbDcz8x2qVCRekE/jpvlACXzS
	bXtPijhP+4rUDmb48cqUZ8iQkAw7tEvSlwSP4UVNngYmHGrCh6DzjjIp9YwRv5b0WNQP
	pbDPwMN7U46fUJeGlYkWHugh9CQRZWVLYy55Ykhy+f2YRnnkLtzcfwX+FY9t/XMBlhbN
	omvvLkkzrNgN5bK7HxHxW/iRD0jXEQfDhVDAL7kpFB+LRjfJ1yE4npAEDQfp9UDZxlMy
	pc8wRgtJxaBCG8hFGPCt5XlYtdd+oHX9mHPLhlMVK/JMOEOxiQ1cqnqyuBtEo/ZjYSI2
	SrEg==
X-Gm-Message-State: AIVw111ZemV1OnDTA18f3qVfLhDxtGhz4PuM8SQ/3wE7uLdzi5f5k4Qx
	vCwd+MqX2+vkRaFBmXFQ5Q==
X-Received: by 10.200.50.83 with SMTP id y19mr109509qta.108.1500358362337;
	Mon, 17 Jul 2017 23:12:42 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.12.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:12:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:40 -0300
Message-Id: <20170718061005.29518-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 04/29] scsi-disk: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:12:47 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/scsi/scsi-disk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index a53f058621..660d068390 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2620,8 +2620,8 @@ static BlockAIOCB *scsi_block_do_sgio(SCSIBlockReq *req,
      * reads and writes that are not aligned to one logical sectors
      * _and_ cover multiple MemoryRegions.
      */
-    assert(offset % s->qdev.blocksize == 0);
-    assert(iov->size % s->qdev.blocksize == 0);
+    assert(QEMU_IS_ALIGNED(offset, s->qdev.blocksize));
+    assert(QEMU_IS_ALIGNED(iov->size, s->qdev.blocksize));
 
     io_header->interface_id = 'S';
 
-- 
2.13.2


