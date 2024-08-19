Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sfywq-000827-Sk
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2024 05:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sfywp-000819-35
 for qemu-trivial@nongnu.org; Mon, 19 Aug 2024 05:45:11 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sfywn-0007sN-0x
 for qemu-trivial@nongnu.org; Mon, 19 Aug 2024 05:45:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4281d812d3eso45018265e9.3
 for <qemu-trivial@nongnu.org>; Mon, 19 Aug 2024 02:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724060706; x=1724665506; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GSVvw+LToAhIkv7UFomu6iKZWhqsx6SkthRz7pgB8HA=;
 b=uUZFTLWrf/PyuaHFADOER3hu9VQl+m+csM5GN+81LGbDrBvYxyOAAGEYUAYTQMCdtd
 LqeqxvEEYFz88xtC9N70HqpLdklQk/wedR4fKGgC+jMnyGsPBFBkqVK6fxFKgAUZvEYO
 Zem2cC49vjh1EBd5V30jCzYGO/w6D77s5by3l05pnxFwnSXmmaq8NefG4XjGsuI4Oibv
 nWUJvsSs/19HsiKPhXqvl+gJBt3Hk43XjhsbEvflNHFvHEBZtuEO5VFSLo5Jrd3thNv7
 DtrSdb45V5WBccadXRjJBvxweSVumAF/0YcwRW0D9ZggjudzjKMx/zjWv40kSmj4MqCY
 /rIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724060706; x=1724665506;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GSVvw+LToAhIkv7UFomu6iKZWhqsx6SkthRz7pgB8HA=;
 b=Jc0KWw/9cQ63/vSmpFNrzigdJsDQrvN65HRhodYwfD2lCNaCuVFXf04f01crd9Kn3O
 G6kCfbv873i9O4ElVOuRcrQHnIMwfSgifwS5B37P0CG52KN9Bxg3vFOn14ao3Qw7CEHi
 EvWiY3SB/BbCNdfCibV18yLAQwfj2voMfxV+4q/8Ed6Fbw8PJ0ovg/WZ6m++rvVzmmoS
 bPtRhyEjEiqx7IHE3sij0zHHZkVJ8GeUTU60HainNZsz3job0ab4NEcZP01ZAcOzE5Xz
 phsAoM+xWSUCTkO9tvx2hea0pKUDf/qS+QGoxfI8KKzJRORl+S3//Dhrk+SbZChzbmzF
 3fqQ==
X-Gm-Message-State: AOJu0YygVEmSyByAW3mJhMaM9vFDwHiveoXkc7hdxntP8O1x+NWoHsE+
 4Ruh8ion8Fm5fsQFOVb+rUwCcq56/Nf/ON1oQLtdwXi0izMtqWZYtfwlEOBmxtM=
X-Google-Smtp-Source: AGHT+IHlwZUSKVxYP6mL0kkYd6WY+av7xVhkS+4m0Ot/PugLk7rkLVtPYOG0GSBZFR0OE/76a6W6Ag==
X-Received: by 2002:a05:600c:3d98:b0:425:81bd:e5ee with SMTP id
 5b1f17b1804b1-429ed79b89cmr78775295e9.16.1724060706282; 
 Mon, 19 Aug 2024 02:45:06 -0700 (PDT)
Received: from [192.168.166.175] (83.red-95-127-94.dynamicip.rima-tde.net.
 [95.127.94.83]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded2931asm155090975e9.17.2024.08.19.02.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 02:45:05 -0700 (PDT)
Message-ID: <d34e9015-432c-4663-a891-107c039ab4c4@linaro.org>
Date: Mon, 19 Aug 2024 11:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 v3 1/2] hw/i386/pc: Unify vmport=auto handling
To: =?UTF-8?Q?Kamil_Szcz=C4=99k?= <kamil@szczek.dev>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Joelle van Dyne <j@getutm.app>
References: <IrhtgC0oPtusYG_0cOwVYOuOr0UpK0YLNYNtxDQ2_lqgtcVBzVr-gYNUzggvmO9tHdmf65aO8Zoab-ERkyQbtjx9u2VuHEYZ_3r0Wb25huw=@szczek.dev>
 <v8pz1uwgIYWkidgZK-o8H-qJvnSyl0641XVmNO43Qls307AA3QRPuad_py6xGe0JAxB6yDEe76oZ8tau_n-2Y6sJBCKzCujNbEUUFhd-ahI=@szczek.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <v8pz1uwgIYWkidgZK-o8H-qJvnSyl0641XVmNO43Qls307AA3QRPuad_py6xGe0JAxB6yDEe76oZ8tau_n-2Y6sJBCKzCujNbEUUFhd-ahI=@szczek.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Mon, 19 Aug 2024 09:45:11 -0000

On 17/8/24 17:25, Kamil Szczęk wrote:
> The code which translates vmport=auto to on/off is currently separate
> for each PC machine variant, while being functionally equivalent.
> This moves the translation into a shared initialization function, while
> also tightening the enum assertion.
> 
> Signed-off-by: Kamil Szczęk <kamil@szczek.dev>
> ---
>   hw/i386/pc.c      | 5 +++++
>   hw/i386/pc_piix.c | 5 -----
>   hw/i386/pc_q35.c  | 5 -----
>   3 files changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


