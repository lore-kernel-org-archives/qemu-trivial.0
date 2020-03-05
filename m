Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9psg-00066b-K3
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 07:45:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41570)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9psd-0005vd-7u
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9psb-0001Hw-VS
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:35 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28264
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9psb-0001HZ-Pl
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nhwgrxnqpunrz8zBbMeODrFA6z+v6v0KC0yLbmsGqoc=;
 b=eAiKzlYlJOnUY5nVl7U3Z9SJRBqZRZyHZvlEXegFiLAaHTqVCblM2U12USG2tYEWcVG7pI
 bhirRKwWvtoCsW+SxF6Wbyfp5Njb09sJ9nyclQY/LjNf2p2ecv9p7GvypPp7j6b473/TCs
 APuuFJRnaFGaBfRDP9A5Fs0rVP7PXLg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-unoQv4OGM0WzUHzjvwQLOw-1; Thu, 05 Mar 2020 07:45:30 -0500
X-MC-Unique: unoQv4OGM0WzUHzjvwQLOw-1
Received: by mail-wr1-f70.google.com with SMTP id s10so493863wrr.21
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 04:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VZtzsSVzb5DX3o4pkmW7ktCi9rq5BRkqUN3Jv0Apib8=;
 b=dZQssoHqAKFatu/mfGKjSaBhUBnT1n6nD2z8yE1lSRhAv5j3v3T1La4UpaZHd+MQwM
 TgsqrAZ0/G6KJ+sKs3r3r2wQCn8cPcGmqaU/o3A7FHGQXWUE90sSZOcvynDuPEIzX6rt
 ZWWW29gerOdAQkQjtv1x4IIJPcX6Yfv3kI8KBa8dDn0kaNkdBosbl2hJ+JVIWEtD5H8r
 nABR3F5MCaMsUfsgYw4Vcd7s0y13Rf8ZP/TyDlx5OtEda09L75Z2wz8GirEV44MXoIGL
 ZgbaiZDD+7hXk+mmu2QiCOs4Xoo78wn4tK+nOTniHw965cKJ4SDlzeBX2jFutt8x8M5P
 y4JA==
X-Gm-Message-State: ANhLgQ0s103zwoFi+oZv84f2I0yykeAHEte+B826oKGqSEknQTTlGPws
 bQ7gCNxTxxAhY6J0wONq2r5CaSIYblhUbNjq6ipsHBVkbi1ltIHMeWe7vllVh+TcplagnspSn5O
 XEu6DRGwzGWzE53gdBw==
X-Received: by 2002:a5d:4f85:: with SMTP id d5mr9009096wru.130.1583412328841; 
 Thu, 05 Mar 2020 04:45:28 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsj+5NKjCRIPqq/H/Brzjh0otlE9Qe8SQpdfKd2O3ZmDaikh5SOyIb4K+v2hWE41E3CKuSJxw==
X-Received: by 2002:a5d:4f85:: with SMTP id d5mr9009071wru.130.1583412328568; 
 Thu, 05 Mar 2020 04:45:28 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id u17sm8282608wmj.47.2020.03.05.04.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 04:45:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 0/9] hw, ui,
 virtfs-proxy-helper: Reduce QEMU .data/.rodata/.bss footprint
Date: Thu,  5 Mar 2020 13:45:16 +0100
Message-Id: <20200305124525.14555-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 12:45:36 -0000

Since v1:
- merged 2 series
- reworked hw/usb/quirks
- added R-b/A-b tags

This series reduce the footprint of the QEMU binary:
.bss: 106KiB (moved to .heap)
.data: 1MiB
.rodata: 4.34MiB
(sizes on x86_64 building with -Os)

The elf-dissector tool [1] [2] helped to notice the big array.

[1] https://phabricator.kde.org/source/elf-dissector/
[2] https://www.volkerkrause.eu/2019/06/22/elf-dissector-aarch64-support.ht=
ml
[heap equivalent tool working with QEMU: https://github.com/KDE/heaptrack]

Supersedes: <20200304221807.25212-1-philmd@redhat.com>
Supersedes: <20200305010446.17029-1-philmd@redhat.com>

Philippe Mathieu-Daud=C3=A9 (9):
  hw/audio/fmopl: Fix a typo twice
  hw/audio/fmopl: Move ENV_CURVE to .heap to save 32KiB of .bss
  hw/audio/intel-hda: Use memory region alias to reduce .rodata by
    4.34MB
  hw/net/e1000: Add readops/writeops typedefs
  hw/net/e1000: Move macreg[] arrays to .rodata to save 1MiB of .data
  hw/usb/quirks: Use smaller types to reduce .rodata by 10KiB
  ui/curses: Make control_characters[] array const
  ui/curses: Move arrays to .heap to save 74KiB of .bss
  virtfs-proxy-helper: Make the helper_opts[] array const

 hw/usb/quirks.h             | 22 +++++++++++++---------
 fsdev/virtfs-proxy-helper.c |  2 +-
 hw/audio/fmopl.c            |  8 +++++---
 hw/audio/intel-hda.c        | 24 ++++++++++--------------
 hw/net/e1000.c              |  6 ++++--
 hw/net/e1000e_core.c        |  6 ++++--
 hw/usb/quirks.c             |  4 ++--
 ui/curses.c                 | 10 +++++++---
 8 files changed, 46 insertions(+), 36 deletions(-)

--=20
2.21.1


