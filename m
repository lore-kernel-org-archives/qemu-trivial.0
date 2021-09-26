Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUdGA-0008QV-2D
	for mharc-qemu-trivial@gnu.org; Sun, 26 Sep 2021 19:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUdG8-0008Mu-7l
 for qemu-trivial@nongnu.org; Sun, 26 Sep 2021 19:08:36 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:46658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUdG6-0003kb-0y
 for qemu-trivial@nongnu.org; Sun, 26 Sep 2021 19:08:35 -0400
Received: by mail-qv1-xf35.google.com with SMTP id gs10so10034400qvb.13
 for <qemu-trivial@nongnu.org>; Sun, 26 Sep 2021 16:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WFPKgVbRPd6LuBZiMidW9WWN0ZLrrkNW00YLNTCJKsE=;
 b=oV06Wk58172UhmlPrzOp/BnutzG+t4gV/ik1RHEYE62m0poM0zvwH1D/WqMdCcwjgk
 H9A56kyGHsLPCEUCm4V/P7KhZ/xTvcSQchaqRNGnwOy+p3DKqCdf7vVQ1MX1DGn9JHRs
 09fCzg7w+dEq8U8t7Kl2CvZicPCRCLmr4xSrL+6xi7L2lI/1Mp4Iot5fKnT6Jnv62wh0
 IzWNUEuglIFU6MtgVtaUGnp7Aq3Fok04FxlMi+Z/aB8PC1Ktgyc4nyANZ9afetbGd+LS
 lYubKSdPs5Ah0x81rMWALA1+eKjAM7CjBy2Jd4XTei2VxYn4wHZT+mObeB96jwSVUHV+
 5JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WFPKgVbRPd6LuBZiMidW9WWN0ZLrrkNW00YLNTCJKsE=;
 b=7pJ8i1U4CL0ysttDIpZGL6dKhltmHN/KCw1rkY+t2/4dA7+h2BNaau5+fp7xgxv6aQ
 0+oC01Xdj5cqGvuEUWL8uOWuU/dAxHx8gZKNajq8C4syUVqy3/E+WQQ4DXslFgDWtH6J
 vSzIGE8BvMCRnTiftr1OqJn3auTj7V7lBfs52PltvWwmFc8bAH3TAYcKpDA9iQqCwahz
 phfgBjpbA7kuSTbk9FVtM6zJeBH1XVvqyNwCLzDcJoafY4Oa6pf9i612ZJgJKM7UsuaM
 1ahLfHGbsl4GxVYeXkjNLYJS+GP871/T1egaHzv0kQqn6ecdVkV+B0YICndI18S9hEcl
 iRbg==
X-Gm-Message-State: AOAM530DlYcq70EuR9fIwQbJNQh7QiwwAv2K3TUlKI/2lnwvYYt/8Ili
 ZxUF/6XTgRtVoo0QJhqWD308RQ==
X-Google-Smtp-Source: ABdhPJx/K0rep6NcSI3QK1igrSpIEmh0wEXLyNbrkdKGG3aeJ9R9a4IpiZBTJZhKB0lPv92r5jVPlA==
X-Received: by 2002:a0c:aac2:: with SMTP id g2mr21257398qvb.41.1632697713025; 
 Sun, 26 Sep 2021 16:08:33 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id u12sm9643277qtw.73.2021.09.26.16.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 16:08:32 -0700 (PDT)
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kyle Evans <kevans@freebsd.org>
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e43cf822-c23d-1ddf-398e-71f78ea05b43@linaro.org>
Date: Sun, 26 Sep 2021 19:08:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926220103.1721355-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Sep 2021 23:08:36 -0000

On 9/26/21 6:01 PM, Philippe Mathieu-Daudé wrote:
> Reported-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   bsd-user/meson.build | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 03695493408..a7607e1c884 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -1,3 +1,7 @@
> +if not config_host.has_key('CONFIG_BSD')
> +  subdir_done()
> +endif

Why here and not in the parent meson.build?


r~

