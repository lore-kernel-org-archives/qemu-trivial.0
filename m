Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY4jd-00033M-V6
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 03:19:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY4jb-00032f-7T
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:19:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY4jX-00060C-7H
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:19:23 -0400
Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233]:39838)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY4jX-0005z9-0j
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:19:19 -0400
Received: by mail-pf0-x233.google.com with SMTP id s21-v6so579374pfm.6
	for <qemu-trivial@nongnu.org>; Wed, 27 Jun 2018 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vi2GvDh7IDWkBNBpEw4rveIvlM6xhWPiKJA3RygG2Q8=;
	b=kRI2qKSfaKe331D2Zt5H8AA67lCLVN4EcWXg/a+jfTXsjKHjoOcmSQKZWSIYKYclH4
	zKSa6prAy1zO8Z8Td91FT9SSzauZzsNqVYfEgAR7EiID1ApjVY8DGWFKix7zdfDmLygE
	qC23BE18wp0dpqX+BKmd4dSqLqLFHHysKOGsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vi2GvDh7IDWkBNBpEw4rveIvlM6xhWPiKJA3RygG2Q8=;
	b=T6rP/FNIFBCAJy8ACukyp4GYf1bvTTc6jWnK9cawJAutS5XkRGvBtnu7qOc0EA4k/W
	G3Oc+aV3E0AUeykJatAkWQqLrlhkOcRfNWF6waMxZYyquOWtsmDGDvWBJ2Cf1+lyOrJ6
	OReIAYLjQguAMpOzcP9Yv3cQgqBADwj7CUDEdy9xqRRgheg6b4nubxleEllyC6XtPH2T
	m7/oCV7p+6stTCHUtmn9WdtVaYQa9tHYfRVzAGP8qLnAzqHPV49t6EAURDnAJyIMhVAp
	nWnr31ENHFyTIXH74LkJoswcAFuJ/dH9kAqbVcjKRT9SyaEgaHUbIWLd5oDfCyxAT8T9
	HxjQ==
X-Gm-Message-State: APt69E05lOg2KsqonoxRR0r7zSjmpwPK4Tr510tJQ5qfz82SRLTpVM1v
	MvG4W3w9bZX69oIF2LrtyuEklg==
X-Google-Smtp-Source: AAOMgpdhth9EVuEklvnFJ1Buo1c3YCxQDSVaXFEem3VeVGwMeMff/+EtACgu2bE1j3YkTaOo9GpMVg==
X-Received: by 2002:a62:ae08:: with SMTP id
	q8-v6mr4236518pff.126.1530083957910; 
	Wed, 27 Jun 2018 00:19:17 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	a23-v6sm5130067pfn.113.2018.06.27.00.19.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jun 2018 00:19:16 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-37-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5e58c7aa-4c54-53ee-8d1a-ee7280bcda9b@linaro.org>
Date: Wed, 27 Jun 2018 00:19:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-37-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 36/46] hw/sd: Use the IEC
 binary prefix definitions
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
X-List-Received-Date: Wed, 27 Jun 2018 07:19:24 -0000

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
>  hw/sd/sd.c    | 4 ++--
>  hw/sd/sdhci.c | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


