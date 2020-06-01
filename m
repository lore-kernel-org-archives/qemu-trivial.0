Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jftzl-0002os-C2
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 19:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftzj-0002kH-Dy
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:37:27 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:53476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftzh-00066J-GY
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:37:27 -0400
Received: by mail-pj1-x1043.google.com with SMTP id i12so492073pju.3
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 16:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PlBT1B/hjs0RZ4Sv/xaBn5v/munjW/EVMnZ0HWetFtY=;
 b=h0ouO/8u5iRqZlDoPrAMhkSSqFRTrfSwQdo19a4i9ahzvmGjW0r6DS5w0CXaMbbJtL
 /So9QK85DTtEQdWnTr0axxftFQZvGnF2jLt5EJ82ylkw5vJgvgWrdemTxnGl2T/EDVPy
 tkR6x9ZtBtuv7G7WnqinFAypKDbsLrHF/El7N5SmOAmTwcd1ObkvDQR+XLnQz3/9dSLv
 0ZcCXDtQJwZmlIpqQUJaKcsDiDMKHRBkg+3uD47Izs61TD3fhbbFgPUiS3tX1lMruyO8
 oXK1ML5f8Zah4SLGKt/6mY+IX6klJBO8Hynj6yjeHoSrie0ul9t9XWocNqYuw8RjfcaO
 h/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PlBT1B/hjs0RZ4Sv/xaBn5v/munjW/EVMnZ0HWetFtY=;
 b=GFrzwN8ePQmJfDeMZLO1GBGZ5PRkiT7A6SLMjGOxjFoKW/8RvBLQKqIMfr1s9fc4Zm
 /cXGlxLOsci4ypjkrw0zxUE3qgtGi2IWmsobbb5FxO8raOLx13F1vhHnqlOmielpsuM6
 S2lI8Augd6tvKk4g9wpchKpgr/g+Md0RbbxEOjGQ1JnVinCnvB076GSpbw3/t8ShC0H5
 q+HRK/FltuOI9n8XZtSLmnHtn8vHl9W20B01aczzhM8OBzmJ8yievgovtGr772Yzgxzi
 EsqqXAPtPJz9w97BFz346VNYSE3h4t/Bea3/2nzItDF0iz476CScmtZfvooQSEWUufLm
 i7DQ==
X-Gm-Message-State: AOAM533gqkIIVYvsWsnYCc7vpR2C6xwxCgx52GRR7usCMT+YQWFdqrYp
 vb1GF70Jq04DqAgViQFXW2Sw7A==
X-Google-Smtp-Source: ABdhPJzzzU+9Uf4BtnV7qNbKvl+iUuKO6qwD6miyTuur8YHPtfQ7XV0BnKoxEbCJaOSgLcuxhYk+Pw==
X-Received: by 2002:a17:902:710b:: with SMTP id
 a11mr6593788pll.156.1591054644135; 
 Mon, 01 Jun 2020 16:37:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l187sm400253pfl.218.2020.06.01.16.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:37:23 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] hw/hppa/dino: Use the IEC binary prefix definitions
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
 <20200601142930.29408-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57783e28-09e5-8545-7a90-e52ad0dac9d8@linaro.org>
Date: Mon, 1 Jun 2020 16:37:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
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
X-List-Received-Date: Mon, 01 Jun 2020 23:37:27 -0000

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/hppa/dino.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


