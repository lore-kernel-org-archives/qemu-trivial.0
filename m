Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jftz9-0002Lf-LU
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 19:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftz7-0002Gr-D1
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:36:49 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftz6-0005nL-2D
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:36:48 -0400
Received: by mail-pf1-x443.google.com with SMTP id a4so4170279pfo.4
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 16:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=utp8UPhvpVOjKQDHheJJZxOdw9rN2rKIwvixqFfY6I0=;
 b=xTG7Mc8Ke+P7C8o56JElmLFbH18twbQfttKAc5G/dIXmkm2onWlNspWFfvusLOTgLg
 pTRDJq/tgRyR7y8JuLP6CZFE2Egd7bg09ZKOeD396awq3y3Wt4q7J+Liinm2BBOuvUrx
 PPw+rh9aMrrdNIj2zKTtH0aArySoR9V7wv0LwGc+yun4GQvO89nczwsvBnve0Xlf9HLH
 7jA8bUorURzKagLbFYICNCER7T+CBwhJkzcywpFi0y9NCCGAjDZRm5Uhst8GI6Mk+SKq
 qe0DI8YoF1wc321Lg2a7uLv3QwcS6piwxXYRRqVkl86ZgCgMmu7bDWT6NTv4v2CVRdQd
 XsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=utp8UPhvpVOjKQDHheJJZxOdw9rN2rKIwvixqFfY6I0=;
 b=cUI0lF/4AAj/Kplx+1PF4nYVm14TKnZHP6uVry1t2c33jRuRaHICwWrzymJFy/oYUU
 2jT8VqRQmSIPnC1kAquw4RcuVHzwTphPl6Idt7+ijaqwqbsd4rhg9gmgc81/EQlSB8st
 8ZRYI2bl8cf/earFNb40Wzjzv5rdzSDqJ+lfuDuL6VQRkqlVQYNHKjyWuw9nv2ll8mM5
 r9vi3DbnACeDTLl69SrUT7eYhGbbP7aZ+ydHVvfS5tbamWc+QkF/cFKRfpmeVtt/Iva+
 m7AP8mNzYvcQ1HCmzKougxC1DJlRjKFLF5tHqRQFGCw7BdrliVzkz7owSIVbehxyceS8
 YkMQ==
X-Gm-Message-State: AOAM530lkIen9rRklLEmBK3GJcu8hbIo2qczuXGXF/IjrINYKo7nMB6i
 h+IBcUWBr3ifEjAmCDucZFBq9w==
X-Google-Smtp-Source: ABdhPJylPCz6NJ8Nv/4CwG5eFZALKyaW9WbeoXC1cmJzPEV4oHq3Rbd3WXYgkQZHOnN28B1WNZx0MQ==
X-Received: by 2002:aa7:8c53:: with SMTP id e19mr22646004pfd.264.1591054606599; 
 Mon, 01 Jun 2020 16:36:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id k7sm452101pga.87.2020.06.01.16.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:36:45 -0700 (PDT)
Subject: Re: [PATCH v2 5/8] hw/pci-host: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Helge Deller <deller@gmx.de>, Paul Durrant <paul@xen.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2aa683fc-ff9d-17ed-a35f-f177bb5c9e77@linaro.org>
Date: Mon, 1 Jun 2020 16:36:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Jun 2020 23:36:49 -0000

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci-host/i440fx.c    | 3 ++-
>  hw/pci-host/q35.c       | 2 +-
>  hw/pci-host/versatile.c | 5 +++--
>  3 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


