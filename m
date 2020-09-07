Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kF6Nj-000616-M2
	for mharc-qemu-trivial@gnu.org; Sun, 06 Sep 2020 21:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kF6Nh-00060N-Vg; Sun, 06 Sep 2020 21:55:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kF6Ng-0007Ho-J0; Sun, 06 Sep 2020 21:55:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id k15so14040840wrn.10;
 Sun, 06 Sep 2020 18:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TTqBRIWUGDzlPmlUQ/wFZcYsZZ7W+Ar6r75Vl/q5/lM=;
 b=a8tntNJWoqrN2jijqrfaCRXmcXny9/MwznU5zdWO0tVowsd1qc8wWisY1eo1mgqE+G
 jPsWVvGiRmEF/6sSG8Rp6dDTZb8aLmDmuA1EP9Tfa17OWHe44lec6KYRbM0oqiC9onkP
 D0W3sX4arg1TccVAAU1/TQF54fn8tt5M2Kc40Xp/4qogZ1D6QLSc65y/vojTTUH5iQF8
 REraTrShj8dDvonr55ZGuPFJ/LXhd9gju4KCQTvfYcKnYR45oxaXGQIz9jyhH1X15Lrw
 RtyrQHcQfWs66zNYasl8pbKUFYc58HWz2VgnDJt6s+DpuQ6nXaZy9cnBQCCeGZ4OJSfT
 NNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TTqBRIWUGDzlPmlUQ/wFZcYsZZ7W+Ar6r75Vl/q5/lM=;
 b=gUzBhrkrD43bnnjwnh2sI1Pkwq7rUptgvyoOk6+jlA37wVNjmW2BQ1qbV/7OBZt5Lo
 clKmu/s1UZdiyrZYVYKUk3aMGnyYxJQaW+CEi5l7iLikXvS+yoaCxd0mJn4J23tXyoyI
 1JaeA4QEBmEJ5VjWxv0skrvZWcSR40jK6V3WwgbW1jol8/P7z5Nzb1M5uBUbJwzdW6Lg
 1EB8KudzylQLzMlt2/g6PnS0fLviCj1PO1teM4GHBESPD34HNu3lLMJpxIEpyyZJz3B/
 71+no6V213i1OxrED07XWHB8zcUWFey3iFWQMjudAU9dy3Fmdslol2uH7hsXPIu3vu4c
 qRAA==
X-Gm-Message-State: AOAM532DX8Fi3Hj5bRoZaijHGU2kQ3VyMZDqg/BcTuJSt7MnLOxTxgHh
 +zHd1IdwRvBRkEi0oEwdwNBBRRC7Ypc=
X-Google-Smtp-Source: ABdhPJzp2bHb/NZUah0Eq/Wmf90jasmtbJCG4l8HXldirXwKszs7Cq+ixEC2RCK+1nZzKrIuVF9Kiw==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr20619273wrm.229.1599443738194; 
 Sun, 06 Sep 2020 18:55:38 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id b84sm29377773wmd.0.2020.09.06.18.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 18:55:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/7] hw/char/serial: Housekeeping
Date: Mon,  7 Sep 2020 03:55:28 +0200
Message-Id: <20200907015535.827885-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 07 Sep 2020 01:55:42 -0000

Nothing very exciting, cleanups before more serious changes.

Philippe Mathieu-Daudé (7):
  hw/char/serial: Assert serial_ioport_read/write offset fits 8 bytes
  hw/char/serial: Replace commented DPRINTF() by trace event
  hw/char/serial: Remove old DEBUG_SERIAL commented code
  hw/char/serial: Rename I/O read/write trace events
  hw/char/serial: Make 'wakeup' property boolean
  hw/char/serial-isa: Alias QDEV properties from generic serial object
  hw/char/serial: Let SerialState have an 'id' field

 include/hw/char/serial.h |  3 ++-
 hw/char/serial-isa.c     |  4 ++--
 hw/char/serial.c         | 25 +++++++------------------
 hw/char/trace-events     |  5 +++--
 4 files changed, 14 insertions(+), 23 deletions(-)

-- 
2.26.2


