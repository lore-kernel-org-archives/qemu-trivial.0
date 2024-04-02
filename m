Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rrcpF-0007cW-UI
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2024 08:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrcp6-0007T6-Sm
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 08:01:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrcoD-00033y-1S
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 08:01:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4161eb1aeaaso690535e9.0
 for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2024 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712059202; x=1712664002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pf6iAlvC95lcmhl6PK/jcsdEbiggfdr3Doja1fwCupM=;
 b=xcSG5IT6eExeSD+bgObGZCIvOPb+OgKuNwJTvSYHRkDcyt6RGB3klBVpPMv+XDoCWx
 3CfH8VGzoXzr4MI52db8MW2xyy4o3hvDSrInunNsureF87Ab5dfsYGQ82dFHcyaRweZZ
 fas+ryo6nUXPIwTuE8ROTXMMq41JFkPsI7PjUZsnIgWYJRDz3Unoj1RlIZBPO0s3jasj
 fqp5Bwf0LaAV1/Bnc5lTRQv/BPk/t+UTjTFaEpbjM5C/ASuVQiW3k6GKqobeZFSZcyCe
 qTBvNkwoLbzmMQarBJIQUfw06bi2mqWBiyX97wvGRpBC9l+l9V5wbqRsTkf7EpaP/ttW
 9qFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712059202; x=1712664002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pf6iAlvC95lcmhl6PK/jcsdEbiggfdr3Doja1fwCupM=;
 b=LZ44x5omQlUUD7FWcM4kEQlF26PEVwrxusQgHgFTd/Ae5Kj7S+pwbk5L5fyPigFmjN
 TJKNSlkY/FtdhBjn1NLMfM3/dHpgY8X59BGlYoIQo07cqBmc2i6xNAkEDse37lLP6mQy
 fnxS/SxZfygcy4GCKAxguNrLqJPYEH1nc8UFMvf/oHTXrfrMJlyMGjrpciEh2YKhOnT7
 EbUu+CqKCYaxplEexZMDIxKh+lpGSR8A/0+FoY9L9xMLXyeLbqjRrkcIjrMo634sqhrF
 8lWNDFp1G/7no2hDaUqe7c4Fan5F6p/5hi0Oc+51vUpkLNunBDVthHxDKin7twQk3IWb
 ZiNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSbL5L2vVhWZfXGSOnN6/jIaHDq5EOUKMnsgXvzVgPfGcjiOCTD/YaDyTuB7FAlmBLVMzN0ykCSe+8BGOxdAUo3k6xlYFNZQ==
X-Gm-Message-State: AOJu0YxPQjbnZThesoGyU7TDTlbncReFoYaJCIamyUrX5wxj7NscLTF4
 SSlygG8Mx1o3lCkrBBfSXZMaySGxwZtkfpMiLpuGrgeYPJQAopAvM89TEBw7z3g=
X-Google-Smtp-Source: AGHT+IEg4VxtfFHoptXE7r87n9Ghvb4CiBIU28SZPBGwZVem9JGzPDqibtpAEYrHeLNEY3jfzGELVw==
X-Received: by 2002:a05:600c:3b17:b0:414:1325:e8a8 with SMTP id
 m23-20020a05600c3b1700b004141325e8a8mr8443095wms.39.1712059201954; 
 Tue, 02 Apr 2024 05:00:01 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c1d8200b004156daeee90sm3482495wms.4.2024.04.02.05.00.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 05:00:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/2] scripts/checkpatch: Do not use mailmap and check
 qemu-trivial@ author
Date: Tue,  2 Apr 2024 13:59:56 +0200
Message-ID: <20240402115958.67615-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Tue, 02 Apr 2024 12:01:12 -0000

Since v1:
- Extend regexp to cover all lists (Peter)

* qemu-trivial@ is not checked
* mailmap hides the mistakes we want to catch

See https://lore.kernel.org/qemu-devel/60faa39d-52e8-46f1-8bd9-9d9661794880@tls.msk.ru/

Philippe Mathieu-Daudé (2):
  scripts/checkpatch: Avoid author email mangled by qemu-*@nongnu.org
  scripts/checkpatch: Do not use mailmap

 scripts/checkpatch.pl | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.41.0


