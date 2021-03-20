Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNelv-0008Pm-7W
	for mharc-qemu-trivial@gnu.org; Sat, 20 Mar 2021 12:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1lNels-0008P3-9s
 for qemu-trivial@nongnu.org; Sat, 20 Mar 2021 12:48:17 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1lNelp-00062D-Ha
 for qemu-trivial@nongnu.org; Sat, 20 Mar 2021 12:48:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id v4so12241014wrp.13
 for <qemu-trivial@nongnu.org>; Sat, 20 Mar 2021 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dLteRjOk20aLA3lfO0lOsZkfXiLgV3PDYmI6pn7R4ak=;
 b=ef1IuWahYvxptHEvqtOGvqn2FXIeFIVHG1ONWBeK8X9Az5zin4xXodLiplU4D2J0V7
 QIrRMPLg/6uZ/QI6CvfrdzW2w6NjYL/0fGChgFLCFzy6XHGyK8ybnGI9HHgQLFGn/bTD
 0So0haXk4PqDud3wHywz407v+aos5eje7kU5M51M105Kp2VECHUYoCIzp/ILYntAtjs2
 XAWc9soFGnUJikwp+2uB/sOApgOeZbS4Ckb1R1NscWSs5SpCHMRjx8gk6IfgT6AYVm91
 W+61KuAGjwdG2OUPGm1sXkYU8WXhD+V3eXfnxVgqpakDEkEDqTgDFrQnta2cp2MeWw+a
 14Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dLteRjOk20aLA3lfO0lOsZkfXiLgV3PDYmI6pn7R4ak=;
 b=P7EVbxUKY+/Nz8v8+lo9stHYQhe0AIt6irJU1yRItwaI+VAzUJ6c3thM00eFdzXRh6
 awFicLiJUZnbFyqKUZ0Ir2jlVfupB+/0ihKUjie9MgTCQF8WvLyEwfSpixRuclFKl30N
 EkETyT+jIWkqrRe2yykg5rzdknOhGX4A4845pazSpbu9X9nqXo24hGhHJu3uCLLCpIFL
 tr1IydBenpKOdptB+k+f26Yj/t59h9Z5U/ih4zACsGXn5wCFQUFSnr4yosZPZBm3KmO9
 0B7d32gdowfnG07GMdgaYGJRPiSq6eObRs6sHvBdAC1cVevwQuKUlQQz0gEIc+zG0cip
 MDBQ==
X-Gm-Message-State: AOAM5307Du8LedcwTGTjxXMKqp/UgVuIcJygyiP0Ni3V7BWRW/b11AZE
 mI6u2IwopiYmjwzakorPOq0eiQ==
X-Google-Smtp-Source: ABdhPJx0ZDafoeYvc1BTz+DA8cCwwoPpXtyEhZA8K3Yvtdyt5z54Ef/GIuwUfew3O1knfMyyKGCZRA==
X-Received: by 2002:a5d:66c8:: with SMTP id k8mr10142175wrw.163.1616258891148; 
 Sat, 20 Mar 2021 09:48:11 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.local
 (trinity-students-nat.trin.cam.ac.uk. [131.111.193.104])
 by smtp.gmail.com with ESMTPSA id p16sm16367184wrt.54.2021.03.20.09.48.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 20 Mar 2021 09:48:10 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.local (Postfix, from userid 501)
 id 6F650336127; Sat, 20 Mar 2021 16:48:09 +0000 (GMT)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: qemu-devel@nongnu.org
Cc: Jessica Clarke <jrtc27@jrtc27.com>, qemu-trivial@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH] meson: Propagate gnutls dependency to migration
Date: Sat, 20 Mar 2021 16:47:30 +0000
Message-Id: <20210320164730.33285-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Sat, 20 Mar 2021 16:48:17 -0000

Commit 3eacf70bb5a83e4775ad8003cbca63a40f70c8c2 neglected to fix this
for softmmu configs, which pull in migration's use of gnutls.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 migration/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/meson.build b/migration/meson.build
index 9645f44005..6fa2f8745d 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -24,7 +24,7 @@ softmmu_ss.add(files(
   'savevm.c',
   'socket.c',
   'tls.c',
-))
+), gnutls)
 
 softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
 softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
-- 
2.31.0


