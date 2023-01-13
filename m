Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGFXo-0006fS-Cj
	for mharc-qemu-trivial@gnu.org; Fri, 13 Jan 2023 03:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGFXi-0006eQ-Rh
 for qemu-trivial@nongnu.org; Fri, 13 Jan 2023 03:36:08 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGFXe-0003Cc-Th
 for qemu-trivial@nongnu.org; Fri, 13 Jan 2023 03:36:05 -0500
Received: by mail-wr1-x434.google.com with SMTP id z5so19287572wrt.6
 for <qemu-trivial@nongnu.org>; Fri, 13 Jan 2023 00:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OzmjMrzZjzDix6IfQJdeda6+2jMMm3RVpFJ3VWErJyc=;
 b=XNF3fQHUrVN/P9tLVkiIwO79mCWzIAGoM7xMPpm0HVdKQ4DUcReQy31vXq21iO6pQF
 yc18Izf49LRdm72mminZoSRfZ3wPYQzD8/U43jY+E9hZB+oLB6OTF07DEAirTZyiDgw4
 QbB786u5lAlW7GLEQ08leQvjkd/q9wyH7OoHuM0zROvOa8EaQwv6qKqTsmp+ij/zg2Fh
 xCiYipVS667uIbiztZBgx/fKIm0PpTi1GdBnrnUhvlg2aKWzu8UI+vJPCvwMzbn5YNXy
 dhGUUPltHwKZsaac9QJ5own4BPlgVkYXuPSLb7dxN7nEALZK9czT3E2BPEohpyPzTaXP
 TFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OzmjMrzZjzDix6IfQJdeda6+2jMMm3RVpFJ3VWErJyc=;
 b=uuXRWgfKTIa6LvYmZ8XtKY+rUgvN1wMFkOH0CwH9BVbm53LFe8s+9TKGwuLtPOdqQu
 mqLvDFRWcGtRvOAL3AIPtpG5xntIGgG9qwB58BLYbwMa1LdfcIRQSViGr0HTGjhHD6oj
 Qf2cf4iPaDubP1D33TX+nQ7rJ35HC/YaaVvCk+oK7n3g7s6GAF6BMr+yQD3jHTOdudrR
 T5Gu/6D3/hvFNWz+JTjdCtmdORObARa7oMooPwTpqYDP5F87T9QrDzTkjo2C1zATFygz
 PILK5oYi3NZvebpfFTBXuYICjKqvHEZ7S5Um478fmtauyxqhrAYyESc2xSqBidHS+GiZ
 SaMQ==
X-Gm-Message-State: AFqh2kpuX0vQ3gaq3UieDnQoDhCgqKROSBJzU15SeGK8nqys5GrYeFCx
 IOSk02jWqbuZ5JNKnCZuzvU/HA==
X-Google-Smtp-Source: AMrXdXsei+mdQKff+hLZG/38guN61tezz4JtLCtldbMXbS2Ld8NK0dNdJaHQhL2E7r3xD35KHaRUnQ==
X-Received: by 2002:a5d:4cc2:0:b0:2a3:3a96:709a with SMTP id
 c2-20020a5d4cc2000000b002a33a96709amr26060920wrt.57.1673598961218; 
 Fri, 13 Jan 2023 00:36:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l13-20020adfe58d000000b00296730b5c3esm18501210wrm.102.2023.01.13.00.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:36:00 -0800 (PST)
Message-ID: <3744f78c-2c99-28db-416f-0c636235ec91@linaro.org>
Date: Fri, 13 Jan 2023 09:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] scripts/git.orderfile: Display MAINTAINERS changes first
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20221216225505.26052-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216225505.26052-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 13 Jan 2023 08:36:08 -0000

On 16/12/22 23:55, Philippe Mathieu-Daudé wrote:
> If we get custom to see MAINTAINERS changes first,
> we might catch missing MAINTAINERS updates easier.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   scripts/git.orderfile | 2 ++
>   1 file changed, 2 insertions(+)

I'm queuing this patch via mips-next tree for my own convenience.


