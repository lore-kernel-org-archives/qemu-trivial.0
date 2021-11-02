Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2fB-00082A-W8
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2fA-0007sI-1G
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:52 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:33789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f6-0002uR-7s
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:51 -0400
Received: by mail-io1-xd32.google.com with SMTP id z206so654065iof.0
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qscs9QmnQjITLDaFiEf4Oo6T7Y3KGHp4Rky0uLwfUp8=;
 b=KJekdd+GfjIYcouCPvv36UZHH7c0W95GcU4321gQkVaCPvcev9Y1o0mzCWS20zgt4D
 8nwapjj62/AlfJqTHCb5uP5IoMD8z+8oUqHP0a6FdV9m+Z8OHLyy2Lzic9ZuOhTUTiH3
 DD1elde+2GE51hkXjcpyTXoidBnncR6kbt08ir07bId3F5KFOAzpgpp8EKt2GKdeqZ94
 9f8qpiBswc0fJJ7pj4AIOUoYF6e/gPj5/kVA6cMbVrAbZWozCgdTNP+WSCQXjq/NdZkJ
 R4SzFSTQXt75vq25bhVreaUiDgyy5zcFz6HQ/K1pVAp00B1ElT6+IKVhritPhK9IRCUf
 y5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qscs9QmnQjITLDaFiEf4Oo6T7Y3KGHp4Rky0uLwfUp8=;
 b=gsQs8ENYRewTdPpVAAyzkhbkfPPigIxjXbwSG43GFyBwpP8hY37TYWuZaT/v1nlM+0
 5JAn32DOOnfi+1gW2YayMLR1lzJz+1unq5foBqvZT7YffWKiOs8ylf6Ge/z7cryn45ca
 te42ecefCp4b5ygtAfkbdpGBVeuqToTSJHkEERb6d/KNPW2f8yGJ/kv9wcl25Kc7bTSl
 PWhDa1Rv1x4oRnZdEDI5iwGo3PvDurHKe+xo0yahgXMr8+HlZJ7ytCQb902E4ZXvnBGe
 ZacgY9TSAMEXZspnzhGSvRvwoffcpPO65hI/+xgYLVdRiJFSYIj7t/IFp46/Gaf6jrNd
 7ILQ==
X-Gm-Message-State: AOAM532VS/Gwl+fzii3IuQ4RKdzVHEIpQrzrxY/nOJXAnC9kFFYNaenS
 7oFh0EVIzjk54u3z3vBnmR0kWw==
X-Google-Smtp-Source: ABdhPJy3qU6YeuD1ekeCrOU4G90YuWMTkq7fCzQATCjHa0Wo9NLcsQuAxsxgGwIOExpgsNBNWShN8w==
X-Received: by 2002:a05:6638:258e:: with SMTP id
 s14mr14958830jat.111.1635893626997; 
 Tue, 02 Nov 2021 15:53:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:46 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 27/30] bsd-user/i386/target_arch_signal.h: Remove
 target_sigcontext
Date: Tue,  2 Nov 2021 16:52:45 -0600
Message-Id: <20211102225248.52999-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:52 -0000

In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
Remove vestigial target_sigcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/target_arch_signal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index a90750d602..e262667bda 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
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


