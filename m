Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olSOG-0005A4-FH
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2022 06:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olSNR-00050d-8o
 for qemu-trivial@nongnu.org; Thu, 20 Oct 2022 06:02:20 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olSNL-0000ld-3M
 for qemu-trivial@nongnu.org; Thu, 20 Oct 2022 06:02:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so1956802wms.0
 for <qemu-trivial@nongnu.org>; Thu, 20 Oct 2022 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sQyNETfTNB3h78Gt5uMdRXMfACFruPoCjru66jOvVCw=;
 b=NfRxlAXmOdmv7sivtcvHH4NA4wQ4d+ZtNlEn/2MBHenEu99PUrgN2PEjbBnWQ0m9eH
 YMB12lHYUvGiDii6UszUvU56PLZ10fg2dLAGSzx+3iDG6dBllP4Aq0HZOd6W5+3yrb+x
 3CTLvrmXuMmm9kXoIhGJH21rh21iJXTG/eRf9lcb0eIH+TK8UOPqsUSX1dgELBtue75P
 vlCtAzv1Xjkvg+dS58QiDlVo9BMRXdt7qZu76D0pVEqLTB0GvoyC8z7hU8MnoEU725Lh
 mLlA9ENLqQsHIfZTXUjuJCHMhFBhk40e+YHc9uA4ZLM5Gza1uoN8v/mAtN+he2NvjGeR
 Yv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sQyNETfTNB3h78Gt5uMdRXMfACFruPoCjru66jOvVCw=;
 b=cQiS0t9B56RFYXG4A+Ro8ZZ9vMI/KiTHipaMH8/g+dymEv9GiAcJ3QG6sYq22buZm0
 AgFowOKKJvK8TioLVeQ17Yr3VHzfGTMEzQRvIhcq4I9Kh0oX8zvADEMRlGilDC+A+tcN
 cZArEZ0KSqQCNPesXYInSBu9QucNzae9cTnjvfg3Nd9eaGXLRBeDX4bklEC+WcAKyiwq
 nGzC96UKGLBwZS5ViTPC7HyGSP5aBs99OI1nKpEOp5UuIQ6rMR6wHhXCG1zoyYfDMZDC
 3k+UkU2QeYzyIj7i3ptKpMhP0lvzfTwgZnWukiRWq2KO63NbrGIPmTRfgKQpFR3bRbfH
 pZuw==
X-Gm-Message-State: ACrzQf0M02FkO15mOMQYfN6ChbICtJ69fIiqxbwvbQHLoGTeyRDQKAyC
 hI4ox4JU4/KouswpSWTGJbPwSg==
X-Google-Smtp-Source: AMsMyM67B1FxcwJrfLr0ZqYiggYcBCVfRXjldI0hLolifFqjihfA5oZSKa9WG4BgJsucLdgJk3GRGg==
X-Received: by 2002:a1c:2507:0:b0:3b3:3681:f774 with SMTP id
 l7-20020a1c2507000000b003b33681f774mr30213251wml.134.1666260125284; 
 Thu, 20 Oct 2022 03:02:05 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a056000011000b0022e38c93195sm15625663wrx.34.2022.10.20.03.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 03:02:04 -0700 (PDT)
Message-ID: <5d6bb70f-ce60-f8d4-2dba-1a8e488b1653@linaro.org>
Date: Thu, 20 Oct 2022 12:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH] .gitignore: add multiple items to .gitignore
Content-Language: en-US
To: "Wang, Lei" <lei4.wang@intel.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
References: <20221020171921.1078533-1-lei4.wang@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020171921.1078533-1-lei4.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Thu, 20 Oct 2022 10:02:30 -0000

On 20/10/22 19:19, Wang, Lei wrote:
> Add /.vscode/, .clang-format and .gdb_history to .gitignore because:
> 
>   - For VSCode, workspace settings as well as debugging and task
>   configurations are stored at the root in a .vscode folder;
>   - For ClangFormat, the .clang-format file is searched relative to
>   the current working directory when reading stdin;
>   - For GDB, GDB command history file defaults to the value of the
>   environment variable GDBHISTFILE, or to ./.gdb_history if this
>   variable is not set.
> 
> Signed-off-by: Wang, Lei <lei4.wang@intel.com>
> ---
>   .gitignore | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


