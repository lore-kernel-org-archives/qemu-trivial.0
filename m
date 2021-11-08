Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkDqD-0006x5-FY
	for mharc-qemu-trivial@gnu.org; Mon, 08 Nov 2021 18:14:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1mkAms-00014l-Vi
 for qemu-trivial@nongnu.org; Mon, 08 Nov 2021 14:58:40 -0500
Received: from [2607:f8b0:4864:20::132] (port=47032
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1mkAmr-0003Kt-Mr
 for qemu-trivial@nongnu.org; Mon, 08 Nov 2021 14:58:38 -0500
Received: by mail-il1-x132.google.com with SMTP id i11so8995835ilv.13
 for <qemu-trivial@nongnu.org>; Mon, 08 Nov 2021 11:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zj7AQVX+x87/tg9+P6j8jJmHy9YTaibeJh0b4X92FGc=;
 b=UrMSvfZdPECtZ+P9DrmfzqzzUidS2J4s0j8AzK4INzOJe/SfmNpgF5iAQI9Iy0VauV
 wa/9UZC0g+AX3aR8FZCKO9KaqB+7zB1Zhs7nfmzRhmInKrNBxlr0XC9jUzaYJaAyndif
 tMnTDQCP0/WvgYF5O/HYhmFh9bwFvkV3T6x1KQmHAXG1g/SVzKB1WdhGEkw7J6De3HAJ
 ffK3PRfANCsC7/PPGgMVXHrMmnbqZZTXYWv6oryjyvbk4BNLDNUNo9gJkZeLM78aXQhg
 gZowOTPb24xK2ZR8wRiwx4wbqgTtQ0Fq+bzNoAXvIqJF6qAOiQeDFA55HeaiQ3cD33ko
 27IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zj7AQVX+x87/tg9+P6j8jJmHy9YTaibeJh0b4X92FGc=;
 b=fNiE4+6z22872cmP13hwxANkKnZyRxpT77FHSF/1o9aXnf5vrD4Y7ZzWPXDi5My+wG
 zA5lz4KweMHdEzQ7JIFdOKC9La4gzChkRiexykL2eTOFB+JUqMaWzm6nc4OKwdVd0GnM
 1PJKOe184BHfA2yHG20Opn+1jzMcEoof4TwIIlYfvC4XC++eufd+aOefX9gU8iBATuui
 +Y5wHeZMcowneILyTgWWpKLo36Vb2QQcx8izlPvqnW8GznYXha8qF5ECMx4eJ8nI7His
 5MiD6YEZEOxjrwvjsoWKpVifg5QYbqVtshFFCFYqJe2oWdXOqSxb3h0ajYlDvdErUSIP
 Ndpw==
X-Gm-Message-State: AOAM530nh5ds579Rb2DXENA+oBZwh1m3c2L8TsOF6Z5B6wzCeG2jWC59
 RXeKuf/wR6QDa+U0lTC2+qFkVd0xnZY=
X-Google-Smtp-Source: ABdhPJzjS2G00LbUcDwRw9H7ZQ1Z8+1IJWaagnY86gqEzWrXKACOBw4GijHREiK5pX2lbfngCpXu0Q==
X-Received: by 2002:a63:6c43:: with SMTP id h64mr1494957pgc.306.1636401076210; 
 Mon, 08 Nov 2021 11:51:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
 by smtp.gmail.com with ESMTPSA id rj6sm177354pjb.0.2021.11.08.11.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 11:51:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] linux-user: Replace __u64 with uint64_t
Date: Mon,  8 Nov 2021 11:51:13 -0800
Message-Id: <20211108195113.1879836-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=raj.khem@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 08 Nov 2021 18:14:16 -0500
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
X-List-Received-Date: Mon, 08 Nov 2021 19:58:41 -0000

uint64_t is available in all userspaces via compiler include stdint.h
therefore use it instead of __u64 which is linux internal type, it fixes
build on some platforms eg. aarch64 systems using musl C library

Upstream-Status: Submitted []
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 linux-user/host/aarch64/hostdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
index a8d41a21ad..34d934f665 100644
--- a/linux-user/host/aarch64/hostdep.h
+++ b/linux-user/host/aarch64/hostdep.h
@@ -25,7 +25,7 @@ extern char safe_syscall_end[];
 static inline void rewind_if_in_safe_syscall(void *puc)
 {
     ucontext_t *uc = puc;
-    __u64 *pcreg = &uc->uc_mcontext.pc;
+    uint64_t *pcreg = &uc->uc_mcontext.pc;
 
     if (*pcreg > (uintptr_t)safe_syscall_start
         && *pcreg < (uintptr_t)safe_syscall_end) {
-- 
2.33.1


