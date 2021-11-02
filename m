Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi2f9-0007r9-Pb
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 18:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f8-0007lp-LB
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:50 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:33708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f5-0002tx-5w
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 18:53:50 -0400
Received: by mail-il1-x12b.google.com with SMTP id l19so720730ilk.0
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 15:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IP/CrjZ71MNpMBK9SbbROnnwU4huuf4Ai9hfA2D/slk=;
 b=XQqB4KgxunMQWpH3GPrDFJpoHDCdxNMVuDFedzg9FmRF54V/y7PtRbFjhLxRpI3PUt
 k9gPzClI9Vbf/THMfRGr0Opzy/ZPx6O7xRqpTNsfi81I0buHfLLJ0SZIWAseB05k+xOr
 HIS9D0njSp4gScV58PdmlBiUsiRI90gUtf2f6/LXz8AG6SC3Pl/VSuPGcgIYauXEziXC
 aNkeiwBAugBafN5j0d2meGmyBYEFbLgjlc+hmkFi5lvb9GBdbgKa2yK29ZGktmAs3Lxk
 hnqtgpUQghAgu10fAzgrxYg4sM+QyFJ09KJvsHOvCyHwEr5thXVDgfR1zKDa2pEnZSM5
 8XhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IP/CrjZ71MNpMBK9SbbROnnwU4huuf4Ai9hfA2D/slk=;
 b=WCPBUb5i3+MibNZHn0QcrTehLxdfeLPsoSiHTY5AmwSjGld6cZ8VkGVfBDLnrWqWIz
 F3Z+lDKg7hm9hZQ+XO+GsXmC2SLboGa5KyU7fdE5ggeXjvpI0/5/zKHfCqXUU+3qg7ad
 QCoHL7g0sFtAMfV4IxM7FMKIaD5ZKrVvKgYsCkoG4EV99WDdnl9Oz9+ZbrmxEioPnVL7
 comYs6sAgUDp8a8KqcWoxxDJoK/BYFcmZReLg+FKeQKVtwyFGUdYzvK/ybcIyuXDD3Ok
 wcmyIoRt7xCcolFgVw4Jm5QyFhRP7omN/NfJvqSiCs+oltoP/V2RePPCty6vGhXpOr9W
 y/Ig==
X-Gm-Message-State: AOAM533y+oFJOu1kdi3lsNT5mqRasXTkASPqZrSGZD/joRjFmbjfhoDa
 I7iVLtTuFpbzktJnw32cRcIhUP67H/fQeA==
X-Google-Smtp-Source: ABdhPJzVaBFfXxNzN017erO6cqwFdJ9t9sfNtUCHSkAtBorFFzIICmCkiUfiHUBJWoqGW1XoFMlYbw==
X-Received: by 2002:a92:9513:: with SMTP id y19mr26490865ilh.300.1635893626055; 
 Tue, 02 Nov 2021 15:53:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:45 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 qemu-trivial@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 26/30] bsd-user: add arm target build
Date: Tue,  2 Nov 2021 16:52:44 -0600
Message-Id: <20211102225248.52999-27-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 22:53:50 -0000

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/arm-bsd-user.mak | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 configs/targets/arm-bsd-user.mak

diff --git a/configs/targets/arm-bsd-user.mak b/configs/targets/arm-bsd-user.mak
new file mode 100644
index 0000000000..90b6533195
--- /dev/null
+++ b/configs/targets/arm-bsd-user.mak
@@ -0,0 +1,2 @@
+TARGET_ARCH=arm
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
-- 
2.33.0


