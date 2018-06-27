Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYBbZ-0005Uv-CT
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 10:39:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYBbW-0005L0-Iz
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYBbS-0003Js-IA
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:39:30 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:37294)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fYBbS-0003JB-Aq
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:39:26 -0400
Received: by mail-pf0-x242.google.com with SMTP id y5-v6so1068815pfn.4
	for <qemu-trivial@nongnu.org>; Wed, 27 Jun 2018 07:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zl+oFUS9EflLeX0L5y2MqXrCTpUy3G+Ag0eqNAwizeU=;
	b=jUr+gy5cstA40ntPYZAfwiM/duVtde3DsFIgJFC5amWxLwkf+bYwUz/jZkMJo0t0e6
	kmtTKn42/oWI9sTEXqNXBK8NTV8B2V18qacZg92LADp8opyb41/5cSVVRE2HqE5+vmxg
	NxD6VkI13lU1lJoO3HUruAdqrVZA08ITUAgvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zl+oFUS9EflLeX0L5y2MqXrCTpUy3G+Ag0eqNAwizeU=;
	b=efCBsbzRAtgDf1C3HP0LujF1BAEmIAPcRqUOtFbncfqiHCU9TIIAVOkjslkY4O2pfN
	XWIsOeE0Q/3M/UQ7tmThXAImgT9OOFIO5yUWtJGmJZN72YO1CynCBJ75Qmc2KMYpHQRf
	PYP0Zta1OIfoyOv2rcr4VtD8JUG24fMW09t3HEhYInMVCXJBxHs+EMGgKjULtGSyoh9/
	Hj3Uz0GmVLuS8SMS6Z9a7PuWmtJBdACZEnbXKHznAFMohl4NciAcQWj8YKXrbdMBEUUp
	kS4E3qZyzpfBSR5k2RttKb2FEvtDw14EEuugnRJRIV8IswG5zCCr28MwcViP5TBgZLSj
	M4xw==
X-Gm-Message-State: APt69E2nvboyF+MvZsM+/L5/3WoV8GE+x37/cz5+xVAS1x3FDctUT9tv
	5y7pITh5NwYZAEmNcoR1iB4DaA==
X-Google-Smtp-Source: ADUXVKKe9d3cWaRw3IS5StTKMM+FYmyaLC8gL93Q3pJssacENnG686P+NkVzTn+nPO9GCWZfnChqcA==
X-Received: by 2002:a63:7558:: with SMTP id
	f24-v6mr5541308pgn.314.1530110365402; 
	Wed, 27 Jun 2018 07:39:25 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	e5-v6sm5886270pgs.59.2018.06.27.07.39.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jun 2018 07:39:24 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-43-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <77701561-fead-eeea-2184-6a45aa7deafa@linaro.org>
Date: Wed, 27 Jun 2018 07:39:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-43-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 42/46] monitor: Use the
 IEC binary prefix definitions
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
X-List-Received-Date: Wed, 27 Jun 2018 14:39:31 -0000

On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
> It eases code review, unit is explicit.
> 
> Patch generated using:
> 
>   $ git grep -n '[<>][<>]= ?[1-5]0'
> 
> and modified manually.
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  monitor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


