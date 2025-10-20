Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C421CCD199
	for <qemu-trivial@archiver.kernel.org>; Mon, 20 Oct 2025 06:08:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vAj4O-0007pq-GC; Mon, 20 Oct 2025 02:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAj3x-0007hG-FU
 for qemu-trivial@nongnu.org; Mon, 20 Oct 2025 02:08:12 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAj3t-0002wG-Oa
 for qemu-trivial@nongnu.org; Mon, 20 Oct 2025 02:08:08 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-426ed6f4db5so2642066f8f.0
 for <qemu-trivial@nongnu.org>; Sun, 19 Oct 2025 23:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760940483; x=1761545283; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZwHQQYPzgk/Oa/BCwkfGIIoOepu1MaY1kSob23Fku+s=;
 b=YrS/w/HnjyluEgYFi2ZSYNKnosWyUlUfNc9otyC1jdxNffRWqbK1kdgSgjqEiQgGN2
 5Ey9nqBldpghlq/IceNbG6Pi/OFE3VI6tY8FqNzTPsnMDDRR1ClCODMoHQjibWQoYyQe
 shIXtga+We3YruhQID+lBEwNr8LDhhvCz8DXFjHrueOyUoYqQMLK2qTpG7GFQU0Z7mrV
 kvVE1eYH2sK/O4AZTMryFRLQqaNBPvrpBMEJDB0VUcJeE+/6hYk4kqHVuoh18cIcCSus
 uBTXVO7zqZuU8Y1JrCKT8bJLZJk4z4n8hlM1NqEj4h5ysedkXVyCMdvoBNEgTdgQavm3
 GHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760940483; x=1761545283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZwHQQYPzgk/Oa/BCwkfGIIoOepu1MaY1kSob23Fku+s=;
 b=Fse2LwFeai1pRLrD2PT/QFQKVgTMXYvf/GKT4btb8NSgxTV+Z34Ncekk2DQT/PV0EW
 UculxbYS98Q4UgWQLPmz0yyHpDNgMch5STXMF9x9abl3zQqIKMi5prry4RbS1rwhpFsP
 iYkjGQkS/jts25g3h3WeCO6QrWCnd1E06SZWjwUZGpfsp7p7hJIzug/4O/SQEEweUef7
 7kGl5Zj0dVxSGJZnJ3kKOj2ihAPmuoDWWjfVfmVX6+yEQ7hag0oY10lOup6HXuETptgI
 AcQjbwBL+tlNz1l7cB2FwODCP02mzn+MwJrAQkxvi86ynTwKfVxN1yzOIuHvSeUxhDm1
 BpWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwt8s9X57LyMdLUEmTFB6q+5uyx8KtS94Kxy69lsyk/LOOXMH32Lu2DJrwzvXaCxVtaYhAHqJqiM/Nj74=@nongnu.org
X-Gm-Message-State: AOJu0Yw7zmYJ3f4/1Y5QmnuNAF00UsVT9vdhlE47EryXMJ6DNKy0Ljwy
 E+IlC7W2OesncPfGcwdZ2z0rrBN6yVhPPTyENLglUr8qa7d/8DCHoozSC7FVRSnj6dc=
X-Gm-Gg: ASbGncv2jMy2+QlQD7weJ/DUuRxfZZ87XH1ZXEIrjdt6FVRFphaGOnzpCuQnsdEf+1u
 M3ps5c5trDmx0GKEGleAh5tPgvzpkIbSIBMq94g/jtvHmWH1+xR2vLRjDFTOaD2xOA61xTbmJEB
 I+5gFC1lEqJ7uD33+pCEKcFdrgZdWXpx5TzHY4AsL6tTKAFMLQZy2xDkofSBek9vRuV3TVRSRD0
 v6gi46CQX4XCo+cyL24euE2Crlt7xyY3DdLcH5t+e4QiAXnRKCldRZq7xOfziWfoB2Dq3pqAl/r
 A+DVaEg2kBigYH7Y8aU8ePF9ayRLfY2bTWXSyECdLoHNGXxv2WVYljytoFcVYT8wtzBDrMkZB9a
 L4ukR0CGypCbhi7Fj5mW7VY2jATZ2Nu4/w47JVfoZ5lP4cOZ5K/WeWUwLvjESr0l2W6eYOU3uFW
 fHGp+rkDfWZxUND2mYpDUEESy/VPzb42YBDtBs+QtX5x45NzCQIr+RFw==
X-Google-Smtp-Source: AGHT+IHjUNCCBhruE03uT+DvimIwUC22UlsWHmljQFlz6N07Wo8DHb7vK09xeZ+F1g8Aw6DM/S1xhg==
X-Received: by 2002:a05:6000:4b08:b0:427:55e:9a50 with SMTP id
 ffacd0b85a97d-427055e9a5fmr10418916f8f.22.1760940483383; 
 Sun, 19 Oct 2025 23:08:03 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a78csm13382381f8f.26.2025.10.19.23.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 23:08:02 -0700 (PDT)
Message-ID: <4bf69cb3-b394-438d-8f86-eebb85f8280e@linaro.org>
Date: Mon, 20 Oct 2025 08:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] hw/ide/ide-internal: Move dma_buf_commit() into
 ide "namespace"
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
 <20251019210303.104718-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251019210303.104718-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
> The identifier suggests that it is a generic DMA function while it is tied
> to IDE. Fix this by adding an "ide_" prefix.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ide/ide-internal.h |  2 +-
>   hw/ide/ahci.c         |  8 ++++----
>   hw/ide/core.c         | 10 +++++-----
>   3 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


