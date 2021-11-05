Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mipmd-0005q4-7L
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 23:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipmE-00058d-3G
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:26 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:35567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipmC-0004Hs-L0
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 23:20:25 -0400
Received: by mail-il1-x133.google.com with SMTP id w15so8272831ill.2
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 20:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VTdt3uC+ttB19F3HtSXrERhSxFv3zvRil3LE5812gSQ=;
 b=ZvuVQbhWL752TFt/HIueURSaRxw7PD9VbXJ3EwFdDCXICqP5EbSW0pGRg6LwEhJoWk
 QPJQuET+/yHpdf1NYLwFY/VFwqx73+3TuqIZWKhYV7rnn812gCiSkg5bXj83RiHeAqa9
 T/6x2AUXgYP8t5IHJowkLCPSnpgWo5rk275Qt0HXrm2p6smhGGVXmXZkAiFes2GVe80X
 H9zRdk6Tth9qONYKZWs4jOK4vd4KUQFxQQHn13l3JBWODtokq/m8ifJrU96XGEmMpeYl
 9ConCB1sx5o7maHT6Sm0QNT8/anJX1tDa4Zx1tSLkZ/HwaDYQr8iSPoWaajqE3cKAnrb
 M1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VTdt3uC+ttB19F3HtSXrERhSxFv3zvRil3LE5812gSQ=;
 b=mfC9NBK0mEgawfSW05ipWnpvtl1O7+crv1d70m7lLX+nsLJ9I0+DLczatxbTuEXo+6
 4JP0LF8TT42sW+DNJ4/nuF4rnEkC7ITxsFXKDU0aEsOPibNp4HcHJsboTX+I43NTK7GK
 pxgVmNI1xbcKFrLbH8wgygsYCiF/ldoOFL93D5OgZm0IjmqVioiTrLTWygctPRH8EZ2z
 xi97JY+t9o8ZVaoVINEJOiAJqGeSFey0+j6pUMG38rjBiPvdexCkTtZu21XkW5DH0Weh
 A6dPwBfBmqKGlVWgFpstXAkgs5lbnIXRJN9q5y1G9Gz4tAdSjaRN/LianZIac37YThcI
 lh+A==
X-Gm-Message-State: AOAM532UBvP/qLIh1K08pBNmrA41k1o8MPxpiD8NbEySEl8oq7sixzec
 oXDzw9W1efQuTd+evNa/xHHXnw==
X-Google-Smtp-Source: ABdhPJw89eb2XtkOGxacss+CuxtYaCDDBtyRPbFK8CL0Cz12wSmbFe63DAP0G9HefwuVq5uZFElhLA==
X-Received: by 2002:a92:6f0c:: with SMTP id k12mr31350189ilc.240.1636082423674; 
 Thu, 04 Nov 2021 20:20:23 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v4 36/36] bsd-user: add arm target build
Date: Thu,  4 Nov 2021 21:19:17 -0600
Message-Id: <20211105031917.87837-37-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 03:20:26 -0000

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
index 0000000000..cb143e6426
--- /dev/null
+++ b/configs/targets/arm-bsd-user.mak
@@ -0,0 +1,2 @@
+TARGET_ARCH=arm
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
-- 
2.33.0


