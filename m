Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547EDCCD193
	for <qemu-trivial@archiver.kernel.org>; Mon, 20 Oct 2025 08:29:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vAlGs-0003JE-60; Mon, 20 Oct 2025 04:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAlGo-0003IM-UZ
 for qemu-trivial@nongnu.org; Mon, 20 Oct 2025 04:29:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAlGm-0007fX-SK
 for qemu-trivial@nongnu.org; Mon, 20 Oct 2025 04:29:34 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4712c6d9495so12592685e9.2
 for <qemu-trivial@nongnu.org>; Mon, 20 Oct 2025 01:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760948970; x=1761553770; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=upLQabNrkLN9xzP5rlMjYwim4MepxAdcp1g39Wi3qvw=;
 b=j8i7E4YWRWjhyWpjPxpyh2ouCNFmF7YVBjNMhtSUNF0F1EzjTqL9ddZOcpbg0haz1t
 ewzKbLGoyWPQ3Hs7kPN+moVY9y1+/ie1I9n0MQAQ0+D4zkTafR8GUPEfaCfMEfTtQyN4
 8NdxQ1VbMimo42/YD+VgkDmbZeNMSvahIwRVLAisCN/SgEJXBIx1aXpWIkblkUidxq7H
 YfEt7/FMb4EEroKadFkwWZnRY4MMtDs5pArTFcKyAZpEhobGValVZOZySDx9JXjYYEMX
 sxj6b6nziPhmpt2EI/AqEuHPcJHcFRUv1W1lECveBit1LKyGMOeaY1F5XmvVHG45aW9S
 UlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760948970; x=1761553770;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=upLQabNrkLN9xzP5rlMjYwim4MepxAdcp1g39Wi3qvw=;
 b=K4i5IpnskP7MWLNmh7kk/inNkLunq3RCxR9aNILxEtmBhZLnM5agMqxEeRnZbLO9iW
 IM56EQ9rUFwUdIytDN82KuO51DXhN9ZTLw1K/9BSSNsxloaTzyAr4zpQu0KTigaP81e1
 wlEsjR61n6TTXD5RNHdPxTdQiNztR3NOsVl0JDUNoCswCINMup+FQYUhzUoEN4KIIzMO
 XNTEcvfuMahdW++ZBXbN7wqNf6ivc6m/ExN5GhzrWAPObU9o8/67L1zKm2PFjo3EQfjd
 kPPf4rqyq37lHZiYdbs1bMH+LyBagGJ1oiWtmkUTqMu6lrAFtwEH+0efdTETMtAYX9FL
 g+tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt38BIBAyQoBzQME+tA8NtWIKphX8OOmSBiaTtX0W52iYfZCDu9RxV1Hs6/JOAKZGwAczBv08DdPMObjs=@nongnu.org
X-Gm-Message-State: AOJu0Yx8xVumCruageVjMV1gBDuw4GTEmyF07QX5TIy5NwRuNnNoAGyb
 tXtkwtHIZu1XaEFFckc9BT2zMQj3tyZYGV672/7I3T/K6ZKtleVbCcb8k2cA+FQWZBA=
X-Gm-Gg: ASbGncsTPvNTg26smKerheeUdauohCltQKDnWvUssjHMXc9ySUpeU4X47y1jAn+2K08
 X+Ejb9jRuL6SNRnEptyZerBv2XHGGEY5YXjv8qJuomQEldXnrbxijf3VZ09Jk+cbUyc59Io08S5
 M2a3rbD2jLPIEWjKO2KcSHZwu1IsoVQjgtDg5KRDrPD2TDdVyLGpISbkuQZO7FSG2QKEP6yv+Xj
 sFbxk8yvs67XStGE5P2Dnikl1f1FkM5RxDjgpwPbQ7YfknDJDbRy2mpiVvyslP5q/KixOiEeAoL
 I3cW/NYkt+oBvt2SAC8VkQi/3BrEY+xrhutCJ78q1u+dtA0NG4bnBbaM3Z2il6f9GWpC4rmrbh2
 pD6fkKtpHilUC5JhMoc2q1xT2iYm3Ugzo6lEtbRX+XuXjMFGU2tNp0LSya4Xcdpyh3t7ZwCwjUi
 ciLaRUIndI4IeZLXLEHcEmv40EtJIuUfv8SifZfTV5tWFYPtbgbIcBwPZg7fsyGo+w
X-Google-Smtp-Source: AGHT+IEzE1bsNkCQUwgrRUB+00ZejTXpM1jHhePaWJboCKPtO+YsgVt7DQis+/s5Igcc0ShXfXMXog==
X-Received: by 2002:a05:600c:3e8f:b0:46e:4b89:13d9 with SMTP id
 5b1f17b1804b1-471177ad526mr90113505e9.0.1760948969780; 
 Mon, 20 Oct 2025 01:29:29 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710e7050c6sm114773395e9.1.2025.10.20.01.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 01:29:29 -0700 (PDT)
Message-ID: <5cee31c8-57d6-4245-a49b-bf317677e211@linaro.org>
Date: Mon, 20 Oct 2025 10:29:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] hw/audio/pcspk: Add I/O trace events
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cameron Esfahani <dirty@apple.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>
References: <20251019210303.104718-1-shentey@gmail.com>
 <20251019210303.104718-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251019210303.104718-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 19/10/25 23:02, Bernhard Beschow wrote:
> Allows to see how the guest interacts with the device.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/audio/pcspk.c      | 10 +++++++++-
>   hw/audio/trace-events |  4 ++++
>   2 files changed, 13 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


