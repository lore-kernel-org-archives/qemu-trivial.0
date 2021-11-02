Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2fH-0008LB-LV
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2fA-0007tB-6f
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:52 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:40764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f7-0002vH-Np
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:51 -0400
Received: by mail-io1-xd2b.google.com with SMTP id r194so572332iod.7
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SBbYIrt8GgDPy1/4QZKIQdNANGpuq0OiEn8qWDZ8UEI=;
 b=Q4VzVpf+cOExfAXn3gy3wLjiuPaQWSjqH2k3f/0D2iWiGYycbF/wKUyZ+au+kDUX2Y
 OSyZg7k/C+qaP8VRMpJlsWmKey9UcTRQXg5plF5rphSfzyuI2/ov2j7AgsnXls6eU2J2
 dvWR4GSuJuT2/1hp/ihqmu8W4uHq0D8EXlvTnXDhgFMreRdMfeiIT7WJkWx8cETFY7sk
 aripA5LT5Wh0qsB+PQOjh+ilFHmnmG1ROYPX/dh2JGYtgduoDJK/lGdw6cTVYMOZIzW+
 tou5xreG/Rg0VZKfwbeNK9PFIpWcUTTVDQzoOQBqzoqk/X9055ZExf1cFKF8YHEN6oFk
 RRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SBbYIrt8GgDPy1/4QZKIQdNANGpuq0OiEn8qWDZ8UEI=;
 b=wi2icXr/Pzopc7q6DeSyEMjuJaMyBOgML5wI51X30xTX0fgSOly14BKATgMlzJQah1
 i/HmEB2Q9Y+Ol6rzBcYFmnx5E/k5kXT+ZP+Pg29awNZgNbjZSLv0xOpJV6Vn0T9Rvo51
 Uc+QTGzYvjSwaphC9Jvv1OkeWY0yJaY5TzU251uSunf2Uxq+GiR7J9RZ+99obvFzzQGs
 52QKmNX6SILb9xMsdRms8NV7I40LiA/YOGDWz5d5HQWDcV2uEVDrjcOa5y/+bW1rFLRS
 LLz3/48OwEKOQ770b8I2TIPHXaoSUs6soHO5iJrw0H3faJWCUty2Ex3vLY2vkrnH2kwN
 WRHg==
X-Gm-Message-State: AOAM5324VUDzJb3oCBOpC5vjCu3AJgj0EJ0xPpzKVOViGRxRMC45pIY9
 3dTEYo4WOkkj4CoxuY2FBLXVFA==
X-Google-Smtp-Source: ABdhPJzgssMUhigVRBLna/CcLAtTXTDjEOYGJCYKQRaThHR51obui6BX/6nYT36D9vnrCjXZ21tbtg==
X-Received: by 2002:a05:6638:1502:: with SMTP id
 b2mr30614514jat.131.1635893627807; 
 Tue, 02 Nov 2021 15:53:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:47 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 28/30] bsd-user/x86_64/target_arch_signal.h: Remove
 target_sigcontext
Date: Tue,  2 Nov 2021 16:52:46 -0600
Message-Id: <20211102225248.52999-29-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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


