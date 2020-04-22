Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRFU7-0006JA-Uk
	for mharc-qemu-trivial@gnu.org; Wed, 22 Apr 2020 09:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFU4-0006Gi-Tp
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFU4-0002Mo-Cv
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22306
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFU3-0002IX-To
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XUlKyT73AlkHFlQ8zqyTxGozcuh5OB4qVGei5hmsoHw=;
 b=dJDLUOuGQHBkwoEKoUeJYNj4Y519YH1sZtjPCV5XWHv028I+lvhgbS5PkV61iRvjfHEkAH
 /S/YtQEHTMfPLqg/mZ5tjsxhRNRg0jeP2ezGFK+2OKb7BfyTAXVLPQvaqjoFbG+PHMRRni
 DIw0U3GszasUp4f2T6Vv1IAy9EEfUDU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-rD1lsA4vNYSM7mgTny9WAA-1; Wed, 22 Apr 2020 09:31:56 -0400
X-MC-Unique: rD1lsA4vNYSM7mgTny9WAA-1
Received: by mail-wm1-f72.google.com with SMTP id o26so810011wmh.1
 for <qemu-trivial@nongnu.org>; Wed, 22 Apr 2020 06:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zqmfue2UwrwiHNMR4TPo8N6a37zrjxPCjDQGfvWFQLs=;
 b=AUrCV8i1QNahvyOCIgaut4bMz+FcICDXjT6DzxNvEo95DugdL4/4S0881AYzAlm/gq
 BmIx+XSSFCh235HuZoX8hF0GbhnPZY1g4NQTgwstuiZ9maZORPvRERpYYUVZNtLhaw5T
 3Sto3gXp3yIZ8ghd039mRuMx3Ff24ovDik/a+7EEMsxu5nm8c9BrFJ/X6L2XLjyGvdTX
 q30rDnMarv6woWoD2fhmeNNXPcXwhI84wkktF8Nv2PCvSkV4YjKhpnRnZ8d9K8bbMiq1
 29RQ2duAEFqrsGI76dJVCVrCm9P8nZNnjzdyDqQ6X3kgQA5bUefSn7duJrgwPq9RdPun
 /Fhg==
X-Gm-Message-State: AGi0PuYCFQjPAkD+WHVMXcJDbUFUG9XPCW3g5T2nWDe+W9S4BGz3IusO
 yJynrRANqN6k/vyKYNu1fWOLtH9vcM6oTzBTxZMTzhzHegnKltgiOPnbokuG/YrkcTT0L5neJBm
 3d6SBusooDQvvxv2Sjg==
X-Received: by 2002:a5d:4d8f:: with SMTP id b15mr29991361wru.107.1587562315143; 
 Wed, 22 Apr 2020 06:31:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypLyOb25132StkCLkHX76Eh5KmJs4V9ysBdaVfZ86rojqHY1LjtJXpThxFsh99WOQlyoK7dstQ==
X-Received: by 2002:a5d:4d8f:: with SMTP id b15mr29991348wru.107.1587562314953; 
 Wed, 22 Apr 2020 06:31:54 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id j3sm8165750wrw.28.2020.04.22.06.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:31:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v3 0/9] misc: Trivial static code analyzer fixes
Date: Wed, 22 Apr 2020 15:31:43 +0200
Message-Id: <20200422133152.16770-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 09:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Wed, 22 Apr 2020 13:32:13 -0000

Fix trivial warnings reported by the Clang static code analyzer.

Only patch #2 'blockdev: Remove dead assignment' misses review.

The official Clang static code analyzer documentation is on:
https://clang-analyzer.llvm.org/

On Fedora I simply used it as:

  $ sudo dnf install clang-analyzer
  $ ../configure
  $ scan-build make

Since v2:
- Based on lvivier/trivial-patches-for-5.1
- Removed dup patches from Kuhn Chenqun
Since v1:
- Addressed Markus/Zoltan/Aleksandar review comments

Philippe Mathieu-Daud=C3=A9 (9):
  block: Avoid dead assignment
  blockdev: Remove dead assignment
  hw/i2c/pm_smbus: Remove dead assignment
  hw/input/adb-kbd: Remove dead assignment
  hw/ide/sii3112: Remove dead assignment
  hw/isa/i82378: Remove dead assignment
  hw/gpio/aspeed_gpio: Remove dead assignment
  hw/timer/stm32f2xx_timer: Remove dead assignment
  hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warning

 block.c                    | 2 +-
 blockdev.c                 | 2 +-
 hw/gpio/aspeed_gpio.c      | 2 +-
 hw/i2c/pm_smbus.c          | 1 -
 hw/ide/sii3112.c           | 5 +++--
 hw/input/adb-kbd.c         | 6 +-----
 hw/isa/i82378.c            | 8 ++++----
 hw/timer/pxa2xx_timer.c    | 1 +
 hw/timer/stm32f2xx_timer.c | 1 -
 9 files changed, 12 insertions(+), 16 deletions(-)

--=20
2.21.1


