Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rg86i-0007M9-A0
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2024 13:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rg86h-0007Lr-Fr
 for qemu-trivial@nongnu.org; Fri, 01 Mar 2024 13:59:43 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rg86f-0004KM-R3
 for qemu-trivial@nongnu.org; Fri, 01 Mar 2024 13:59:43 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33d9c3f36c2so1211353f8f.2
 for <qemu-trivial@nongnu.org>; Fri, 01 Mar 2024 10:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709319580; x=1709924380; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ForxCwRxQPhQOXs3n4FwdU8zqqg+YL37+9IjHlcPlAc=;
 b=bLIgXrNG3AxczG0vsjpK+iUjJj+NO0OJn0Sm14iiT/YLVhCqp4bl+XU31xvmguCj84
 5VaTED5mfrTBLTCkGnHMh4SNguB3M25o6aaH8DB4hkZIktS1V6uDhNsuThRd17Xt2fRX
 3uuu8UPPGzR81veUE2hg6mpWmm3LF/RAKXG51Rw+qWK+NuzoI10o0ur4lGAsn2Jc10ua
 Uh3ZwZD8Zn384dgAo2d6LePQx99WN/d3fcMbGXqghAo+Y8UNCCBcKLX3UkXMz3Lj/TjT
 jcObZp32SOoUxpYq4MS49YtLPtEAk1OiKmzLtidzvODfzbGjtSRRAS4v0EnBvRlQjyCs
 nNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709319580; x=1709924380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ForxCwRxQPhQOXs3n4FwdU8zqqg+YL37+9IjHlcPlAc=;
 b=LU2RzT9+XmzfQTJGe7moZDb/Zd1FP5MO5GGFzD0Hbem95H7y4pW1Inbu9ETo3auuFm
 Z6JlwKKYEPkIKB/yKMy+wB3FP1yUQ6kQkYqW5yXhND4GmB9HQ0Zvk5poduH1nRgLDy1j
 MZInh0pNCTr86Mwx/7RY6ZTEOXz802zyhsJz2hyKLB4cEHK2f/mTYhxQRCE6PiyRWK0g
 y5avbwRsxQn6l5j3X9QjxsVO91a97loTgjJAmchq6FHxaDU7Y6G7CcDmG8uvqmJS6mOM
 AF3rTuzMswdgZ1AcB3imunkBI3CCuS+YEwbANoAiz+fcjSownZBLIAcf4A5YXqFDFmxD
 gNGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8KCroIBvjLNZCErVJZYTUYv5UIZNt3BMSV1lDa7c7ibfyC5ERXiQvyo2sY+qp7UQ3kx8cEEEVs/zy2c0rfijUKKv1YXDq7Q==
X-Gm-Message-State: AOJu0Yy7cDXbCniV2xCQNnLrpyRlmgWWhDtj+G9TvgoqCEVNI60ue3TV
 TEFeUr44ms69tIxjMSRxSWbM1R4RFzdLG0lWZYD47E3tGpYdr2ARFKNQWL34INE=
X-Google-Smtp-Source: AGHT+IGoD1o0u7osqWHycHOxow0ZB/NLOF/AvtpVZA+f1LM9k0sycOJxjAsC2txXYEoFcmNkB3oagg==
X-Received: by 2002:a5d:58f4:0:b0:33d:5e19:e1eb with SMTP id
 f20-20020a5d58f4000000b0033d5e19e1ebmr1903848wrd.9.1709319580145; 
 Fri, 01 Mar 2024 10:59:40 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.84])
 by smtp.gmail.com with ESMTPSA id
 bu28-20020a056000079c00b0033dc7e50488sm5405762wrb.96.2024.03.01.10.59.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 01 Mar 2024 10:59:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org
Subject: [PATCH 0/4] hw/i386/pc: Trivial cleanups
Date: Fri,  1 Mar 2024 19:59:32 +0100
Message-ID: <20240301185936.95175-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Fri, 01 Mar 2024 18:59:43 -0000

Trivial cleanups, mostly around the 'isapc' machine.

Philippe Mathieu-Daudé (4):
  hw/i386/pc: Remove pc_compat_1_4..1.7[] left over declarations
  hw/i386/pc: Use generated NotifyVmexitOption_str()
  hw/i386/pc: Remove 'host_type' argument from pc_init1()
  hw/i386/pc: Have pc_init_isa() pass a NULL pci_type argument

 include/hw/i386/pc.h | 12 ------------
 hw/i386/pc_piix.c    | 18 ++++++------------
 2 files changed, 6 insertions(+), 24 deletions(-)

-- 
2.41.0


