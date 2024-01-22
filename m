Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rRuzb-0006OY-BI
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jan 2024 09:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1rRual-00089B-KA
 for qemu-trivial@nongnu.org; Mon, 22 Jan 2024 08:43:59 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1rRuai-0002mU-Sz
 for qemu-trivial@nongnu.org; Mon, 22 Jan 2024 08:43:58 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d751bc0c15so7787135ad.2
 for <qemu-trivial@nongnu.org>; Mon, 22 Jan 2024 05:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705931034; x=1706535834; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3hIggqEqKA9JzTGgr2h/ijbASg+Xod7v5jcTn5sOzL0=;
 b=pmPXEkMdXf9gJGBmFfSCFdPc5CYsfy7ImoSBMf1KQfpY7AwDx1ZiZvadPLSrVznrFA
 RkYKxhWnUTjg49YVVVrvtK6nCmQPOafbgLYzWSG5MPOIiPMENlmn9kREjpiF3zMu5X/+
 TLGwuMj+Dp7GmjiDGuuv4+NiWQmdA6M75ghstSEFBuAG6SvR654o2fpPaYx+OPbJyVq0
 EAws3aZ4PqexaQQ8Jh5j5G+xgjJSp6pnaeZgydPGU7tNei669Otb3Tl0ETplL5YiAYvV
 MXLesi1vDoQovApRDrOhyXzFB3V/Dh0Bhg/g0LczBwGZoPIuuhov609/PkbfunSzQH/c
 q2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705931034; x=1706535834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3hIggqEqKA9JzTGgr2h/ijbASg+Xod7v5jcTn5sOzL0=;
 b=drCwws1kwtuplRiWxXE1rEqJRWbz8gCnbh+NzPV1+rB1uItXxj/9kVmWdMVi//kOc3
 S7nr9CrWjI02nFCs0W55TRjnf/ErmDV6IIcTkcWnDxxpbxsSZKq8z3wqD0b7wiu0LbXT
 c3zsXfcqXAMZjI6WS7bYuex3+H8yKozOhuiPV2fuap3khWLgyXEfWZHYRE6Lly/Q+eKU
 qBc8KNcu+gzYUO5jcAmHQ5Y9+kmx0N5STDHQzeB/1OUyDSYExEKIw5wd83GlOD0j0BP6
 9tu+mTRh72Vv37eKVn0LJc00ltBRdavCnGlL9yILtO+Yj4rd9fTXJt3Pm68AASGR4dRu
 wR3Q==
X-Gm-Message-State: AOJu0YykGJK0H4WqMl6iwvw9ytlGADSUdAuS1BrzTrSpsH9eiEtjcYVm
 iQYN+zoofuRVlQTvVYCZzTAJlGHwSQYJNkaX8Mma5DL7nVJFstpVGop7YdHDCxX2GPa1Oy5gsVy
 cgUk=
X-Google-Smtp-Source: AGHT+IE27+m+u7ZrvCktBND+l3acSK1OdYGc3qu/0A41uTyWkT/FJrsQ4JiqhHmij2FN7R5O+Pg+mg==
X-Received: by 2002:a17:903:1104:b0:1d0:6ffe:a1a with SMTP id
 n4-20020a170903110400b001d06ffe0a1amr5173858plh.120.1705931034288; 
 Mon, 22 Jan 2024 05:43:54 -0800 (PST)
Received: from amd.. ([2804:7f0:b401:e1f2:3e7c:3fff:fe7a:e83b])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a170902e90600b001d720956b8esm5398732pld.77.2024.01.22.05.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 05:43:54 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-trivial@nongnu.org
Cc: philmd@linaro.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 richard.henderson@linaro.org, gustavo.romero@linaro.org
Subject: [PATCH] docs/system/arm/virt.rst: Add note on CPU features off by
 default
Date: Mon, 22 Jan 2024 13:43:34 +0000
Message-Id: <20240122134334.91411-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 22 Jan 2024 09:09:37 -0500
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
X-List-Received-Date: Mon, 22 Jan 2024 13:43:59 -0000

Add a note on CPU features off by default on `virt` machines. These CPU
features will remain off even if `-cpu max` is given so the user must
turn on them explicitly on `virt` machines.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 docs/system/arm/virt.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index c245c52b7a..0e9ad526b4 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -69,6 +69,17 @@ Supported guest CPU types:
 Note that the default is ``cortex-a15``, so for an AArch64 guest you must
 specify a CPU type.
 
+Also, please note that passing ``max`` CPU (i.e. ``-cpu max``) won't
+enable all the CPU features for a given ``virt`` machine. Some CPU
+features are ``off`` by default (e.g. MTE) -- see machine-specific list
+below or check them for a given machine passing ``help``. For instance,
+for the ``virt`` machine pass ``-machine virt,help`` to QEMU.
+
+For example, because MTE CPU feature is ``off`` by default it's
+necessary to turn  MTE ``on`` explicitly to have this CPU feature
+available on the ``virt`` machine, even when ``max`` CPU is specified:
+``-machine virt,mte=on -cpu max`` .
+
 Graphics output is available, but unlike the x86 PC machine types
 there is no default display device enabled: you should select one from
 the Display devices section of "-device help". The recommended option
-- 
2.34.1


