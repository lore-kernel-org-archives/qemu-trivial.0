Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jftyp-0001dx-Hm
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 19:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftyn-0001aE-QT
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:36:29 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftym-0005WQ-Kc
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:36:29 -0400
Received: by mail-pl1-x642.google.com with SMTP id y11so547158plt.12
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 16:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tdEZ0FE2fCkDdeCvjfAB13a3HzQjvtrN7+bWKrDiVJY=;
 b=QSSR3Tj/yGlftLB9YcpZ1IPdp82Oq7+Xb1W/zB0ce8Lpd6c/K8euxhHRJQzAI4a1E3
 1KobbVvQyaCC1uCzRelaNzPSRDXazQXp0S4Dfysw3vyuEUTUMWHoEu2qjV8hhDAf2wNG
 fLvrpPn9nnwZP40nJV7l3OJj4NDHzApNYsv2Vm5kR4q7rI38ry719XhneDioE1H/su0b
 2YaVgNOMMBWxj1xn2kqrtmX2tU6r78lX7kW/dTQXAkKrfIJIWxAotPPZHRf9HLeUL1SX
 nzuSL6fROjjw1xXXE03lAqSXRjuxHPqkPTZlPC7ytxiuFFZzwk7+dOkN2fAa6qxcObH5
 sKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tdEZ0FE2fCkDdeCvjfAB13a3HzQjvtrN7+bWKrDiVJY=;
 b=fG2pfmzD95htT98GLmCbLr9LHIDgDV8ZJqYHRVJMH/JDRPFJGYuTIargZIb3kBl6kM
 Zgijgj0zeozT+N8vdWhCVVZfKisqwA32aKDODzUWPJrASOQbiWjVwcI9LCU2omuwM1Ec
 63ariqrvfCv0HJonNXvAiUGKYJbdd6d50X+E9Huji+aqjvbH9iLjy8fwyY0HYFdIJJI5
 MIx8Cz7Mty53VOLF9WAmRGgCemdVEDwm58PSuqwWP9yxiLEwcPtIPLFTvklU5cepHOOx
 sanx2gXR3X1ey9BlrNYtU8yUGzRwPyKVLOeJjtxwxU6KK92pzd7zYA4IjSmiIqtZfK8p
 SyeQ==
X-Gm-Message-State: AOAM531KVtpH6QCnvP7/L/Q9aUIwHzFw9ccQQIVGxiWhbQcGvbNptgex
 axVAVxPrG9bNehLmsz8+4kaHWQ==
X-Google-Smtp-Source: ABdhPJxpAGmqj3Dx0cH2lpPvMLKiH5ZdJ3xTJ4daeI/RNAe8QkFrgiIitY2pMAswbpMKPCy91j6fQA==
X-Received: by 2002:a17:90a:a08d:: with SMTP id
 r13mr1978033pjp.96.1591054585155; 
 Mon, 01 Jun 2020 16:36:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x77sm454355pfc.4.2020.06.01.16.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:36:24 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] hw/pci/pci_bridge: Use the IEC binary prefix
 definitions
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
 <20200601142930.29408-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <761761ff-13ef-acf7-094d-b0406a4f9a02@linaro.org>
Date: Mon, 1 Jun 2020 16:36:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
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
X-List-Received-Date: Mon, 01 Jun 2020 23:36:30 -0000

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci/pci_bridge.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


