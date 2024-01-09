Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rNH6W-000090-VN
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jan 2024 13:45:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rNH6M-0008WG-AI; Tue, 09 Jan 2024 13:45:26 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rNH6F-0002Wn-Qb; Tue, 09 Jan 2024 13:45:24 -0500
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by zoidberg.rfc1149.net (Postfix) with ESMTPSA id 0725280024;
 Tue,  9 Jan 2024 19:45:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfc1149.net; s=smtp;
 t=1704825913; bh=0TINWY8HRlOV+mR0MYQncm2cL7XA3W+i5PPcGq//eIg=;
 h=From:To:Cc:Subject:Date;
 b=DVYTUKfxGhD1L0vgohE86GZiFC/NAMl9r3lePHihJyY2fUE/Ig3K8+c3qXFygAvH7
 4jKhRrAS1KIvTSe6Oeg0geqgTrvqf3jS+hQgNi3CQhKx4FrE87vYxKV3m0xORZEkK3
 kwNAQWdf5f3VdeYggko9qSriYQZVdUT4N8HsVDmIgLg29hoMKqwWF4sHzsGMSVhA7F
 U3aIHdxQun+P56r6Mdujp9wm5Ev+hwAIzbT5bM4nIi5zam/oovtp5+tqtirjNNEcXa
 8qltIgQJZKeLDtgdgOjYzLpZ7L21MuzCqvOydrlDFOaXONgbqlVhNoR84DvOLghFnu
 RtEy6X8SZ/RfQ==
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH] hw/timer: fix systick trace message
Date: Tue,  9 Jan 2024 19:45:08 +0100
Message-ID: <20240109184508.3189599-1-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2024 18:45:30 -0000

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
Fixes: ff68dacbc786 ("armv7m: Split systick out from NVIC")
---
 hw/timer/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 3eccef83858..8145e18e3da 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -35,7 +35,7 @@ aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "From 0x%" PRI
 
 # armv7m_systick.c
 systick_reload(void) "systick reload"
-systick_timer_tick(void) "systick reload"
+systick_timer_tick(void) "systick tick"
 systick_read(uint64_t addr, uint32_t value, unsigned size) "systick read addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 systick_write(uint64_t addr, uint32_t value, unsigned size) "systick write addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 
-- 
2.42.0


