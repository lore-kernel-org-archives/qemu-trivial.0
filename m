Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvoq-00061I-T2
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:59:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvon-0005yX-63
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:59:38 -0500
Received: from [2607:f8b0:4864:20::d35] (port=45765
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvol-0000qN-SQ
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:59:36 -0500
Received: by mail-io1-xd35.google.com with SMTP id v23so2388013iom.12
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0zcqxxx9i9efPGyMNGiYlMMaZ7Z90otmzxtyKTD4u1s=;
 b=PEiLhvbuyBHQI6fCdnHPD85rbw3Z4Icy4QbFXykg75zO9rd4Wdb5hcJ+m5Qi16/STZ
 SOmB8JNZh+L7drh1OODImDxeXiMvAbmVPaFqHEqtOt6wPcvzmmT52ZdLhZSggLUzPLlW
 CAnD5Wj8QhTUuxg2E0aM7JLynHXvrUIg8SOmUN4vLP/WslyXtK9p2kiK1YuYqlB9ih2F
 Z7PPgdk9516WEBjcJT5Mg4fWQ+fl3BRltw69BbCx3oRnlcWTPA6FMkFWPdHgQnAL1l8C
 whTOcdQnvfKgSDfu2uoDtCpaQ4D2zlX9t5KzpgYGBFTr49WVw0BhLnLidMhWtlL+L26r
 SA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0zcqxxx9i9efPGyMNGiYlMMaZ7Z90otmzxtyKTD4u1s=;
 b=pDdqwZneFcdRE/UGnOJAL+Zz4v5B/QKfZPk4CAMx8dRhE+isXQwDM2Yp/Hz8N34QSL
 Sf5vhgdR0HLq7NCbY8MPdDCT+Zt/M2gE/TMQ9sy6HiqRVefJuMWdJfMF1P0UbzqfbI56
 iclHILtpCC88qbmTaP/XDvxpvUtLiSv3mua+SFsnF3G0M11cFzLQz3Rty+jX0kIlOUQ1
 XWwpZ8jwrJloLmZUdTLHUmOVEIKYvN8sFpun2422HTn0ztrqnaHW1Q4bZIDPu6JgiOAl
 WgsadavNlzAmmTfOdWhKg6pxP748DQgZgrJw/gamtvUMhb+2gwhSwM+mLO2gktaXR8m7
 n/TA==
X-Gm-Message-State: AOAM533kvnrgtNK9YhbRp4OfhA2buRVCGvU9RX+K1hUmNmaUCcp73ODf
 vvsKrVY7G0n6z1acPDnQSD/SOko1fNIpXQ==
X-Google-Smtp-Source: ABdhPJyVmmFwrlZqX6CHgt0m94yv0c9XCf8BJmH3Eqj8T1WKYVjVe85r7xdrMRKzCWwmuKrOr2V13w==
X-Received: by 2002:a92:9513:: with SMTP id y19mr51138902ilh.300.1636343542176; 
 Sun, 07 Nov 2021 19:52:22 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:21 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v5 13/37] bsd-user/arm/target_arch_sysarch.h: Use consistent
 include guards
Date: Sun,  7 Nov 2021 20:51:12 -0700
Message-Id: <20211108035136.43687-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 08 Nov 2021 03:59:38 -0000

As part of upstreaming, the include guards have been made more
consistent. Update this file to use the new guards.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_sysarch.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/arm/target_arch_sysarch.h b/bsd-user/arm/target_arch_sysarch.h
index 632a5cd453..8cc6bff207 100644
--- a/bsd-user/arm/target_arch_sysarch.h
+++ b/bsd-user/arm/target_arch_sysarch.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
+#ifndef _TARGET_ARCH_SYSARCH_H_
+#define _TARGET_ARCH_SYSARCH_H_
 
 #include "target_syscall.h"
 #include "target_arch.h"
@@ -75,4 +75,4 @@ static inline void do_freebsd_arch_print_sysarch(
     }
 }
 
-#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
+#endif /*!_TARGET_ARCH_SYSARCH_H_ */
-- 
2.33.0


