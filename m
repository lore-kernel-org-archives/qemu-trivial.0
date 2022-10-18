Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1okmCh-00041W-JA
	for mharc-qemu-trivial@gnu.org; Tue, 18 Oct 2022 09:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okgJH-0003Gp-MI
 for qemu-trivial@nongnu.org; Tue, 18 Oct 2022 02:42:46 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okgJB-00031N-EA
 for qemu-trivial@nongnu.org; Tue, 18 Oct 2022 02:42:41 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so14274411wma.3
 for <qemu-trivial@nongnu.org>; Mon, 17 Oct 2022 23:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yboswpoehrFkJ1PJM2fzYjo8b4mS8z7J4Wz6f0FjOzA=;
 b=rERSoFqWlGbsyeSPcYErvE5UnE88XanPqmkZpQCaEiQYYv4YHDp7ESo29ssAXLqzcp
 VT/qh62hflZc3D+Ci+yV0QHDQbkYxLzCm8lnCVnzZUT/hi5OCUtLZ7UlwT/7iOGpOcyw
 1CXU3GQb1ZaWvM0AWkMIR6e6nxL42+ZwBJ6vE/fTnQmlsVjrPXJ4wnCepjPh0qW5xL2H
 69AVfxSMy3InPwdqLBmhxfKxGYCZexD4bfsoO/x1pOz+ydIFkQDHYQlQZCzuqyvzpBmY
 TCcNN6t6V5KQWA6SI4Hx6WexevxsSpS4CSvHBC2aBhgzSuks4VjvcDrn5UNFWxDM4JBt
 s9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yboswpoehrFkJ1PJM2fzYjo8b4mS8z7J4Wz6f0FjOzA=;
 b=ggTib4bMubyxjaolpYL5RpM77fhhg4UCaxPpbkJBrKzTSkB447Hs0Qc6DS4oW8RSH8
 IR4VBM6/M0zaR/+2Yv6j6dRgdz/AO9P481bgzjruEKHdfgs5VgX28nZytcgNPpw3Yaw6
 IN0knsYUtOaTyEoTGJqA3tNojbqttjlAFbHiLQi6d3ei5TnAh9rnmN8er+osLcCv4Uv1
 +9KlkI/2cDZHHXnmDV2pu67/Dyaa0WTsvHO11ll9EBRKagXSoll6h8wfel9TUK5IEMAE
 zhkEl28ddNGlfkX/ShF7wrEjEINS5IwxoN4od79T9nLB86zXcuWo1/B2pXJCx6aQt4Zl
 fKzQ==
X-Gm-Message-State: ACrzQf2z94YvOeL72lfkfU23GGTKSQWsbQIjnr5/or4inB8cWfWPO/b4
 Z+zo3sE784FA3ssGgubhR4vJpw==
X-Google-Smtp-Source: AMsMyM6Gbmmh6NQ/4DpO96UVNh/6fmbBvogPD43XpIGdG7FZosTb3tK3JKD/sCVzC+WPmYc4eQizpQ==
X-Received: by 2002:a05:600c:a47:b0:3a6:5848:4bde with SMTP id
 c7-20020a05600c0a4700b003a658484bdemr21287293wmq.189.1666075355683; 
 Mon, 17 Oct 2022 23:42:35 -0700 (PDT)
Received: from [192.168.130.175] (151.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.151]) by smtp.gmail.com with ESMTPSA id
 i3-20020adfaac3000000b0022e62529888sm10630451wrc.67.2022.10.17.23.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 23:42:35 -0700 (PDT)
Message-ID: <fee57363-5cae-6e08-77c6-b226b5cfde14@linaro.org>
Date: Tue, 18 Oct 2022 08:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] elf2dmp: free memory in failure
Content-Language: en-US
To: luzhipeng <luzhipeng@cestc.cn>, qemu-devel <qemu-devel@nongnu.org>
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220929120459.2018-1-luzhipeng@cestc.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220929120459.2018-1-luzhipeng@cestc.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Oct 2022 09:00:12 -0400
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
X-List-Received-Date: Tue, 18 Oct 2022 06:42:47 -0000

On 29/9/22 14:04, luzhipeng wrote:
> From: lu zhipeng <luzhipeng@cestc.cn>
> 
> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
> ---
>   contrib/elf2dmp/main.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> index b9fc6d230c..d77b8f98f7 100644
> --- a/contrib/elf2dmp/main.c
> +++ b/contrib/elf2dmp/main.c
> @@ -125,6 +125,7 @@ static KDDEBUGGER_DATA64 *get_kdbg(uint64_t KernBase, struct pdb_reader *pdb,
>   
>       if (va_space_rw(vs, KdDebuggerDataBlock, kdbg, kdbg_hdr.Size, 0)) {
>           eprintf("Failed to extract entire KDBG\n");
> +        free(kdbg);
>           return NULL;
>       }
>   

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


