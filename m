Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jr3Am-0004Fs-Hp
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2020 13:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jr3Ab-00041F-IO; Thu, 02 Jul 2020 13:38:45 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:39372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jr3AW-0007N8-1b; Thu, 02 Jul 2020 13:38:45 -0400
Received: by mail-ed1-x543.google.com with SMTP id d18so19187455edv.6;
 Thu, 02 Jul 2020 10:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l6wuKz2C8HP67deoIdZIR1YuTZFXJvtoU6qcCbCDPz0=;
 b=oJ6wg1AgtkrqK7KVpfODrvTY8YIDPRTLJ60W6mW9Uguad6Ig3ZjDICBDkGoi7nKRCc
 Ro1BcIKbb+fvmGUclbtaPrcYlX3Cmvbr90RjMuis7P7qHAb2UKXGpgWW+qZjuuTzNQof
 2BwcVrzl1LiXrPR2Hxv+/UTLgK5nyq+pxyKKpZC//2LR/t5afeuEVMQqyBud48c2czsl
 TWaLYY3TE352sn0A1THxCRZ+g9fWml1U67qeW2/EjUiWnww9C8iHsc29M8nfRypJgwTw
 sL1n/HsEL6h/Ygr9pOKwqk9HdGl2ApRJ4go4eB9UVnaV5e4l7avafdqCC+IShqmLqJ5R
 sAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l6wuKz2C8HP67deoIdZIR1YuTZFXJvtoU6qcCbCDPz0=;
 b=OEHrfhkoyzs1cgDtyT1OK4cXQs/rL9BT1YiVN0M8bqTmHtgHu0e3f5q6rg9a/gRupz
 W2yOXhoMw+RSdO+BTGTeeMeHpm38CUZtJo/ii7f+Xdz41OfJgnIoY+5UNk8doFU71+NY
 u5/q+TfldHGs96wKwJS3EhJOK+MKvcBDfTscyaffQwPiBoBlV+f8me9Nna2LOQYnssh2
 v8KzgoKaoVY5SfOqOI/+YgxydKSmsZuexeALi8nvu9TZJNnHj33wLFBCEl+ckAGHFA29
 xn6o+Puxfo5z16Dg0icJ+kKBoCeLFTpPRt4NzN4vEds3POFiy0FKFGxOFdlmeEIIfazK
 o1ww==
X-Gm-Message-State: AOAM531Z9uxR3uKo7ML9tZs70lFvzwCb+AfCoHyWeE9iegNwi/8x8yHe
 gKxU3f/5K48AkVbKKY4HTPvvVFcss2Q=
X-Google-Smtp-Source: ABdhPJypmdlZlAIoz7X8Mg/fTz6Xe/gBYgAvBmCqARRXYqYlP2zWzhvE7WDRG8JgsC3biTtmqcgDpQ==
X-Received: by 2002:a50:fd07:: with SMTP id i7mr1973816eds.221.1593711516709; 
 Thu, 02 Jul 2020 10:38:36 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id w20sm5710344eds.21.2020.07.02.10.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 10:38:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 14/19] .mailmap: Display correct email address for Michael
 Tokarev
Date: Thu,  2 Jul 2020 19:38:13 +0200
Message-Id: <20200702173818.14651-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200702173818.14651-1-f4bug@amsat.org>
References: <20200702173818.14651-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 02 Jul 2020 17:38:47 -0000

Fix Michael Tokarev email address in the following commits:

  $ git log --committer=mjt@gandalf --oneline
  eb83c2030a hw/net/e1000e: Fix compiler warning
  5ce747cfac target-m68k: fix get_mac_extf helper
  3224e8786f timer/cpus: fix some typos and update some comments
  04ecbb7834 timer.h: fix inconsistency between comment and function prototype
  083b96e221 timer.h: fix typo
  e2f310ec38 maint: Ignore generated version file
  32945472ce Document that curses usually needs -k option too
  deff0ddb86 trace-event: display "%d" instead of "0x%d"
  8223f345b9 linux-user, trivial: display "0x%x" instead of "0x%d"
  8928473699 pic: fix typo in error message: KVM_GET_IRQCHIP -> KVM_SET_IRQCHIP
  a337f295de sparc: Use g_memdup() instead of g_new0() + memcpy()
  bc82585a8f vl: remove unnecessary duplicate call to tpm_cleanup
  39cba610a7 arm: spelling fix: mismatch
  0aadb5a15f hw/dma/omap: spelling fix: endianness
  270a4b6739 hw/bt/hci: spelling fix: endianness
  37e3645ad3 docs: Fix description of the leaky bucket algorithm in throttle.txt

Cc: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index eaed43a178..9bc80771e0 100644
--- a/.mailmap
+++ b/.mailmap
@@ -131,6 +131,7 @@ Marek Dolata <mkdolata@us.ibm.com>
 Michael Avdienko <whitearchey@gmail.com>
 Michael S. Tsirkin <mst@redhat.com>
 Michael S. Tsirkin <mst@redhat.com> <mst@robin.(none)>
+Michael Tokarev <mjt@tls.msk.ru> <mjt@gandalf>
 Munkyu Im <munkyu.im@samsung.com>
 Nicholas Bellinger <nab@linux-iscsi.org>
 Nicholas Thomas <nick@bytemark.co.uk>
-- 
2.21.3


