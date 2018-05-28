Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNAu7-0004hx-Ie
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 01:41:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNAu4-0004g7-E0
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 01:41:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNAu3-0007hO-Gu
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 01:41:08 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:38547)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNAty-0007dq-Ne; Mon, 28 May 2018 01:41:02 -0400
Received: by mail-qk0-x243.google.com with SMTP id c23-v6so8381093qkb.5;
	Sun, 27 May 2018 22:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=owkJCIC3+EDOSoytaIBKyKQ3CUkgwJlIASRByu5l7Fw=;
	b=kMiPAiaZvpNiDjnKQsvMnm5eVl2SYIr5oGpsxuEaDgSw/+SSxv3a7PFNUoyrvUzQAK
	9NW2Ouai+A+++xtxvOOkM1u/bFBw+r+YjP1IjqY9GRor5bN3o6nVoMtd03/+At6uQRJH
	PtV4peTIYMbc4ATesp/TEF/FsOTqafVavcdX9cpYVEoR7dwzLGyINVXGZiRNSr56Rdma
	rVCJ0x8X5zW+lgOJG9jB1zJsD6Bx5Q928ufy21MN0k1IPK7KLKPPHEOHH7SpOiKOkiw5
	QMLlZj17PGVbAnDS7aBDgLyov8fgLINsbFziGS5+CxKcekCwrJLIDTS7OA6G/fI8CfKV
	Sl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=owkJCIC3+EDOSoytaIBKyKQ3CUkgwJlIASRByu5l7Fw=;
	b=dkJTaBlpRbyIv3u/6tu/HiqBqWBdCfF4pYaF766wnAt0PGsXp3d6B+yfkPN7gYunVG
	oV6VMSEYJPz5UXuQYxcV1KOWIbAV0z0uU4iYEha3WBBK3WDaNGuZ6VVr2HbBqrGmMSDY
	b64mwh6FFQia7090F+HEVdEXaMBebbOVzGhDzACnKnzEt9jX3ntj+YqiKT1458UNkYfM
	XHyL7x1Yh1TZaWCMpnXa9i8FHOuyT+nOS4fkAaMJyIzE73p7VrhBuir1TWm5UNTNCIO/
	ko1SY1MSrcBm+7VmpEDdWH4QUVLGlF+jHUXdnTlXrDJzgzil148yEJFu44pes5OOt6j/
	GqIg==
X-Gm-Message-State: ALKqPwd4Vo/k2BxoqzHW4k72gsRulkuQDITdJ1NQR74zc+lQXbRZ00sB
	cbsx++uFKMT9CexxtRWZSo4=
X-Google-Smtp-Source: ADUXVKJUSMONuvU+R6Ox4DMwLA6b7i45J7/+p4HrJUZGSkCpvJ7Ra082w9cDg8uOX0+2b+9dOQNCPQ==
X-Received: by 2002:a37:73c6:: with SMTP id
	o189-v6mr10436458qkc.258.1527486061838; 
	Sun, 27 May 2018 22:41:01 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	b13-v6sm20786829qtp.89.2018.05.27.22.40.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 May 2018 22:41:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org
Date: Mon, 28 May 2018 02:40:55 -0300
Message-Id: <20180528054055.21153-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH] trace: Sort trace-events-subdirs
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
X-List-Received-Date: Mon, 28 May 2018 05:41:09 -0000

Having these entries sorted helps to add new ones.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 Makefile.objs | 82 +++++++++++++++++++++++++--------------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index c6c3554203..2c8cb72407 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -196,66 +196,66 @@ vhost-user-blk-obj-y = contrib/vhost-user-blk/
 
 ######################################################################
 trace-events-subdirs =
-trace-events-subdirs += util
-trace-events-subdirs += crypto
-trace-events-subdirs += io
-trace-events-subdirs += migration
+trace-events-subdirs += accel/kvm
+trace-events-subdirs += accel/tcg
+trace-events-subdirs += audio
 trace-events-subdirs += block
 trace-events-subdirs += chardev
+trace-events-subdirs += crypto
+trace-events-subdirs += hw/9pfs
+trace-events-subdirs += hw/acpi
+trace-events-subdirs += hw/alpha
+trace-events-subdirs += hw/arm
+trace-events-subdirs += hw/audio
 trace-events-subdirs += hw/block
 trace-events-subdirs += hw/block/dataplane
 trace-events-subdirs += hw/char
-trace-events-subdirs += hw/intc
-trace-events-subdirs += hw/net
-trace-events-subdirs += hw/rdma
-trace-events-subdirs += hw/rdma/vmw
-trace-events-subdirs += hw/virtio
-trace-events-subdirs += hw/audio
-trace-events-subdirs += hw/misc
-trace-events-subdirs += hw/misc/macio
-trace-events-subdirs += hw/usb
-trace-events-subdirs += hw/scsi
-trace-events-subdirs += hw/nvram
 trace-events-subdirs += hw/display
-trace-events-subdirs += hw/input
-trace-events-subdirs += hw/timer
 trace-events-subdirs += hw/dma
-trace-events-subdirs += hw/sparc
-trace-events-subdirs += hw/sparc64
-trace-events-subdirs += hw/sd
-trace-events-subdirs += hw/isa
-trace-events-subdirs += hw/mem
+trace-events-subdirs += hw/hppa
 trace-events-subdirs += hw/i386
 trace-events-subdirs += hw/i386/xen
-trace-events-subdirs += hw/9pfs
-trace-events-subdirs += hw/ppc
+trace-events-subdirs += hw/ide
+trace-events-subdirs += hw/input
+trace-events-subdirs += hw/intc
+trace-events-subdirs += hw/isa
+trace-events-subdirs += hw/mem
+trace-events-subdirs += hw/misc
+trace-events-subdirs += hw/misc/macio
+trace-events-subdirs += hw/net
+trace-events-subdirs += hw/nvram
 trace-events-subdirs += hw/pci
 trace-events-subdirs += hw/pci-host
+trace-events-subdirs += hw/ppc
+trace-events-subdirs += hw/rdma
+trace-events-subdirs += hw/rdma/vmw
 trace-events-subdirs += hw/s390x
+trace-events-subdirs += hw/scsi
+trace-events-subdirs += hw/sd
+trace-events-subdirs += hw/sparc
+trace-events-subdirs += hw/sparc64
+trace-events-subdirs += hw/timer
+trace-events-subdirs += hw/tpm
+trace-events-subdirs += hw/usb
 trace-events-subdirs += hw/vfio
-trace-events-subdirs += hw/acpi
-trace-events-subdirs += hw/arm
-trace-events-subdirs += hw/alpha
-trace-events-subdirs += hw/hppa
+trace-events-subdirs += hw/virtio
 trace-events-subdirs += hw/xen
-trace-events-subdirs += hw/ide
-trace-events-subdirs += hw/tpm
-trace-events-subdirs += ui
-trace-events-subdirs += audio
+trace-events-subdirs += io
+trace-events-subdirs += linux-user
+trace-events-subdirs += migration
+trace-events-subdirs += nbd
 trace-events-subdirs += net
+trace-events-subdirs += qapi
+trace-events-subdirs += qom
+trace-events-subdirs += scsi
 trace-events-subdirs += target/arm
 trace-events-subdirs += target/i386
 trace-events-subdirs += target/mips
-trace-events-subdirs += target/sparc
-trace-events-subdirs += target/s390x
 trace-events-subdirs += target/ppc
-trace-events-subdirs += qom
-trace-events-subdirs += linux-user
-trace-events-subdirs += qapi
-trace-events-subdirs += accel/tcg
-trace-events-subdirs += accel/kvm
-trace-events-subdirs += nbd
-trace-events-subdirs += scsi
+trace-events-subdirs += target/s390x
+trace-events-subdirs += target/sparc
+trace-events-subdirs += ui
+trace-events-subdirs += util
 
 trace-events-files = $(SRC_PATH)/trace-events $(trace-events-subdirs:%=$(SRC_PATH)/%/trace-events)
 
-- 
2.17.0


