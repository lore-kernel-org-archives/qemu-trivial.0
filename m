Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rd0IC-0002od-1t
	for mharc-qemu-trivial@gnu.org; Wed, 21 Feb 2024 23:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rd0IB-0002oT-B2
 for qemu-trivial@nongnu.org; Wed, 21 Feb 2024 23:02:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rd0I4-0007H5-5K
 for qemu-trivial@nongnu.org; Wed, 21 Feb 2024 23:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708574550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1faIOiExS26ujZjxJUrYaGy4bPENpXxP0Tdvc+SQStg=;
 b=bjswkBAKImzYaixUkOwiFO8coUkbvgde+lesLcYL/5kvCaxlfLIao1IszLviuidXhg5Aiz
 7CeZ8eknXkTK0NQGNIbsIt8aqd2lk77lCNTKiytlYG5OJWwhYHnYX1pXiCRVH3rK0mDgnc
 H+13/bCUc7pniqXLd841Xn8bYP+fEo4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-W6zuJIuXO9OChDq6mXPJig-1; Wed, 21 Feb 2024 23:02:29 -0500
X-MC-Unique: W6zuJIuXO9OChDq6mXPJig-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-411ce6e7708so39627595e9.1
 for <qemu-trivial@nongnu.org>; Wed, 21 Feb 2024 20:02:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708574548; x=1709179348;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1faIOiExS26ujZjxJUrYaGy4bPENpXxP0Tdvc+SQStg=;
 b=TRJiY92pd4RxV07GLqD4ADaJTSUC8EfQLKUyD76bk4r7VVsOttMIIEYgPtJ/xC/hBV
 Q0mZK2wRc8jKfOnzmZXSzyPd5HhCIZvIjH0zGDWE8vXhjuSGPmw2TEr7a68A3gp41VRY
 AdjMl8Dhmu+HKh19JIQI2s6j4/v36hR+Nwr1XWgFu0hPMaVL19s58yc7gBBt/7X5V2jo
 zC0lwGBKGLR18CI4AxaamISMRuOh/NNk9Hz7iE8qg6ec0GA5JROxPY/RVfltWSJhWFJd
 88n/rwoLIsyFdmm+HPVJFLQUmNpZgasHEtsiMnS0qyElWyvLaCshe++aowaL7TLZI7Ak
 l5pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6EnQyU0fHy4J4yYP9EeFbVIeRa9E1wsiySnuiHWfc5Rsi71by/Wpxmq1BAplDi8551W9s+ZGVmk5DyV36PEuZ5+wVRLl0XQ==
X-Gm-Message-State: AOJu0YwzeKPpKG4X72Y3c7q2Z38x6bDxjXkBnyC5XsTo/ezusXpNHgDz
 C25KUCnLf3hNaeRpGtJ7zkTltPeZmpcKCn59QukkR9faUd+gydLPmzNco4uhc0JTWHoUoLtTKsc
 Axc4IqVHmfmsB30UXNKl8TKbPj9TG9AV+3qJOU3Ss4f4kMDT0mdT568o=
X-Received: by 2002:a5d:4389:0:b0:33d:3b83:6ca3 with SMTP id
 i9-20020a5d4389000000b0033d3b836ca3mr8141273wrq.64.1708574548101; 
 Wed, 21 Feb 2024 20:02:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdQ5wlHWZLB6IG9y57GTvPguBCS18JhKTcvLsYYqQHeP2hFbFQOMYCA/lbP9srbqf0esj57g==
X-Received: by 2002:a5d:4389:0:b0:33d:3b83:6ca3 with SMTP id
 i9-20020a5d4389000000b0033d3b836ca3mr8141261wrq.64.1708574547804; 
 Wed, 21 Feb 2024 20:02:27 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-100.web.vodafone.de.
 [109.43.178.100]) by smtp.gmail.com with ESMTPSA id
 j11-20020adff54b000000b0033b43a5f53csm18834788wrp.103.2024.02.21.20.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 20:02:27 -0800 (PST)
Message-ID: <a9bbbae4-2e73-4027-8c46-0d0573597129@redhat.com>
Date: Thu, 22 Feb 2024 05:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] system/vl: Update description for input grab key
To: Tianlan Zhou <bobby825@126.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
References: <20240221195208.462-1-bobby825@126.com>
 <20240221195208.462-3-bobby825@126.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240221195208.462-3-bobby825@126.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 22 Feb 2024 04:02:39 -0000

On 21/02/2024 20.52, Tianlan Zhou wrote:
> Input grab key should be Ctrl-Alt-g, not just Ctrl-Alt.
> 
> Signed-off-by: Tianlan Zhou <bobby825@126.com>
> ---
>   system/vl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/system/vl.c b/system/vl.c
> index a82555ae15..b8469d9965 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -891,7 +891,7 @@ static void help(int exitcode)
>       printf("\nDuring emulation, the following keys are useful:\n"
>              "ctrl-alt-f      toggle full screen\n"
>              "ctrl-alt-n      switch to virtual console 'n'\n"
> -           "ctrl-alt        toggle mouse and keyboard grab\n"
> +           "ctrl-alt-g      toggle mouse and keyboard grab\n"
>              "\n"
>              "When using -nographic, press 'ctrl-a h' to get some help.\n"
>              "\n"

Fixes: f8d2c9369b ("sdl: use ctrl-alt-g as grab hotkey")

Reviewed-by: Thomas Huth <thuth@redhat.com>


