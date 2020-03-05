Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9ehE-00061D-L6
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 19:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9ehC-0005z1-H3
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 19:49:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ehB-0002uK-GV
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 19:49:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47986
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ehB-0002st-A5
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 19:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583369340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SWKNQmVdwUEuUvOigyGAZ1SnibrdAq4SlTjBU4pTvo0=;
 b=AQm0d9rCF9zYHv2FC/alVuWeXwvs+uJn9HFU0gz/d1ag6hQgBZR1rJ8owxm9LeGb+W5Lpe
 EGCeB4FYTVs35T4me9yFd3epgnJkKGQ9d9AbLDR3IV/SKCXEZUHmt9eoIAIWzJ9HCZ1gU1
 0k3SF7JSQcC352oJRLcwdu2hFEeKMfw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-P62l9ojWNxuAQwq8g03YFg-1; Wed, 04 Mar 2020 19:48:58 -0500
X-MC-Unique: P62l9ojWNxuAQwq8g03YFg-1
Received: by mail-wr1-f71.google.com with SMTP id w18so1623660wro.2
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 16:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZC0MGU7nsZI/4XmjuBi8tbNohuM2/2iE0Kp45pIfhLQ=;
 b=rH4UbtndohMMg0jsx62pPyessSI65fTdss8hN0w0mr//dIWEox+jgUT3mvfsMGXZxe
 daTR2EVaLS/7VnhMRtaUPl8Er5q93RQiI3adFdo9uNu1de4e+6dwI6pilInKTWNtuOGV
 L3h5wDbD5QDE8x3EW06xqEwhAGBXC0dzUVwM9QyUuf6a2uQanbXNvPNBlQ+yhch5tnvu
 QyQK9oZyVcSObI2afKhcIuZwp0/dS4LQmm+qRGA/+r3ATsyLMjSMlv/UlSsacWyti0ti
 zJJppehRVvUIzgKH8xWWJLx5UJ63hvPcbP2FF5Xl7eZHEuB8RTCeGpaAY8cdohmdRlgS
 kUrw==
X-Gm-Message-State: ANhLgQ36wcSQCUxuenxP3TPf6h3Qf8GBDpnlFWOkPRL2zwQiGzxNbddV
 Kua5HzWFcA1kOJijAc4vkt6UQNNTnKOgDDZnoQUYUf71Yy2gnCWx2is9HXrd+h7lsCxm80u+gHF
 GWnD/5UdtE2O3+vmXwA==
X-Received: by 2002:a5d:55d1:: with SMTP id i17mr7017382wrw.326.1583369337682; 
 Wed, 04 Mar 2020 16:48:57 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvqrD5jcDEaHoABlPfOyfoxFFjqF/4Qcq1KS0d6Zcf7fXQ/OSoEsmTYFWMbiCL4a0NaD6AaMQ==
X-Received: by 2002:a5d:55d1:: with SMTP id i17mr7017361wrw.326.1583369337343; 
 Wed, 04 Mar 2020 16:48:57 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id d17sm6500874wmb.36.2020.03.04.16.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 16:48:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/2] Makefile: Re-indent 'help' target and list tools
Date: Thu,  5 Mar 2020 01:48:53 +0100
Message-Id: <20200305004855.9665-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Thu, 05 Mar 2020 00:49:03 -0000

This series improves the 'make help' output:
- re-indent current output
- list tools targets:

    $ make help
    [...]

    Architecture specific targets:
      x86_64-softmmu/all             - Build for x86_64-softmmu

    Tools targets:
      qemu-ga                        - Build qemu-ga tool
      qemu-keymap                    - Build qemu-keymap tool
      elf2dmp                        - Build elf2dmp tool
      ivshmem-client                 - Build ivshmem-client tool
      ivshmem-server                 - Build ivshmem-server tool
      qemu-nbd                       - Build qemu-nbd tool
      qemu-img                       - Build qemu-img tool
      qemu-io                        - Build qemu-io tool
      qemu-edid                      - Build qemu-edid tool
      fsdev/virtfs-proxy-helper      - Build virtfs-proxy-helper tool
      scsi/qemu-pr-helper            - Build qemu-pr-helper tool

    Cleaning targets:
      clean                          - Remove most generated files but keep=
 t=3D
he config
      distclean                      - Remove all generated files
      dist                           - Build a distributable tarball

Philippe Mathieu-Daud=3DC3=3DA9 (2):
  Makefile: Align 'help' target output
  Makefile: Let the 'help' target list the tools targets

 Makefile | 49 ++++++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 21 deletions(-)

--=3D20
2.21.1


