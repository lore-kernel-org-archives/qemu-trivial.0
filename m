Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osfrI-0000Qi-6p
	for mharc-qemu-trivial@gnu.org; Wed, 09 Nov 2022 02:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osfr5-0000Q1-19
 for qemu-trivial@nongnu.org; Wed, 09 Nov 2022 02:50:39 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osfr3-0006u7-4q
 for qemu-trivial@nongnu.org; Wed, 09 Nov 2022 02:50:38 -0500
Received: by mail-wr1-x433.google.com with SMTP id v1so24427870wrt.11
 for <qemu-trivial@nongnu.org>; Tue, 08 Nov 2022 23:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4rnijDnAeAElMiR+cCUbab9N8bv/5YhO4uhULJeH4fM=;
 b=kJ9fnWV2FyhgfNYw5gj2LT5zWV2RX7fUXiO/ADnom1v3hbUvNOHfIK+gCyZGglzdVU
 WjRYeQ2nGCSsT4u/JPu0Qyt0ORRI1AMx3HemKWRnjeMe/QRBlEUQWiPY7+Y/pfY5NARH
 jAzSiKCdzMV9w7pUy/ugzAvpH1rV99ZmgqQxXQEBibXEwnL0QXeBlTGTODuIwoZg90nx
 pd3AX8G6MT46JdIoTNCNhDkHkuNuHFGidcTSsc+WHJVb4s8QB6cGY9bLt36XBz9HjX+H
 I8KKoKlLh0PhR4Xv7n/YbTSZYs3SIQjGW3dijDtAXXJL+/lYN/JVCV4VhIAMLrXxTk5C
 8cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4rnijDnAeAElMiR+cCUbab9N8bv/5YhO4uhULJeH4fM=;
 b=wE873hYIuPrm1mMHSpaEFFWxXYC0Gdms6xUu5me98rg5bn28+UQSAJu/81g4h59rUc
 n8JWiuxFONocsmX8ec/Uz2WmaXHHXCeJpWRxvnI+7djsQsVPWYuKT3IqDX7/Lt6Yg+pj
 VIWSHbGLKcfFbZPVarmekao5dYtXWeqBW3TfX/t1adBKlMNQ0jCgpELijwWfpUJ+G/FU
 K6YQ0A/wFMP/w5o3IHj445gsNwyS6a9nuFQTlBD4lMVKm3qYkyNz2qTjwzMl+2RMspSe
 PAGK9uYXWJf+eu+t/Q0jboHu+Ms1WNbaKEHCprgUwG4yaH78EpEbO4iBFIduhEkUZiPU
 /QBQ==
X-Gm-Message-State: ACrzQf071AiKZIMW9tKAQ2VHnQ2RyHva+JIqiKCteL+sWgJIMjPErul5
 060JnkufmNspwYukWPq7JRhcGA==
X-Google-Smtp-Source: AMsMyM4YnScOBPC2RNxEmt1e/q1U3YPQHS/VJ/YOt0hRejJB7zNQb7y3n4s4LqLIawfrP7ZCbqsVKw==
X-Received: by 2002:a5d:4004:0:b0:236:cc0a:7c64 with SMTP id
 n4-20020a5d4004000000b00236cc0a7c64mr31418515wrp.149.1667980235164; 
 Tue, 08 Nov 2022 23:50:35 -0800 (PST)
Received: from [192.168.63.175] (218.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.218]) by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c19c600b003b497138093sm685216wmq.47.2022.11.08.23.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 23:50:34 -0800 (PST)
Message-ID: <c3881f4d-53f8-22d0-766f-77ab1b0a51d9@linaro.org>
Date: Wed, 9 Nov 2022 08:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH trivial for 7.2] hw/ssi/sifive_spi.c: spelling: reigster
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, mjt@tls.msk.ru
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, alistair@alistair23.me,
 bin.meng@windriver.com, "Michael S. Tsirkin" <mst@redhat.com>
References: <mhng-33f90530-6bed-4501-913a-0ce40f4d9e0b@palmer-ri-x1c9a>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <mhng-33f90530-6bed-4501-913a-0ce40f4d9e0b@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 09 Nov 2022 07:50:39 -0000

On 8/11/22 23:11, Palmer Dabbelt wrote:
> On Sat, 05 Nov 2022 04:53:29 PDT (-0700), mjt@tls.msk.ru wrote:
>> Fixes: 0694dabe9763847f3010b54ab3ec7d367d2f0ff0
> 
> Not sure if I missed something in QEMU land, but those are usually 
> listed more like
> 
> Fixes: 0694dabe97 ("hw/ssi: Add SiFive SPI controller support")

MST suggested once to try to restrict the 'Fixes:' tag to bug /
regressions, as it might help downstream distributions to filter
commits to cherry-pick.

Since it might be useful to have the offending commit sha1 in the
description, when it is simply an omission or improvement I use
the an inline form instead of a tag:

   Fixes the typo introduced in commit 0694dabe97 ("hw/ssi: Add SiFive
   SPI controller support").

Although in this particular use-case it is not really useful ;)

Another example:

   When adding <the feature> in commit <sha1 ("<subject>")>, we forgot
   to fill the API prototype description. Do it now.

Regards,

Phil.

