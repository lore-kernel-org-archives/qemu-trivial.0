Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fb6eL-0004Ju-Mm
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2018 11:58:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eJ-0004IQ-4U
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eG-000513-34
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:27 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:39251)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eF-00050n-TQ; Thu, 05 Jul 2018 11:58:24 -0400
Received: by mail-qk0-x244.google.com with SMTP id b5-v6so2735870qkg.6;
	Thu, 05 Jul 2018 08:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2x5s73zFKEZW9Zy7do8M4M3wOlHTyf1YSYxIeCfImU0=;
	b=CWT0eWKZy8dQyylxKSt1i9tMiqIB1+9HjxTseWz3jsgoG+LnYnNW3fe9sI1fUiryQx
	FrYO42EJhVR+lZCtQ1sBerEMEPX+hkrwUah7z4gf97WoI3R30Ybai/alDCA+zOUy/L0e
	jN9Ic5jGrKwfN72N+eN/B8h7cJtuAbsltSgLIMhHsmfN9vTJhArOxAdvOFuzTahfPT2a
	M03EshDcd5xgrdnaJYf5sFqY53vqcdgTHYzxJ6buJSpF5ugYMx1AbiC9S2llcgEQSxrO
	z1yt7GBfMO0Oy8aVB7TPi4tF56BL3nSneRYn5gYdpTm+583rJcvL83EaJ+nz9pvzAPjc
	BUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=2x5s73zFKEZW9Zy7do8M4M3wOlHTyf1YSYxIeCfImU0=;
	b=C+uOlub3twrYnzX8LSxLpW2/wHAneRqtScmUm6lILJdk0TLVxQk03yAamhaXNN4HIV
	jINsZ6DGd+DJ3WRmdv3k/4ZBHNo/t2mY1BuJMa0wWSbBvLBTr4ORXgQey+FwHAqy3fh5
	KJ1sYHncjyuThi3eFZD7syl6BBwtO2NtFwX81DnF28DQWmlmKpDMgzTAOfkhu7o+tzQb
	3tspWYWiQAYwrFqVFEBaBAEGO3nUWJZqjlZgoCM5HUgXn/7hv2VNhcQpveHcJPHsfY7F
	NCMsS0Odbk+Kq7lzSPU8bTJndu15BrZvu53Gy2YAx9NZZD/HXZ5ubhL7et9Xc1yaswW8
	6SYQ==
X-Gm-Message-State: APt69E1ly3qZSLZpemLKSw0RxoU7EyMQ11ru4DMfUeFpBdfQkzeTf2i0
	JI5Zvi6bxB7RyqQjZjkfgOkPKTRJ
X-Google-Smtp-Source: AAOMgpcKLht60aSqdv6JkAx9pCOsss0jwqN8bVn3c1YSRr0jBiV25AfZn5ePNSSxKv6l1W0hzRC6gQ==
X-Received: by 2002:a37:6812:: with SMTP id
	d18-v6mr5442890qkc.215.1530806303094; 
	Thu, 05 Jul 2018 08:58:23 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	k66-v6sm4049403qkc.86.2018.07.05.08.58.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 08:58:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Date: Thu,  5 Jul 2018 12:58:04 -0300
Message-Id: <20180705155811.20366-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v2 0/7] Coccinelle cleanups
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
X-List-Received-Date: Thu, 05 Jul 2018 15:58:28 -0000

Hi Michael,

Nothing exciting here, patches created mechanically
(common after soft freeze).

All patches are reviewed, can you queue them in your Trivial tree?

Thanks,

Phil.

Since v1:
- rebased
- dropped incorrect "crypto: Remove useless casts" (Daniel)
- use PCI_DEVICE() to access XenPCIPassthroughState->dev (Peter)
- added R-b, A-b

Philippe Mathieu-Daudé (7):
  qobject: Catch another straggler for use of qdict_put_str()
  error: Remove NULL checks on error_propagate() calls
  xen: Use the PCI_DEVICE macro
  tests/bios-tables-test: Remove an useless cast
  ui/vnc: Remove useless parenthesis around DIV_ROUND_UP macro
  hw/pci-host: Remove useless parenthesis around DIV_ROUND_UP macro
  hw/intc/gicv3: Remove useless parenthesis around DIV_ROUND_UP macro

 include/hw/intc/arm_gicv3_common.h | 2 +-
 hw/pci-host/piix.c                 | 2 +-
 hw/pci-host/q35.c                  | 2 +-
 hw/s390x/virtio-ccw.c              | 4 +---
 hw/xen/xen_pt_config_init.c        | 8 ++++----
 qobject/block-qdict.c              | 2 +-
 tests/bios-tables-test.c           | 2 +-
 ui/vnc-enc-tight.c                 | 2 +-
 ui/vnc.c                           | 3 ++-
 9 files changed, 13 insertions(+), 14 deletions(-)

-- 
2.18.0


