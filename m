Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuLd7-0003qn-Cu
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jan 2020 14:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iuLd3-0003o0-57
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 14:25:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iuLd2-0003lT-0s
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 14:25:28 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:51932)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iuLd1-0003k5-PK
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 14:25:27 -0500
Received: by mail-pj1-x1042.google.com with SMTP id d15so372181pjw.1
 for <qemu-trivial@nongnu.org>; Wed, 22 Jan 2020 11:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dLLhwhf2bGoDdETTzh/LsbMlfpbCN8urf5vSnY0fHDo=;
 b=ah7dei+sYH7kEfPYnLubp6s5Co6ulJ8LGF2FHSgjWS1oruucwDkSQB3R6oSzJIDg19
 VqlLLxHlXkI360qTrmB4vuLpjY6CUUbrnaB1CMThw+ctxRVFMKw5tMT9PIcyRKmSKEK2
 oIzHejg1hjAP4WlUECY32TfAbXenzJO4YIxoD/xjsU1hIWp0DPJCNswOlZfjWwB3zOEm
 ay+BMstUq2TyhU0IXsvmo+HwhOWMtZv9U+NePZsrmNIyRXQc6yKSe2qYwDdKBlVZlTTq
 /Nbu8j3lU47d8BQTV3AvR0VNMYajPg0KS/quLsmVZ4be6MAfg4z8+02mC0a3L2/bkNMo
 KKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dLLhwhf2bGoDdETTzh/LsbMlfpbCN8urf5vSnY0fHDo=;
 b=Q85YVS1eGVHIG5FW5Uzq3KQXJDazMbSZr307ThDIbOOvBzUhXY3H1ELVHc0LwYCGtN
 hfB+rNPEVj/TgNApvMOKS+3+cEgWgjo1PEadZ9/e/1zi6LKQS4p8NRQITlj6GbBASZy9
 P1CJExhTuUUB8dldI2rG3mWoZqHYuM0db1qFk4tGCs3KMXBaOc2hd61OQ8Kubr6AWs1A
 pApe+UENIO3kDncLXUG7NSv2VRc7+QJgKeZYW8nYlNaPmuxyd4Zk79rzTUCmos5tWftA
 SRqB4ME9vtBUlxyoTTvnVWLM6YffKVyKwYjIN6dNBRLdeKDiQ7Jp1sqFjloJRlI9k+8L
 snVw==
X-Gm-Message-State: APjAAAWEb1WDKrlHZDp5la3ncArbCcgm3qWC+IkpUr2eukXeBDhivkSR
 9F3Ub4IM1S0cGMuxjkd60wdQKQ==
X-Google-Smtp-Source: APXvYqxaBuVU9zve4sFLswNtBi3tXwLKvBSG1FfaPtjTmEU5RQ/c4o5f1d2qagjZevRtmWy04m6Axw==
X-Received: by 2002:a17:90a:222c:: with SMTP id c41mr72143pje.35.1579721126433; 
 Wed, 22 Jan 2020 11:25:26 -0800 (PST)
Received: from ?IPv6:2607:fb90:580:a104:4475:e6b8:8600:af4a?
 ([2607:fb90:580:a104:4475:e6b8:8600:af4a])
 by smtp.gmail.com with ESMTPSA id i66sm48870284pfg.85.2020.01.22.11.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 11:25:25 -0800 (PST)
Subject: Re: [PATCH] Makefile: List the sphinx documentation in 'make help'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20200122172137.7282-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <733f67b5-e4d2-6d3e-6407-7d73801de3f6@linaro.org>
Date: Wed, 22 Jan 2020 09:25:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122172137.7282-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Wed, 22 Jan 2020 19:25:31 -0000

On 1/22/20 7:21 AM, Philippe Mathieu-Daudé wrote:
> In commit 5f71eac06e1 we started to support the rST documentation.
> List the build target we need to call to generate the rST files in
> the 'make help' output.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

