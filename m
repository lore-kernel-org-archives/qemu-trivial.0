Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcLsd-0000Zw-Bn
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 03:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsb-0000VW-N6
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:33 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsX-0008FP-Ej
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:33 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so572011266b.1
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 00:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419208; x=1709024008; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p2ZZZfT2mvh9TPWu1HLXXLptGZNuBkeMEgEXTk5vuuQ=;
 b=fBykam33pGzxcYHGA9CQh2lwzHmohd/zv66axXoM7ENs4qgYV9Vm0bkIV3MKJuuqZC
 tv633u9h0AMVtMZQMb6FdQ1/SyVENQFN7h7cv7Rkau9/ZYYA7Q+ac8X6FaLFWeGxlYtN
 sgRHL+Om23dl7aIi+xhdEfeqgOZD8pZ/Us7PTOD6jNYfqAE7o3J7MHIlytRvRCtTazqb
 IpFcHjiQs43x+j1BerhYNLsdg3sD2TDtzVRhWxEIvDI2slwyUi8j9IofQCxfRa/bHgt2
 zRSMYyVzVD7rjCoNbb+kNUisuhcNXLYthSIo5p7idWt+cLD7k3EUhnQ0b8ZHes/Ik/bA
 i+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419208; x=1709024008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p2ZZZfT2mvh9TPWu1HLXXLptGZNuBkeMEgEXTk5vuuQ=;
 b=oexdC3tcoe/EBkdRPjgjWEVewordJcbjKqj0qjihGs9RVZOvjkdY7AF6VHa9nRjuB+
 +xWeRhAmOsu7GmZ8bYsIX8c3UFqz0tekbRxII4fEJqX3AFa450phBwm0a7twBkvJ/O/L
 392I+0TiJMfivPPhW4tpH0dgj/FRQMbdo7GiwG3jdL0BVMFYWTlzt4+QTKYrqPEQhCv9
 SIU+qMFHGTvZkaOfbopn4mCONOcyRrhc5fqyimhWCSf0KcfcoWKZ7U9Y809CQUSGhgBt
 sVm87ZXMOQHCxplcl10Zn2rE5uhIepCCw3scvKkxinU4rS4SbeoHm28UoJRoGZ/l2EDv
 gimw==
X-Gm-Message-State: AOJu0Yze+wGHbgqReWqhLu4e+Y65aJN0T3u4toA5fZbnHzt2FAapQyqI
 kL779IR0FjIJGTshkP6K4QVYXcCICJAwHOKXtO0eSSfkJTInkEfKM22h2tU8GS2yreYd3bM0JrQ
 wm2A=
X-Google-Smtp-Source: AGHT+IEStIKtmT5AaMveWofLskvajnkJhh3rrgvT0Ejf+dFSKdpwnsFRJUaDAJEB4tg11nulmDpEIA==
X-Received: by 2002:a17:906:154e:b0:a3f:2c1:9887 with SMTP id
 c14-20020a170906154e00b00a3f02c19887mr686091ejd.21.1708419207994; 
 Tue, 20 Feb 2024 00:53:27 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:27 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH v1 16/21] qemu-options.hx: correct typos
Date: Tue, 20 Feb 2024 10:52:23 +0200
Message-Id: <be8b852de8adb887472d04016eec876264ea5a91.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 20 Feb 2024 08:53:34 -0000

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8547254dbf..9be1e5817c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2468,7 +2468,7 @@ SRST
 
     ``to=L``
         With this option, QEMU will try next available VNC displays,
-        until the number L, if the origianlly defined "-vnc display" is
+        until the number L, if the originally defined "-vnc display" is
         not available, e.g. port 5900+display is already used by another
         application. By default, to=0.
 
@@ -5511,7 +5511,7 @@ SRST
             -object filter-redirector,netdev=hn0,id=redire0,queue=rx,indev=compare_out
             -object filter-redirector,netdev=hn0,id=redire1,queue=rx,outdev=compare0
             -object iothread,id=iothread1
-            -object colo-compare,id=comp0,primary_in=compare0-0,secondary_in=compare1,outdev=compare_out0,notify_dev=nofity_way,iothread=iothread1
+            -object colo-compare,id=comp0,primary_in=compare0-0,secondary_in=compare1,outdev=compare_out0,notify_dev=notify_way,iothread=iothread1
 
             secondary:
             -netdev tap,id=hn0,vhost=off
-- 
γαῖα πυρί μιχθήτω


