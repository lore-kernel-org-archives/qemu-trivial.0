Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPzOx-0008RL-G6
	for mharc-qemu-trivial@gnu.org; Tue, 06 Oct 2020 22:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPzOv-0008Pq-Tf; Tue, 06 Oct 2020 22:41:57 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:45064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPzOt-00056I-EY; Tue, 06 Oct 2020 22:41:57 -0400
Received: by mail-pg1-x534.google.com with SMTP id y14so423339pgf.12;
 Tue, 06 Oct 2020 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5PEbYzQnYiFvrcn4EJsDEL2gxzyh3HsDEjQLa3bjd14=;
 b=BZ3nrmWynXGkRa0319mInuvgyQEOudaLJFtGh906jgrxmS9/JLq48c4p9TYXDdaZ4h
 DcWKUx7NiZG0IrFtBN/CbeWyiyTq/T8gpsGvkJqiLyjsClMUWejywKZeFZ02imaSDcoL
 kHqJYAqhHF3Hr61i5OSV+vpPB4dbAVLEzdl7gq2S01S+79WwachCAR0oA6SuKkxY+0Wk
 9gX4ACyp+tg+f/qNvbSqgYfnkpS8duhhXcbloKaclKPqzVeGnFYhUBXJ+L5CagMlZyYC
 9+x7BdpfYhSsWMnGJRp43664f9lZjCis1RGvpTNxp/QteZbKSupxe1EggNb7ZEk+F35e
 psiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5PEbYzQnYiFvrcn4EJsDEL2gxzyh3HsDEjQLa3bjd14=;
 b=mhgXRAfmBjxubU3rvgGZfTiAwDzz92b2AYzx1WAUueYavDkD2b5+CsxakQvSJEckGH
 Dv3T/LKvnVzX0FA15rB/KIMR6WRuMjFyJQQ3oyILmKI9fMQbfjogiTz6DeidgX4Mm00K
 fbQ2v/ZK3QIAiAi3RpPSOtf2tRs1A5/D5BwWBbkqO/PDI5LZkKHpYlHfmzmxKWh9abQ/
 +5gC7fskmwv3rUNjG1jhW21Y9mpNxrtO56uMFbt0vUmnL4CYRHbUDXAyFWv80V8ASRTY
 nbrKcGstImatPLecuMTYbzSi4MtcBEKm0fX5g0ohd1e/yJJtQc9386K514Qz5ljBYTw7
 mANQ==
X-Gm-Message-State: AOAM530FvV4mNL0J5WvA3kwrN38/WLHfcXJz/TZsAXUHh4q+74QZTN6s
 G/4GZUrjpelBaNW+F0kdgOD3cSNcSU9img==
X-Google-Smtp-Source: ABdhPJxzUXTqB1KCDyMGy3rAsw3d8OkXclkdLZ3KCeUrTtatQfBoql/LLiOFJ7q3yCnvMLaxwKOe8Q==
X-Received: by 2002:aa7:9a41:0:b029:152:b36e:409e with SMTP id
 x1-20020aa79a410000b0290152b36e409emr963087pfj.31.1602038512589; 
 Tue, 06 Oct 2020 19:41:52 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id u27sm583913pgm.60.2020.10.06.19.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 19:41:51 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH 0/2] Improve cirrus msys2
Date: Wed,  7 Oct 2020 10:41:33 +0800
Message-Id: <20201007024135.1885-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x534.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 07 Oct 2020 02:41:58 -0000

Fixes the broken msys2/mingw ci and speed it up.=0D
=0D
Yonggang Luo (2):=0D
  docker: Add win32/msys2/mingw64 docker=0D
  cirrus: Fixing and speedup the msys2/mingw CI=0D
=0D
 .cirrus.yml                           | 60 +++++++--------------------=0D
 tests/docker/dockerfiles/msys2.docker | 57 +++++++++++++++++++++++++=0D
 2 files changed, 73 insertions(+), 44 deletions(-)=0D
 create mode 100644 tests/docker/dockerfiles/msys2.docker=0D
=0D
-- =0D
2.28.0.windows.1=0D
=0D

