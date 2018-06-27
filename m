Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY3e1-0006VU-3x
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 02:09:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3dx-0006Ub-Uz
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:09:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3du-0004jv-QH
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:09:29 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:38711)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3du-0004jP-Iw
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:09:26 -0400
Received: by mail-pl0-x241.google.com with SMTP id d10-v6so536429plo.5
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 23:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=QQS2zqXuk497w5PX2zio0JfUY5XVmoitztFjSZ100ag=;
	b=gz1Bvgb1osSDl1xxYozqUuCCagBVL18/PDixPT7JhOSY7Mjb3hy0K7ew7VPUWjU6KA
	IJjoqUTRNvqJvv9KnfC0Wx8gNrL33JjT6PGhpbahSvdpfHEMAofQLd4kaxOizh08tXu8
	qEBJ2jB2mB0Da3TWl4m8L4WoqQFbZAbpQKr7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QQS2zqXuk497w5PX2zio0JfUY5XVmoitztFjSZ100ag=;
	b=EIyReBnqTuanCTij91/EdJn8uTa0bxoRp5pP18emBggUhYG69Jtb5D9CrmgXMxizSX
	hkXxTwur8BAjMeurNP2I9/89vNL1pXY3oEH3z8+WMDxCqFvUheI7FkvR/r8V3gtx1OXv
	20Au7OFPW7pTloBQ8Tl1VIuC+rtOVcNfEpfwM6MknGLQS7wN2JFxw8uc36//Tg45clv8
	D9aZ8abdA8KBPY+XhMUceVo27nRjJ30wkUMR5rLgelGIX8kZ+sApUmZhGnTUOfitnCsz
	LmnXga33yumGUdjhH59AhPiGw4bEuS8oool7kd3JXJQhldLFAX7Bfn1cm2Yq0mYYZhXt
	a7qg==
X-Gm-Message-State: APt69E0RNrZZmH2nLVSNb3qSegvZ/WJKhC6BZyHnge185l0sq9ABzy4n
	QLTOvpiwFtcXtljlne3SAzX52A==
X-Google-Smtp-Source: ADUXVKJTj7rYLmHjRZrvRv6K9/EHgjgmnx/GnQd/8a5Bey2tTvnupaqiYaR0kZ8FSkTZjTBaq5nsEw==
X-Received: by 2002:a17:902:d209:: with SMTP id
	t9-v6mr4775101ply.63.1530079765467; 
	Tue, 26 Jun 2018 23:09:25 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	t3-v6sm5223766pgf.43.2018.06.26.23.09.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 23:09:24 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fe9a73fb-9cd5-e772-c6c5-c9ef6383bb8a@linaro.org>
Date: Tue, 26 Jun 2018 23:09:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 10/46] hw/smbios: Use the
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
X-List-Received-Date: Wed, 27 Jun 2018 06:09:31 -0000

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
>  hw/smbios/smbios.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -640,7 +637,7 @@ static void smbios_build_type_16_table(unsigned dimm_cnt)
>      t->location = 0x01; /* Other */
>      t->use = 0x03; /* System memory */
>      t->error_correction = 0x06; /* Multi-bit ECC (for Microsoft, per SeaBIOS) */
> -    size_kb = QEMU_ALIGN_UP(ram_size, ONE_KB) / ONE_KB;
> +    size_kb = QEMU_ALIGN_UP(ram_size, KiB) / KiB;

Perhaps for a different patch set, but DIV_ROUND_UP.


r~

