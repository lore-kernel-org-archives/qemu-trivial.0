Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA12CCD184
	for <qemu-trivial@archiver.kernel.org>; Tue, 21 Oct 2025 16:02:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vBEoM-0007zt-QQ; Tue, 21 Oct 2025 12:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBEnX-0007JG-Gu
 for qemu-trivial@nongnu.org; Tue, 21 Oct 2025 12:01:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBEnT-00005p-K2
 for qemu-trivial@nongnu.org; Tue, 21 Oct 2025 12:01:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47100eae3e5so14051225e9.1
 for <qemu-trivial@nongnu.org>; Tue, 21 Oct 2025 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761062473; x=1761667273; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wi4jMzpi3nbawrsaPcGe1LeGK6a/mFs1A8RcgbTOttA=;
 b=hpVYvxo3JvrIguVRYoLHnxUM6Oa9gupv+6575LHzlylyehRM1VCUUS087Vpnot2wcL
 XjosPJAjv4SQIf/FhTcXOym2ySjBQl+v6jCHjflJyHX7A3OQDkocdt3SPgBEIaK0uaOo
 kV5i2vSYqUxB2AF/LaFXXENiEU264Zj1oO9iqKwOyB2VlOdYtf6Hq994bKOVZrbeSRw2
 F8OpWHubAck01OOelyC1zSc24/Lgq8koU8fZ5lnBlGzYiT4GBCJGDvpJezfq0Q7VSuUC
 fuKOxyTyolsW5up7pvwzjEJt7WR3Fotc1x5A6jvwZZlkB4ARZoNqSvd/wutSnGSl/uAh
 x2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761062473; x=1761667273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wi4jMzpi3nbawrsaPcGe1LeGK6a/mFs1A8RcgbTOttA=;
 b=kqESpaske4P86Q/FA+U0uEVGXCDtr/tRvO9KZCT6LbqkSIjwJWnxkaJ+IFhI3ZK8W8
 hdVT9Ukxe7cZ2CQYhqUNyq5z1vDCnPCqrsUFQujM2MI1gU2KWB94SlDExbrzD3OZGLk0
 627lVVzxMlO8Tsn2l/eHUpoDMmXr172UurM7gznCgUnceJv6+Z7GI2lPridXTfssFzad
 ejy6cWzDwoZwyPLENbeD7YlLVKC6KOyJvrYmp+PWaLFc7VXhtBkcdlYP/1a1EJN1xYq4
 /JDilLXPmIPcDbLhS1+XSKTe3sCsR6I9tTW1WPRIyxMGv2fp+XxFg7A2E6/ZxgEUPj60
 6b2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE3vODe8ejMDPmiE0JEdH2aLT/SpwZQiSOjGhYFd0vdoY2qcsAie2194jsjwTqK1wZU2gJgo5ciY5AJlw=@nongnu.org
X-Gm-Message-State: AOJu0YyC+WNrSGcAr1Fy6d9CveDKKguwAqLckrGHTkH7kBPchj9zuZZ5
 GfHdR4iTuuxa1cfXwXIpouEK7+6Z/R5Ar32+ala0Lcib3HncjI3NkFC36VG4nbho4yQ=
X-Gm-Gg: ASbGncsHk4rNfcaQ6zBDstJsatGkaWnKzlI3MZGFVO+YiULjTuTZz3vMLKidN7FS98I
 4G7aVXUlRJZWo33Og424xChog637ssSBtiLvWGjNpo0i1XhgqVRx1/W+mbedzpwFJl8wY2qaciw
 PEEhUriigQDqGA7Wlyp64xhUENCXkNc10/MDUyPpPAEWCkfYeq+nteYpFhToaW6GA7X9fZoqwFj
 Wmd6wQgVxaajJ3RXVevCrroKHIU6aIlikwIFPGRkgNZL1Wr7djH6GdPbDbawFZTNwcVWvAOVPo7
 7u+p/pOBkqaTcgTWndk10kNqmxgkmNH8G6Ix/0wR1Mm7XYlOnCpA8DbwWviZvo8SD6UPbzgsGbQ
 8XK6KiB5jwdoOIFldZZ2ZlgQIcxDxC/0Kcjrf/lC4peUxV0R/8EELxuQlAT/Nl6jQ5gxc2eAxpv
 5BF1PDMTVggtnAlkXPF9rr+BnWry/ewsPU4rMRq+h9SlUwjcfVb4vqeA==
X-Google-Smtp-Source: AGHT+IHrko61yHL+EkLhNGwx9wqvLp8HifeGykLYFnZoo841oLOivvfKWYEyiB4PmnxGj+jpat6DHA==
X-Received: by 2002:a05:600c:45ca:b0:46e:59dd:1b4d with SMTP id
 5b1f17b1804b1-471178a4bb0mr128739695e9.16.1761062472496; 
 Tue, 21 Oct 2025 09:01:12 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144c82b8sm287502825e9.15.2025.10.21.09.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 09:01:12 -0700 (PDT)
Message-ID: <f1e8c675-d7fb-407c-adba-d30ed0e771b8@linaro.org>
Date: Tue, 21 Oct 2025 18:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] hw/intc/apic: Pass APICCommonState to
 apic_register_{read, write}
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
 <20251019210303.104718-10-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251019210303.104718-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 19/10/25 23:03, Bernhard Beschow wrote:
> As per the previous patch, the APIC instance is already available in
> apic_msr_{read,write}, so it can be passed along. It turns out that
> the call to cpu_get_current_apic() is only required in
> apic_mem_{read,write}, so it has been moved there. Longer term,
> cpu_get_current_apic() could be removed entirely if
> apic_mem_{read,write} is tied to a CPU's local address space.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/intc/apic.c | 35 ++++++++++++++++-------------------
>   1 file changed, 16 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


