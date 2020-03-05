Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9ewc-00046x-VP
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 20:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39427)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9ewa-00046b-MP
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 20:04:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ewZ-0005GE-CX
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 20:04:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43914
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ewZ-0005F6-7y
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 20:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583370294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ASuvXJzSwaay1xbKHLSIhs2mAWSbDz0oulJY6D76muw=;
 b=bH2l9nJfpl00DmiLWPfsJqhct0Atj8EK+RcQUpIBkXLDOXlCcXURERLEnkctques+b//JX
 SxS36bD1HpkE4y6raPSkHM0P/o+8+OXGMQPSa/sYigvNkV94/Pc24L7LGMFAYj7Y1W0Lo5
 lC8UhdAThy4trA0yzKms+EgaSjpE6os=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-77lYP9lEOIW7z-Kc1aQ1sg-1; Wed, 04 Mar 2020 20:04:50 -0500
X-MC-Unique: 77lYP9lEOIW7z-Kc1aQ1sg-1
Received: by mail-wr1-f70.google.com with SMTP id p5so1603397wrj.17
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 17:04:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fm9u3HbkueAjiabsbTX9B1kjiGGd9Wj6z2DYzKRIZKE=;
 b=I9FYWDd17cUf+BENj76G/a4bKllUQxDwG/QNbVNHvOcGLE5PolW882+iKzmlrj+fE2
 xhWJw55RwPAabx12IzBGKV0mAJ87nuEAMYgrpYKAltLMBPUWgZCB9Rsz4VHmtt30D1ft
 36pZlSW+0JmRMov4LOPDA04U5G5UNpjP9wCj+lpKpHTXcgzC/IW6ZZS3prwR1FNGeGA+
 Fe1ZBv/EEe8Vgo2K/aiKqy7buMHfv4HWQ7vbGwkQJUbtAW3DwpxQC6Ampp/6HzhfSw+n
 RM6t1qrdplcIwpkU06qs/Ug2ovqwNURRI/+dY6Utp6ueV9t5HkvmDt27Y52XIXuj41bu
 QhHA==
X-Gm-Message-State: ANhLgQ2BoSrcVxcUuqoTa2VEElo242zjQlB034edny9z6Lr1UdLob4yN
 wL499m/Ug2QrkMOxlbe6BOwqPDApCfGZnpwkSJjkBBVSG32e1V+r2cskTl0UWXHqkplcW8X/pTU
 xnB/yuheDvrsbQB6uZg==
X-Received: by 2002:a1c:a515:: with SMTP id o21mr6098352wme.124.1583370289169; 
 Wed, 04 Mar 2020 17:04:49 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtFHPd6DevqhvKtgWk19aGA+th8kpFNpqu6vlf2jO/7T3jFqDrpCT0SrzLlWlKVkwxjehcq4A==
X-Received: by 2002:a1c:a515:: with SMTP id o21mr6098337wme.124.1583370288963; 
 Wed, 04 Mar 2020 17:04:48 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id o5sm7228822wmb.8.2020.03.04.17.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 17:04:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/3] hw/net,virtfs-proxy-helper: Reduce .data footprint
Date: Thu,  5 Mar 2020 02:04:43 +0100
Message-Id: <20200305010446.17029-1-philmd@redhat.com>
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
X-List-Received-Date: Thu, 05 Mar 2020 01:04:57 -0000

More memory footprint reduction, similar to:
https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg00984.html

The elf-dissector tool [1] [2] helped to notice the big array.

[1] https://phabricator.kde.org/source/elf-dissector/
[2] https://www.volkerkrause.eu/2019/06/22/elf-dissector-aarch64-support.ht=
ml

Philippe Mathieu-Daud=C3=A9 (3):
  hw/net/e1000: Add readops/writeops typedefs
  hw/net/e1000: Move macreg[] arrays to .rodata to save 1MiB of .data
  virtfs-proxy-helper: Make the helper_opts[] array const

 fsdev/virtfs-proxy-helper.c | 2 +-
 hw/net/e1000.c              | 6 ++++--
 hw/net/e1000e_core.c        | 6 ++++--
 3 files changed, 9 insertions(+), 5 deletions(-)

--=20
2.21.1


