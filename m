Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSw-0002ry-KS
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSu-0002py-O1
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSu-0000Ca-1B
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:36 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38011)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSq-00007l-JV; Fri, 06 Oct 2017 19:55:32 -0400
Received: by mail-qk0-x242.google.com with SMTP id 17so5921155qkq.5;
	Fri, 06 Oct 2017 16:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=j9cp+Fg3IAnoTZ4V34vSGc1owpDbeDPUDxiTyMLzb74=;
	b=fK3HQ90Oph8ujz1P9SxFObS07MK9fQoQFLtm3AkI7qVDVO3GAp06YkSTQRfdcZVHbB
	kKtteF2U1K2ZiW1c7uqvlwoTJDSgqQYgXqQirlrDgrbS5UQjg9Bpgu5QG0H1txLjSe3w
	7rjYN9/m8GcoVtv3sBakzgyR8rwUOz4z7Fzt+iLZA6uVuy/BKFhdNLJxDyh46MwaoocR
	cxglq9jgOIDdoOgB0HGX2GywYFV0LzIZaZL2IRYGdnYkVnm8JLYtyj7Ca7e7MyNSRSfO
	VMbCsrzgjCvSNG4dP4qatSjfHJ0qOnQZJMYxFU+wjjL/HfRPc7vHQJTfYRCDLCjHNTte
	+76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=j9cp+Fg3IAnoTZ4V34vSGc1owpDbeDPUDxiTyMLzb74=;
	b=i6Ff+97kX73cRHDFRijkVgpkpUbgXnKujR8LC38GrgUVLy8PujunUYrpfMC6lkQBMx
	9I9DWbPbTUmkUfljOd1I/gZqhyzSN3Ea5Ys5ilklFQSQpgoeRw2MMaTUk0PPamsTCUY7
	lybiF1yX3SSzkSpzSRijNW0bi56S2IQPvgcZcDaXtvn/mff6SmF92ebryi9pzCzd96yp
	vvjNbP0dfh+t11YShw6/crHH12EUWO45bKLskgoFwowE7kFy+LcP6r1qqh1aDbaNLEF7
	5y3Gbay514rg6FBWguOqRanyLjmHkidyn6zSUxmx+kXYGWZVBUEauvu93El21KZPvQC7
	8e6A==
X-Gm-Message-State: AMCzsaXKwHzrqo0OQr8bpDacLzv0zSBbLnqqgw1Sof2X6XyV73LVcIrS
	esBbvaOclhNyJYm78/oF/OA=
X-Google-Smtp-Source: AOwi7QDnnDJ8ULjraKNRJpW5ClTIuKIZ+01BvSidJJHBuwkh1urqUtSAUZN281j9KcoXepq49q+eaw==
X-Received: by 10.55.195.11 with SMTP id a11mr670429qkj.222.1507334132058;
	Fri, 06 Oct 2017 16:55:32 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:20 -0300
Message-Id: <20171006235023.11952-86-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 85/88] hw/usb: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:37 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-ehci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 0134232627..34785923f3 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -545,7 +545,7 @@ static EHCIQueue *ehci_alloc_queue(EHCIState *ehci, uint32_t addr, int async)
     EHCIQueueHead *head = async ? &ehci->aqueues : &ehci->pqueues;
     EHCIQueue *q;
 
-    q = g_malloc0(sizeof(*q));
+    q = g_new0(EHCIQueue, 1);
     q->ehci = ehci;
     q->qhaddr = addr;
     q->async = async;
-- 
2.14.2


