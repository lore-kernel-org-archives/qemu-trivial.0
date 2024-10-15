Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t0ipp-0002iR-ER
	for mharc-qemu-trivial@gnu.org; Tue, 15 Oct 2024 10:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0ipb-0002gy-JS
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 10:47:29 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0ipW-0006vC-6q
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 10:47:23 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-71e453c7408so2601311b3a.2
 for <qemu-trivial@nongnu.org>; Tue, 15 Oct 2024 07:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729003641; x=1729608441; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oLU9JFZH41dRezNGjUIlFApdphtq84Y37lvITKPsGLo=;
 b=HPt9cLRzVFPt2olwf5z/rSbi+p2PnKIRFU2bGUNwH1vv55BOGVEwPyWAdAqrtk6nBE
 jwCo/88/TVl88CoJIV/+ugSPw+fsa2l7YObgA5suAUgG8uXvxcqC7UCL6hVeC/9MaiRr
 VkMM6+VAveDyegdEQMCQI/SMCRtyvSN7OssfRqDgyZtdtWSyC9AMVY8u+uKeqKEaXa+l
 Ju1+EiT7njxRfgoF4cuTUtTr1gWNY5JioHb+6SwKxaeNkbdGWvjK2g1jJrLzWAlMTg6o
 jqAs2eMMrIefSHonF8xrf3Ic879suhgX41FKjIFTrRa7H6vcrBgE5m9A2gPOHYT0rgq6
 7ZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729003641; x=1729608441;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oLU9JFZH41dRezNGjUIlFApdphtq84Y37lvITKPsGLo=;
 b=wtzps/Vn6Uwkm5IfxR7e7fhrw348mn3sVFrZckLf0FX6eIZg0CgIgRPuiyClYeS4Lr
 u0tDrzzkMwOM38El4RuGjZnuPiL+Qv2FzUwmZVFH+n8c1AUVad9R2eeGYv45CK8jSI/c
 qkLsIDfV7Od6NvMQ2r6CXRgwvGIWQuH4ndk2X9lSSVKqId4lqUYIMqrqz37l29GpvfpF
 yxhYZ6yBad/M0SQBQP3pIo9WmWCJiCbmb5WbG59+BiBReNEvYSEuQ5FBeXviiLlQSwDT
 BMUJRSDAKUA+G4tMC/ZvL7z7BEonQEtgMLFbeqxxDA/NgNdxinm3L7St3OTtC02UVsr4
 xLZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY1a2VKb80nA64sfEnm7fDhYWRbAme61ju2NnjUlY79GDpcYaXhWcJ80+nlKbgYxIoTi3a7NsUEM++2Cw=@nongnu.org
X-Gm-Message-State: AOJu0YzS4wNY0x3GYLdfPPTx4nfRu45PlHbbQgnZK/x1MisrEn95KgcF
 J77gDcvfZY1eUD54Ijtx3OBMieYXJYnfRlg149Y4KPS0CI2TT+cO0B9ctIV+zNsasISZCTqklIl
 C
X-Google-Smtp-Source: AGHT+IFW5cRIODPbiNm59YeWZaPskcbDW4uvUJsIIGwfJaMDcXJGXWP9bZmpI9h5ijsJFOVP8Qkr2g==
X-Received: by 2002:a05:6a00:b87:b0:71e:19a:c48b with SMTP id
 d2e1a72fcca58-71e4c1cfc30mr18172068b3a.22.1729003640713; 
 Tue, 15 Oct 2024 07:47:20 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e773a2fd2sm1345111b3a.74.2024.10.15.07.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 07:47:20 -0700 (PDT)
Message-ID: <3a7da33b-c802-44f2-8478-ce4de64665a4@linaro.org>
Date: Tue, 15 Oct 2024 07:47:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ui/console-vc: Silence warning about sprintf() on
 OpenBSD
To: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20241015112510.412471-1-thuth@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241015112510.412471-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Tue, 15 Oct 2024 14:47:34 -0000

On 10/15/24 04:25, Thomas Huth wrote:
> The linker on OpenBSD complains:
> 
>   ld: warning: console-vc.c:824 (../src/ui/console-vc.c:824)([...]):
>   warning: sprintf() is often misused, please use snprintf()
> 
> Using g_strdup_printf() is certainly better here, so let's switch
> to that function instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Use g_strdup_printf() instead of snprintf()
> 
>   ui/console-vc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/console-vc.c b/ui/console-vc.c
> index 8393d532e7..53fcee88f4 100644
> --- a/ui/console-vc.c
> +++ b/ui/console-vc.c
> @@ -648,7 +648,7 @@ static void vc_putchar(VCChardev *vc, int ch)
>       QemuTextConsole *s = vc->console;
>       int i;
>       int x, y;
> -    char response[40];
> +    g_autofree char *response = NULL;
>   
>       switch(vc->state) {
>       case TTY_STATE_NORM:
> @@ -821,7 +821,7 @@ static void vc_putchar(VCChardev *vc, int ch)
>                       break;
>                   case 6:
>                       /* report cursor position */
> -                    sprintf(response, "\033[%d;%dR",
> +                    response = g_strdup_printf("\033[%d;%dR",
>                              (s->y_base + s->y) % s->total_height + 1,
>                               s->x + 1);
>                       vc_respond_str(vc, response);

Could be better by limiting the scope of the variable to this case.
But either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



