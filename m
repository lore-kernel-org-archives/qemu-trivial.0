Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1reW4s-0001dU-Jh
	for mharc-qemu-trivial@gnu.org; Mon, 26 Feb 2024 03:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reW4p-0001bk-Bk
 for qemu-trivial@nongnu.org; Mon, 26 Feb 2024 03:11:07 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reW4n-0002dD-S8
 for qemu-trivial@nongnu.org; Mon, 26 Feb 2024 03:11:07 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3e891b5e4eso307221966b.0
 for <qemu-trivial@nongnu.org>; Mon, 26 Feb 2024 00:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708935064; x=1709539864; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IXxTAwoJKY2jfKurotE+rFCHnfcn+5saUQNAytaPDDk=;
 b=hpW2teennsvUyXYD4DAlYBH61/J/IQd7quphUYPHodY59J31ASQ14ag387H7yU9wbQ
 bF43DkD3bLZeJSpf1Ef9D8iMT/drMh4anGdm07eFCfIhwyZQnP1qTsNjm7EThihiOMyL
 HIE1jcP6Tt7QPt3zCHuwmMX0ttrp5Aluo0YC2KhM3lj9qfttWHoFNwzIzSIc1129gt4I
 1nfmo8wVUiz8Gf20G1LW2jKwYTIlAGBfFWuQXsRGcDBgesmVAJBZidG4dyhJD0zJrEmi
 X0Tjj4dHJULVsXMPnjTR739Zm8g+LhHu8Uf3WSeQfjZbdCJZ1OZ/wt4L3VjaX/j0ZW6X
 qKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708935064; x=1709539864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IXxTAwoJKY2jfKurotE+rFCHnfcn+5saUQNAytaPDDk=;
 b=JJiYJKVRNE0JVUECCqErbMsNS16HAEQuK+3fjDjaXkKo4XeEnEyOnjIiqMfIOZyNU5
 R6gq1qUT0QhyiS3aP3zUvdzgCqJXM95j8rVy+7l+pcvIqC3iKDxEYND7kQyIlrP6Yzw5
 cTkdG7FB+L94H5FGnLqouGHWW3esro1rGy+L+lXuKPVCdbXBPEv6HuvuU+T3aQeJLwh2
 NMHskgC+pyFluqreHpNkpNp3EUKxt+q+RCxCFbULV1u06n6sB+8oYMYIEol3NqHkdn9w
 RWVQTvgVVhWOUSJJu4LY+/hO92n5nItYosmshy/B4kqOHggT8UBLEscAqAu4v5HWX8vV
 AXnw==
X-Gm-Message-State: AOJu0YxStrZTFYMNHs9bRS5VVd+8fFtJWT0JV+20lOJkkb8rSPgYVTN7
 WE07X+1St2+b7z0EDBAAIIMNV0FUwZYLPGoIyxhZ/jccEUr6pdG5cQF9DydwOEc=
X-Google-Smtp-Source: AGHT+IEUzjguIvkERSszRezAEUNX5PU20OKfYznX22BzTzPMfMcO6fG96j4iVNrClVcUhP5cyoH4yQ==
X-Received: by 2002:a17:906:2e89:b0:a3f:5144:ada2 with SMTP id
 o9-20020a1709062e8900b00a3f5144ada2mr4542878eji.2.1708935064325; 
 Mon, 26 Feb 2024 00:11:04 -0800 (PST)
Received: from [192.168.69.100] ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 tb24-20020a1709078b9800b00a42fa329ebfsm1948745ejc.54.2024.02.26.00.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:11:03 -0800 (PST)
Message-ID: <c2a2b5b5-10ca-4a7c-84aa-308273e6c7d9@linaro.org>
Date: Mon, 26 Feb 2024 09:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ui/cocoa: Fix window clipping on macOS 14
Content-Language: en-US
To: David Parsons <dave@daveparsons.net>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, akihiko.odaki@daynix.com, mjt@tls.msk.ru,
 kraxel@redhat.com, marcandre.lureau@redhat.com
References: <20240224140620.39200-1-dave@daveparsons.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240224140620.39200-1-dave@daveparsons.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 26 Feb 2024 08:11:08 -0000

On 24/2/24 15:06, David Parsons wrote:
> macOS Sonoma changes the NSView.clipsToBounds to false by default
> where it was true in earlier version of macOS. This causes the window
> contents to be occluded by the frame at the top of the window. This
> fixes the issue by conditionally compiling the clipping on Sonoma to
> true. NSView only exposes the clipToBounds in macOS 14 and so has
> to be fixed via conditional compilation.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1994
> Signed-off-by: David Parsons <dave@daveparsons.net>
> ---
>   ui/cocoa.m | 7 +++++++
>   1 file changed, 7 insertions(+)

Patch queued, thanks!

