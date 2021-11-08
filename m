Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjvoh-0005s3-Ao
	for mharc-qemu-trivial@gnu.org; Sun, 07 Nov 2021 22:59:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvof-0005pX-Mr
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:59:30 -0500
Received: from [2607:f8b0:4864:20::52f] (port=45829
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvod-0000pX-V8
 for qemu-trivial@nongnu.org; Sun, 07 Nov 2021 22:59:29 -0500
Received: by mail-pg1-x52f.google.com with SMTP id f5so13966151pgc.12
 for <qemu-trivial@nongnu.org>; Sun, 07 Nov 2021 19:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4/CwsutaIOyDt2WjHRLiQgEBPJ5vyd4yg3qN35Y9Ogo=;
 b=YicToWzSexndkpQoE7u/jETLTD4+gfvW2i099/jciU9HV9sE5nfmXOqMMiAiT4e35F
 A9l0O6rYvbFNc6tKrvb/6oOG2miMQiHTgOAgapkrRppoSngI/D+dJGHnhfBkNJ1hgHvC
 XQVbpLijy0gm7Du/nkI+QH/FrMnl0eFyiMa4aCPmAP3exIL69zv7938yeynJNca7NMCT
 GKIK90Rlpx8mp+wMX7I9j3rwT5AZYmqhfYwkLnqrELv/EZUT3X6yB//0+WfmQGqX+FvP
 O7tG82F0SXMeKQWyyVWEANq8YcntuTNVQusm/Yd/Dcwq0NnDbDTrMvZzR0k7lJanHAru
 UgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4/CwsutaIOyDt2WjHRLiQgEBPJ5vyd4yg3qN35Y9Ogo=;
 b=p//jc7FRP0itAW/OnBUY+wuUKBsdoYbafZ0+jdTETT5FOb4AP7xW2mJUdr3OSQn8eU
 B160raieIK8P08hxEqnrM4IZUIfHIfnJ5mxMq5BQ0Gb6L4CoSEtjY/3GHvlq9Wd4FW1f
 gdQVMLhdxpUH23AjHc4Ljvmn0lNixSH8G65NfOj+ODW8+7gEPiyJFAvy+U1ZPv/WLAvj
 wawKEtT4NohKsm6rvPP20Uyhfiw7aBFmnbuQCCzGAJnfecceF0qFJImt/ecmqrH31Bsw
 uxPzxcf+ZjX2X0YO/6skbBxRqrGJ0F4P/CsMCKQkn0NsEGPRKnwmrf4ejSR7XuFto2WT
 ro4g==
X-Gm-Message-State: AOAM531Ia4o00hx5x2oHmDcoLSHSgLzaC4+or0FkUldkZV/zkOcbGc7u
 VI7qoolbgViHgQZH0CbAoyCA86kepeGTRA==
X-Google-Smtp-Source: ABdhPJyZse4gQcD7NeFqUEhTNrfbfHzyufmnvF3lCNeiR54F4YWMsfuKIL+6DyOMchpMA0fpbqCGiA==
X-Received: by 2002:a6b:f706:: with SMTP id k6mr10431594iog.155.1636343532682; 
 Sun, 07 Nov 2021 19:52:12 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:12 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kyle Evans <kevans@freebsd.org>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 03/37] bsd-user: create a per-arch signal.c file
Date: Sun,  7 Nov 2021 20:51:02 -0700
Message-Id: <20211108035136.43687-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52f;
 envelope-from=imp@bsdimp.com; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Mon, 08 Nov 2021 03:59:30 -0000

Create a place-holder signal.c file for each of the architectures that
are currently built. In the future, some code that's currently inlined
in target_arch_signal.h will live here.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/signal.c   | 1 +
 bsd-user/x86_64/signal.c | 1 +
 meson.build              | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/i386/signal.c
 create mode 100644 bsd-user/x86_64/signal.c

diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
new file mode 100644
index 0000000000..ac90323365
--- /dev/null
+++ b/bsd-user/i386/signal.c
@@ -0,0 +1 @@
+/* Placeholder for signal.c */
diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
new file mode 100644
index 0000000000..ac90323365
--- /dev/null
+++ b/bsd-user/x86_64/signal.c
@@ -0,0 +1 @@
+/* Placeholder for signal.c */
diff --git a/meson.build b/meson.build
index 26c58123e9..14b0bb2042 100644
--- a/meson.build
+++ b/meson.build
@@ -2888,7 +2888,7 @@ foreach target : target_dirs
       base_dir = 'bsd-user'
       target_inc += include_directories('bsd-user/' / targetos)
       dir = base_dir / abi
-      arch_srcs += files(dir / 'target_arch_cpu.c')
+      arch_srcs += files(dir / 'signal.c', dir / 'target_arch_cpu.c')
     endif
     target_inc += include_directories(
       base_dir,
-- 
2.33.0


