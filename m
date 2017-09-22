Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4p-0004n3-2j
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4n-0004l9-5Y
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4m-0003Ho-28
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:13 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36458)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4j-0003FH-MG; Fri, 22 Sep 2017 11:41:09 -0400
Received: by mail-qk0-x242.google.com with SMTP id i14so873637qke.3;
	Fri, 22 Sep 2017 08:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LcB4RfVh2Br0qaTh27b+lYbg7F8pshlpz7nEIaEpcPo=;
	b=rngux9Umz8pji6cJHq4pgXlDrwWdM5pTdONxdp6qR/aN6/jVH1gMhhzhQXOPLPNRWC
	21Od0tgFP2NLs5ju19oemxZzjyBgDPUyL1zhmvAgNzrec/uhRVcEA9i+9tXZ0Bujlpcw
	KUmke+lEcgNCGzTPVcRs0HswaIPyxxR1p5WVdEBaptunYvBnZfYOoXCz2cV3rxmUyEdv
	PZcurGpXvWMw3aj7YOuSHmP29J27XwCjoF2NRTYbmQ2nAS9EKZHocLVwtMAKtBz2qaEq
	KwatAHYms5JQyYoq2xQ4pmKhC1Uj17PmZlk73S3pCgtL58YxL5CAKDnaRgHbRRzPDxlp
	Z3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=LcB4RfVh2Br0qaTh27b+lYbg7F8pshlpz7nEIaEpcPo=;
	b=Au6SDqS6EFybGX9k+osZQhXt2/vhCU9OX/YRpTA4fERdLvTMIpwlt7D3y0vkKGdxx6
	AdRCXEP6cOnwNqN/p25QMi9WNHBhB+vXcDN0VhNl4fzAhqxMNujaOGCw//5bfqRecg0k
	xuhFMfqa14hjoqVnlVJ68G+QlFFKjUORQLbSA39nV866VTQssdzu9QAsC9sm2LAInFlF
	L4fBgqBN7LG1vbve444NgGWt60K8wkYPRQdLGdY65ywMMiT4B2Uf/Bl91/pCC+kxHTSN
	7bxdQWuTszOjC3vZwy7KVvNdoDR8zwQC7eX3ns3nRvMNFLfDlz7pgVAnXINxR+hDOmDJ
	t0zg==
X-Gm-Message-State: AHPjjUhvI/TtqWoOkRbpxlPYGLagAIALGUILi7qJ1bkLpf47CPrlwwOF
	7UaNNPkLN1TBrGXVY3Ez00c=
X-Google-Smtp-Source: AOwi7QARXBYKuGa1b4s2QdEEEmov8JdyvCH1OuR4oWC7FtkvsMfrMUEW9RX1EigZ7HlCwzGyo8ZZtg==
X-Received: by 10.55.212.93 with SMTP id l90mr8352311qki.30.1506094869201;
	Fri, 22 Sep 2017 08:41:09 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.41.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:41:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:51 -0300
Message-Id: <20170922154014.29350-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 11/34] i386/pc: use TYPE_PORT92
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:14 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 05985d4927..f116cede91 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1577,7 +1577,7 @@ void pc_basic_device_init(ISABus *isa_bus, qemu_irq *gsi,
         qdev_prop_set_ptr(dev, "ps2_mouse", i8042);
         qdev_init_nofail(dev);
     }
-    port92 = isa_create_simple(isa_bus, "port92");
+    port92 = isa_create_simple(isa_bus, TYPE_PORT92);
     port92_init(port92, a20_line[1]);
     g_free(a20_line);
 
-- 
2.14.1


