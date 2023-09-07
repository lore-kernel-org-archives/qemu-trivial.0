Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qeGN6-0003I2-45
	for mharc-qemu-trivial@gnu.org; Thu, 07 Sep 2023 10:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeGN5-0003Hj-26
 for qemu-trivial@nongnu.org; Thu, 07 Sep 2023 10:52:39 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeGN2-0002hF-Ra
 for qemu-trivial@nongnu.org; Thu, 07 Sep 2023 10:52:38 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-501bd164fbfso1702956e87.0
 for <qemu-trivial@nongnu.org>; Thu, 07 Sep 2023 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694098355; x=1694703155; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O+qX3qGCIOO+y62hXFMihcApMXG4Ej7e7028ezPZcZI=;
 b=LBP3PRNuTTdr+g1kJFTA+qxe/Bh2fs1a38QduUYF1PDWBU6NuEpD5wpvTAMCr+FMAW
 YaHWCOfWcrxXpx/82icf/ZXImiY1WQVvVvMXDbUrXe0auCZ7h5BdCYgE8k9EY70jDvOP
 HxWm7GRfeNJpmOIZNWMznvLezNG2tuc/+IDW3ylRkebdg27adZX3+zEV8GPvf7EKgwZe
 CRxXJho/IncpzARkDzcK6nqdmmgs9LXALiHweKdgxLD7nEMKtzLEe7NApGs6gInjJgRS
 gODcj7DpADLf0VqUaccyiL+GqZQnDeqfAkPvpI2YOwGEWHt4dW6ZG/Am9ULUgy9l5V+x
 iZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694098355; x=1694703155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O+qX3qGCIOO+y62hXFMihcApMXG4Ej7e7028ezPZcZI=;
 b=Xf4wN1JhpTOE5J+OLHJs26OGUQj6XhVidM5IcrsvsbhV1oxcJH5TfG0oVz89nud2F/
 PUGx0JyoD+IKtGp3yNAmE3NeCbtB0MFVnYjpU6X6S9jkD1EbXLx4abR8inyZNruODCCu
 vBR3IHnws2FY6vcAYJiuDExyn4qnIYM7oJQhqdxmWJe6f3C9cToR4EOElBuWIHXlS0nC
 JWDnA2L6hPFSjScFyHzPR6u77TGkarzeq39RcPx31pepiByaZ+CSszRieQlGD78IjJlL
 qCd4u7h0f5Akfr4B/V6ywHnb+JPD7vQFA6J70XXwdMI3tCky+zzwD0S7cRrdtLnJ+ypu
 XoXQ==
X-Gm-Message-State: AOJu0YzgzVANYTcJCT1lb43RWrLmb8lxyq9KbGwO0gzzKLnT2om7giCa
 HpdnsmX8dcg0spNxEM/BEmdnkQ==
X-Google-Smtp-Source: AGHT+IFlRgenbRlLqnA6KWwQ6GfP3fvPiieYDphnLsKbdBl3A8VZlnUBxBaJfQl401ep1gI4gJcvgA==
X-Received: by 2002:a05:6512:200e:b0:500:a6c1:36f7 with SMTP id
 a14-20020a056512200e00b00500a6c136f7mr4509796lfb.3.1694098354833; 
 Thu, 07 Sep 2023 07:52:34 -0700 (PDT)
Received: from [192.168.69.115] (176-131-222-226.abo.bbox.fr.
 [176.131.222.226]) by smtp.gmail.com with ESMTPSA id
 a9-20020aa7d749000000b005257da6be23sm9995859eds.75.2023.09.07.07.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 07:52:34 -0700 (PDT)
Message-ID: <9477d60c-f064-019a-5684-902904f5612b@linaro.org>
Date: Thu, 7 Sep 2023 16:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH] tests/qtest/usb-hcd: Remove the empty "init" tests
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org
References: <20230907143942.233219-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230907143942.233219-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-List-Received-Date: Thu, 07 Sep 2023 14:52:39 -0000

On 7/9/23 16:39, Thomas Huth wrote:
> These tests do nothing additional compared to the other test,
> so let's remove the empty functions to avoid wasting some few
> precious test cycles here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/usb-hcd-uhci-test.c | 5 -----
>   tests/qtest/usb-hcd-xhci-test.c | 6 ------
>   2 files changed, 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


