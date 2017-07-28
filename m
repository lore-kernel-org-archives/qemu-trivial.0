Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxU-0004SX-Lw
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxS-0004PQ-49
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxR-0003cr-93
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:06 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxP-0003Yq-2n; Fri, 28 Jul 2017 01:37:03 -0400
Received: by mail-qt0-x241.google.com with SMTP id u19so9230747qtc.0;
	Thu, 27 Jul 2017 22:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=e/0Mp+wIwbHTjkT+aAsQsWRj0fdJUYKQrz5SKUchRZA=;
	b=ONlbM8Mbq+6PkinP+kETqSu9Es1qnwC2yLEAbPGQnzkabbWFER2SgC7k4WK8YmnEyn
	ZVcaADSiYBizz7Q2nok0Vu5vGF86hsRkjWVOubOkJxzx0WJstdDVMmHvklRVm25gDVh2
	6lnUXiNusN+yKHAFW3QX+CAPTrZJh5VWLblyid0J9WF3bdejJoNMktI+/4hRENj7p1r+
	2++O1J7+5k1zx7E8JDjI9JeNCoZd16CjponDbvHlzwfj1KBZdOVqEUZ3tA5sb8s5Zy8T
	v9OzlgjRJJ4CtniBLS5WqQOy0LCaFQhj/tYB+nku05TmR4xZyxaFQRrMpAXSNPlzRa+a
	GTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=e/0Mp+wIwbHTjkT+aAsQsWRj0fdJUYKQrz5SKUchRZA=;
	b=PRjTiFyCbcW/Q423WcxX7NWGR8SK8lCUoYX9uD0lQrpXTAlNEoWjTEFdyfiTaDPtRz
	bvTq3eVYlEftfQ9GjvqdwlYd3R6KKGbPMnOMlfb9pG7S2lJsYvc44d347+DnvqaqaV8q
	zSxAxOlCFVZWtO1wAAr2ZIGWjhF1HZcdWrcPeYHZlFcGIrtrxT4fDuAX7mj2WAgStR+z
	80fbBd7aWmpxnsFOE8PtLcUnsG+E3UiYFayWjCSOC+fPfUTutJKyQVfZeXNhtq0gquhn
	r5umjVG8mLiv0gGP8LxJo65JPOBTmXQTIgB9P/J7OV3sKfRxCm9JJroVJeOZMvym3SMX
	qf3g==
X-Gm-Message-State: AIVw113xRPBC4qnsM5aLVHtld4rqjMP1MZO4fVeOioMMWWOWlta5FDMN
	QNnbU/jzSQa1Ktuu2xJMug==
X-Received: by 10.200.47.93 with SMTP id k29mr9370615qta.18.1501220222591;
	Thu, 27 Jul 2017 22:37:02 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:40 -0300
Message-Id: <20170728053610.15770-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 17/47] MAINTAINERS: add missing Guest Agent
 entries
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:07 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 653c2a1db1..8cb94af6c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1448,6 +1448,10 @@ QEMU Guest Agent
 M: Michael Roth <mdroth@linux.vnet.ibm.com>
 S: Maintained
 F: qga/
+F: qemu-ga.texi
+F: scripts/qemu-guest-agent/
+F: tests/test-qga.c
+F: docs/interop/qemu-ga-ref.texi
 T: git git://github.com/mdroth/qemu.git qga
 
 QOM
-- 
2.13.3


