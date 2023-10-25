Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qvnEB-0000Ch-0z
	for mharc-qemu-trivial@gnu.org; Wed, 25 Oct 2023 19:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnE6-00005l-7Z
 for qemu-trivial@nongnu.org; Wed, 25 Oct 2023 19:23:51 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnE4-0002on-Jo
 for qemu-trivial@nongnu.org; Wed, 25 Oct 2023 19:23:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1cc04494653so1900485ad.2
 for <qemu-trivial@nongnu.org>; Wed, 25 Oct 2023 16:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698276227; x=1698881027; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YzUOicqAHZtKpGRgbqgDSyXm04r78JXVYAf/cY5pEuk=;
 b=KHLywVn8XWKE0rflxDh+I26tlshcJHJAwlpVtcUKynni6PmUOfPyhzsF+aH8JDu3dJ
 5RtwNqHhs1DSf8ehnajQR1z0ymI9314AvnusDbBcCFpCMAG6SG1d8XKOS7ntIVy2cCl9
 r3mC56p07NvgrKq/ScIMwU5Pl/iGf7aOmDb2vuNjiLZ+JioslF/x4qxPLQx1V3MMCD6l
 b3WGRSBHnt26M8HC/jY4FKfooSFhdgDl1KXJCqJqzLfaOj+jPksjoLtzsKgupH1BByvo
 +gy7jtWTPbTGnZ/Vg9PYWg70qJhVIreOB6Rbjn8XYzvTXavJjjZYgaf1DenvFKHCCAOp
 un6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698276227; x=1698881027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YzUOicqAHZtKpGRgbqgDSyXm04r78JXVYAf/cY5pEuk=;
 b=McNRNmslr+XICpycVZSt31GWyWyMql7IpqHfxTSic+Fi5e0gvojrEjwaA9ILvgC0eY
 VCpB5dVyC1DjH9k2V1x0uozYrtWPVyXDnm33nW3m5KS3qFj9xKMrxZO0ny3QAt8hOswk
 G4EnpP/TqZX8gykwV6q3AojGSu8R4v+DdbGz3YpevGtlbHXv8rUB3q8LU9IVCzF10SZ6
 EAuHKOBq1HT/JlTf+d8tHC9GNT9Z8rbdTVArfwzTDrp1AzdYdx662KHmvYTpRj0VDlAo
 CYQg26V0O0cKbWgCxGcIxGT2Awc9iI3XvFzIexfXDvwWSitjPLQypGUvjYUpwwDpSHit
 mgbA==
X-Gm-Message-State: AOJu0Ywhwiy4O5nhZ9akRzzMbTlZ6Ci/0Xu27qxt4TyEsHXsRoaNWTl0
 zoREwvaC/vsNcjZxeXNQsLrLow==
X-Google-Smtp-Source: AGHT+IGjTQpuaCKXmD3uVw0yHW26KIKffepWc8q/joSTGCzBRuz5Dmk2Mt+V/xev48VXLLQjsMCVLQ==
X-Received: by 2002:a17:902:f988:b0:1c3:2df4:8791 with SMTP id
 ky8-20020a170902f98800b001c32df48791mr13293281plb.27.1698276226918; 
 Wed, 25 Oct 2023 16:23:46 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902680d00b001c0de73564dsm9926456plk.205.2023.10.25.16.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 16:23:46 -0700 (PDT)
Message-ID: <f4c07e08-fa8c-4876-9867-1ae661e290e2@linaro.org>
Date: Wed, 25 Oct 2023 16:23:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] hw/arm: Move 'hw/arm/boot.h' from header to source
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20231025065316.56817-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Wed, 25 Oct 2023 23:23:51 -0000

On 10/24/23 23:53, Philippe Mathieu-Daudé wrote:
> Almost no ARM board header requires "hw/arm/boot.h".
> Move this header inclusion to the source.
> 
> Philippe Mathieu-Daudé (10):
>    hw/arm/allwinner-a10: Remove 'hw/arm/boot.h' from header
>    hw/arm/allwinner-h3: Remove 'hw/arm/boot.h' from header
>    hw/arm/allwinner-r40: Remove 'hw/arm/boot.h' from header
>    hw/arm/fsl-imx25: Remove 'hw/arm/boot.h' from header
>    hw/arm/fsl-imx31: Remove 'hw/arm/boot.h' from header
>    hw/arm/fsl-imx6: Remove 'hw/arm/boot.h' from header
>    hw/arm/fsl-imx6ul: Remove 'hw/arm/boot.h' from header
>    hw/arm/fsl-imx7: Remove 'hw/arm/boot.h' from header
>    hw/arm/xlnx-versal: Remove 'hw/arm/boot.h' from header
>    hw/arm/xlnx-zynqmp: Remove 'hw/arm/boot.h' from header

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

