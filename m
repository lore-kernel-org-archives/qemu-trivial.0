Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHT8H-0000d9-BJ
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 08:28:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gHLfS-0003Cm-AX
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 00:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gHLfQ-0002Q3-KL
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 00:30:14 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41701)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1gHLfM-0002HG-En; Tue, 30 Oct 2018 00:30:08 -0400
Received: by mail-oi1-x244.google.com with SMTP id i10-v6so9232172oik.8;
	Mon, 29 Oct 2018 21:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xvhtgDM1Cu151/NXfmBhKuIUK+4DfjLFqcEOAaWraQo=;
	b=mH/ntlFKfXiOsdNQa70Epl2J6GD5JjHGpz+RP9tX68ob4pQwdKnUrap6R6SamtQcGB
	47uyAcIPR2h7khxrenSDqJnqJlUfqgDiGvLcQwXVsovNEKIph3RhRRFl5duBoeWOmL4m
	+tojakdCqTFf1sPb6qReSgZYmH7Xfs5+7UFNZcb8rqZzeBbkBzyYX+H2V8kYx/ajawaT
	+AUINWwuWKyEjeKcL3E1TSMRa9HxAkbbhqpPTvbbntzq2tKLkhNdFRw6+zCdoNMFw9EX
	ED+YuIHfkrhJVsSDT5am0MkRwKyopZIrrE1oP3jT+2qkbWgW6P/P3vjaB1vHVtAre4eT
	aGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xvhtgDM1Cu151/NXfmBhKuIUK+4DfjLFqcEOAaWraQo=;
	b=YYrHlWtwsxqPdLujhF+4cUMdxJJw4OQ9rkHxnlCwwsgVLuog65f5IlX3iRtKRCNO5v
	l7pujevFI4/nrDVi5Uv04gKK1RerFavyPvnJ9Q+3ACYLWWzPono9bc2VwYNAeEymnDDH
	w/fgcG/Co5XTb1UHaznaknXRPIQEQREdDhpx5UOM7XdCRdePh1Prqgrc/5U8P20biuSK
	nf5TH+naHH5tQX1+sjjos2FvsRakxdcwu14e8Jtu4YwvV7AcWKuMloXj3cWyCgS5d8M9
	o2adWqiHPYl2LLAWnyIlNQ1T1FqG7pG//6bp5RSqgpAFLB/VbHrjZZUU5iozjYgFySSN
	nCWg==
X-Gm-Message-State: AGRZ1gLGgmv7Vu0om0U1c92PSwgf4taXJ6cP8SdMW4N/e1yw7LYWUE0R
	f5o+O2PcEJzBXj7Fb0ZrwUR9Az6E
X-Google-Smtp-Source: AJdET5dDIEvip3wzfrCzye4Rc+MhEClUhT5jqHzST5R/IsMWPbqkczq3tPwAbZ5CsDUZtA2/c/ukFQ==
X-Received: by 2002:aca:6c3:: with SMTP id
	186-v6mr10649538oig.158.1540873807107; 
	Mon, 29 Oct 2018 21:30:07 -0700 (PDT)
Received: from [30.43.121.251] ([47.89.83.59])
	by smtp.gmail.com with ESMTPSA id
	b185-v6sm7267611oia.12.2018.10.29.21.30.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 21:30:05 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
References: <20181029195931.8747-1-philmd@redhat.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <fa65f06c-13dc-a73e-2bcd-2c7fcf7c3d30@gmail.com>
Date: Tue, 30 Oct 2018 12:30:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181029195931.8747-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
X-Mailman-Approved-At: Tue, 30 Oct 2018 08:28:27 -0400
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Remove bouncing email in
 ARM ACPI
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2018 04:30:15 -0000



On 2018/10/30 3:59, Philippe Mathieu-Daudé wrote:
> Shannon Zhao's email at Huawei is bouncing: remove it.
> 
>      X-Failed-Recipients: zhaoshenglong@huawei.com
>      ** Address not found **
>      Your message wasn't delivered to zhaoshenglong@huawei.com because the address couldn't be found, or is unable to receive mail.
> 
> Note that the section still contains his personal email (see e59f13d76bb).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Thanks Philippe.

Acked-by: Shannon Zhao <shannon.zhaosl@gmail.com>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d794bd7a66..1aa2728aac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -625,7 +625,6 @@ F: hw/*/xlnx*.c
>   F: include/hw/*/xlnx*.h
>   
>   ARM ACPI Subsystem
> -M: Shannon Zhao <zhaoshenglong@huawei.com>
>   M: Shannon Zhao <shannon.zhaosl@gmail.com>
>   L: qemu-arm@nongnu.org
>   S: Maintained
> 

