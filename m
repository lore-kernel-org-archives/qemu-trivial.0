Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q6o2t-0003gS-Cw
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jun 2023 03:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6o2s-0003gB-Dy
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 03:57:30 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6o2q-0005Cu-S3
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 03:57:30 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f7368126a6so30480465e9.0
 for <qemu-trivial@nongnu.org>; Wed, 07 Jun 2023 00:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686124647; x=1688716647;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J7HpCaY+DXPHysvUq6YT0veG8ke8Jzp5UZZMM2S/gNY=;
 b=pCl8Lu/DpzXCKm1wBu72diu2q2ob/oIGYdn1PF3O5S8YrohHk+BmNr/vF/dv2s7C9U
 RrZfgm+1IwHxt+X2/j71qmN+ZH8Bnz3SBgkBO0mUxYqC9XqtaukhK3aG2t3gKDSoqtRi
 bgkyho4DnC8igDBZK1q0wYE0tKhXHirIl/HvDCgnLRAKjPeBiZfihsEh+ncdVTz4n+Ua
 FFCekbKFqv4MlG6Wxb1UYAZ+tf75PRfak4Zr4+al1Ks7mSXbludsyDC0B+5BROjWJ1OJ
 hOjSrK/zK1JxixvR4Y3xizgQhW9yp4sSU3cCfoOuTAR+uYDLkWHWV8yIfP6C2hStwwx7
 Ei/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686124647; x=1688716647;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J7HpCaY+DXPHysvUq6YT0veG8ke8Jzp5UZZMM2S/gNY=;
 b=JkinKISSkqHq0iXBG6EnA+//rVCk9CcpvJbQAdUtzEbuYAQ9yR1eqNhtYxEmndWbF+
 iajZ7Hn2jxOMhdZkyEfWfw8M/kZWzWjHDO4i1fQ9V4fvK90JiYv5k46GrgUSdvg2vafI
 1zKwvSBlxs1oz3Qgq7b3p5+nhpkxYPaR2LMdi4Dgwb26u6j0HKMu1FpK48KQ/9WHkRAr
 MaPrnC+MuVIEhHtqR1m0uYjxp/bwzflh9IKkdEor9VNCWIQCYptdVbvtQu3C82ooPnPD
 GeI+Euos3qMBKUuuL7bqDPVu4e8CtBVgfVTxkcXKxnFyuSlxHaVMCC+lhJG2UirodeSe
 6Rhw==
X-Gm-Message-State: AC+VfDzaFTyes1s07P+mLvjlN6i4e3zqPAh0K9d1m616Hs34BrlSdtdp
 hElXuIOlrpauA04eS9cj0flXvg==
X-Google-Smtp-Source: ACHHUZ74IF72zWJX64qXcQW8hTs1bOdB1+7ZA6RJphIavRTsHQKJIEuZWzh8KhYx1z7tvtAQrEh+cg==
X-Received: by 2002:a7b:ce95:0:b0:3f7:e463:3cc8 with SMTP id
 q21-20020a7bce95000000b003f7e4633cc8mr3494985wmj.28.1686124647304; 
 Wed, 07 Jun 2023 00:57:27 -0700 (PDT)
Received: from [192.168.69.115] (bd137-h02-176-184-46-52.dsl.sta.abo.bbox.fr.
 [176.184.46.52]) by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003f6f6a6e769sm1229931wmc.17.2023.06.07.00.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 00:57:26 -0700 (PDT)
Message-ID: <e33d63b9-2afd-44e6-127c-832581d81c82@linaro.org>
Date: Wed, 7 Jun 2023 09:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH] configure: check for $download value properly
Content-Language: en-US
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
References: <3236bc555c76dcd561d38a3aea6e8489e917bc15.1686124161.git.mprivozn@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <3236bc555c76dcd561d38a3aea6e8489e917bc15.1686124161.git.mprivozn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Wed, 07 Jun 2023 07:57:30 -0000

On 7/6/23 09:50, Michal Privoznik wrote:
> If configure was invoked with --disable-download and git
> submodules were not checked out a warning is produced and the
> configure script fails. But the $download variable (which
> reflects the enable/disable download argument) is checked for in
> a weird fashion:
> 
>    test -f "$download" = disabled
> 
> Drop the '-f' to check for the actual value of the variable.
> 
> Fixes: 2019cabfee0
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


