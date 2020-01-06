Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioblt-0000YK-8B
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 18:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4e-0002qD-3f
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:25:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4c-0004g4-Mo
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:25:55 -0500
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:42066)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX4a-0004dQ-B7; Mon, 06 Jan 2020 13:25:52 -0500
Received: by mail-qk1-x729.google.com with SMTP id z14so39015125qkg.9;
 Mon, 06 Jan 2020 10:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9iBtM24gxNcAx1ejDUOR0GLhyehYr4GnSdxBSiFhd/U=;
 b=HVMaOLRwolx3rm3gwTHFVdu/toenkl+41BDqkp22iVBpe1ywA+YciHLQ78rv727D7z
 PMHWswFe8SfFERzoN/0pqtpZqfQvl5hokxyrYd8D+YPcuVWJE1c9JHSEmNZEryA+b1PU
 n0W30eed5E5JZ7teLKTvAmSIcPCtBPLuMsvzLG42vAyEbMyEtCrLjj26nUCf00ftheXQ
 NB2dUboTnsrtqBWLkTLY+5dANNFdDo2XyHnJa29lzLz0P/tOzF4PMYp0a/pUmxapllTk
 GCKuEeE/rbgXim+PbZmFhhBli/tYlZaxLerMH5maTXvPtq/EcssZ5yOXCvqHbVRn74o+
 88ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9iBtM24gxNcAx1ejDUOR0GLhyehYr4GnSdxBSiFhd/U=;
 b=AxZTRo8wcx+FzqJmc9ev/dM3IHs151/u+o6tQJZTx1hSyQ4z0db97nMc4m+0PbKQNa
 HP5a7TY1gYLUu1FSPLuGypOOf0JeM0osAULiJnT19XeJSWf4g+UcV1btnl0Kq8yrywBc
 J9Md15ZeKkmsx8yDrudHErBw9Ucq1jB8oGlb7Nah8gWFdCpPXsmr8V71hroullA600dM
 hELLgSxlD1EB9F2qsPglvp7lCwgGCQ99bttQSd8q7+yKhiSNLbtLESzGBL32oytxc1yL
 5SafCCozMz+apcBc4a3Yef8Xz+s61iBTU7uWpGmN1x3Xumk0lFBTE+5WrB9aJpNB7JKi
 Pq6w==
X-Gm-Message-State: APjAAAXy3awGKEQBbQshdNqZIBJHyxkpeYpOhd0RkXV+sj5sXYj4X1aM
 j5OR69TPx/uJNXLQV7JEHfUvCPN5
X-Google-Smtp-Source: APXvYqxNCdyCI+5IWqfjzBWWNSQlIUlqGLwOgwQRkwTxANsLrlC1DI4HIlMK5Abm1n7kSwyMxbCmyg==
X-Received: by 2002:a05:620a:21d4:: with SMTP id
 h20mr79651642qka.468.1578335151684; 
 Mon, 06 Jan 2020 10:25:51 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:25:51 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Corey Minyard <minyard@acm.org>
Subject: [PATCH v1 33/59] ipmi/ipmi_bmc_sim.c: remove unneeded labels
Date: Mon,  6 Jan 2020 15:23:59 -0300
Message-Id: <20200106182425.20312-34-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::729
X-Mailman-Approved-At: Mon, 06 Jan 2020 18:26:41 -0500
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
X-List-Received-Date: Mon, 06 Jan 2020 18:25:58 -0000

Label 'out' from ipmi_bmc_gen_event() and gen_event() can
be replaced by 'return'.

CC: Corey Minyard <minyard@acm.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ipmi/ipmi_bmc_sim.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c
index 6670cf039d..1e06fd1de9 100644
--- a/hw/ipmi/ipmi_bmc_sim.c
+++ b/hw/ipmi/ipmi_bmc_sim.c
@@ -461,14 +461,12 @@ void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log)
     }
 
     if (ibs->msg_flags & IPMI_BMC_MSG_FLAG_EVT_BUF_FULL) {
-        goto out;
+        return;
     }
 
     memcpy(ibs->evtbuf, evt, 16);
     ibs->msg_flags |= IPMI_BMC_MSG_FLAG_EVT_BUF_FULL;
     k->set_atn(s, 1, attn_irq_enabled(ibs));
- out:
-    return;
 }
 static void gen_event(IPMIBmcSim *ibs, unsigned int sens_num, uint8_t deassert,
                       uint8_t evd1, uint8_t evd2, uint8_t evd3)
@@ -978,7 +976,7 @@ static void get_msg(IPMIBmcSim *ibs,
 
     if (QTAILQ_EMPTY(&ibs->rcvbufs)) {
         rsp_buffer_set_error(rsp, 0x80); /* Queue empty */
-        goto out;
+        return;
     }
     rsp_buffer_push(rsp, 0); /* Channel 0 */
     msg = QTAILQ_FIRST(&ibs->rcvbufs);
@@ -993,9 +991,6 @@ static void get_msg(IPMIBmcSim *ibs,
         ibs->msg_flags &= ~IPMI_BMC_MSG_FLAG_RCV_MSG_QUEUE;
         k->set_atn(s, attn_set(ibs), attn_irq_enabled(ibs));
     }
-
-out:
-    return;
 }
 
 static unsigned char
-- 
2.24.1


