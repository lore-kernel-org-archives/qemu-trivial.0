Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxF-0004Br-Hf
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxx9-000488-41
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxx8-0003Bc-8T
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:47 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35760)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxx6-000393-5E; Fri, 28 Jul 2017 01:36:44 -0400
Received: by mail-qt0-x244.google.com with SMTP id t37so8844226qtg.2;
	Thu, 27 Jul 2017 22:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BnxH8x2NEWnQjPDk5qB2WzrIDw/MzFw9w/MAf7vvFdU=;
	b=ItjjNTBGKasXdbtU1rc7n9HWngmkfynxlPSRVKoSMx5c8pzZ2X+eWmOT7gwt7PbKdT
	cEk9Ax6mxlNFX6nXl6JWMY6NxoD9wzULKgaSAkVL0TR1LVMlj0XmMQRrYxKltvMxB4FZ
	tCYhEiEPNrKY+39urr+gdB0LDaQmkmqB7E+OvB2lxWmH3yfPzdLTk15NOBuvf6CwhO5a
	Cf+v4t1kl0y1pwRCiFbjNZcAH74twQ1B//dPFmrzpIshv6PnzkBPu8JRmpN4xSm5jMg+
	YEQJsLMYEr78NYIHm+/uNPFHtP9kWIaGO6eITZZRTpOri3sVmk8Cw4ooS6tOmRw9r2is
	c2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=BnxH8x2NEWnQjPDk5qB2WzrIDw/MzFw9w/MAf7vvFdU=;
	b=qJWTb5DuqXi6sLwiz3YPu3avXbKQMBl480dy/cC3CpdBiS0+f1ySeOvbaxFAKdPc9z
	3/9fSgBAvqy/wlWz757aN3Xz+AidNpkVF+eaGRcTHK0e8r1TsIBNLuhUBFlXzalm97kb
	rtkHrDAFQKJfUX8lqb4mlYvBaDVWu9Q8+GxywJ4G2S0/3cmfngmoL+iPhp1qTl+5i6ld
	ZfzY/bKfCodMUWuqvT+GGJEylLKx1NNbIwwobS9ElxfvKzuzHjNou3UUKnTlly95fTu7
	SO8yO3fqKTpUjdRuWYT1v/Y/pk2XgTtKKVqdpp/Ghb63hRZ47r8Gb4HD3gAC/r32Yhix
	73Kw==
X-Gm-Message-State: AIVw113RKD9Arnw6vPMfUS858xWl2h+P5d39BkSGCYVcstDMIlcepZP0
	vjQRb+J8w9Gs5IAeUYML9g==
X-Received: by 10.237.57.199 with SMTP id m65mr8617385qte.243.1501220203765;
	Thu, 27 Jul 2017 22:36:43 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
	Greg Kurz <groug@kaod.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:32 -0300
Message-Id: <20170728053610.15770-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 09/47] MAINTAINERS: add missing entry for
 virtio/9p
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:51 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6da3264d4e..4f9ce6e686 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1056,6 +1056,7 @@ S: Supported
 F: hw/9pfs/
 F: fsdev/
 F: tests/virtio-9p-test.c
+F: include/standard-headers/linux/virtio_9p.h
 T: git git://github.com/kvaneesh/QEMU.git
 T: git git://github.com/gkurz/qemu.git 9p-next
 
-- 
2.13.3


