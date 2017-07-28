Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxC-00049C-V4
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxx8-00047L-7Q
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxx7-0003BJ-Jt
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:46 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37111)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxx3-00037N-Uf; Fri, 28 Jul 2017 01:36:42 -0400
Received: by mail-qt0-x242.google.com with SMTP id d10so10617727qtb.4;
	Thu, 27 Jul 2017 22:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=57IWJqW/1i4CnGlxWEqv0NV/wZjhI9m1NgfV7vO4+TY=;
	b=uU/s94BZgqIldl5ap/Qa8GF5JY6z8ch00ulZ47ReAQULXOw2ryarEokL2W2C5HQba9
	uFd36HS00qZhojbyxIWzwZnkNncgAT/+BWrWYfrfj3rB+TCA60JbhdPRQ8TQAUBug/EZ
	OKV/dk2Av5tIBw7jxtj5PRheBk975QdNE4URVK5jB0uVuttAFGCYniITR9ktfz155iBy
	11EI/ulV1KlWH7TWGI4CZazj4wCaFtL0HA0Fp8Q2PnrJuXutdK+Djy9JyPIAHG6rCZGG
	HP4xjC8wyyrb3esju+LwYs97VkbtNmrz1RMo8SOS/nJZXqwRy1Cemb/8AebvgooLZx1Z
	MO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=57IWJqW/1i4CnGlxWEqv0NV/wZjhI9m1NgfV7vO4+TY=;
	b=Oe/RwIhKy+9Irz5e/0Lv7VSYFjvdyjW9w5rTB3FlJEa0OLkuP6Oa8knZRx4DjGXdmn
	nFnJ7zhf67IEOtI8NIGH7wiezBTTuR3sjWcFbBULm7/PFOuSUdKvuJNuT6cvgLzkXKn3
	5s2owZdmsFuzNrCf+EeRGr25V8l7/a46XPnfBdAXjAD48Zvm2Xe4VW3mBtSQF16a9iHA
	0RUySUhN+XOLYk9Zjym23plY88YyerFyTVTNSqg9EyghBKtsr+Yorxl3usG51dBRpcYv
	ch5ACCnk02r5RZ/yGBYFDnzI1sdwHmuamw3jjOtVVRixj1Ju1TWJ5EH1vDIZoLf6+r7E
	Q18A==
X-Gm-Message-State: AIVw110TTLWglULlkI629HOM83LRcYUfF7pbIEpRfVG917BKYgObemI5
	CnPvBmPuuMvSNm1XOFFgKw==
X-Received: by 10.200.3.135 with SMTP id t7mr8797588qtg.216.1501220201532;
	Thu, 27 Jul 2017 22:36:41 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:31 -0300
Message-Id: <20170728053610.15770-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 08/47] MAINTAINERS: add missing entry for
 virtio
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:47 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69987b5e5b..6da3264d4e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1046,6 +1046,7 @@ F: hw/virtio/Makefile.objs
 F: hw/virtio/trace-events
 F: net/vhost-user.c
 F: include/hw/virtio/
+F: include/standard-headers/linux/virtio_*
 F: tests/virtio-balloon-test.c
 
 virtio-9p
-- 
2.13.3


