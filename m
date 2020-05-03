Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVCrG-0001sf-VT
	for mharc-qemu-trivial@gnu.org; Sun, 03 May 2020 07:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVCrF-0001sT-DS; Sun, 03 May 2020 07:32:29 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVCrE-0008KO-0l; Sun, 03 May 2020 07:32:29 -0400
Received: by mail-wm1-x344.google.com with SMTP id z6so5480741wml.2;
 Sun, 03 May 2020 04:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1nPi+oQinHEr6TQxWwU7YkttsDFOpqeOrrr/3RoJBA=;
 b=YPCKPQTifNurp4ArMBxRLl/kA/eqZ68wvmv/vu05nyRNlWCNi0ZoZLs3z/0O83/YXF
 mzO/Z01o0vGAVWS4edsOqCjXspH3u/2p77VgQy09Lgvr02bObyaKdo4cg5Gkmbcf4uij
 09TCv1pxVAq5iG6ZynGuPq2TrenU9jZktwK7rOOC1hsV0oVwadQlvLZW2XBN/JqYzZGl
 IyecscWpIqd0nNKYDvFMGzSatDuCWwFL25MGJFjFRbmbUTmjjl82tF0Hs7ETeBHHmegZ
 Ur3AbkYIPeKgoRZT8lYhbtynaByGX/RBKn2lXDNWs2e8rhDo8OGF+rAnUycHfxLpKFbE
 pB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=f1nPi+oQinHEr6TQxWwU7YkttsDFOpqeOrrr/3RoJBA=;
 b=WRh6thVqISPL2m5wiTUKejTn1Sn/odgJ3iDdqjbD1rynE5WFZJquD0M1C+hapXEkle
 HvSMfbY8gmPfQ5j+mUA6g3GqtOVUqSIxsA7a4uSkBwHTwtDW3QNkp5Dk2nSokFe2/lfF
 n1gKSWVRsE9A0ZLrU0OCGvTjpEy16MCiNCVOcPZ/o6VojWY+YV1NCjZt3DPau3yxFvF2
 XSyDzZAXwuhxpCgKWatWvLw1FxH6pSdlVeac79+YH9SZYIC5j2z3/TETCTki0gHgKzRF
 R6HcHd7bPpDqTtZtwynaJ6ZH+4C4LakMBG/pUMXFdonTwiEEech1XLfmbSNjhpuJUnLy
 4kkg==
X-Gm-Message-State: AGi0PuYMUb1Gn1hbv1zGjsVVZI9EsaFKcQ4qZAZbr11XXsDNKVwl8WPN
 q4/tKfKp1RXCbki76XMhCGiAMXKa
X-Google-Smtp-Source: APiQypIlNdICjVUNCPCJ8NEfdAXcoMGNDAxDdh2Qzrp1bTLvVeIj77swUpzIqLT1syNonJFC319Vtg==
X-Received: by 2002:a1c:9cc6:: with SMTP id f189mr8859204wme.75.1588505545434; 
 Sun, 03 May 2020 04:32:25 -0700 (PDT)
Received: from localhost.localdomain (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id n9sm13485904wrx.61.2020.05.03.04.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 May 2020 04:32:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 0/2] misc: fix Clang10 warnings
Date: Sun,  3 May 2020 13:32:18 +0200
Message-Id: <20200503113220.30808-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
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
X-List-Received-Date: Sun, 03 May 2020 11:32:29 -0000

Fix 2 warnings when building with Clang on Fedora32.

Philippe Mathieu-Daudé (2):
  audio/mixeng: Fix Clang 'int-conversion' warning
  linux-user/mmap: Fix Clang 'type-limit-compare' warning

 audio/mixeng.c    | 2 +-
 linux-user/mmap.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.21.3


