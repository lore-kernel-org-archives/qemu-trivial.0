Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqHcr-0000ON-1D
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jun 2020 10:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqHcp-0000Nh-1T; Tue, 30 Jun 2020 10:52:43 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqHcn-0002TN-L3; Tue, 30 Jun 2020 10:52:42 -0400
Received: by mail-ej1-x644.google.com with SMTP id rk21so20967361ejb.2;
 Tue, 30 Jun 2020 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3siTkfLjVJQEaCMkrInYfzFvhXImBmDXKhPhC0qsnI=;
 b=Itp09bPnnE+v0QZj7CqVxLdfeoIdNB18dIzkFW+fquQUkVr4y9bCRdInMqHprcouzs
 58Uk30JXnoEpgtiCq8zldQbrsXAGGf00a5GBPTXkRvt3kJmbUM2Wc9m6qm+2AK3N0uCp
 JF0AXD4wx4LvFbGFkeGAHD5zBiHEoy320fzPglBK2FaRLgs+6t2EnMHyv+ZDfWNwTrD1
 Lm+Xg9PhXY08mFDRLHDvJviOzaHwGPm4RWrDLhJ3KWe9B4v6LrJZpohEpEaPaSChsy6P
 vdhe3iwaDN6LDcymWDSheBQloe2L0tVIB9reITQskXZ6E42hX7rPFSZLNty/xfAB73vn
 4pSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U3siTkfLjVJQEaCMkrInYfzFvhXImBmDXKhPhC0qsnI=;
 b=ehgvnfj93GRa8JyvhBwPXm8pBWSlpx2ZvcbfFsMcnxb5jjf507xdf34Ql+VO2OaQw5
 F5ZWqPBhrV8RHF5q43A/8VmeX6RUbKA6nWUA9JRQHs8IU4mPgrcFYJxbYPV+mnT/zkvP
 lJBr+hEHjXvi9CdL/3OzDfcADbefTNWDZ47ThxdyfVquV/6YKLK/zCwHropoDZnG7+X5
 vSioN3owo+27qttjW7n2CijGMcuhqW1Wd1dbHGAzxoMww7HEC1dyHCqrVCwmQneWX1fL
 /H6l+dAIS+SHxuhKfmSAEd3e6a/7BmoUfO3aEw2saPdiodlkpJtAPcdJ4hH/xrslVr41
 UoJA==
X-Gm-Message-State: AOAM532kv8yRk7OrrplBiYI2xZfhGnpuG4R4i2lPtuY8J2tg1dK9dfZB
 h0e2xNvYghSU7boFeO0jAIBNYxtm1dQ=
X-Google-Smtp-Source: ABdhPJwzklpD4/ZaV2FA7KY678EJmrW0ES5j3FR4K1U4OAM9BvgdsDfvwkbsjhq47NL9yKGRmqVUNg==
X-Received: by 2002:a17:906:35cd:: with SMTP id
 p13mr18575164ejb.172.1593528759703; 
 Tue, 30 Jun 2020 07:52:39 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id p9sm2144569ejd.50.2020.06.30.07.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 07:52:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Aurelien Jarno <aurelien@aurel32.net>, Yunqiang Su <ysu@wavecomp.com>,
 qemu-devel@nongnu.org
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org (open list:Trivial patches)
Subject: [PATCH v2 1/6] hw/mips/malta: Trivial code movement
Date: Tue, 30 Jun 2020 16:52:31 +0200
Message-Id: <20200630145236.27529-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200630145236.27529-1-f4bug@amsat.org>
References: <20200630145236.27529-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
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
X-List-Received-Date: Tue, 30 Jun 2020 14:52:43 -0000

Trivial code movement to make the next patch easier to review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/malta.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index d95926a89c..5b371c1e34 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1426,6 +1426,13 @@ static const TypeInfo mips_malta_device = {
     .instance_size = sizeof(MaltaState),
 };
 
+static void mips_malta_register_types(void)
+{
+    type_register_static(&mips_malta_device);
+}
+
+type_init(mips_malta_register_types)
+
 static void mips_malta_machine_init(MachineClass *mc)
 {
     mc->desc = "MIPS Malta Core LV";
@@ -1442,10 +1449,3 @@ static void mips_malta_machine_init(MachineClass *mc)
 }
 
 DEFINE_MACHINE("malta", mips_malta_machine_init)
-
-static void mips_malta_register_types(void)
-{
-    type_register_static(&mips_malta_device);
-}
-
-type_init(mips_malta_register_types)
-- 
2.21.3


