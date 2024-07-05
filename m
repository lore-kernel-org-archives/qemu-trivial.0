Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sPiDd-0000EN-7Y
	for mharc-qemu-trivial@gnu.org; Fri, 05 Jul 2024 08:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sPiDb-0000DM-Bg
 for qemu-trivial@nongnu.org; Fri, 05 Jul 2024 08:39:15 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sPiDY-0003rs-Jh
 for qemu-trivial@nongnu.org; Fri, 05 Jul 2024 08:39:15 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-367b0cc6c65so126100f8f.3
 for <qemu-trivial@nongnu.org>; Fri, 05 Jul 2024 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720183150; x=1720787950; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f1LKp34FYELTp/+mAMc133AHvjK9bpe4E1qnRAwwCVM=;
 b=qwXhiMmXLG/P03yGn3dCX1n81pIveEwBpT3MRap/f76U8RfWoEA1w5y20bR4KPBMgg
 ixQgGUPFyUD1/f7X1aH7MKxSx4TcEFkOyYsMlysGbUKJBVo06GJ+CszhhEo7TXiLHZeh
 4fPCBMjVNstbMHu9SLeW3zA81pp95H2hhkOw/0p01NXXmaDIL8JaH5ozcQhXLVoDctGk
 QR5BijZkNJ8KlQhHaptQ2uvacYDwoUUm74iJ4vQuuBA6+x9+q/gYq59iSf+SEKWCGR86
 ZQznoaQcVhJ9tngFoPez5IUWUC2WC8yNAYU05J3Ka8tLnhFstus9iybgMdN+0CHqo9dS
 rl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720183150; x=1720787950;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f1LKp34FYELTp/+mAMc133AHvjK9bpe4E1qnRAwwCVM=;
 b=NcKmtAXVdk2o+kQe4vqPxaY4iWKgK0m4kCEe2oeB2G0+AnMt68/QxIpBXH7AmCOkEK
 xYZQI+spDSW/TCC2MsLuRAK5qSbxMq6FUbJ/+G7jyBlPVbwIMHXbJuQxpJ2oc1WSe4T/
 HMouHTd2CGkT0ZgWng6UjVN8k8sYc9y3PlvC4+5CkjHlY+AuBMp3VSHTfJcGM5LwJICd
 19Ljmr5fXEQFJR91sihwRq7AmUBlJZrHwlxUAzi3xeYeUsEwyJJpgr0qTZTfOKAfegeR
 1qShpW5A4Z4XbNLqPpzk0tZkvwYdFdmHg1Q0dg0IrjSFtzFSpZq/pBTeddywB+tqncHN
 D7GA==
X-Gm-Message-State: AOJu0Yxx36eVsxOd9rc3ayGzCa2Qb0C68fyKiqVpUC1KrUjyg7lvfbkA
 4JMN3F7PQWwKOrl4j84+rbdJHkmvTp2ZzyXF8Nfu/DHpZnwYOHYkT0drnUFxwx0=
X-Google-Smtp-Source: AGHT+IEZELc3jACuwRHMdLRc/9v9Nin523Qmz0/qNqvfIYMrTlPCpi4jbgoYh7r2ZzL1gdSI4g7+AQ==
X-Received: by 2002:a5d:56c5:0:b0:363:7788:b975 with SMTP id
 ffacd0b85a97d-3679dd67d08mr3758781f8f.52.1720183150269; 
 Fri, 05 Jul 2024 05:39:10 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.163.129])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3679aa0edccsm4381041f8f.60.2024.07.05.05.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 05:39:09 -0700 (PDT)
Message-ID: <73a0498e-8f66-46ff-a4f2-fcb6b80f9d42@linaro.org>
Date: Fri, 5 Jul 2024 14:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system: Enable the device aliases for or1k, too
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org
References: <20240705090808.1305765-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240705090808.1305765-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 Jul 2024 12:39:15 -0000

On 5/7/24 11:08, Thomas Huth wrote:
> Now that we've got a "virt" machine for or1k that supports PCI, too,
> we can also enable the virtio device aliases like we do on other
> similar platforms. This will e.g. help to run the iotests with
> qemu-system-or1k later.

Indeed, since 2022 in commit 40fef82c4e ("hw/openrisc:
Add PCI bus support to virt").

> 
> While we're at it, sort QEMU_ARCH_LOONGARCH alphabetically into
> the list.

Suggestion: a preliminary patch sorting 1 arch per line ;)

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   system/qdev-monitor.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


