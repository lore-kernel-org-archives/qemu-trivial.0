Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQL-00011p-54
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43104)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQI-00010K-46
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQH-0005mY-0i
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:10 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59728
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQG-0005mC-To
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j/EdDI2CtMVN9fdl6+h7xbjhrRwwWIt4TPFM6oFFcSc=;
 b=PzuSllLRkQQBsWwHnwglCe0ykYChZ3g9tbYn0LvTT71QyAGJiq6eifqmPD6YmknJ8Qp0FN
 vXtf9cp19E2seEb2xiNVVmQxC4ncIpfpRyASlnUylyc+zek20nBPzEFkIpmNK6Lt6EGBC5
 tBaRL+qRj66YOFbnaweBSh1EAcDqyUs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-Sd8ounGlOGOHshva1cxoZA-1; Tue, 18 Feb 2020 04:44:06 -0500
Received: by mail-wm1-f70.google.com with SMTP id p2so785846wmi.8
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d11KEHy00cHcmoOZmfkiJiWUsKxIDwvg0E/JJImsCd0=;
 b=f4GCRMo4Q5hCmOSRKvX3CdsVezrmGwW+77PkUrWcqSVyHbQdqhKkWLPiwL8TFxtZW3
 YSGOqppOTBBEyyFeqnNAoMkS4Eqe2sCHUAkOQNB2gccLs/ZWKcQOtu5MVzorwZYDEEVs
 QlBQs7yq7W6E4wgShchgMC83Lqmej0iYnUXm4ASD1DWamFBvxCHGs9G7CaR6SCxi/w/t
 lxEdVRu3Hu434EmSOglnLCyq7MAmQ8CncdRuFmABp/x5bde/JeYuFs6rXISYW7bb262I
 8VgMXmi04FUoL9FPe5Jk3qNrjFhMWQbMQj9+hPt3br/OjKG73kgr9BGw+oIo/Utkx+Dp
 SE1g==
X-Gm-Message-State: APjAAAUz6X4TybAJrI/+Jr5RJnsmRdjkDvSSlEutAu0JzydJjYOXsYVo
 caw4RkMfEpZztH76n5veeHYy1VTU0Jq6sBcfN1QIxTnIi/LgZJ9pMzMNs/J+4bqvVmK69TVlWaD
 sqEq9A18fEDm1/riqOw==
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr2144523wmg.151.1582019045869; 
 Tue, 18 Feb 2020 01:44:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLgsh5LNMyikPjX/FLArT4rWgBdq3dbcvVm+2uT8w2tbshpyIEEFwkWdPllurI1KHIdPBk0A==
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr2144493wmg.151.1582019045623; 
 Tue, 18 Feb 2020 01:44:05 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH RESEND 00/13] trivial: Detect and remove superfluous
 semicolons in C code
Date: Tue, 18 Feb 2020 10:43:49 +0100
Message-Id: <20200218094402.26625-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-MC-Unique: Sd8ounGlOGOHshva1cxoZA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:11 -0000

Luc noticed a superfluous trailing semicolon:
https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg04593.html

Prevent that by modifying checkpatch.pl and clean the codebase.

Philippe Mathieu-Daud=C3=A9 (13):
  scripts/checkpatch.pl: Detect superfluous semicolon in C code
  audio/alsaaudio: Remove superfluous semicolons
  block: Remove superfluous semicolons
  block/io_uring: Remove superfluous semicolon
  hw/arm/xlnx-versal: Remove superfluous semicolon
  hw/m68k/next-cube: Remove superfluous semicolon
  hw/scsi/esp: Remove superfluous semicolon
  hw/vfio/display: Remove superfluous semicolon
  migration/multifd: Remove superfluous semicolon
  ui/input-barrier: Remove superfluous semicolon
  target/i386/whpx: Remove superfluous semicolon
  tests/qtest/libqos/qgraph: Remove superfluous semicolons
  contrib/rdmacm-mux: Remove superfluous semicolon

 audio/alsaaudio.c           | 4 ++--
 block.c                     | 4 ++--
 block/io_uring.c            | 2 +-
 contrib/rdmacm-mux/main.c   | 2 +-
 hw/arm/xlnx-versal-virt.c   | 2 +-
 hw/m68k/next-cube.c         | 2 +-
 hw/scsi/esp.c               | 2 +-
 hw/vfio/display.c           | 2 +-
 migration/multifd.c         | 2 +-
 target/i386/whpx-all.c      | 2 +-
 tests/qtest/libqos/qgraph.c | 4 ++--
 ui/input-barrier.c          | 2 +-
 scripts/checkpatch.pl       | 5 +++++
 13 files changed, 20 insertions(+), 15 deletions(-)

--=20
2.21.1


