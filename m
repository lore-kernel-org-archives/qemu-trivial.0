Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tdRlv-0007bv-Go
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jan 2025 05:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdRlt-0007a6-U2
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2025 05:27:41 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdRlr-0000wm-SO
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2025 05:27:41 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436341f575fso6396405e9.1
 for <qemu-trivial@nongnu.org>; Thu, 30 Jan 2025 02:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738232857; x=1738837657; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0HEnfd3vYGqVopqupIod4qfD+i2GZ/7R21Dp9JwJvKQ=;
 b=el9KjAMWWRbkGnU5xP+Ldqt8fWycHx9D8ZI0G7sy7+ATVCevSsmy4FpmR+jh0Q2/B4
 PvKOzzHVqw2PEec9esX6XY5A7UjLAVvdscdaR6FDp+UT1Mc8Z1LyI8c46KDQ64ekGA/q
 8b6LHSRRHK8Adf5GaXnomHoGK3s9LVNk1O3pautoPf8r+32Hu/vfZ94uBXxtpvejt244
 +GA6h13LET020K6/Zp8MmUBkz1uUd8GwIgd3/Khzl2hwV2+os5J1ltfUd3K1IpTSYhc6
 uerZaA22FF1fIJ3pjkQ+4PjPMDZzdFmKM1gXBzg20okOBAJ6IZsOD9qMr7sMOWcehI9v
 mFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738232857; x=1738837657;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0HEnfd3vYGqVopqupIod4qfD+i2GZ/7R21Dp9JwJvKQ=;
 b=PDw2bTA14ICc1yLSxOzpATVwv4HS3ZsGZ+5KxE0Fa2rfwgqC+01Hy/Sx7XNn31OuFu
 BjDP/oaOJAnU59vRLBXJTA8z+cwYJPwHUNUj1QzaG3pdF0kI2ZWxefG1nFqocjXXP+nk
 MwEn3Ye0ooUXd0HmJ1i7Yu8y5lsAmOtwUg7JZYygz55k4+qNZssDI5Jlsy6EHeOQvzaI
 mK4Xbkc5lMDxowyQ7xHUKkycVUpPB/33WyTLkZi+c/OE/PA0cy6eMj7+vsvTYJUF1BmD
 PbzF9DKPpCtaMdng1zQXh8+WR/FL3MsmvV3OfZQpjkjc854nfa3EATOuDRSHijdUtg00
 p+aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7xfqh3KsT1LvH7JsoZVJcpI+9My10mGneTDR5/RoAA03Dun+sq+QDN6gjshxtExRUR7HFY0GAtwWNuWM=@nongnu.org
X-Gm-Message-State: AOJu0YzWUB32iK6W9ueHQP53bblp2iaQj6XvkDwWfTccABoSlBw8h5DQ
 BDBom6vSIl2Jrrpg9LWtBZtOrcBm3Pxe3X0rNbwWRrXxV5FlphOhLIbbp5rJ4Iw=
X-Gm-Gg: ASbGncsQFbNZjgudKvKTPObKJNM9IjemVQxgR9+SlW5GfM1UyiEVAqWbZ1DiRUQLTUm
 Y4Up65xgfplTItVD7SAKh3uxEhumBHlihhR9+914Ni2G987gIBxN5zf8+knsaNmgYQPiq00iOE7
 Zr59jeJEGNmYnsO/Fka+6rPpDEY8cbJnzUqsc/m8fznGtiSWXFKTGF56B3E9HDq0W8gR1qPiu+4
 y5SqxbXUpYmlwYn4Gpo2tSCdGM3S35INVtQYgcD79vau5cmjUbVwWyd+nqlBv8COaejTALhtp19
 5WiyOjnogsVsTBffAJEuPxEYajgdGE0ZR1KGEFuN8Sl+HfrMmPkBQZKg0DY=
X-Google-Smtp-Source: AGHT+IG/OObATeVJ4F8gvOa86e4bHj3xhKH5FL5eUJxfjbJiWbSRKF1uJhqxBfZwv7gU0XIUQbUAqQ==
X-Received: by 2002:a05:600c:3c82:b0:430:57e8:3c7e with SMTP id
 5b1f17b1804b1-438dc4251f2mr50749615e9.28.1738232856658; 
 Thu, 30 Jan 2025 02:27:36 -0800 (PST)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245f49dsm17990325e9.35.2025.01.30.02.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 02:27:36 -0800 (PST)
Message-ID: <7bea68e1-855b-41c2-be28-bf94a1b43cc3@linaro.org>
Date: Thu, 30 Jan 2025 11:27:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] hw/i386/pc: Remove unused pc_compat_2_3 declarations
To: Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-block@nongnu.org
References: <20250115232247.30364-1-philmd@linaro.org>
 <20250115232247.30364-2-philmd@linaro.org>
 <9ee34c5f-d65c-447a-b128-96cf44b94b6e@redhat.com>
 <85be953b-7166-4353-85c0-7e15b9ec6423@tls.msk.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <85be953b-7166-4353-85c0-7e15b9ec6423@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Thu, 30 Jan 2025 10:27:42 -0000

On 30/1/25 10:59, Michael Tokarev wrote:
> 17.01.2025 11:52, Thomas Huth wrote:
>> On 16/01/2025 00.22, Philippe Mathieu-Daudé wrote:
>>> We removed the implementations in commit 46a2bd52571
>>> ("hw/i386/pc: Remove deprecated pc-i440fx-2.3 machine")
>>> but forgot to remove the declarations. Do it now.
>>>
>>> Fixes: 46a2bd52571 ("hw/i386/pc: Remove deprecated pc-i440fx-2.3 
>>> machine")
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Thomas, such pick-ups from larger series may not be a good idea
> for qemu-trivial in general.  But this one looks okay'ish since
> the series is about 2.4 and 2.5 machines :)
> 
> Philippe, are you okay with merging this one through qemu-trivial?

Sure! Even appreciated :)

