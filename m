Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcLsg-0000dv-4m
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 03:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsd-0000Zt-8G
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:35 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsa-0008GX-BK
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:34 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a3d484a58f6so677614866b.3
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 00:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419211; x=1709024011; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/tc2tgzYdqf1GRKL9zR1dRy/HHltPh9jD3TH0i4ovo=;
 b=BLs5FPgj0FTL7BqwpifHkCMnxxhLu6Ea7x7dnAup3/8yZ/3BzTA03wNvJ+p3/B0rdv
 UA+CPBV/tzumva24fTJ/PPY5PMKI4yVuw8oFR7NPuZgVQ5FgV6xlGI/DTVcUGenuLWMd
 khkEG5lJjzkjkJ/TLPIwP5ofsFRUe4n8DNX8SpOIAlIZ/kV/kMjfIKwNSWiPP+mH6Qag
 rsg+D36jOay5NWgHQO4UBvc/YA7jo8heKnYNWoCSZ6/MlUGU+W1w+hTWX/tWigJykhoY
 sdL4/z9xhwGTEpOlsicRe8yhh6ZGpN6/0rCNjtPUVKIT7tv6gaKqotwNjhhTXHhNPCZC
 N9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419211; x=1709024011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n/tc2tgzYdqf1GRKL9zR1dRy/HHltPh9jD3TH0i4ovo=;
 b=DI2WHZGFTsyzgkzSaI7A3I0JnupUP9qX+wCkE1OBT4zRt3Pf3usf5AE6aZbrJ457LQ
 /wPbdmxRGZzquwm1Nghlq8FbKHTyyVLnqlSi+5DKm7JH//lPauVkSDk4lJRzxNkGFUnc
 Skvo3uIeLVWczwJCLT/QjOo0dbQrdyp9BKAyigc+X0OgO5kkiHdz2fO9lLNzFdI7KqLn
 6AP2Zj9gTUnVsyQrXvCHaTKNf9DtUPe6yGkxhWj72O3IENWT8ytOdaN56zQ/DReV2W/W
 go6zhMFpOO1C7QtwF0Qy2lkGIsz4cvDzov1XBcJ9h+R5yNMwLqbczxrTsR9QCMQeh0kq
 BsBw==
X-Gm-Message-State: AOJu0YwOSwu4GxHlylO92JgAGTZGFzCpY89LrqCO7ECl0WWnRPoDGQ9Y
 Zc2ljD0xYwPV3563UuKPJ4vhhfrbDWATdP3TfXs+YnxOjXcGQEyq5dZaFmg1stojgZi9/ca5bLD
 vD5U=
X-Google-Smtp-Source: AGHT+IH5qV55MwovROUTupL34Mwv5bX7pdp36dJlAQkyKK51UKIejDgCLTWpQ2SHo3XxbosKPiOcoQ==
X-Received: by 2002:a17:906:dff9:b0:a3e:8223:289a with SMTP id
 lc25-20020a170906dff900b00a3e8223289amr2982024ejc.31.1708419210859; 
 Tue, 20 Feb 2024 00:53:30 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:30 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Alessandro Di Federico <ale@rev.ng>, Anton Johansson <anjo@rev.ng>
Subject: [PATCH v1 18/21] hexagon: correct typos
Date: Tue, 20 Feb 2024 10:52:25 +0200
Message-Id: <10db19d340ac3f275900f315661904d1aa004949.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 20 Feb 2024 08:53:35 -0000

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/hexagon/idef-parser/macros.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/idef-parser/macros.inc b/target/hexagon/idef-parser/macros.inc
index 7478d4db17..94975d9583 100644
--- a/target/hexagon/idef-parser/macros.inc
+++ b/target/hexagon/idef-parser/macros.inc
@@ -127,5 +127,5 @@
 /* Include fHIDE macros which hide type declarations */
 #define fHIDE(A) A
 
-/* Purge non-relavant parts */
+/* Purge non-relevant parts */
 #define fBRANCH_SPECULATE_STALL(A, B, C, D, E)
-- 
γαῖα πυρί μιχθήτω


