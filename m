Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozYF2-0002jz-JZ
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2022 02:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozYF1-0002jj-Cx
 for qemu-trivial@nongnu.org; Mon, 28 Nov 2022 02:07:47 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozYEz-0007bp-PF
 for qemu-trivial@nongnu.org; Mon, 28 Nov 2022 02:07:47 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bs21so15238384wrb.4
 for <qemu-trivial@nongnu.org>; Sun, 27 Nov 2022 23:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LOgwOJnM40lY8hFBwKqGD5oiCB2hIHsLKvK+NmLl044=;
 b=Pc5dnpHdpxq+QiHNOkL6Za2fDt4M3ByBwwN6rnoewJrpEGDoZuSPErSqp272hY+YVI
 zQDN7N3WDF6xtonamOVEST5ixjM/sWn2DSnDfXIuFND9ahAAUqDcSj+MVrpi6hxSyVOP
 97pbHcd9ZhiJjPxxxAqSYYgHESsuqWh6FzctlMEfjSPVhjC+/JcrZiOTpfXgg8EVOVpT
 39ReG3feD0qOJVssmf2aX+rGxZVwSK15X3IQJJPuAOEYdHzkd/qCAXRseSjZkjwdhTSg
 S8PrRQgHXAKss02vq+KCmDFl8UNDINhv0miqkKla+Kl6G1x3j/nQzSZBBAqpZbwUrecd
 VisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LOgwOJnM40lY8hFBwKqGD5oiCB2hIHsLKvK+NmLl044=;
 b=ol7P7FydBLDPwyyw0EGe5CMQzWW+Vl6D6++sZPGnjGp01CLxXpFJMBTWhLxTa9pOp8
 aYf//mcmt2/rhvaDMFE+aToJvSb3hRBfoSGfGaf7CrfT+8qoZei5sedjTFj1/yG9uXhg
 O3TCM1QbyYReYnaMY0Vd0b/bwuKWpY1lpHnxidub1MqVHtrFPBYSnUeyOSVu4kLp9rbG
 1cijMMxqGPImDF7qOuQzcCOvekbE6kFp0kqOZd2Nj2XgtnmAczv/FMjVBRl01foSYBoE
 dmdhi3cphARAkx/nfmkcB8efMBRAx0MV/lrGwN1C8RiUKYM0shwO5tOeDusrHRBeSPn8
 d55A==
X-Gm-Message-State: ANoB5pkLc/GlQOtUI7QcZDuZoK+awayVE1J8QJKQTY8D+KMF++TRyBH2
 /362QM9efTzdCmPNijXGSXdzKQ==
X-Google-Smtp-Source: AA0mqf6eoIJNq4L6bVFZm2MPHTZ4ESiDSHOhOT+IMjvfyjHDfaBQnDhN1lK3QL3hh0lWt3lbDVrMEw==
X-Received: by 2002:adf:bb04:0:b0:241:f868:578e with SMTP id
 r4-20020adfbb04000000b00241f868578emr13112315wrg.516.1669619264067; 
 Sun, 27 Nov 2022 23:07:44 -0800 (PST)
Received: from [192.168.1.175] (49.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.49]) by smtp.gmail.com with ESMTPSA id
 e9-20020adff349000000b0023657e1b980sm9953236wrp.53.2022.11.27.23.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Nov 2022 23:07:43 -0800 (PST)
Message-ID: <c8aca9fa-ea8f-bd68-960e-f579a28243b9@linaro.org>
Date: Mon, 28 Nov 2022 08:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] hw/display/next-fb: Fix comment typo
To: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, huth@tuxfamily.org
References: <20221125160849.23711-1-evgeny.v.ermakov@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125160849.23711-1-evgeny.v.ermakov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
X-List-Received-Date: Mon, 28 Nov 2022 07:07:47 -0000

On 25/11/22 17:08, Evgeny Ermakov wrote:
> Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
> ---
>   hw/display/next-fb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


