Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qL48u-0004XM-BH
	for mharc-qemu-trivial@gnu.org; Sun, 16 Jul 2023 11:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qL48t-0004XD-1n
 for qemu-trivial@nongnu.org; Sun, 16 Jul 2023 11:58:39 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qL48p-00089c-WB
 for qemu-trivial@nongnu.org; Sun, 16 Jul 2023 11:58:37 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8ceso32487685e9.0
 for <qemu-trivial@nongnu.org>; Sun, 16 Jul 2023 08:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689523113; x=1692115113;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=duT9rh18uNgwS+LyL8yMXIqAKbRP5GsiZRJ0NkeXr4U=;
 b=fNQ1pZZMw/kFy2tUvmHn+KhRKMVmcp/WepwZ/biPWL0iDDpZsV7QMU/eCOGRMg3n8M
 dC1h8+cdwbuXStaOBI9L95iRYMbY3Rlw0dNU8mn1g0CTqf8Kdxfp+miSbZg4JyaQ+RJU
 XbiL+JZZNJBP5FYjVZaEmgwjzleB6h1bioDrb0AKjRz/mn0elA6HElzj52IolfRUIsp0
 M/VL3YVDUE0sQwU7/0HZoTeO+tQwNpjN5MM/ItB/op8YYjmUw7aDDSunBBk5XyXkKffb
 uoV+qeJPhe3ftiBh0pA72gdhE0pm03jXW5lPuETIJJIBncXrbXkOEArRgeylir9YvFHr
 QXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689523113; x=1692115113;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=duT9rh18uNgwS+LyL8yMXIqAKbRP5GsiZRJ0NkeXr4U=;
 b=h/EE5XWaV3uW/sQnNTKgsoHXiPL2P+ZRg02U5lJIDreedg1LJsGHFDkso8OhOnhcLX
 BBfEpabVKop+y5/OrUKCQcUj8teQvU6yBH/lw0tlUPQil2G4rQ9e0EBB27Sk+MZPA0+j
 4XfThFzU8x2ir51hNLtNbEtvmNe0nUEHxbrlgWPrAo08j937hXjaLRHqLt0XPbtK3Jdg
 8F7pKJTeyq+hDIcg+YJ2UVPIbUPDGI+FUi1U6jCLEzhTarBkCySV42nXaPEyDVYw9aSg
 xSfrVk/zlUV3f5OP2kDDQVpO4wzj4+HMG2pQe3KroEE2oI/bgRjhf3J2kX78wpm0v5w4
 si8A==
X-Gm-Message-State: ABy/qLbs5heed7T39H1gd9NmOEDPxr5IcPZkDeEnpCRq5eImBnh4Uxvc
 wKNGQ216IXrtBR3eu45OuiJFAg==
X-Google-Smtp-Source: APBJJlFFBoVV3Npv16vL7Pcz8NUnSrrgftDsu4DmvefybrcNR8MVrRJcg/GxwzDTS38PN45UrgL5Kw==
X-Received: by 2002:a1c:f213:0:b0:3f9:b19c:aab4 with SMTP id
 s19-20020a1cf213000000b003f9b19caab4mr7662050wmc.6.1689523112965; 
 Sun, 16 Jul 2023 08:58:32 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.218.195])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a05600c0ad600b003fa96fe2bebsm5991366wmr.41.2023.07.16.08.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jul 2023 08:58:32 -0700 (PDT)
Message-ID: <69ff1b09-a795-fcbe-ad0d-52f76f25eba7@linaro.org>
Date: Sun, 16 Jul 2023 17:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 0/6] trivial-patches for 2023-07-16
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20230716115801.1505288-1-mjt@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230716115801.1505288-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-List-Received-Date: Sun, 16 Jul 2023 15:58:39 -0000

On 16/7/23 13:57, Michael Tokarev wrote:
> The following changes since commit 7d07a21ec003724475566073404c5893e36de5e5:
> 
>    tree-wide spelling fixes in comments and some messages: hw/9pfs (2023-07-16 13:59:17 +0300)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/mjt0k/qemu.git/ tags/trivial-patches-pull
> 
> for you to fetch changes up to 7d07a21ec003724475566073404c5893e36de5e5:
> 
>    tree-wide spelling fixes in comments and some messages: hw/9pfs (2023-07-16 13:59:17 +0300)
> 
> ----------------------------------------------------------------
> trivial-patches for 2023-07-16
> 
> This contains a doc fix for riscv and reviewed spelling fixes.
> ----------------------------------------------------------------
> 
> Daniel Henrique Barboza (1):
>    docs/system/target-riscv.rst: tidy CPU firmware section
> 
> Michael Tokarev (5):
>    tree-wide spelling fixes in comments and some messages: migration/
>    tree-wide spelling fixes in comments and some messages: s390x
>    tree-wide spelling fixes in comments and some messages: arm
>    tree-wide spelling fixes in comments and some messages: other
>      architectures
>    tree-wide spelling fixes in comments and some messages: hw/9pfs

FYI patch subject is usually "subsystem: Topic", see
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#write-a-meaningful-commit-message:

   QEMU follows the usual standard for git commit messages: the first
   line (which becomes the email subject line) is “subsystem: single
   line summary of change”.

(not really a cosmetics comment, but various developers have mail
  filters written using this pattern).

