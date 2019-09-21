Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBhHi-0006Qs-3n
	for mharc-qemu-trivial@gnu.org; Sat, 21 Sep 2019 11:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41491)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iBhHg-0006QV-04
 for qemu-trivial@nongnu.org; Sat, 21 Sep 2019 11:26:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iBhHf-00043g-3I
 for qemu-trivial@nongnu.org; Sat, 21 Sep 2019 11:26:51 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44393)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iBhHe-00043O-Rm
 for qemu-trivial@nongnu.org; Sat, 21 Sep 2019 11:26:50 -0400
Received: by mail-pf1-x443.google.com with SMTP id q21so6437940pfn.11
 for <qemu-trivial@nongnu.org>; Sat, 21 Sep 2019 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=54rGvRC2DHDrzSXA4F9r+xIfJe2KBhX8HqaGRlC98Us=;
 b=WGV7AXzrPrHjbY72MWE3HQOyxMXk9Uv/QHqSWTx3J1wsWtTeXI3+i8G8Ybkm0PX5Oj
 wgA83b8J0ksXgdHT6du76U6IOfna6gOZltatny2qMiW1RT8dnGJGmIhza8hFiGQ055uZ
 dwjXc66SohjbF190q13QHPB+7WZRBjToSx77lpdgQJ11CEBbBayFl5NTh1/Y9CfEy+eT
 0mHXdPrtKgAAYpbqtxEJxu8aswq2BE5YJ888lPbhznq/+H1XTR7pHI6H+rBqKIoIsMuT
 pOXhCf18QK72sg05A5BLprWQp/WMgPxri1+hOCLMXsUSoKMbJt+5d/vaSlw0rLVZwzgq
 uwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=54rGvRC2DHDrzSXA4F9r+xIfJe2KBhX8HqaGRlC98Us=;
 b=exMAmNq/q3/luxFr1fJN5mKuA85NuTxr2YspRI0zPl7CAvZa10R4qZyExxSAkKVcw4
 UKFiuguoZP38hteuvdgW7v192RzFSo1HBC+Aw54rzw6arCVdjwLQxknoGIG9pqbt75Pj
 q4MLG1isrQW5Im8uCRXoeLJqhCvBu/6d9JklaARZsSJ0wsamvikJYS18QlcE4YNz76sF
 hNhS/nbe3jrhfFNWBpowS5lsNRcXGthzrCxUmQRCceaK3nMgRBRZmCSDbIZ9BwO6QirN
 sBB/v9izD5xIzCBXJLqTOQidXWNUR9Ujmq66OpaaahgGUaQdxIvVsDDeAAC74QN50aOg
 0yzg==
X-Gm-Message-State: APjAAAX+2Mc4+Z5SWF3zo4EpLaqBZOlsEJ2E74MPbul54lw4ni+vDoBt
 ErRYjJE4OSmOpdqllUSZHPvNGA==
X-Google-Smtp-Source: APXvYqwat6KAQI6/zESyy8xzgC0+9aIyEtrZritqX18WpB85XHKLn5vrBZAEwFFxOXMI2JcenlB/mw==
X-Received: by 2002:a65:6254:: with SMTP id q20mr21209552pgv.423.1569079609657; 
 Sat, 21 Sep 2019 08:26:49 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v18sm6083361pff.32.2019.09.21.08.26.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Sep 2019 08:26:48 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/boot: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20190921103405.19623-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <089a9b68-b1bf-66a4-f696-9e7e28bf6c4e@linaro.org>
Date: Sat, 21 Sep 2019 08:26:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190921103405.19623-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Sat, 21 Sep 2019 15:26:53 -0000

On 9/21/19 3:34 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/boot.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

