Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIlOx-0008TB-17
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jan 2023 02:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlOr-0008Q1-UU
 for qemu-trivial@nongnu.org; Fri, 20 Jan 2023 02:01:22 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlOp-0005Dl-Fz
 for qemu-trivial@nongnu.org; Fri, 20 Jan 2023 02:01:21 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso3674493wmn.5
 for <qemu-trivial@nongnu.org>; Thu, 19 Jan 2023 23:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RXYeRnu/87Mvcfk9IZAc+Dm78jV8PD58MD1by96OlcI=;
 b=JXYuTJ7PTyp31jbxvPsjZ67r5SqSnMKvR32tfqhfdfZr7wqlpsc10YCihuWRM2GVwV
 VasjfEOYsX81JsMrnFqixOLMo2miJVwfYcALeCrDWCGxIGz9+LK5yFZW6KrKNV73SxNp
 TYH7EjGqDQ09JSWKWOHynz+WicWN1VhpyWVQddRY0oCKBUF3M5oK9/NVYiCoEWOYPrD9
 2I/kkFunbo+hF3OR2YhE+oKCLdbbvkxZilMU9sDr7ps1507Sq8CI2+Dyn1VZoLAIevm6
 WmpLVUbbe+VZDFrOXhP3jyV8qBG/waA9XsEF5GGsQQKCSKVoUwi1RqYCd/dYP5YSJ6Vf
 TMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RXYeRnu/87Mvcfk9IZAc+Dm78jV8PD58MD1by96OlcI=;
 b=H+Z31TLifWptud/rf5M+UHWvgdOS8v2RRoVEl5MqbXVTLYmCxVb1APqFhqIWp2AavO
 aRVxU4mlBn2any/SFdmnxgb14QspRqhPrFbr6+nSmJzbA9bVdKHledKWKgf6QN22bb1d
 zO8AXEImNAGlMlw5cSnV02lStUYDzP8Y29Ob0WKMsoJhMhp7jSom70CrvN1OGYUIu8Qf
 kxcXR5iJhRmWT38xmGD0cvHKszLUiAt3jP5MDl1AFbVnFx9il1jrD+IxSx0M2Rb+/TNP
 Yj2CQLlXqUtPFnM2wLJHzlYPdRacTm+LPZA1Udj1iKl7Mnk+v2N+qf99ovJ5oUfIbWhM
 5/Gg==
X-Gm-Message-State: AFqh2koaNgKo6Q+Ng1qPZmsovpyb+c/ZJrtoYzXVbNumcCBfDsdSyY4l
 Bpou2YTjoGL8JWIV4YAapekxBQ==
X-Google-Smtp-Source: AMrXdXtBv6zlPIzI7+xxUxF5fu5QMZpPACWoxqtwtxIeCT/8ikExBMJHk5LGx8c/r35H67gWxLfvzg==
X-Received: by 2002:a05:600c:4e93:b0:3db:d3f:a91f with SMTP id
 f19-20020a05600c4e9300b003db0d3fa91fmr10640560wmq.23.1674198077576; 
 Thu, 19 Jan 2023 23:01:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm1287281wmq.46.2023.01.19.23.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 23:01:17 -0800 (PST)
Message-ID: <4410fea1-e463-7445-da9e-ea555c335b96@linaro.org>
Date: Fri, 20 Jan 2023 08:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] log: remove unneeded new line
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230119214033.600FB74645F@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119214033.600FB74645F@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Fri, 20 Jan 2023 07:01:23 -0000

On 19/1/23 22:40, BALATON Zoltan wrote:
> The help text of the -d plugin option has a new line at the end which
> is not needed as one is added automatically. Fixing it removes the
> unexpected empty line in -d help output.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   util/log.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



