Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQzvN-00016b-P4
	for mharc-qemu-trivial@gnu.org; Sat, 11 Feb 2023 19:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzvM-00016L-Vj
 for qemu-trivial@nongnu.org; Sat, 11 Feb 2023 19:08:56 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzvL-0001J6-Dh
 for qemu-trivial@nongnu.org; Sat, 11 Feb 2023 19:08:56 -0500
Received: by mail-pl1-x62b.google.com with SMTP id m2so10240542plg.4
 for <qemu-trivial@nongnu.org>; Sat, 11 Feb 2023 16:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5pbn28NdBT7eR1musuMumktiGbVnjbmT92RPP1j+jpc=;
 b=ZQV+YEsOWYdEKKl/ojfbG1QxtlXNNV4qH3mQZNCIXuzBX2E9lwpo55lvX2MZ10SbZA
 rKJpvPUQG0WNOmeilpXoVQb5E+rnywGhvRssj9zYYzSJOGSjXtx6mPdntaSJDG8Naih3
 pdeivXKaDyQyow2Vqtq9wareBSrxwfKE1oEmVd3TfAYNNUqHe8j+4Y80OQCWDnXqUmca
 lztbyeUKfCYLAXDNJF4LPWcuqAmeK+lfGyDQVmfR2K9Ww2D8eN5tCA9gOJnJJRQJdPie
 pvNr9cjVFD2nrdZbXsP1ISD3C1IMs2OKOZPSUK0UQwXQh+hhQgBsd5emobN5QVJnGBQA
 tlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5pbn28NdBT7eR1musuMumktiGbVnjbmT92RPP1j+jpc=;
 b=hPel6dcyw6EM8HTt4sXe9LmltjeEoSxX2wl9nSTdSkTqf86tmQaTIt7PQjT8J0Bv0Y
 SCWtpUzzShTR5nXj3H3BBbMGg7oN1vPN/juQvbjL4bwy4qgzXotX28SYfpW5q2pOIVba
 Q7IgwZNew1tDZFJzngtTqmg4eP8HugOEP9ijlJEY63PW0z6kyjoF7a4mHBNQexXonAsg
 wkN17ysBlnzXhOWd6RaLERuyyT/6bJEtfiC+z7GVHbFy/9If1QdmfGHKfZfxlaefw+Jz
 9CpVHfc4IR1C14jukph5H1Ep0mGPlxE+DybKm71wcqXI7ap1wV9YGxeSBFmkkZ+mwqnX
 hHhw==
X-Gm-Message-State: AO0yUKVsu7qqTHzz2Y5d5Icegkf/U3nbtfrMBlmesIzbGrF93SnBPapt
 ptS/8ce7FoRuspFErTVI3xUnrg==
X-Google-Smtp-Source: AK7set+KO9RMhfxUeGdpfJfSNMvJt006YIDR4RvxSTMIKvX7iZJabce8+FxC2xLXESbJeFl/p7+t4w==
X-Received: by 2002:a05:6a21:620f:b0:be:e43f:df97 with SMTP id
 wm15-20020a056a21620f00b000bee43fdf97mr16018865pzb.14.1676160534066; 
 Sat, 11 Feb 2023 16:08:54 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 d14-20020aa78e4e000000b0059085684b54sm5565687pfr.140.2023.02.11.16.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 16:08:53 -0800 (PST)
Message-ID: <b295255a-773f-a5c8-b1e8-d503a4e02f78@linaro.org>
Date: Sat, 11 Feb 2023 14:08:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] hw/pci: Fix a typo
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230211152239.88106-1-philmd@linaro.org>
 <20230211152239.88106-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230211152239.88106-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Sun, 12 Feb 2023 00:08:57 -0000

On 2/11/23 05:22, Philippe Mathieu-Daudé wrote:
> Fix 'interrutp' typo.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/pci/pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

