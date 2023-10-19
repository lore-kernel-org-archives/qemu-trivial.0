Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qtViJ-0004sM-0x
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2023 12:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtViH-0004ro-Fr
 for qemu-trivial@nongnu.org; Thu, 19 Oct 2023 12:17:33 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtViF-0002tl-Pm
 for qemu-trivial@nongnu.org; Thu, 19 Oct 2023 12:17:33 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4083cd39188so16169885e9.2
 for <qemu-trivial@nongnu.org>; Thu, 19 Oct 2023 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697732249; x=1698337049; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gYk4QCu3g6fu7ptIR+Y+ak74EdA9tlsGhp3ow44agnU=;
 b=WQsZs6py1PzXcZAiNyaVncGmvoB0uITS/1289EUKv6N85fJGkA2NYyRIOtrHxKhtOM
 lXJ32gRzbncDJUpZLJmFL0aoJJNfQQMBFFavRA8FBJVqBS3+PKKSy6OKYVWlaoQpDmJw
 Cr57gCWAmWIcLvjXEgotSBVYmc6dWKJZEWLggLdDjCR8UHaUbjQxqkgClcJ0JL1pY2cL
 r6zxLkEDMBbLnntkzwBar1izMAivM8K/KgDSu3JiZ2DXEXNDMU1pNnhhIOc8oJOaOUN5
 X6C+mLxUda3DHjBbDVj53FNQEjwDmpd7lNr6JfUXPWTSRyJgvd707CFjqn/52YVoPW0I
 TzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697732249; x=1698337049;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gYk4QCu3g6fu7ptIR+Y+ak74EdA9tlsGhp3ow44agnU=;
 b=VOOehVl1iFqs4hHINDYzuHtyydRaNpXcPVqfTSqIdFR8HtaumDjxDJA+XY8TJR5WhK
 s/lhdvbFZJcVFBy0V4g7YnxlPnzLHAX/SF5q7KW4/UlDP9YQEnS6hzQWY8dHAhq0OcRG
 FDNxGCHA/h7D6ePvOUV5tDvFq4d+HC/DlM6X8VQmsDabL/jwcccUkAKhT3kUTKc0PjTZ
 2MjFTt9kzpdFyuzrc09G4J+fIeuFvK40/NOAoGRbyeBDCZWAaYk91k3Yd8BBo+wjhk7a
 ssz7825TBmekSiWSbaxBZodOXGemaQ9liFJCpI32Y5wQZWWXYlGpqYhXzy9TZxD5YLTK
 rk1A==
X-Gm-Message-State: AOJu0Yz5787gblAZ4Hz0UwEjn5bpLEotWocKppFe2YH48sHhcgWF8VHE
 7tFmjTW0E3IE5mJD9747ofSx3w==
X-Google-Smtp-Source: AGHT+IGnjYlqFz1TplWyw/flL8Qc+t3rHcvkgJR8eyFD9/avrdO9G+advUmKrJPpxax4UmfKxX82Tw==
X-Received: by 2002:a05:600c:138f:b0:3fe:dcd0:2e32 with SMTP id
 u15-20020a05600c138f00b003fedcd02e32mr2316419wmf.19.1697732249233; 
 Thu, 19 Oct 2023 09:17:29 -0700 (PDT)
Received: from [192.168.69.115] (176-131-216-177.abo.bbox.fr.
 [176.131.216.177]) by smtp.gmail.com with ESMTPSA id
 l32-20020a05600c1d2000b00402f713c56esm4892949wms.2.2023.10.19.09.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 09:17:28 -0700 (PDT)
Message-ID: <fd7ab62d-2141-7199-40f6-fb8d3e7c66cf@linaro.org>
Date: Thu, 19 Oct 2023 18:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Fix typo in openpic_kvm.c entry
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20231019155822.499027-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231019155822.499027-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-List-Received-Date: Thu, 19 Oct 2023 16:17:33 -0000

On 19/10/23 17:58, Thomas Huth wrote:
> It's a .c file, not a header!
> 
> Fixes: ff8cdbbd7e ("MAINTAINERS: Add information for OpenPIC")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



