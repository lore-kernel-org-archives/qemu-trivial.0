Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otDZW-00059G-DX
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2022 14:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otDZT-000571-Lu
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 14:50:43 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otDZS-0001XR-2O
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 14:50:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id y16so3747803wrt.12
 for <qemu-trivial@nongnu.org>; Thu, 10 Nov 2022 11:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PThKRh0NG5pEJ9WWU7KS02YyuzUCjXpY8pSUus1Ba/Y=;
 b=uAh2k55eSdyFP79Y++YOKX5KyDXxWmSmMWJ5eC8TaMhZWihhObjW3ZBVuEkEGWU0jF
 DeaGj5mr6Z9FB4+FxLshxjNdGoCK43AUhNHet3yh9ACIYfEFToyXvg9pyORO6Ekby8vS
 e1xJQnmI3S139TpHrEDVcfMyS+Xq+NeqyqOIOZLOs+f+IXVoIprWAmMhAWRZ56Yz7cex
 s0LfVpGekK22tuEd7XBQgZMMIz0EUmoxRw122U6s26M1twY5PzaywZN++lomwHAgk3Yb
 SFanPWU7oDNHHV81C1R0qlETIygskWNEXT2fOZS1bAnQJV9E/hbf6GtnPR396W+4yjPP
 HYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PThKRh0NG5pEJ9WWU7KS02YyuzUCjXpY8pSUus1Ba/Y=;
 b=x+x/saZ7HEdfBQC+cJU6yWU3IEvI/9WfpmRQsvA5kiK/1AjK7jnhEXSxonAJy6Pm4R
 nTOA54KXNIP6/K/+ORIUZWro32bcBXzgyW9uQVqEf7SlvHnYdGSjJwmjan8ya5YDs1+g
 EirS+eBsE2VofOhtNe+PzFNSDdYDK6y7Sj6mQPIgdR6ME6jB2eH7y+3CRRDfF9UH+Wae
 I/rrOVzjmyHBGDwjsUZy6SiOqzpz8l4/3ryAuryiu3zqDw2c3gZsAsmy/JNzu70TQcnE
 z/vlygUTO6OsJUPQeDE4QU7GACHUMC3IPhOKORgzZ77TwhW41rjmxq6L3HYhtIry4MQc
 7Zmg==
X-Gm-Message-State: ACrzQf3gFXmtR8yJiEuGV60ML4lmqW6fWSuOaIqsYL3Ae5bgPaImf1+d
 /d4PGyOXkXzj1Xer6Z5ruQbfNA==
X-Google-Smtp-Source: AMsMyM5Fix+WQOwkXAfVTSFslrxMjuL61PpzHT2V/5hdx3oDkE7jKN4WTebO2enDB6PQI5QyBKMenQ==
X-Received: by 2002:a5d:4008:0:b0:235:a4c4:97c2 with SMTP id
 n8-20020a5d4008000000b00235a4c497c2mr43334654wrp.295.1668109840642; 
 Thu, 10 Nov 2022 11:50:40 -0800 (PST)
Received: from [192.168.7.115] ([109.111.120.167])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a5d614f000000b0022ae401e9e0sm11387wrt.78.2022.11.10.11.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 11:50:40 -0800 (PST)
Message-ID: <672dbf74-bba3-a711-6469-caba9dd67050@linaro.org>
Date: Thu, 10 Nov 2022 20:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-7.2] Fix several typos in documentation (found by
 codespell)
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Cc: Ani Sinha <ani@anisinha.ca>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20221110190825.879620-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221110190825.879620-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Thu, 10 Nov 2022 19:50:43 -0000

On 10/11/22 20:08, Stefan Weil wrote:
> Those typos are in files which are used to generate the QEMU manual.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> I did not fix memory_region_init_resizeable_ram. That might be done after 7.2.
> 
> Stefan
> 
>   docs/devel/acpi-bits.rst       | 2 +-
>   docs/system/devices/can.rst    | 2 +-
>   hw/scsi/esp.c                  | 6 +++---
>   include/exec/memory.h          | 6 +++---
>   qapi/virtio.json               | 4 ++--
>   qemu-options.hx                | 6 +++---
>   tests/qtest/libqos/qgraph.h    | 2 +-
>   tests/qtest/libqos/virtio-9p.c | 2 +-
>   8 files changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


