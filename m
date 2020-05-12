Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYOtz-0003xQ-3H
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2020 03:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jYOtw-0003w7-RI; Tue, 12 May 2020 03:00:28 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jYOtw-0005Y6-5X; Tue, 12 May 2020 03:00:28 -0400
Received: by mail-wm1-x341.google.com with SMTP id n5so7077071wmd.0;
 Tue, 12 May 2020 00:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v6fg/mU4Bk/0q03fr2d5YzMbkGZ67G/czubLvjRut6E=;
 b=GgXgmFz8IY+pa9ocN2/XvYf1Z5J3CRDjyV+8xqeFnikvU5jCbQLf+YGXawi1zXF1wK
 nEp/GbVlzP17pUvUFZkuS9f2GXLimVNCaQnAurujidToXag6PvgDmn4tpcRFsH7reZQC
 MoAWgBH6I6b5/OgmqJ3AEr4tBCEoxIuIHZKm9nLR6k5jqXT5QzsgTNJsm0Y8zTWC17ed
 +8+skZr4g0xTxz1dfSh5eKksAqonVo7b7KGs47GDQFSxdg06PQdaimERZEF9qH0cDLZp
 rciTN8f2otxSJeW3UBVU7QboWmu2WO1IudLXV7wEwGqOsGivDgP9LXihMZbbmnP7e08A
 ViAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=v6fg/mU4Bk/0q03fr2d5YzMbkGZ67G/czubLvjRut6E=;
 b=hJCO80nb33pyatDiPOzZiVCNsZomSlu0myGizr+fcyChXCsB5Tmy9Q6/iZcGIynnsf
 am7JgoimcRBJtkQ/xIeTTypEGPa26SkCGKkqjsBEYqXocuQhXsKroVdam7dY9RObzo4x
 glxRkIJKE0Dqz0sHONRTgYnBBm+UtC7PHnYcP8BXdmSxZHAoTVVrWcuaZJ4m8Qg+6R1O
 vuGZIJPjp+aS/i6bPPIgCqjdw+tFOX0OMs91iDY1T/z+bnBfE6ewR4Eq5Wej2yJZmiS1
 OV40bQ338lVvzc06mNWPwMRfSjCpAI8LqIU5EcMbtYLf+rflIksY/I74pIKnOVGaD+ni
 x43Q==
X-Gm-Message-State: AGi0PuZIz3dvxjKcmxapbwJXAhYsmWNt+o5juDEVmsSBvahidiW2Nu4y
 9th3D0Nfl+pR76yPC7bi35byC6wwHwAhDw==
X-Google-Smtp-Source: APiQypIT2HPCX3fabSDeTGNUfM5dRg5+16ERzkptJxDXeBDyVSY92wAyQPNH6JP5vKrTXy89Xka+RA==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr13129954wme.2.1589266824836; 
 Tue, 12 May 2020 00:00:24 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id i17sm30322243wml.23.2020.05.12.00.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:00:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, Richard Henderson <rth@twiddle.net>,
 John Snow <jsnow@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Corey Minyard <minyard@acm.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <laurent@vivier.eu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paul Durrant <paul@xen.org>, Peter Maydell <peter.maydell@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 0/3] various: Remove unnecessary casts
Date: Tue, 12 May 2020 09:00:17 +0200
Message-Id: <20200512070020.22782-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Tue, 12 May 2020 07:00:29 -0000

Remove unnecessary casts using coccinelle scripts.

The CPU()/OBJECT() patches don't introduce logical change,
The DEVICE() one removes various OBJECT_CHECK() calls.

Since v3:
- Fixed patch #2 description (Markus)
- Add A-b/R-b tags

Since v2:
- Reword description (Markus)
- Add A-b/R-b tags

Philippe Mathieu-Daudé (3):
  target: Remove unnecessary CPU() cast
  various: Remove unnecessary OBJECT() cast
  hw: Remove unnecessary DEVICE() cast

 hw/core/bus.c                       | 2 +-
 hw/display/artist.c                 | 2 +-
 hw/display/cg3.c                    | 2 +-
 hw/display/sm501.c                  | 2 +-
 hw/display/tcx.c                    | 4 ++--
 hw/display/vga-isa.c                | 2 +-
 hw/i2c/imx_i2c.c                    | 2 +-
 hw/i2c/mpc_i2c.c                    | 2 +-
 hw/ide/ahci-allwinner.c             | 2 +-
 hw/ide/piix.c                       | 2 +-
 hw/ipmi/smbus_ipmi.c                | 2 +-
 hw/microblaze/petalogix_ml605_mmu.c | 8 ++++----
 hw/misc/macio/pmu.c                 | 2 +-
 hw/net/ftgmac100.c                  | 3 +--
 hw/net/imx_fec.c                    | 2 +-
 hw/nubus/nubus-device.c             | 2 +-
 hw/pci-host/bonito.c                | 2 +-
 hw/ppc/spapr.c                      | 2 +-
 hw/s390x/sclp.c                     | 2 +-
 hw/sh4/sh_pci.c                     | 2 +-
 hw/xen/xen-legacy-backend.c         | 2 +-
 monitor/misc.c                      | 3 +--
 qom/object.c                        | 4 ++--
 target/ppc/mmu_helper.c             | 2 +-
 24 files changed, 29 insertions(+), 31 deletions(-)

-- 
2.21.3


