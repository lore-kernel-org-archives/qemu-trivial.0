Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sCJjd-0008AS-Hg
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2024 09:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sCJja-00083d-Dp
 for qemu-trivial@nongnu.org; Wed, 29 May 2024 09:52:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sCJjV-0003Gf-3y
 for qemu-trivial@nongnu.org; Wed, 29 May 2024 09:52:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-354dfe54738so1344573f8f.3
 for <qemu-trivial@nongnu.org>; Wed, 29 May 2024 06:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716990767; x=1717595567; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8MrRRWivmOQ1cKlrRdTgFV+Gu0PH+odEUxHHhgnLeRw=;
 b=WE8QVLhc4WkyR0HfoxdXlN2Jdklds6SkihcGyynJr4nbMfTKmXC+8Crp3t2woxW0qR
 9VJkJiJJDTIiA+ArIO78gNR2F7BWSJg7IzhBSVy1uWKSujlCPYIrBgPmGXbrYf5rovb3
 us4JfdIRJN4A1qmwxxI2PhD4Km26ID2eVcUn5shU6tPbvK5czXTAkhwRTcm2Wk9BJJcR
 vhIwKMfmO2agdtPrKjbPxKKSGrnmu0iAwi0o1as/b623RYhe4nf9w27sGUO1c9x5jY1Q
 Kpyx613sSctehcni0ZAC1chwnfTY2+VFpMjCNZV0KY2UYuEnamc3qvXMEhAh2VFUxRvD
 wWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716990767; x=1717595567;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8MrRRWivmOQ1cKlrRdTgFV+Gu0PH+odEUxHHhgnLeRw=;
 b=fDMg0QejrHWlxvkfllHweH0iNKjtSrTUgOe++J+5z8Nj37aRk3mumHxK3IYI3+apl2
 roXSXq0sWCbnkeEtTb4vT3HmNb/99UEKiL8ng5Hrf2Xu5ONPWafGTiXXGapGx3dio7tH
 X7XQ+BnFBWGCMKQN0SlaqAgt+q4QKQx8QfqpVypc+Aawjm5an+4YpumrqALt/9dSkgYL
 2jXLE39s7iWDlNPhSHhjKRgA1HMGJL53j1r2nHIFd4XirwGdqZ2VQAneO4Ed2EM0XYTT
 xeuygVJq6ng0BghTpFwGo9KOoRD9D7VjmGk4OgXFQY6nqc1qAzhdz3DryERom35cqpZh
 TctQ==
X-Gm-Message-State: AOJu0Yysm5sb2Gyw/GPPuUtFg2l2JI+oEZ8O0E5bZlvJCEfQfU4u/9r5
 /FpeZJq+RYGksAsG/mCqDT3dFW0XT8hWJttApnI9ej6f/cDPOQpXACt9JzUk/uL4V29F8KdVs1H
 v
X-Google-Smtp-Source: AGHT+IHE873LmpFWOLlFZQJ8G6vGYeVnS/psJoVyiK/BtPbrF6cHNxjaRc/9L4rb4UDShANy7Cw5Aw==
X-Received: by 2002:adf:eb8f:0:b0:35d:a660:4dfc with SMTP id
 ffacd0b85a97d-35da6604ed9mr335475f8f.60.1716990767329; 
 Wed, 29 May 2024 06:52:47 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.204.141])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35579f96519sm14826063f8f.26.2024.05.29.06.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 06:52:46 -0700 (PDT)
Message-ID: <93e2d304-7a57-4faa-825b-97c5db09f492@linaro.org>
Date: Wed, 29 May 2024 15:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io/channel-socket: Fix -fsanitize=undefined problem with
 latest Clang
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240529133106.1224866-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240529133106.1224866-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 29 May 2024 13:52:55 -0000

On 29/5/24 15:31, Thomas Huth wrote:
> Casting function pointers from one type to another causes undefined
> behavior errors when compiling with -fsanitize=undefined with Clang v18:
> 
>   $ QTEST_QEMU_BINARY=./qemu-system-mips64 tests/qtest/netdev-socket
>   TAP version 13
>   # random seed: R02S4424f4f460de783fdd3d72c5571d3adc
>   1..10
>   # Start of mips64 tests
>   # Start of netdev tests
>   # Start of stream tests
>   # starting QEMU: exec ./qemu-system-mips64 -qtest unix:/tmp/qtest-1213196.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1213196.qmp,id=char0 -mon chardev=char0,mode=control -display none -audio none -nodefaults -M none -netdev stream,id=st0,addr.type=fd,addr.str=3 -accel qtest
>   ../io/task.c:78:13: runtime error: call to function qapi_free_SocketAddress through pointer to incorrect function type 'void (*)(void *)'
>   /tmp/qemu-sanitize/qapi/qapi-types-sockets.c:170: note: qapi_free_SocketAddress defined here
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../io/task.c:78:13
> 
> Add a wrapper function to avoid the problem.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   io/channel-socket.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


