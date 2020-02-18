Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zF5-0006A9-Kj
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41655)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zF0-00067e-E9
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:32:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zEx-00019g-PF
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:32:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45562
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zEx-000184-LW
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j/EdDI2CtMVN9fdl6+h7xbjhrRwwWIt4TPFM6oFFcSc=;
 b=ExSmOcLETm9S7EmHumC7bQ0qsLnWKWRMv0lj/prrstfRTMd1hPSOi6h4U3r1zkLz5Of7us
 azI+1cDgO01dZedGKmh9Zrgb/k77IiIHmz0SJRbJ/ug11e5FUGyGAvssoLs0irMbZk60bM
 nHudp+fmQ3xBroAytHUBnrhMQ7ROJKM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-eBEyvEgeOIG0RYdc_d4V6w-1; Tue, 18 Feb 2020 04:32:21 -0500
Received: by mail-wm1-f70.google.com with SMTP id q125so873087wme.1
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:32:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d11KEHy00cHcmoOZmfkiJiWUsKxIDwvg0E/JJImsCd0=;
 b=jNQm2zuk/a+APLs4oR7hmmjV1QnBT4d8IitJpy3aDYxRNYs1r9kmiqOPKTG2KmVwij
 VX9VR+HdSIH+86++ZqpdlkCvHdDAkeUGyxwwXUUa6FPuRGWQMdl9OQJVTY78jBPiVtza
 QzcKAbQ23lvo2b4qH41tLuG9mRNzo2qaljskt9baBcmoVKakArtnh4caUAzwpkkIXyzw
 rLZTs0GCU6csOkRLHvR2H4KFKt/3C161YjJs4ZHZxYfIqbOJo2SinM3G8euSMZwrXuFB
 iS9WyB5th2txdwtqksycHEGMXZXvKniZMu1G243O9r1Q+xlW5ziwb1YrKlBHWKLPE12I
 xqmg==
X-Gm-Message-State: APjAAAW49JGLrqqGrWSk7FIwyjkHid8p6j47NscQlxCJe/6ARGht1dsi
 hWiHNijgU8G9X5uMvncmwWgqpQnklx4dGFycPHnKF9AAQ+ojAIkPrtO5bbJYTeO53pPJwo7Meus
 ffDJ17jvgjqK4ymGeMg==
X-Received: by 2002:adf:82c7:: with SMTP id 65mr856651wrc.374.1582018340642;
 Tue, 18 Feb 2020 01:32:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqx9id1CWf2xhCK3EiBxDYX01GhrBUWLw9cUnpB3oa1H+kt5xUR4QkVSDP5FsO7wy003N72TxQ==
X-Received: by 2002:adf:82c7:: with SMTP id 65mr856594wrc.374.1582018340337;
 Tue, 18 Feb 2020 01:32:20 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id v8sm5146891wrw.2.2020.02.18.01.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:32:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Luc Michel <luc.michel@greensocs.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-block@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 00/13] trivial: Detect and remove superfluous semicolons in C
 code
Date: Tue, 18 Feb 2020 10:32:04 +0100
Message-Id: <20200218093217.25156-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-MC-Unique: eBEyvEgeOIG0RYdc_d4V6w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
X-List-Received-Date: Tue, 18 Feb 2020 09:32:31 -0000

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


