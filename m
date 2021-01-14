Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0BFu-00047b-RI
	for mharc-qemu-trivial@gnu.org; Thu, 14 Jan 2021 17:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mforney@mforney.org>)
 id 1l0BFt-00046y-Ca
 for qemu-trivial@nongnu.org; Thu, 14 Jan 2021 17:38:13 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mforney@mforney.org>)
 id 1l0BFr-0002EO-9E
 for qemu-trivial@nongnu.org; Thu, 14 Jan 2021 17:38:13 -0500
Received: by mail-pg1-x532.google.com with SMTP id i5so4769720pgo.1
 for <qemu-trivial@nongnu.org>; Thu, 14 Jan 2021 14:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IqgaHUk5U7mtZ3Pv6go/Z6K4kDupzt6qMv35bF1pAi4=;
 b=ItzAJBNEqh7mxYTg3EmuH915g75jXUxwWx8YZ4Wn9NE10i2E19ZCGU3QfNW6VO0wKf
 6GPCkP9uEGulRxxI+kBeGWAhG7bDGcHn5JA0Rt0Q/LowyJHigXyrbt29gMaJBkc3kreo
 32eXwMIvSNoR6W8A7Rule8SN6/RPnFYEc5PjEVlJ3DB0Eea7IRAKxe5jzUrg34XDJqhd
 0uil7NpolOLdS7dGLTghNlHsch/kWgpps65GbsHGJH9HMMCzFJ0WogKSd7Wkrn5o2hnp
 Ye5QQ/XR8khXyLIiko9wK8WJMldWd+TD55oRKhOF8mpR7Ec5cFDcuIQ8ru+QFtg5SsVd
 sYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IqgaHUk5U7mtZ3Pv6go/Z6K4kDupzt6qMv35bF1pAi4=;
 b=ugXSKpbRMSDt4g9nnMCrcMpawv56lHwazAdoa0B5ns2Zhe9HildWV1SParNCu1WPMi
 m52VtiMyL79V1q7MUTEFRpr7etx2GRm3OEFzqCy6xWyUQQZo0Fby7ZYwz8MJv9kX9/dy
 kNOhGfusIiWm2JpZSHfhSyWloHAx1SGnTtynSFi2/7mkQY5nIe3HXQJ/dzwO4jjc8r6G
 UYTMtJQkOHTsyz8zG2Goyxk5ojUwbFESQ1B//Wr1SbiU/1u3jRJivLjAMOshDM6alZO3
 rBTwOR9+CELeJT/052PboSwKX9A+/DLxbgsvkhq+zHIiCi8jvAzpnWe5KfS4zjMl2S2r
 MXww==
X-Gm-Message-State: AOAM530laiePQ02ahoVaNIwDncrjSn/GoUn1Qmy8kk8n98YaMK586hbG
 fRh7U9STB3CpqN8o7JUU6IT8kQ==
X-Google-Smtp-Source: ABdhPJxdAOfOfpWoyvPTeqah34NTW87d7X+UV/kQb95J3DzXiWtucHxo9lpvBgeKSr055H0Z7ehIiw==
X-Received: by 2002:a62:1ad3:0:b029:19d:cc02:5d07 with SMTP id
 a202-20020a621ad30000b029019dcc025d07mr9358904pfa.70.1610663888442; 
 Thu, 14 Jan 2021 14:38:08 -0800 (PST)
Received: from localhost ([2601:647:5180:4570:c90:56ff:fe92:3a06])
 by smtp.gmail.com with ESMTPSA id u12sm6140344pfh.98.2021.01.14.14.38.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 Jan 2021 14:38:07 -0800 (PST)
From: Michael Forney <mforney@mforney.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH v2] linux-user: Remove obsolete F_SHLCK and F_EXLCK translation
Date: Thu, 14 Jan 2021 14:36:02 -0800
Message-Id: <20210114223602.9004-1-mforney@mforney.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201028032727.31326-1-mforney@mforney.org>
References: <20201028032727.31326-1-mforney@mforney.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::532;
 envelope-from=mforney@mforney.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 14 Jan 2021 22:38:13 -0000

These lock types are unsupported by Linux since v2.2[0][1] and
always return EINVAL (except on SPARC up until v2.6, which just
warned).

musl libc does not define these constants, so just remove them from
the translation cases.

[0] https://github.com/mpe/linux-fullhistory/blob/v2.2.0/fs/locks.c#L322-L324
[1] https://github.com/mpe/linux-fullhistory/blob/v2.2.0/fs/locks.c#L429-L445

Signed-off-by: Michael Forney <mforney@mforney.org>
---
Changes since v1: fixed typo in commit message, resend to qemu-trivial.

 linux-user/alpha/target_fcntl.h | 2 --
 linux-user/generic/fcntl.h      | 5 -----
 linux-user/syscall.c            | 2 --
 3 files changed, 9 deletions(-)

diff --git a/linux-user/alpha/target_fcntl.h b/linux-user/alpha/target_fcntl.h
index 2617e73472..e16ed1d415 100644
--- a/linux-user/alpha/target_fcntl.h
+++ b/linux-user/alpha/target_fcntl.h
@@ -33,8 +33,6 @@
 #define TARGET_F_RDLCK         1
 #define TARGET_F_WRLCK         2
 #define TARGET_F_UNLCK         8
-#define TARGET_F_EXLCK         16
-#define TARGET_F_SHLCK         32
 
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/generic/fcntl.h b/linux-user/generic/fcntl.h
index c85c5b9fed..4568d1f42b 100644
--- a/linux-user/generic/fcntl.h
+++ b/linux-user/generic/fcntl.h
@@ -119,11 +119,6 @@ struct target_f_owner_ex {
 #define TARGET_F_UNLCK         2
 #endif
 
-#ifndef TARGET_F_EXLCK
-#define TARGET_F_EXLCK         4
-#define TARGET_F_SHLCK         8
-#endif
-
 #ifndef TARGET_HAVE_ARCH_STRUCT_FLOCK
 #ifndef TARGET_ARCH_FLOCK_PAD
 #define TARGET_ARCH_FLOCK_PAD
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d182890ff0..f238edf715 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6664,8 +6664,6 @@ static int target_to_host_fcntl_cmd(int cmd)
     TRANSTBL_CONVERT(F_RDLCK); \
     TRANSTBL_CONVERT(F_WRLCK); \
     TRANSTBL_CONVERT(F_UNLCK); \
-    TRANSTBL_CONVERT(F_EXLCK); \
-    TRANSTBL_CONVERT(F_SHLCK); \
     }
 
 static int target_to_host_flock(int type)
-- 
2.30.0


