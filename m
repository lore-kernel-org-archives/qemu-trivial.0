Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78582C83F26
	for <qemu-trivial@archiver.kernel.org>; Tue, 29 Jul 2025 11:26:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1ugiTI-0006SD-6R; Tue, 29 Jul 2025 07:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugiTE-00065t-CQ
 for qemu-trivial@nongnu.org; Tue, 29 Jul 2025 07:26:12 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugiT9-0002rb-5y
 for qemu-trivial@nongnu.org; Tue, 29 Jul 2025 07:26:12 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so43842665e9.1
 for <qemu-trivial@nongnu.org>; Tue, 29 Jul 2025 04:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753788364; x=1754393164; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bamcpu4ZxaiiMEq1WdGInn9RkfGT1cDZci0aMm9WFWU=;
 b=tUVXWT7CGvjCIXTZnV+K/v2aBbdBKcHyAvgfciSmQRpj3eSFe1w2DAWjkIE2r8x7Z+
 pPoAsAZJExx7v4HEzWvLQHRrqczLejA0xZL40YE3kUBwUodGrykUe61ODL5b2Nm2kScH
 n+MTL3ne0LHzfUmSvd8Q9+KuSGsDSSLIhbS40hRHG/oUOn2eM5yGCI8nEqdGKDBJOk5O
 3BolqJOih2jiz6kxgBdcIKyNx/HyC996cVjTuB6A2hwYfhNLNwae18z4B1T8ESoHJQik
 q7IDVUZqytZl/Ut37B12IMaQEaXjeEjS7uykspr6nHnZT8hw+fef/YSgOEw6+vSoZMT4
 3Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753788364; x=1754393164;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bamcpu4ZxaiiMEq1WdGInn9RkfGT1cDZci0aMm9WFWU=;
 b=RciNQhpOsOKOMoolw7PaSb3l1fhU0G81R3usJJsHccAs4R30LyU6rsKl/ddijOPniw
 0GeJRqw+XXtxJoSq5d0ttCy9fcrKck4E8F3SNttuO+zzaieFKAwSm8abYeAvSs4IZGBa
 yjXZJUCUP5lU7LNwXXoypKnpPU17LYmZeFzs3Q9aaVRLvw5SFxHrgud0TNGxshZFjqra
 nN2aLHryveM9WGRh4dxhL/e/t4a8o4Ov25Qulv8JZQc1vyDmsdwrooEHZG/MVpR0LTnj
 aXRtqijDjb3ArBYXdGT2ZMF+zjtU5JxqRhJrpVsYyy+xaLp/xStv/2u3DElwofDeYKrp
 HdLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs1JSIrx5n+uG2dUWEyQcpO9kVyLLaYimSoU5wJpsGou1pOWgcA9bD8yCVfpMP48vUpWjH+NYH/UQa6YA=@nongnu.org
X-Gm-Message-State: AOJu0Yz6pCCqapgR+8NLpkiEFqhhoVa5OZr9SMadDJAAG/mKI/uLRL34
 r2zCA7HBiFHE827CxQ3fJrRVw10kBWbZrNp/8gWAYjx5JhQgOI5qlZOWBVJfodGCAmg=
X-Gm-Gg: ASbGnctKhi4MwsEv7QPQT+Otu+B5x5ZuuSqJSitjsJyh8ODDaXe96040ZrGNfdmL9uq
 TMKUQ+14e2spLfskEU8rkwEPhqdRJM+aNpghql2GihVSJ7k5DQg4B3f83/tbG9cYyQdrrRGkihY
 DjkIj0SWbwgEr1athsbiY1J6FU1Wx2k82sdlCbcD4gQHKu+OsCNPY5Yovp44g+H4VkA7TuWdquP
 QqoWRpmpa8ZcUbO8KK1aDmSm7tOs0mZS/xEMsUjDIJQmVR0KJCmxz7MnJ8xolgiSokoPUNJHinH
 nDXF3TsgMuFU6crLeJEWC4/ilmKtEM2DWx0Y8UDitINC2WWn6BAsKOukprmHmO3j5dysbOILQl3
 Tsm52C4Rtw/pnHGBGNlbH21A+PcOnv1LpyIhzhD2NBt0hT2yqXnStYapKvGFdWKZq6Q==
X-Google-Smtp-Source: AGHT+IFsGQgT3nWmOCzVxTZbl/bJv6N+J6axhFXup1a5if02Esb7AvBb5wMQiuZlrbRSMG067C0NVA==
X-Received: by 2002:a05:6000:258a:b0:3a3:6e85:a529 with SMTP id
 ffacd0b85a97d-3b77679866emr11233434f8f.51.1753788363594; 
 Tue, 29 Jul 2025 04:26:03 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78d45d010sm3310098f8f.8.2025.07.29.04.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 04:26:03 -0700 (PDT)
Message-ID: <14fff91b-7434-4d90-adb1-ebbe3f51d605@linaro.org>
Date: Tue, 29 Jul 2025 13:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org
References: <20250729111226.3627499-1-armbru@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250729111226.3627499-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 29/7/25 13:12, Markus Armbruster wrote:
> xenfb_mouse_event() has a switch statement whose controlling
> expression move->axis is an enum InputAxis.  The enum values are
> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
> case for both axes.  In addition, it has an unreachable default label.
> This convinces Coverity that move->axis can be greater than 1.  It
> duly reports a buffer overrun when it is used to subscript an array
> with two elements.
> 
> Replace the unreachable code by abort().
> 
> Resolves: Coverity CID 1613906
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/display/xenfb.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
> index 22822fecea..5e6c691779 100644
> --- a/hw/display/xenfb.c
> +++ b/hw/display/xenfb.c
> @@ -283,8 +283,7 @@ static void xenfb_mouse_event(DeviceState *dev, QemuConsole *src,
>                   scale = surface_height(surface) - 1;
>                   break;
>               default:
> -                scale = 0x8000;
> -                break;
> +                abort();

We prefer GLib g_assert_not_reached() over abort() because it displays
the file, line number & function before aborting.

>               }
>               xenfb->axis[move->axis] = move->value * scale / 0x7fff;
>           }


