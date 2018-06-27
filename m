Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY3jE-0000f2-RT
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 02:14:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3jC-0000ep-DI
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:14:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3jB-0001pa-HS
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:14:54 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:45048)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3jB-0001oc-BA
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:14:53 -0400
Received: by mail-pl0-x241.google.com with SMTP id m16-v6so538253pls.11
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hZE7UKW7G9ykhWIapvMKmdKu4OFYG+smEaGsW5RsUJs=;
	b=NE8xZU2kRQWPwroZIDAgXLBHByOR7C+nwJb2aSVwoIHp2pWSbPei9kCTbgH3SH5vD1
	v7HgG69Sp0F8d6Umf0D7vD8ymdISD66Hk5DHCg0cPV5UornGrsxc1LxV0IyS3yYPD0GG
	GtPgHqBwcJCoHCIWKFb3jMADMZbJLrYFLOJzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hZE7UKW7G9ykhWIapvMKmdKu4OFYG+smEaGsW5RsUJs=;
	b=FWvjUOFQw9OapmDf31w35f9HGWzI5kybD878B0UPJo9rwjL/Nojcpzff163i5vlLkD
	3loOETMnntthKY1JnNV+bCJT49re1YoCpEjcpkUt6jaWkV+jo/lBTdWiDjYG+ZFqXO8p
	tadHTqr/d7JA742JAQ4TkVpj2rldABUK/Fbaz4jw0TMnd8av8TrEqfiYQdCVCuhWeFKR
	0BMbeGr/GbTwIkzUkCMtugph17LKlcsWRYaQep0yGDFLY/TlxjYbeC+8xqeHjNvLth1j
	9AZFYWdXfQhuh/rg5aem1P8+a7Zn2/PenLGyaFY01FcerMzubUPIWoZYfDQIXY5mXK+j
	nKOg==
X-Gm-Message-State: APt69E0+rgulrc/CVoY6UtBhmJJ/FISIagUoWyzB5t5hD4LYX0emsMfH
	h3hV14lO4ueDyKOqxe17Eq+nTQ==
X-Google-Smtp-Source: ADUXVKKJXuVxAXxfn8bK9+8w9gsRNYvi3n7gH3o65diHghBOR4aHHab9BS5J1S2r43a6mtpu3wrv6A==
X-Received: by 2002:a17:902:1682:: with SMTP id
	h2-v6mr4734592plh.327.1530080092508; 
	Tue, 26 Jun 2018 23:14:52 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	n10-v6sm7021607pfb.27.2018.06.26.23.14.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 23:14:51 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland
	<mark.cave-ayland@ilande.co.uk>, Fabien Chouteau <chouteau@adacore.com>,
	qemu-devel@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-19-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2bbd2b7c-3b79-e3a1-2cb6-84e4705c8e34@linaro.org>
Date: Tue, 26 Jun 2018 23:14:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 18/46] hw/sparc: Use the
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
X-List-Received-Date: Wed, 27 Jun 2018 06:14:55 -0000

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
>  hw/sparc/leon3.c     | 10 ++++++----
>  hw/sparc/sun4m.c     | 10 +++++-----
>  hw/sparc64/niagara.c |  3 ++-
>  hw/sparc64/sun4u.c   |  4 ++--
>  4 files changed, 15 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


