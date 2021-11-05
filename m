Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipm3-0004aF-RZ
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplk-0004Im-UA
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:19:56 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:43578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipli-000453-J9
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:19:56 -0400
Received: by mail-il1-x136.google.com with SMTP id s14so8245539ilv.10
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZvh57AWzS8inwSMVn1OaBIlb06mOlklnUcQyFDbg60=;
 b=5aexJ+o/VItz8FeK7eHwx5APZdqxmqLLl+Hjs87Ai47PgrN+qKs/zwd1nJohu8dqTK
 m63BcsaRYG2w6D4qJgAushkRS7L5IXXXOM2f2INj985OZJH6Q8PunATELIk8CzDa+XTD
 881jn71tQZLAmtEID/KhnlHSmhAFiQ0MFkM0pY4gthCPTUuEYQkpvIMAK5LhGglRFBk4
 QUP+zhGLj3Y++jbFGmvU5ePszw85V+O6o4Uaprwd+3GiYX2TzBEnt/1bZbNb9a+rtgCP
 FHFxqgaQ0Hu6IoikrIAlQMVXynD0drplCZ+wkEIRdhrcA3QcMdGNqK3pxG3xkyGpkpeA
 HRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZvh57AWzS8inwSMVn1OaBIlb06mOlklnUcQyFDbg60=;
 b=mdSRqDJY4eWrJrK+3nTSazQCH+shrk2Glko2wbZsS9VpKEsA40QddnxAXKS4FcN75J
 48cEwgrUcY9qlAg3E2hVfbT+OEXIziqX4mZdcCcVZ3zQ/XUzsnHO7x0H4aCXBrQ4IUZ1
 0vKhBlhC4dHrqrBCDQXSj0Em1yWMI45lIfcMWOPlb9taG5NzbvbuFEWu/B5EHaFgT9zJ
 6VbJXZ4Rq8nwbZgldaOHosH6k2hPofZVX5B4KUGx9zxF3oYMD8D0GtF0XTobQ5fO8FLt
 6483nTww/jRsjlcqj0fZzZAJIs0AYrMzjFvUdkQOdsR8qjcuE2XINOhFHK9/uQGXPXcN
 2X8w==
X-Gm-Message-State: AOAM532Ccg7N0v4G9Ju/oEjlYOWSgfDs66R7POt4ksSCCLJWTuSGVZqc
 BHhd3y+t+gbtjT99NqHeNDN9+g==
X-Google-Smtp-Source: ABdhPJzZAqgytSnO5QI0vvY4aagc/iecK29jO+8jNmDZ+yO3Y04d6P7QOjBjiXiW11cYSBd84mOriQ==
X-Received: by 2002:a92:3642:: with SMTP id d2mr38342564ilf.91.1636082393582; 
 Thu, 04 Nov 2021 20:19:53 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:53 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v4 08/36] bsd-user/x86_64/target_arch_signal.h: Remove
 target_sigcontext
Date: Thu,  4 Nov 2021 21:18:49 -0600
Message-Id: <20211105031917.87837-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 Nov 2021 03:19:57 -0000

In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
Remove vestigial target_sigcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_signal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 4bb753b08b..55f742b0a8 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -27,10 +27,6 @@
 #define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack size */
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
-struct target_sigcontext {
-    /* to be added */
-};
-
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-- 
2.33.0


