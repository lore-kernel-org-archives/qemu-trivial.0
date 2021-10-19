Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcsEp-0008Va-5W
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 12:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEm-0008RH-Pf
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:16 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:35794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEc-0000AG-IS
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 12:45:16 -0400
Received: by mail-il1-x12e.google.com with SMTP id k3so19075447ilu.2
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 09:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1RJ4bYCKRLbbeOm2Xoes9tKh+W8zRGO3Dbj9Y1y5Eeo=;
 b=H08R7LralMorM84z482c6GQdwivd+D2tGmWgr0++9SdPSEPgL+peRi3ZjnfQoF5t0i
 fc2Iy1YfeA4gzTslsHLQOJCMDPLCzUug1pxY8ukhNebfAM5mL4IbCGsuxT1wqcmN8paf
 zPXP+1PHbTAk//ogpKH9ghQEXsvWo+qaNgq4W9866agBi8fdP7qm2Cly7JvWgCaOlS1A
 yqpbsArVbWpg8iExCzBdFZ/PfkNJfb9Ts8QgmVY6NRDz1VbmtdY4iV9zLNFnXKTczXAl
 zZoXHeKhVe3RavwcStScaiTGF12iXCrU2+H1+MBMlZ54zrN8kYI1NtvDNwE5B6dyUVfA
 44lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1RJ4bYCKRLbbeOm2Xoes9tKh+W8zRGO3Dbj9Y1y5Eeo=;
 b=GhGFkZ3pyThQeww2OwGIajqHZZlar6n7cDq8tgbM2Wgy5J9d7P3jOGZxWi+13Y2+DG
 EuFYn7wdHKSHm1xUzRFRl8lNWTD3H3iCGCdkmH1XlAFj+v7ZnNj12wJbK9h9NzOPiu4V
 kJlcm08X9nhAYnoZ3QL6AMkpB9ZwSaGUlZ7036kmEIBm5eFoFzhbJ1n5CPWa6m0pKZ4W
 UAaQe6ZNroSEnB91w+KeIBhv57U/E2NrYQukkj3VPSFqvdD0lb9nnI2TjeTFXIwgeZUE
 9oUhg94YxBeLs8o/GTdVX/0KsldcX3qMONwGFd73GMDYNzQsFZ+zbiv3+Y63A8Vfdt59
 ZPww==
X-Gm-Message-State: AOAM531sthsVOcgwja7UpaNIGRjudyAfjwVcDNYh3fYptmhLYvGwPAfM
 OOEA3JfutNaAVg4i/81R/3apGA==
X-Google-Smtp-Source: ABdhPJzVsZkl+FHfsBGSjTYIE0oi7p2PTYgnxsF0jIAHKxtRtqEakeRNSkbL30uDk6tDXsFzQcFQ/g==
X-Received: by 2002:a05:6e02:1847:: with SMTP id
 b7mr19148589ilv.129.1634661905376; 
 Tue, 19 Oct 2021 09:45:05 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:04 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 01/24] bsd-user/arm/target_arch_sysarch.h: Use consistent
 include guards
Date: Tue, 19 Oct 2021 10:44:24 -0600
Message-Id: <20211019164447.16359-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 16:45:17 -0000

As part of upstreaming, the include guards have been made more
consistent. Update this file to use the new guards.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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
2.32.0


