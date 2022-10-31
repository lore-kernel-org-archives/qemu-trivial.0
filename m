Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opcxw-0006kZ-0P
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2022 18:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opcxt-0006kA-QE
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 18:09:05 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opcxr-0003uD-TJ
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 18:09:05 -0400
Received: by mail-wm1-x32a.google.com with SMTP id t1so4235373wmi.4
 for <qemu-trivial@nongnu.org>; Mon, 31 Oct 2022 15:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LyQShnvoJM7z9hDlodIpAOjZgHnaO9r8jiYZc/6MZBk=;
 b=mIrr1FJvWRAC4HmeE9iDwrehh2t7ieXggNwccLDO49TCTUgu+ATdQYxZG0d57XYsU5
 dUyfZOvp0PE38aUxByqtRb5L5sbJTLC+WlftxMdhbprHhqpx8gLkbsRQmohbkEJBo2Rp
 bFLSwTq/XL4UT2OdHLDqr2BUNATB10yO4DPVxkuYpgGXj2QhG61HGE0RjQ5PfFxqkyS7
 RQvQLUm3cyG1aaIZa/xzTI6ORokWu1Ik3JmxM16o53RZI26oXLcxU9J2lGvkpYVERgkf
 dUnp0+cIGihV4hrvz2l5iWGre2M0vNddAcnD26F5yFdHObssUOaTXpBVFSED0wU/AA/N
 yxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LyQShnvoJM7z9hDlodIpAOjZgHnaO9r8jiYZc/6MZBk=;
 b=G+i/VjsMEbW3qsgDoVEZoWkvWqHmg7B9zGMWe/wLAvH1EQKDt36ezAPfdjQbIr6JjQ
 SFma/Yrg6Z+Wqy+IBPmJ27wdX1wgZm4bda9VhgbY9hqIrmX2cjvBdm6yBRbWdIstWMAy
 1V0yRAIO8bZrhQBI4mpRPTxjsVdL/We+A+G7UZsvG7UeuNtuTeotrKnFgomVxa9uqg20
 ur5KbwqJFX8BaCQSdOTpTH9sUYYDNDNHEoF/en+XBusAvR6/8PN/jkYKUzrlaG7MoK6R
 oB4SkgFR4uAQNmQQj2lobU24T1ws53b36ZRyYc1n4YTlrdv8u/1+H/BUg9u8/clg1ntC
 f5cA==
X-Gm-Message-State: ACrzQf0YT7s5qUC3y1lRxI5VcHi4raKCou4sYfT9612l5AhrWP2sWwoh
 Q2VRPaE1IfpYyyDsXbxfWVqOww==
X-Google-Smtp-Source: AMsMyM6DqV2a/e9jZ/s6CrUQ1j2rP0SxUQe5cljzbansYROltu/j3dGAfGioiDY1OQETpZMr9IGCeg==
X-Received: by 2002:a05:600c:4e45:b0:3cf:3e69:9351 with SMTP id
 e5-20020a05600c4e4500b003cf3e699351mr20182478wmq.2.1667254140857; 
 Mon, 31 Oct 2022 15:09:00 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a05600c0a1100b003b492753826sm8508549wmp.43.2022.10.31.15.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 15:08:59 -0700 (PDT)
Message-ID: <dccf8560-a4db-53e4-418e-402ba76d7570@linaro.org>
Date: Mon, 31 Oct 2022 23:08:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 1/2] xen/pt: fix syntax error that causes FTBFS in some
 configurations
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <cover.1667242033.git.brchuckz@aol.com>
 <5f1342a13c09af77b1a7b0aeaba5955bcea89731.1667242033.git.brchuckz@aol.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <5f1342a13c09af77b1a7b0aeaba5955bcea89731.1667242033.git.brchuckz@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 31 Oct 2022 22:09:06 -0000

On 31/10/22 22:35, Chuck Zmudzinski wrote:
> When Qemu is built with --enable-xen and --disable-xen-pci-passthrough
> and the target os is linux, the build fails with:
> 
> meson.build:3477:2: ERROR: File xen_pt_stub.c does not exist.
> 
> Fixes: 582ea95f5f93 ("meson: convert hw/xen")
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> ---
> v2: Remove From: <email address> tag at top of commit message
> 
> v3: No change to this patch since v2
> 
> v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
>      email address to match the address used by the same author in commits
>      be9c61da and c0e86b76
> 
>   hw/xen/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index 08dc1f6857..ae0ace3046 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -18,7 +18,7 @@ if have_xen_pci_passthrough
>       'xen_pt_msi.c',
>     ))
>   else
> -  xen_specific_ss.add('xen_pt_stub.c')
> +  xen_specific_ss.add(files('xen_pt_stub.c'))
>   endif
>   
>   specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


