Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u2E88-00078T-O8
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2025 14:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u2E86-0006uw-Ej
 for qemu-trivial@nongnu.org; Tue, 08 Apr 2025 14:57:02 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u2E7v-0004Js-K4
 for qemu-trivial@nongnu.org; Tue, 08 Apr 2025 14:57:02 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso38999735e9.0
 for <qemu-trivial@nongnu.org>; Tue, 08 Apr 2025 11:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744138608; x=1744743408; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Aar0fJ7Vs4z1geDlA6Q01FVDg7iAx6AqY33ZS2R/YkM=;
 b=jwNKARXBKbnXnOCJ6a99cY2TDrEywIAcxRC3yUIQGgVBHWSkNpmdO710uUzAt6REe+
 YcUCqNkofQFlQttC18wA6IJ+gsi679Nl7ynw5+PIhqs5XIFtjIH9KWjCf+7hmJCOrK9k
 dReLmtTLmcSVOnrRL0GploqABmhF4rY8ILsNdh1RDr4lPghs1PVm3JN/HTwN1Vg5fQXV
 /4W4yENisUSV2lTLjuXwzPrZyIRIlPPEdxsOUoLJn/9BLXvztl3nWb3XsvBj5x+2MyqE
 gM53rDu2ukhXB8Ox7D9tD1CE8hHkEq8BITjKDRnr7EgZ2C/QbiOQtLSewQBAV5kYeZNV
 e3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744138608; x=1744743408;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Aar0fJ7Vs4z1geDlA6Q01FVDg7iAx6AqY33ZS2R/YkM=;
 b=vK9AgUgo+L6/9BekllOviZrelTbSRdttVWGYAdyPisDH++xB3MQqWKMjL5SGDyqHXl
 9Nuv9Ayn5gpLOYLQe71qZktaZPigUmwq56P7bdUjHRM5D9QE/0t8nFkxkVPJv9F36cCS
 Cpl6K0MISz9t/1qWCQbkskG4E76J2AZ+aofkzofY/9gbaaO2NrLAawd8RP3zlN0wHJH6
 vBLkbm3OxinST2wClmufILc7jq62XmJVy8SAktKQtzVf0vNYkYBVuImr+koEGsc7m7EF
 4saoMpS+u0Pw6xWULeQibKNQGtccjCTM3mVlF8aff0rzimhC77cnozU312TQmZP0lT/B
 r8zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx0hTYuOMgaEYDyx0SzzleP/H2P6ReFCDHXJNsfb89Smyk486xdqm8WPdjaH67FlNjqxfC0ZoqjgIYyrg=@nongnu.org
X-Gm-Message-State: AOJu0YxKvVGEfmfRKeax5c+1OrQGOE5g4gwqLGw/nj981dYxGDMu8aCW
 vsOfN/r5uZdwU7e0m89zWRMTY/JOvVsFCzPTBzfKk0yU4lQkr5uHEwqXPzanxwO56CBvydt1KzQ
 ifeQ=
X-Gm-Gg: ASbGncu/qYl8TEvPqLFuGeWLA9yIO/lCCVi9fAVdJn28Zz0b2uPN76xsYGOR2a0BCnf
 5jwomDqDCCkrTfVVWmDu+a8iGqpYvyTfTxv5R9U3qGN8WEpg9aUs4njBKSZLP5c2p+IewLDcLta
 9JD125KAOu12yJRH+f51rdDfLeFJmAzUxam2s8Se7wPuU1vwyjzyvgNHmZgGjVs6EbB1HubGvJa
 VTNPK001z1VNXGQMQuvTgHYBvrNNxMRkncykVHDXFfcyS0FLcI8JAoIfKG3nt19ac6hEDL7105G
 eG7mSdePejnoYMK4erk3DHiJQhMnUGLwGR+n8oBhuNmEGN8M9pdN8VMjRyZ/vSWbeFkVXbaeBJF
 BfcdHRBX19AuJ
X-Google-Smtp-Source: AGHT+IF7r+OdHif1nTU2mBrUYmvofGlvkInl34cpcpHmVd5KfXG5VkXIRiGC4sT7Wh8qiV9M5gBm4g==
X-Received: by 2002:a05:6000:1863:b0:39c:1424:3246 with SMTP id
 ffacd0b85a97d-39d87aa1e43mr292400f8f.2.1744138607827; 
 Tue, 08 Apr 2025 11:56:47 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a732asm15876480f8f.30.2025.04.08.11.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 11:56:47 -0700 (PDT)
Message-ID: <151210e9-1969-4e55-99d2-53dc7e9d9864@linaro.org>
Date: Tue, 8 Apr 2025 20:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/checkpatch: Fix typo in SPDX-License-Identifier
 keyword
To: Zhao Liu <zhao1.liu@intel.com>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20250408162702.2350565-1-zhao1.liu@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250408162702.2350565-1-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 08 Apr 2025 18:57:03 -0000

On 8/4/25 18:27, Zhao Liu wrote:
> Fix the typo in the error message to help `grep` the example:
> 
> ERROR: New file '***' requires 'SPDX-License-Identifer'
> 
> Fixes: fa4d79c64dae ("scripts: mandate that new files have SPDX-License-Identifier")
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   scripts/checkpatch.pl | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Patch queued, thanks!

