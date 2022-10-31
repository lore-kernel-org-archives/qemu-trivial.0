Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opPuB-0001gD-V1
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2022 04:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opPu7-0001di-2I
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 04:12:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opPu5-00046m-IQ
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 04:12:18 -0400
Received: by mail-wr1-x433.google.com with SMTP id z14so14797775wrn.7
 for <qemu-trivial@nongnu.org>; Mon, 31 Oct 2022 01:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iEpi2edwhN+F+JqmhqtuUH6TTCY+MU8IhQBLhqPWTf0=;
 b=zWvKZ4bA1vxZTTumfkyPwq8dchrV1YI59G1hbVNVRuUCbH/yqxRI9PVaUmhrjNY6e2
 JxLs/4Y2wtQHe/Xkxitw+ZzlCm6ApA2v9/dqien/bpzRkl7aokimlmQrOpEOVYMCysVH
 AZaMbS67pXmGZvJBu4grumqsBx2YfJFAD3/yYnacgbICnJtI9GoZFOz2ARjROnkoxMDW
 apC0LyDdQovURH1JZMoEQoI5cttqzIBmT4Y3sudRRD8UNeUBhI8cyFWIurybRRO/fgpN
 +OmtpxbM7V6S7MsRbsUqIF2FY6vVrqDcVq+NCorsxcDoIoDuaknCeFspFydFzQI41klj
 CaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iEpi2edwhN+F+JqmhqtuUH6TTCY+MU8IhQBLhqPWTf0=;
 b=g7L9Z415xG51PIXefDaO5fkoy9i2VyHIEGXzBXCrtPI3d9MsUsGcCgu6AcLMXKdob1
 6tY5ZrXXhOUy78uHjjXrOlDHGiFKZ/gokGr6kJxwniadzHKrN6Qsvz3oSHn+Q/5Bk98U
 07uOO1qviASvR2M0VM6M6NMT8dVG2fZzT+B+6iW5vP0KZiLShwmqzFMaLVpUUccF/vVA
 JyqtZPJEowwgX/JtBAGPrm9yW1Xgp0OgjlvCBBlf5Zgx+dHVANoSF2jNFdppQ9l4xqwd
 Tb+ubPlSLMeSbPClPGrSB0kga5bgJPg81Tiza7KM7wmcDPBgTI0YUus7Jw41Xt5H7iLr
 +Jjg==
X-Gm-Message-State: ACrzQf3TCZXze07KgRMXy5/MsEMan/+6hvOxqwV1Z0fTJQN4oUPpFwMJ
 fuXSRPU+Mje1BU4PO1uckYipDQ==
X-Google-Smtp-Source: AMsMyM6TqXIg39WthEzTT241+nfn06zCvRIDlmO3pM+81UrblR4QBInZ229fiNZ2nTtRiXM7cFqQQQ==
X-Received: by 2002:a05:6000:2c3:b0:235:5734:b253 with SMTP id
 o3-20020a05600002c300b002355734b253mr7265901wry.94.1667203935627; 
 Mon, 31 Oct 2022 01:12:15 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c3b8a00b003cf71b1f66csm2365376wms.0.2022.10.31.01.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:12:14 -0700 (PDT)
Message-ID: <178e9535-b70b-bfff-cc07-06bd51bea83a@linaro.org>
Date: Mon, 31 Oct 2022 09:12:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] qga: Add initial OpenBSD support
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <Y19Rqp61A16MJqJI@humpty.home.comstyle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y19Rqp61A16MJqJI@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 31 Oct 2022 08:12:21 -0000

On 31/10/22 05:40, Brad Smith wrote:
> qga: Add initial OpenBSD support
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>   meson.build          | 2 +-
>   qga/commands-bsd.c   | 5 +++++
>   qga/commands-posix.c | 9 +++++++--
>   qga/main.c           | 4 ++--
>   4 files changed, 15 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


