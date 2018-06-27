Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY4RI-0006TR-CT
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 03:00:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY4RG-0006RX-3m
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:00:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY4RC-0006g0-AA
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:00:26 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:41485)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY4RC-0006ep-3g
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:00:22 -0400
Received: by mail-pf0-x241.google.com with SMTP id a11-v6so556212pff.8
	for <qemu-trivial@nongnu.org>; Wed, 27 Jun 2018 00:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6fjiyRRS0uWDpiBzT3W2RohJqCZgd8y9faKosbdBt70=;
	b=W9F5DUg4YesFTqxJyUjaP5HRaeaAVCN+9EFrTiwZNdPLgYsUcvtvgUVdYfyrxUih/h
	0wsGjGJDyZHh89mnVpsls/F/eQbRhBs9wF7H9r4Z1DVl0V+OKUhC3+uaEixCioCiz+Jg
	TpEpPExKYYviA9l2/HmqwGX+emluCn8WFV7fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6fjiyRRS0uWDpiBzT3W2RohJqCZgd8y9faKosbdBt70=;
	b=MqtnAtwgUsRSO5uMq6v1pnPbvHGCkSHtpKYkD5e8rYkas7RHLBKmw7q1yfNB4ZzxuS
	BrrPQ1IYPytv0mCjsDTbLnEATSJLUzus9zwhrSJ6OFzRqzQcBV/DqXUs1JqrlJJr3m/k
	ggFcYU21lsWKeivuNl5vxYHO6N+2LeeroMSBgshgtTYPJBiJf7y5dDIwV1mSRkKH0JX8
	xXKjkgTg7C273kwD5b8lNm5RWdNBT82nzh6m+I59DD7NU1pJjD9kSsbvvVWHaaQDQC/3
	li6RTPBzQO1p+A18mnDVL9F+bhxw2P9sR7Oj+LkAW7GcGF2xdxJ0kaEj4Jlu6g/1sU/O
	5Pjg==
X-Gm-Message-State: APt69E2Ac3um+YV78/CoGJz0OhVgS9pBtt0+JVLvwB4EPYM9EvyZxmbm
	pgkm9CiFwiLa/nS84qL5oa1/7w==
X-Google-Smtp-Source: AAOMgpcuKny0llPmbFpSGCvfM1MghQAZFKasyTJhUzH9lEXaKUIniWci1ZMvSlcezhKz2HP0/N5ahw==
X-Received: by 2002:a65:4d05:: with SMTP id i5-v6mr82715pgt.58.1530082821098; 
	Wed, 27 Jun 2018 00:00:21 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	h13-v6sm5385790pgp.13.2018.06.27.00.00.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jun 2018 00:00:20 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-29-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6ac25559-9f64-9034-3b07-a2afc3edb57c@linaro.org>
Date: Wed, 27 Jun 2018 00:00:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-29-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 28/46] hw/sh4: Use the
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
X-List-Received-Date: Wed, 27 Jun 2018 07:00:27 -0000

On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
> It eases code review, unit is explicit.
> 
> Patch generated using:
> 
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/
> 
> and modified manually.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sh4/r2d.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


