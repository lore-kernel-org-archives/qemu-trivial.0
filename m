Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9cLN-0008OP-MS
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 17:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32935)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9cLL-0008Ly-8y
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9cLJ-0006Ua-J1
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:18 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38726
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9cLJ-0006Sa-9i
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583360296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mevovTh2z//uQB1rbtMSkrPY9g+6HbLB05a8lK8425E=;
 b=Dh6qKXuup20nW+CM5+Jn5gFNmnVJLYTtX2dP1mUKzko6uPy5Hgn7Oh7kTx9K54mnFMjov4
 Lazz4jikLpSxVmj1l307YxpZ2+9pPMucSzNJnttICWlQgAh9mtVhpwpeqk/HnQQmpXW+ak
 feIt1rdAmzOZLJ+v90RkO3RDDMeDrh0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-gKKxbn_SMXaeY2DbkI2zXw-1; Wed, 04 Mar 2020 17:18:10 -0500
X-MC-Unique: gKKxbn_SMXaeY2DbkI2zXw-1
Received: by mail-wr1-f69.google.com with SMTP id d7so1459565wrr.0
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 14:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8itZXg/N7J74J4OimKI2kWdVe8JS+hsrlg+d+Edd6OU=;
 b=VUJvXRIwrL82b+AR8aMg+x5mflpqw6WoJplAczjkH+jop4EYGsndXFkighLtzFO+YP
 xyFU49idp0MmNvHJ7lAeF+kouYuONLhYWEwoXfDTTvqpbV7vQa9tvGfE1I9Pot2gmO2e
 dJoq2a05pygCuJQmD5gNHyj822laTlhWOy71fMoG6V+tJ4l190bqltAuCYC6EFnJJnAh
 cBtAcjNUJxNSsxXIIFqFxNVypYLs1Fb/CFSu1Vr6/hgaHuZOW+SzN2FnY4E9D3w/DlNc
 LsP4kYt+Zk0M/tGW4/khg5mzbjLR3F2BXj37wQ15U6hTTGhY686GzE2HGYCN4RUjvC7C
 KzJg==
X-Gm-Message-State: ANhLgQ3qPVYxNOOh/LuQNSwOgQNdosoNz5zZXGCYKKD2d9eqNh8Ft6TE
 JtRZ1YbhXQTJ829aykaKt288XD0aO2bDMlRYGofoCem+83yZ6PXmbb/LdPe+isbw9t1LR3hizKL
 w0nzR7SqUgdjHC4TENQ==
X-Received: by 2002:a1c:750e:: with SMTP id o14mr5387710wmc.156.1583360289677; 
 Wed, 04 Mar 2020 14:18:09 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtP5/X7qMtItTdqvRAmfbBql51yio/qOOkkyd+VUuklGjXJhnZrxG3K/ROiIpzyuILKkg/otQ==
X-Received: by 2002:a1c:750e:: with SMTP id o14mr5387697wmc.156.1583360289469; 
 Wed, 04 Mar 2020 14:18:09 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id z12sm4506428wrl.48.2020.03.04.14.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 14:18:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/6] hw,ui: Reduce QEMU .rodata/.bss footprint
Date: Wed,  4 Mar 2020 23:18:01 +0100
Message-Id: <20200304221807.25212-1-philmd@redhat.com>
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
X-List-Received-Date: Wed, 04 Mar 2020 22:18:20 -0000

This series reduce the footprint of the QEMU binary:
.bss: 106KiB (moved to .heap)
.rodata: 4.34MiB
(sizes on x86_64 building with -Os)

The elf-dissector tool [1] [2] helped to notice the big array.

[1] https://phabricator.kde.org/source/elf-dissector/
[2] https://www.volkerkrause.eu/2019/06/22/elf-dissector-aarch64-support.ht=
ml

Philippe Mathieu-Daud=C3=A9 (6):
  hw/audio/fmopl: Fix a typo twice
  hw/audio/fmopl: Move ENV_CURVE to .heap to save 32KiB of .bss
  hw/usb/quirks: Use smaller types to reduce .rodata by 10KiB
  hw/audio/intel-hda: Use memory region alias to reduce .rodata by
    4.34MB
  ui/curses: Make control_characters[] array const
  ui/curses: Move arrays to .heap to save 74KiB of .bss

 hw/usb/quirks.h      | 10 +++++-----
 hw/audio/fmopl.c     |  8 +++++---
 hw/audio/intel-hda.c | 24 ++++++++++--------------
 ui/curses.c          | 10 +++++++---
 4 files changed, 27 insertions(+), 25 deletions(-)

--=20
2.21.1


