Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zJr-0002ru-1u
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zJo-0002p9-9Z
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:37:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zJn-0002xG-6E
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:37:28 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50290
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zJn-0002wx-2w
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582018646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j/EdDI2CtMVN9fdl6+h7xbjhrRwwWIt4TPFM6oFFcSc=;
 b=Gwjzwr9p3B0OAiBv6dBOBcWd5ZiOG/aDvu4zaUtI8AN75tBkavIG8KTBSK9Pk8S7UvCSA7
 eErAf+NNVjwgxYIugQl8V8hbAQgjEeQudz/tyfDv4f3Sc9uGpkM2eh+no5FsjvGucedN5e
 1Qguvmlul4hKRFZajzCRqgYsyXHX+4Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-S4zw9hy0M7Ki9ISzNg8i4A-1; Tue, 18 Feb 2020 04:37:25 -0500
Received: by mail-wm1-f72.google.com with SMTP id t17so778259wmi.7
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d11KEHy00cHcmoOZmfkiJiWUsKxIDwvg0E/JJImsCd0=;
 b=jOR41uyZonc/A+QFuYxBefu8jUWcXD+WkNOuzYDFKNUFd+wm2OKO3bB+AVjrjMDQKK
 FQB4En85DdIwN3HpRUD5g+3ZV8wHokhkXTF+ypeW2/ILHRHOhWstJoiZ3QOXoeQUB2Tp
 Qoe224+9Ty7rM95N8MTje/KtB2eHKB5gmNMh6dkhR2lN9vLNOGWk9YuoAkVbY6XLtiQ4
 LtHYI220gCje99aodVbsvYvtE9jhcXlzoPugIy6FsBoe8p1tzjhlT3HIjodEjtUV2NRM
 6d9kU3vdYWNgfw+t0J/jVR5psJWZ5ra3ueTdHy4yPob5xLOjk5s/HvS3HpjtT4Esu9oY
 6Tyw==
X-Gm-Message-State: APjAAAXX6HZljNOS2S+3eAGt61WZSuw0rnN913K2Lv5DgmROOnddjaY/
 wPVMO9tAvOdHMydyptrd2iC6i9EZXUYowd9aLTuhJlKbft0DMGPowpLuK7FsKE+RPxHpndc7IjU
 qCcHnJEvqbRvQ69Wkmw==
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr27161703wrp.17.1582018643885; 
 Tue, 18 Feb 2020 01:37:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxDgSVKEeBEyu7w3AwLNqidQhLHTdzxThCyRxta2SxOoivSJV/qeogNP7nq3boKVbXsebxTdw==
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr27161672wrp.17.1582018643684; 
 Tue, 18 Feb 2020 01:37:23 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id 133sm2817232wme.32.2020.02.18.01.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:37:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <huth@tuxfamily.org>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Luc Michel <luc.michel@greensocs.com>, Laurent Vivier <lvivier@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <rth@twiddle.net>, qemu-block@nongnu.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 00/13] trivial: Detect and remove superfluous semicolons in C
 code
Date: Tue, 18 Feb 2020 10:37:07 +0100
Message-Id: <20200218093720.25640-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-MC-Unique: S4zw9hy0M7Ki9ISzNg8i4A-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:37:29 -0000

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


