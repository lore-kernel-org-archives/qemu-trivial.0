Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY3n7-0002gJ-I3
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 02:18:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3n1-0002fU-Ae
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:18:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3mw-0005Ft-JT
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:18:51 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:38747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3mw-0005F6-CU
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:18:46 -0400
Received: by mail-pl0-x243.google.com with SMTP id d10-v6so548653plo.5
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 23:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=GdZP9XYRQZi3bYw0MNAjxQrjLRZ+Xt2TJj9GE6LPTM8=;
	b=QMaaeonGV/oRiMwRPwmFqNyM40cwyTnOSgLuiTXeukkl7YR3bV5uyABDOt0lTW5aJc
	21yQUOiJIrB1ZuF9HZyKeMXXZXFafCL+zNxbDl0ZQ9ReJKks3pZoy8PtbUZXS/9Yk6l3
	VXY62U7mUT3MP5MTc/M9tHs61yIrOiSWdqWec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GdZP9XYRQZi3bYw0MNAjxQrjLRZ+Xt2TJj9GE6LPTM8=;
	b=asw8lJp2ZWXar4zilgeREkLtnmvxnn3IrozDxX58yI4vOSmMnfqFTB7Kluh4Zpltgn
	cQjk+ngbLeTSHAlSMYxP4gAsaGaU9c1aSKwXut+Mzu7lQrhZeFlaOYs8ggQbuUXSQK7c
	/cG/7dWZfYMN68+3kGVxSqrVK/0452JzK3FfFLkS1b16j2pgbOAzPYazqJjTKlk/17DX
	BDW2UJ2Yu3XhWV6Sn6I7UvFLWpn/rGwh6o2BUE3yDiJC10fn7y5cvoia8YoHx9gw9s8V
	6q+kKNOT46yv880m8SnvCW85RK7aF+6mc9BvDvPBKizdIZ3Pvudbq4im/juQjb5ibMhM
	E89Q==
X-Gm-Message-State: APt69E3mJR/5QRZ6eTKE1inVqZEMSzQ3aIAcHVbEDQCU7D+FdbaIsLRe
	SxD3mV1Yl75Z4Fy4Vpj0fgWFFQ==
X-Google-Smtp-Source: ADUXVKLU9BLi8mSsbVknQBMoWGhExRkDNqdsdkWr67z1y5876KkNMMu4aT21T0moUPXTqphuwm6sgg==
X-Received: by 2002:a17:902:22:: with SMTP id
	31-v6mr4825472pla.332.1530080325500; 
	Tue, 26 Jun 2018 23:18:45 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	o13-v6sm4490824pgp.50.2018.06.26.23.18.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 23:18:44 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>,
	qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <250c288c-491f-f8f2-5c17-77277c112f41@linaro.org>
Date: Tue, 26 Jun 2018 23:18:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 22/46] hw/alpha: Use the
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
X-List-Received-Date: Wed, 27 Jun 2018 06:18:56 -0000

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
>  hw/alpha/typhoon.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


