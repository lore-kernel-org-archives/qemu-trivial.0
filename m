Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvpn-0007rq-9k
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 23:00:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpl-0007jw-CM
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:37 -0500
Received: from [2607:f8b0:4864:20::42b] (port=41879
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvpf-000147-Kl
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 23:00:37 -0500
Received: by mail-pf1-x42b.google.com with SMTP id g19so8730859pfb.8
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 20:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IfRWeGYD+0hbc23c7Edg1M5XjxcHd+iZ98b19hdHbHg=;
 b=h+lyCx3528JpeKv4Yln6Sy72OPZoCCxKjmTZXnrCALhSmdp992bgleJT+hCPqX/sz9
 MYl78Ke1RwfdsixnA+UCmUU5kT5O6MufbwlbH9IqZZ/z16Wmuz/YuWLzCVfSm5NrNPyE
 2mk4+cU5NjXFy4uexRJ+jS33UPnFwyBo8rKvm5WiJ4hqMw0I15RETcE+vijStdgrmX76
 EjZ68O0172zpD/hWW0tkvOliS2hYbfo0exzuGjA1cLmV5vh5rA5ow2tviQxG4zp+tCdG
 zQraX6cJY7hcRuDOyPdCGi9X9C3pVoSDPkgpGMHbdZ1sjyCENDsAUff1IM73mpQVwrjw
 rw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IfRWeGYD+0hbc23c7Edg1M5XjxcHd+iZ98b19hdHbHg=;
 b=OGZPPQNUKK/CdbdzZpWWORnfsuH0dvfiHMOsIArFs+m7JQeprf3NlnaGCSInEArC+W
 Ijn2P85pyDzrtau9XqmOxYukjdlMoWLw6m4PUkehJB1P1pTNfWVC5gw8JLdrU1PfitoC
 vc4Hu4emRVLle+jYqsY16Hrgi0RUYx5dxncW7hIbg9bXXw8w7LuqoevfuTGcheVDUl3P
 HdbQOXaMV1Y8FR7f4HZIp4GZ6VFcx3AHugxQJ5EvouwL9L3Q5lO3NYrkXAeskv1pbxJH
 Gr28wlLD/ACM1sIbABEENXzHydTcXifbnpg9SkMPahmvMMjITJuhBT9rJlo+wf32tJkM
 ddTQ==
X-Gm-Message-State: AOAM5303IovVGX/gkHXonPZ+M23nAjsi5Lpts39BIibWcux8cPgLGxzP
 rluHJZoPozjSl3CGLwuZuMh19tKBaF134Q==
X-Google-Smtp-Source: ABdhPJxLWqXcPZTsil6T1YcFNMubGoXM1Re1az4U8UfOiudO6PY3fIHS1zEVPBj/s3NBD+SLninLNA==
X-Received: by 2002:a92:c80d:: with SMTP id v13mr54571731iln.175.1636343548913; 
 Sun, 07 Nov 2021 19:52:28 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:28 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@FreeBSD.org>, Olivier Houchard <cognet@ci0.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v5 20/37] bsd-user/arm/target_arch_cpu.h: Implement data abort
 exceptions
Date: Sun,  7 Nov 2021 20:51:19 -0700
Message-Id: <20211108035136.43687-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=imp@bsdimp.com; helo=mail-pf1-x42b.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 04:00:37 -0000

Implement EXCP_PREFETCH_ABORT AND EXCP_DATA_ABORT. Both of these data
exceptions cause a SIGSEGV.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Olivier Houchard <cognet@ci0.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 9f9b380b13..905a5ffaff 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -65,6 +65,17 @@ static inline void target_cpu_loop(CPUARMState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
+        case EXCP_PREFETCH_ABORT:
+            /* See arm/arm/trap.c prefetch_abort_handler() */
+        case EXCP_DATA_ABORT:
+            /* See arm/arm/trap.c data_abort_handler() */
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            /* XXX: check env->error_code */
+            info.si_code = 0;
+            info.si_addr = env->exception.vaddress;
+            queue_signal(env, info.si_signo, &info);
+            break;
         case EXCP_DEBUG:
             {
 
-- 
2.33.0


