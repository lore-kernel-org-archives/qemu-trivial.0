Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tcgSH-00005y-Mu
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jan 2025 02:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcgRu-0007jw-OH
 for qemu-trivial@nongnu.org; Tue, 28 Jan 2025 02:56:00 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcgRq-0000DJ-VH
 for qemu-trivial@nongnu.org; Tue, 28 Jan 2025 02:55:53 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so60880405e9.0
 for <qemu-trivial@nongnu.org>; Mon, 27 Jan 2025 23:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738050949; x=1738655749; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IuWgJybtWqvmOGLDQYpEV91S4HSMgGB+RXFMYZWQ394=;
 b=opmiBsSkx4CjN7Oct2REqO8u4okTQUn5ndNNr9RpccuLIFo4boYmiOeHRtNZIETxid
 qYvoJPRep+Z/mxZspkjlGRoml3LS0LYZRLPaRKTEn9EFIQiNvyJwZKwJtyltW1QDFush
 XSUOsdkcnmB+J466uoH+x3efPYFc76mc56ENCD5o36l+1CCg6OhMCReDN3G29/3G0ijP
 LxGg0KQU6J6rJ47BqohQ9326SNIAXbu1mZDEkaDYbm+D45Kx48bKF2DZyNhf/7ZG09XQ
 SLLP+Z3ZyolX++03qyQw4kZryVKlIVn+rocv0WS1XPbfmthbXWzRGU3YNDV15lH1peNo
 RfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738050949; x=1738655749;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IuWgJybtWqvmOGLDQYpEV91S4HSMgGB+RXFMYZWQ394=;
 b=euKOwFkw9Hdkxzz/MHyJfmxpw7oDojSejxIUgsbDVZ0VJbqyIeKF7p8lP1/LsSswX1
 cIDDuQ8PeH8Anx4HeyirPhbN3GfBgQ1n1Hbj8gVK8nUbVMeEH5n5IAg8O2o2dIdbNEMB
 iJWc+ZYxefTjWJkqSkrGooPoqgM9Av/bPAFOkggaezo6Xc82/sepP9f2h8xdivCYrSPQ
 vihBNv5yfMtdmmR1X590kCKYSy24nIFdZyr+poB8AtntyVWlFMMSY/aTkYtX76BMgzYR
 Vv2sVvcwgNGnxxEet4iIwdlZjbu2yGwgC81LhWMgZ7DRK1CXReEECCro0hvh1G4mWQRg
 oa/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbIMmbv2N6ts/RAD2dVBFiGqzLcriqfLBETPPSx0Ss808H264zWO6m+C0FjvTdKu6a9EtaW+O5mHQ+KEQ=@nongnu.org
X-Gm-Message-State: AOJu0Yzh9jAKPJJxooJNP6Xap1yy2xxiMm6LUSu0K7Zpf5dE+16ydInV
 m328/d0z8Ha1qMYff4rP4q/cPutwouTbOYGjcMwTP2xiQ53V+M7nQWNrNQ0LjtI=
X-Gm-Gg: ASbGnctzrj2jetFtnkcxw00YpC5cA8lG8hUhxKd1IZqjnGdGcGOADuPP0816kG/NypW
 5PVYgQ/NvKUKYlv47PNPGf4yVk6ZjohyWYuxxr0IvRZ5UlQ9h/tYK07YL1diKZjZGhyhVftkjhV
 Y2Fb0ZZ+0peCQoDF/bRbPVy+b6NMzeK1Bv0eJMtKsoZngQTZuaelxIrynOAlEXifvIa1kVhn1+b
 YAMZhz45ZM8AzhzXlHQWEMQkwiUZSKOWl5ZwI/u8zWeOCshujl10MGV0RCqKYhR1x/7cFDVQWZc
 0hL7nZZWxbUEFOuoMxPMoMkMBAgYj62Y/EG+V9XaoCauP7Se3l2QTTLpGQc=
X-Google-Smtp-Source: AGHT+IHJqQgQESqxWn7+L56tYCQdm0A/ZVa6qpgbQIGagCFW5cSRc0wFh4AuRzK9AfZRh2kyfvpVjA==
X-Received: by 2002:a05:600c:5119:b0:434:fa61:fdfb with SMTP id
 5b1f17b1804b1-438913f0620mr386306645e9.18.1738050949138; 
 Mon, 27 Jan 2025 23:55:49 -0800 (PST)
Received: from [192.168.69.151] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd5732edsm158318675e9.36.2025.01.27.23.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 23:55:48 -0800 (PST)
Message-ID: <b8933aed-5a35-4385-9526-c60a4412070d@linaro.org>
Date: Tue, 28 Jan 2025 08:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/test_mips_malta: Fix comment about
 endianness of the test
To: Thomas Huth <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org
References: <20250127184112.108122-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250127184112.108122-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Tue, 28 Jan 2025 07:56:11 -0000

On 27/1/25 19:41, Thomas Huth wrote:
> This test is for the big endian MIPS target, not for the little endian
> target.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/functional/test_mips_malta.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/functional/test_mips_malta.py b/tests/functional/test_mips_malta.py
> index 3b15038d89..eaf372255b 100755
> --- a/tests/functional/test_mips_malta.py
> +++ b/tests/functional/test_mips_malta.py
> @@ -1,6 +1,6 @@
>   #!/usr/bin/env python3
>   #
> -# Functional tests for the little-endian 32-bit MIPS Malta board
> +# Functional tests for the big-endian 32-bit MIPS Malta board
>   #
>   # Copyright (c) Philippe Mathieu-Daudé <f4bug@amsat.org>
>   #

Oops

Fixes: 79cb4a14cb6 ("tests/functional: Convert mips32eb 4Kc Malta tests")

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


