Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcLsi-0000iJ-1f
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 03:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsg-0000dn-1j
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:38 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsb-0008H0-Rv
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:37 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-564a05ab3efso1979495a12.0
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 00:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419212; x=1709024012; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MUu5a76jY50nFXASHYB85g2gMeODgMhQO6/aUsbeOwk=;
 b=Z0Bt4TVRq2O03dtBCEP7PyvVdREEGogaSNzCqx8s0YY5eRv9zneQ15txxQacljjz4T
 /2gzwInDkTo1jDusVinjzYFqahZEE5J+GP7zc8CRSzqgcjP+Lo1DShoe47C8zOfZ7mHu
 FkePGgYEB+NFxZiyz1J8ZANeD9uOoi6mqRr5YwgOF/1yDWhskqttx7itaFf5Sn9lspFd
 yLiFeVrNNLPK36wE2tqSVgEUQtrT1TcMiauhShPwtJDgM9bzJn67MnP5nEtIivuUv0Zp
 tIF15DCdvwEXuLNBJxVynr7tnOQIjxH+3AOI6C7yzaXEw8G7QOBLYJFN6rrjbMDk5uYb
 Oqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419212; x=1709024012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MUu5a76jY50nFXASHYB85g2gMeODgMhQO6/aUsbeOwk=;
 b=JAmqjo87HNRa+vEuTUHNR5tHcCvIbmUEdBsuPlyyEqAtTa/6PRLkuMPHC8rwlxvrye
 jei1OVdWS4/qLA6xgis/OPzyIHTwlZ/B828wnRCC99a/xQvYzgGdYL8sBr2R4JsWEw/e
 o8j9UMmVEb7xUHQT6LsD977za464Muh+57TyOyBw2n74RLyfdElxGKbbyLwdXi/nFCQK
 C09aAqQjeULSqrTdELhHHbzDn/SplEXrN1o7G9xwp4ltJ7+DWla6r4fvg06vaPBKV1Ng
 1jltN/9yCPCPD5QgIoKTNMs4bbASqLkv2cttoW608g5H84i4MUA26OQZCX9yQs9wdxT0
 zHXg==
X-Gm-Message-State: AOJu0Yz5Aw0QgcrgZVFk6XyrHgbmHZlf7PSUwZ5R+KlVetVJNZJAmVOA
 m9QEhMyYopT2Dygy3X1wqGXggGmya8UgNeeL5aR4AybW3U8KwcGkqBnqKJrpxrDecki1wVTI6YX
 uxMU=
X-Google-Smtp-Source: AGHT+IHpL6/7f/V6MddKY5h8nGC66oEHaxJ/oG2RUhoH6YSIo4i4RDkTQ54lOTSfJopnQ3F2N12RLw==
X-Received: by 2002:a17:907:9869:b0:a3e:f163:75ee with SMTP id
 ko9-20020a170907986900b00a3ef16375eemr1054420ejc.75.1708419212190; 
 Tue, 20 Feb 2024 00:53:32 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:31 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v1 19/21] m68k: correct typos
Date: Tue, 20 Feb 2024 10:52:26 +0200
Message-Id: <e24a3deefb9d721ace414719e8b773e6bf787fcf.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x533.google.com
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
X-List-Received-Date: Tue, 20 Feb 2024 08:53:38 -0000

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/m68k/cpu.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index aca4aa610b..57e3b6d3ce 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -478,10 +478,11 @@ void do_m68k_semihosting(CPUM68KState *env, int nr);
  * The 68000 family is defined in six main CPU classes, the 680[012346]0.
  * Generally each successive CPU adds enhanced data/stack/instructions.
  * However, some features are only common to one, or a few classes.
- * The features covers those subsets of instructons.
+ * The features covers those subsets of instructions.
  *
- * CPU32/32+ are basically 680010 compatible with some 68020 class instructons,
- * and some additional CPU32 instructions. Mostly Supervisor state differences.
+ * CPU32/32+ are basically 680010 compatible with some 68020 class
+ * instructions, and some additional CPU32 instructions. Mostly Supervisor
+ * state differences.
  *
  * The ColdFire core ISA is a RISC-style reduction of the 68000 series cpu.
  * There are 4 ColdFire core ISA revisions: A, A+, B and C.
-- 
γαῖα πυρί μιχθήτω


