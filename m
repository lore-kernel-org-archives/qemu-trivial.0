Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppUbq-0003xY-6C
	for mharc-qemu-trivial@gnu.org; Thu, 20 Apr 2023 09:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUbg-0003hm-0E
 for qemu-trivial@nongnu.org; Thu, 20 Apr 2023 09:45:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUbK-0007sG-2v
 for qemu-trivial@nongnu.org; Thu, 20 Apr 2023 09:45:31 -0400
Received: by mail-wm1-x32a.google.com with SMTP id v10so1247216wmn.5
 for <qemu-trivial@nongnu.org>; Thu, 20 Apr 2023 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998328; x=1684590328;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EafrFWI8Dvyov2ZouB1636vfnUzieBsU2B9legK09uc=;
 b=Mi9yimC6nBVGyQoyf+OhTY2C+cznrBofRyR+OsmwNjyYyTCsxoJe4G45BAqUyd3PAg
 bDR2GxZvQNP/CoaHyXiH4nDbxFuerEOK7wiJAyetVRZ75t1FDYt248WKxfA2E/p3kyT1
 w/qWIFgiBM1qS1j9zLvGzcTRPNF+GAwXvlEW+kmaxCSmdJSqpq5RoLGSCixZsRO5J1Hh
 hwUiS/DTnnVwEut5Tka8/qwNkr7tUf2IzlfcjmwVjnnebrzGzV56nGE2+mT+ozYj4ZX0
 hLQtPrSEPZXprMrcF09yFUVi3Ce2/OhG8+PcKML9mSja4JA0JpbkY9vTBx+i31neiNTd
 9rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998328; x=1684590328;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EafrFWI8Dvyov2ZouB1636vfnUzieBsU2B9legK09uc=;
 b=Eto+hc4eLIXY2yEAhgxGiqoKK6DxPoYHIkm2j6cWcr1oWLf7GBgfbBYPE/8vRAyVCD
 Z1Acm4b1EKv/04hxviB7lynLwbdj8Vw+4oeo+wZQY4TfLmHwj/LxOATkfaiCSLvrcRUq
 F4TxO9ZjDk1vHj+NHefYHi+a+BMJiZfYtFMQaXE0rYOD/lNa88yuQlE2Qixx54J0/xxJ
 UMazljVMExPe/HMKeyI4NDoWsryg/kY03J2CvYCqMdmuSbX+BBk4z6lh5tJgXhG8YzzV
 DGsVh/eO9YjlfNOOnI8hwyLEoRdjXKeilpWcI3hoUevpI04TRK07vxbUcWSugRNcoaso
 mSZw==
X-Gm-Message-State: AAQBX9dZKmDakdFe7whAdK6O+miOd5iBrD5K/wFSx+eOKV1ewK3YfABN
 yDelz0onRsWcwJG7zLcFGoXUkg==
X-Google-Smtp-Source: AKy350YmpeFqsfZIlg1dl7hD4Omy01Puwx+wl+rwXe6NrF++Q/qrhmTqdSdm5UvQdx8WZLykzIpzQw==
X-Received: by 2002:a1c:f213:0:b0:3f1:8308:d39e with SMTP id
 s19-20020a1cf213000000b003f18308d39emr1393898wmc.9.1681998328626; 
 Thu, 20 Apr 2023 06:45:28 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q17-20020a1cf311000000b003eeb1d6a470sm2128493wmq.13.2023.04.20.06.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 06:45:28 -0700 (PDT)
Message-ID: <421d369f-40b5-60a2-f763-cb496943918d@linaro.org>
Date: Thu, 20 Apr 2023 15:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] docs/about/deprecated.rst: Add "since 7.1" tag to
 dtb-kaslr-seed deprecation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20230420122256.1023709-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420122256.1023709-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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
X-List-Received-Date: Thu, 20 Apr 2023 13:46:00 -0000

On 20/4/23 14:22, Peter Maydell wrote:
> In commit 5242876f37ca we deprecated the dtb-kaslr-seed property of
> the virt board, but forgot the "since n.n" tag in the documentation
> of this in deprecated.rst.
> 
> This deprecation note first appeared in the 7.1 release, so
> retrospectively add the correct "since 7.1" annotation to it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> My mistake, since I added the deprecation.rst text to that commit.
> ---
>   docs/about/deprecated.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


