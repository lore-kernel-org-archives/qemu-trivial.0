Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rrcpO-0007lr-0A
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2024 08:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrcpB-0007UZ-B7
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 08:01:12 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrcoI-0003Jv-BJ
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 08:01:09 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4156a29ff70so10215095e9.3
 for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2024 05:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712059209; x=1712664009; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1kjiUTZUDmebHpHvoroBhRzu2KMQB0AVpaRH7FSxUQ=;
 b=lEFURz30hSXdAdrNmY/1x/8bUf7obHInKB2El28RCfv2NNe1tJJ6qht4PgLzD90gLS
 8KKNMPsEIhTIpq4bZDk5rq7Rp60V4DOeg7/XRTEFwmmvlewvWcE52as1fFjJ9mMkT8Lz
 wD2Qlvp36kfg7k6BwjTcH2+ihge+gHfTkV0X4X5jaBJK3Ov86PdlpgX3tnh8AbJMazh8
 lDQJFwIIBjJ5KOBeRXbgAs6i+/6Y3FHAd+lkUuIh2PH3TFnpARNivwqC/Py4T0T5nFaV
 eIP/WkZGN9MrXkSrBzvtufe4KsiTDPdJ5JICj6+nwXCeB90+aHageYmIMtaun3YDb200
 Yv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712059209; x=1712664009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1kjiUTZUDmebHpHvoroBhRzu2KMQB0AVpaRH7FSxUQ=;
 b=es88JBEypJF73YBXu9TybqJMsBP5cdxenez/uc/reJM+zu2Mp4zjBskJnpA/ljoexq
 B0WN2vjS0sIMnF1/lzxX3JY391LUryuXRf7MladNcyBV/1kVYKHn3m6/HmhI8dRqDndL
 VV9aBwNqsai+9B2yWpUi284A+SVP+uLfsJkM94Eyav4og+2egXobfqlkfVS4EbTbLhtM
 QakGauC77XvZXxZC1SjpBUQYyIRqwZhFSp7LMFUxvn3LGy7nGmwzqV3s3/k7uUrnpVpv
 9YrnscldD3YHTzGm4nwfjtdjk6a2sdOfYviYsKpK2029TCuYbv9NSCOB4i8lNrCCtqin
 PGvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoGGEZ6KIkRTjJGKUQNXx0VYxF0M77AZ33OpXdA4wOZ89aVJCYBIAwQx5nj8hAWpgmXnF5FX1vbN7BPcZXUEn9XG47TGsPOA==
X-Gm-Message-State: AOJu0YzuWYG8j1f4NnZV8v+1kRfaOhsTDN1aBm6Oo1Ib4ZSPBrAhRuad
 PrVSYHc+5BCQ22DOS4bbNfEusiQfb8+Kvq2xfOFQyRuu9RfQkEExgPir8ZExamQ2LcR7He0dwzn
 tXos=
X-Google-Smtp-Source: AGHT+IGhs4CvOkK63Lj00QvbIWNPnDa6ZkMHU194Az5nSki+CIQBDwgMVTWPVov8iqczXa4xcQUa0g==
X-Received: by 2002:a05:6000:1449:b0:343:439a:5962 with SMTP id
 v9-20020a056000144900b00343439a5962mr6779612wrx.1.1712059209471; 
 Tue, 02 Apr 2024 05:00:09 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 ck5-20020a5d5e85000000b0034349225fbcsm6780280wrb.114.2024.04.02.05.00.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 05:00:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/2] scripts/checkpatch: Avoid author email mangled by
 qemu-*@nongnu.org
Date: Tue,  2 Apr 2024 13:59:57 +0200
Message-ID: <20240402115958.67615-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402115958.67615-1-philmd@linaro.org>
References: <20240402115958.67615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 02 Apr 2024 12:01:13 -0000

Commit f5177798d8 ("scripts: report on author emails
that are mangled by the mailing list") added a check
for qemu-devel@ list, extend the regexp to cover more
such qemu-trivial@, qemu-block@ and qemu-ppc@.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7026895074..12e9028b10 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1573,7 +1573,7 @@ sub process {
 			$is_patch = 1;
 		}
 
-		if ($line =~ /^(Author|From): .* via .*<qemu-devel\@nongnu.org>/) {
+		if ($line =~ /^(Author|From): .* via .*<qemu-\w+\@nongnu\.org>/) {
 		    ERROR("Author email address is mangled by the mailing list\n" . $herecurr);
 		}
 
-- 
2.41.0


