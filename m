Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoI8-0004KG-8j
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoI2-00048S-5a
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoI0-0007KQ-Jb
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:22 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:40975)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoI0-0007Iw-C5; Mon, 05 Mar 2018 06:28:20 -0500
Received: by mail-wr0-x244.google.com with SMTP id f14so16847588wre.8;
	Mon, 05 Mar 2018 03:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YcuE8ic3EBzyS6+02HOEOP6CGIkcnCDTYKPTphkP5Ms=;
	b=aewdRfGAX+VzFsXATzERGt4OcmyznTS74W8j7muzOtszCN0Re8+0it+bz1t3fNkcAG
	o/ceUjZYhmfALnip7co8Tmq5iGi6tXFk8lx7lRsw5v80YhKF+dtwNL2WWtqleOgXmx8i
	uea3aQyKAQAsiiwOwAdGXF8Ziynop1wzHOEY+x7ygI0uewsQCFoKEleFGnWTt7f9dj5d
	a4y2sDrBj8RwbuT/ywz6Ac85DCQkenC7Y+3kaANjW3TvnmQd5Dde3D424nMQOshQ0RAS
	M0+wi4Te25UdLrmliiw2MKzfOU3tLqFYhw8D59sVlhp1e+8fX13TsuH1ixoW7Nvh+aFv
	LtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=YcuE8ic3EBzyS6+02HOEOP6CGIkcnCDTYKPTphkP5Ms=;
	b=QHPjkidSU7zAJaylWO1Bweo8ryxjlZJWXPpKDyVy9Kq0wElc+T2Jf0PdxLRqFX6u/Y
	j/kzmiRD0KoBLUuGXkGvAeoA/Rlp/Uv0Ju0MfiTFBN/OKiiRtqEiSyxRMSdvJU5PqVQ8
	ORgIo/edG6AkS9A3djyBJIA7KftQv2acj4mHTWqOIx60ACOVZHjyFKCcsFRLPq9JXj2H
	2GJIkxKgPvX2AS50Z9+DVs+VUt7RlEataNdpVa7+aSt/NkZ/WlgyC0BhLtPji0mVj54X
	RsA/06j1JJwJUH63VA/TbBKIa8fM8xigHy5BvN0RoC9PCZvB7fdJAPU2VWxTeS6hDj0L
	+X5g==
X-Gm-Message-State: APf1xPBsFOnoMCENhYRhUQFSGxzi2sx490fxKEY9BS+O9vO4BXQHf6cI
	C1awk8A6iwj5EPNwrViHwRza/TE4AOQ=
X-Google-Smtp-Source: AG47ELtISRPQr4Hh16t9YYbOIU0Q1tOeP1J5f/7AiFmXgPpmuFKyMdwDNrjtLLV3EafumsCGue76aw==
X-Received: by 10.223.134.193 with SMTP id 1mr11416379wry.245.1520249299129;
	Mon, 05 Mar 2018 03:28:19 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:18 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	xen-devel@lists.xenproject.org (open list:X86),
	qemu-block@nongnu.org (open list:Block layer core)
Date: Mon,  5 Mar 2018 08:27:32 -0300
Message-Id: <20180305112732.26471-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: [Qemu-trivial] [PATCH v2 30/30] xen: use the BYTE-based definitions
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:23 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alan Robinson <Alan.Robinson@ts.fujitsu.com>
---
 hw/block/xen_disk.c        |  4 ++--
 hw/xenpv/xen_domainbuild.c | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/block/xen_disk.c b/hw/block/xen_disk.c
index f74fcd42d1..557005b5e5 100644
--- a/hw/block/xen_disk.c
+++ b/hw/block/xen_disk.c
@@ -1153,9 +1153,9 @@ static int blk_connect(struct XenDevice *xendev)
     }
 
     xen_pv_printf(xendev, 1, "type \"%s\", fileproto \"%s\", filename \"%s\","
-                  " size %" PRId64 " (%" PRId64 " MB)\n",
+                  " size %" PRId64 " (%llu MB)\n",
                   blkdev->type, blkdev->fileproto, blkdev->filename,
-                  blkdev->file_size, blkdev->file_size >> 20);
+                  blkdev->file_size, blkdev->file_size / M_BYTE);
 
     /* Fill in number of sector size and number of sectors */
     xenstore_write_be_int(&blkdev->xendev, "sector-size", blkdev->file_blk);
diff --git a/hw/xenpv/xen_domainbuild.c b/hw/xenpv/xen_domainbuild.c
index 027f76fad1..7c8bde20cd 100644
--- a/hw/xenpv/xen_domainbuild.c
+++ b/hw/xenpv/xen_domainbuild.c
@@ -75,9 +75,9 @@ int xenstore_domain_init1(const char *kernel, const char *ramdisk,
     xenstore_write_str(dom, "vm",     vm);
 
     /* memory */
-    xenstore_write_int(dom, "memory/target", ram_size >> 10);  // kB
-    xenstore_write_int(vm, "memory",         ram_size >> 20);  // MB
-    xenstore_write_int(vm, "maxmem",         ram_size >> 20);  // MB
+    xenstore_write_int(dom, "memory/target", ram_size / K_BYTE);
+    xenstore_write_int(vm, "memory",         ram_size / M_BYTE);
+    xenstore_write_int(vm, "maxmem",         ram_size / M_BYTE);
 
     /* cpus */
     for (i = 0; i < smp_cpus; i++) {
@@ -260,7 +260,7 @@ int xen_domain_build_pv(const char *kernel, const char *ramdisk,
     }
 #endif
 
-    rc = xc_domain_setmaxmem(xen_xc, xen_domid, ram_size >> 10);
+    rc = xc_domain_setmaxmem(xen_xc, xen_domid, ram_size / K_BYTE);
     if (rc < 0) {
         fprintf(stderr, "xen: xc_domain_setmaxmem() failed\n");
         goto err;
@@ -269,7 +269,7 @@ int xen_domain_build_pv(const char *kernel, const char *ramdisk,
     xenstore_port = xc_evtchn_alloc_unbound(xen_xc, xen_domid, 0);
     console_port = xc_evtchn_alloc_unbound(xen_xc, xen_domid, 0);
 
-    rc = xc_linux_build(xen_xc, xen_domid, ram_size >> 20,
+    rc = xc_linux_build(xen_xc, xen_domid, ram_size / M_BYTE,
                         kernel, ramdisk, cmdline,
                         0, flags,
                         xenstore_port, &xenstore_mfn,
-- 
2.16.2


