Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBSr-0006Np-6i
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSl-0006JS-5C
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSk-0003kf-Bn
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:39 -0400
Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236]:45498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSi-0003jh-FA; Sun, 10 Jun 2018 21:17:36 -0400
Received: by mail-qk0-x236.google.com with SMTP id c198-v6so12054618qkg.12;
	Sun, 10 Jun 2018 18:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=p8gRURVSYopLtvj8fip9cwuXx6Ue3T/Ei5s5Ac+dMjg=;
	b=Z/VWOXn8kjdlcG5D7H94+38jctFNWGHZvyKjt7Ix10iyka3FwY83Ow2cOlyzZm2q76
	EeSrpqARIRaK5c/PCXKmuuJOyq6rrPdhhtzsh+CPWelS5D74RKpgZH4uYpIBUG+oc0Ze
	NXqznW+sqlFRkVab6zayJmy2PFZRvX5Ff+AyapO+igG/ngDmeaUPB6NE5SLfkNnE0UUh
	nUnKvl+8Xzq6W547pzpIeM0nE3XWpDEQ/xk9pF1zGyJzjOqAlxU1wurqUbi+dQpoOrsx
	sGm6j40UnGwbzv7w48KgownEfcdyp7CZqdqkFnVJgEGlNXIhu2VQk7AokAEGfNgSwqc9
	toNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=p8gRURVSYopLtvj8fip9cwuXx6Ue3T/Ei5s5Ac+dMjg=;
	b=Wi6fTeAIfW1KXI6ebFA2RdEcuc0GgHxYT3E3yPRPtjCRkiECwqP46X9xSapCLdAPfF
	tAvhaB6ZLhT8fCi/mrd/87utx77mvFmGsvivv11bamd7VF7SAmv3+diRq4p+PnX84UZV
	+CsSsof3o5xfPLaDMjKE+gOt0oLTXFU/r0/Ctoz0a+31jln8wHUeAZXyf0u6pMhWg4I0
	qixSDlclEBjKb/74zczpIIUfYcb0e8CW2/q8IXhop2VXrps0320Fq//+msTQUF06XUK5
	h9aQhL30+EHn9wAH5pOrG9BThSbMzT51Qmb1e8mnMIaJVvocLthJ7FFhCd1I5sY69WuW
	nOmw==
X-Gm-Message-State: APt69E10JcV+9Ws+vzH1zudRVm0zhYaxGwXmF9clHjFu/i7LGVPnMU8R
	fNV5R9QVU4Z7/+uTlHee1XNag5lvHbc=
X-Google-Smtp-Source: ADUXVKLSI7LMn5zcPbE0HlTa9dOIwTZgHB0mxf9wAL0fEIBXCPQ+XzLK4lnWcEl9KmQgNOixrvW8hw==
X-Received: by 2002:a37:9303:: with SMTP id
	v3-v6mr9724268qkd.318.1528679856096; 
	Sun, 10 Jun 2018 18:17:36 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.17.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:17:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Date: Sun, 10 Jun 2018 22:14:59 -0300
Message-Id: <20180611011501.10235-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::236
Subject: [Qemu-trivial] [PATCH v4 38/40] hw/virtio: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 01:17:40 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/virtio/virtio-net.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 02484dc94c..4d7f3c82ca 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -14,6 +14,7 @@
 #ifndef QEMU_VIRTIO_NET_H
 #define QEMU_VIRTIO_NET_H
 
+#include "qemu/units.h"
 #include "standard-headers/linux/virtio_net.h"
 #include "hw/virtio/virtio.h"
 
@@ -44,7 +45,7 @@ typedef struct virtio_net_conf
 } virtio_net_conf;
 
 /* Maximum packet size we can receive from tap device: header + 64k */
-#define VIRTIO_NET_MAX_BUFSIZE (sizeof(struct virtio_net_hdr) + (64 << 10))
+#define VIRTIO_NET_MAX_BUFSIZE (sizeof(struct virtio_net_hdr) + (64 * KiB))
 
 typedef struct VirtIONetQueue {
     VirtQueue *rx_vq;
-- 
2.17.1


