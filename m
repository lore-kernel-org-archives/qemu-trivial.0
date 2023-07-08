Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qI9Ou-00008j-Iw
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jul 2023 10:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qI9Ot-00007u-56
 for qemu-trivial@nongnu.org; Sat, 08 Jul 2023 10:59:07 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qI9Or-000441-FV
 for qemu-trivial@nongnu.org; Sat, 08 Jul 2023 10:59:06 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fc03aa6e04so8846565e9.2
 for <qemu-trivial@nongnu.org>; Sat, 08 Jul 2023 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688828344; x=1691420344;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bYJJ4BlzuFNOisnx8/Z2jE2XrLbtVvTEWEszs+agcoA=;
 b=C5lQqjEJlmv3fKPY55rbhuH+Tt9mnl4AOa2Ul/isyoLBEQ9lCjHkO4omn0vmYA0ZLQ
 nlsTOY/M1eV1+++rsb/4MLhgFrrTlNvUN+6RxEj3KGcU6lUI6Y7UqpF8Y+MD5KjKoBwF
 CIQ+NhI3RWZVjMHbddofWO0toyI2MjUYN4tQjc0pepAWF0CrRkdojxen9OichD73N2Ss
 pGaevoDd10CNqPgeVUGSg7pBVdNjG72lGHWAI9wpvG3ZqOsML7ZJzAd8DmxnAB5+zmNa
 9bXVAhEyviastg90fhs3bKD4gL1iMhoKCqcScG4gaBhikjTaiRhwmGO3aFUVENuiwMiB
 8YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688828344; x=1691420344;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bYJJ4BlzuFNOisnx8/Z2jE2XrLbtVvTEWEszs+agcoA=;
 b=fo6tuh8NS2dca90yFwW+kfhm4Gt1vBNyNHXJ5f8AggeQco0OiTSYLvF6nRxmJ7i1/c
 k3lbQM+CIbG+OtB/9f2Pq0QaB9qXg0YbtCxPoBxTqUCE2VK1ir5orJYfscn1VY7oaNg7
 UfiABMG29ansdqhJPS6rFEYiMGKkUz9IMDvtanEFFixSNbk+iY75zSkSgjeyRlk4kQ3D
 /QmwuVc24dL00pOm4XAitkx77C0+7RLeTZL7gvwPUy/2Jb9CrcoTMhOI/M//mST3DFXD
 EOeevdzvfkMYh9WxiBXQOyw4jvAjXsrQGOBdEnvaBQ04jiWqSIC8y5Am3GIZcb12axGp
 ymKg==
X-Gm-Message-State: ABy/qLbgMQPATwM/NRHTz9dwpEbHVX7J6aTQ8dW4tzky5JQ5aL+3D2P0
 3Qj9dwsr/+uCsA9tAeMYdzLAhw==
X-Google-Smtp-Source: APBJJlFDhbEcC7bpIhyrOfomTOcPboIED1BUR1KhpCiqMOmzkDqLSXiQXnCWWeICnxK4zxEWhXKCug==
X-Received: by 2002:a7b:c44c:0:b0:3fc:4:a5b5 with SMTP id
 l12-20020a7bc44c000000b003fc0004a5b5mr3526421wmi.29.1688828343740; 
 Sat, 08 Jul 2023 07:59:03 -0700 (PDT)
Received: from [192.168.8.133] ([148.252.133.210])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a5d5543000000b0030e5bd253aasm7093580wrw.39.2023.07.08.07.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 07:59:03 -0700 (PDT)
Message-ID: <6cdfd5f5-c2c3-9190-5a90-618e01d8428f@linaro.org>
Date: Sat, 8 Jul 2023 15:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PULL trival-patches 00/10] trivial-patches for 2023-07-08
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <cover.1688793073.git.mjt@tls.msk.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cover.1688793073.git.mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-List-Received-Date: Sat, 08 Jul 2023 14:59:07 -0000

On 7/8/23 06:12, Michael Tokarev wrote:
> The following changes since commit 3b08e40b7abfe8be6020c4c27c93ad85590b9213:
> 
>    Merge tag 'for-upstream' ofhttps://gitlab.com/bonzini/qemu  into staging (2023-07-07 20:23:01 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/mjt0k/qemu.git  tags/trivial-patches-20230708
> 
> for you to fetch changes up to 13a637430be13bda3e6726752936321a1955bc93:
> 
>    hw/arm/virt-acpi-build.c: Add missing header (2023-07-08 07:24:38 +0300)
> 
> ----------------------------------------------------------------
> qemu trivial patches for 2023-07-08

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


