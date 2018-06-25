Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQri-0002dq-OD
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:45:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrg-0002aM-5g
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrf-0008KF-7k
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:04 -0400
Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232]:46904)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrb-0008HK-H1; Mon, 25 Jun 2018 08:44:59 -0400
Received: by mail-qk0-x232.google.com with SMTP id o2-v6so7357118qkc.13;
	Mon, 25 Jun 2018 05:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jEdOJMrTQyDHwdwa2ZYHeouSFiuQ23P+sklzrRWqDtk=;
	b=rpSzEBNBxJj9YMWxUxHaAdnY0ATxTX7Wp76IuYXYOqOhqEAGah1DQSBJ70fFhP7sCG
	euuNCB/+Q/P6XwaD/TTIv1jr1Jd5Hd/Gv6JFuItet+QqdRW70gmo0o7gUr5oSex2zMvx
	gGqPn3AOXcFdV1LcvT8l5mX3WfGFQpi06EUIQkNoCJ89uXti4RwverkEgR+ol2d1Xtqh
	kldeK7RSCGCmJmTpXXzFP2Ae7hIVdruMq8w9VDJpIUWV/X1uHfJedBmmJzYPZHBDfF2r
	f+uZQ8Z+goelDpq0Jygw/9d+i3EEFgsxvSPoqt3HOqfUQ7Id+y94pWD2C0lZk0GSJCcM
	+0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jEdOJMrTQyDHwdwa2ZYHeouSFiuQ23P+sklzrRWqDtk=;
	b=R+fWhO48AEpdwc3+M6VwtXglfyNGivs5gA9cjOV7WKwg/+oAD1qxkJDJdxM8+hkzVi
	a/Op51wC5eO+Lb6HST9M4jEUhWGABp7/nn7kEnndSk72Q+B3uxFd9pilZmYnyoIYtqzE
	frCYToosE+hSDU1n2Tp3Oygr1AecJGchq4x1fMCnmpB49YUEJN3rJ21wiRK9OIKZCide
	pEh/Junz2+bRZyArJKQn8A4KHvdqTTb494IZUQDJRi6Id3+AzHTabUJSPDqCDyuxvGfM
	TB6ogH1+DCLgO9CDB5vWoiYBHGfRbSACr4K4NHe97txruMAO+1PwtovHOGK9CaIiDENR
	jd9g==
X-Gm-Message-State: APt69E0zAOMyaxUTKuIx8JpJSf9wRqeM5knA6yVSxHBQkN1lU/4Q/KH8
	6XSjRWgQP5rDWQjsan6x6Ho=
X-Google-Smtp-Source: AAOMgpcKpA3bGnBlONMHdEJjVvEUPvbvDJefEuWNKp152R10Ua0YejPn7vOg/tOCvtxXb4ErBORQ6A==
X-Received: by 2002:a37:6086:: with SMTP id
	u128-v6mr9983385qkb.8.1529930698967; 
	Mon, 25 Jun 2018 05:44:58 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Date: Mon, 25 Jun 2018 09:42:30 -0300
Message-Id: <20180625124238.25339-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::232
Subject: [Qemu-trivial] [PATCH v5 38/46] hw/virtio: Use the IEC binary
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
X-List-Received-Date: Mon, 25 Jun 2018 12:45:05 -0000

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
2.18.0


