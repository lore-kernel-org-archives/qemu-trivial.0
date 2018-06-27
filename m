Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY3aA-0005Yy-Rw
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 02:05:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3a8-0005Xa-N2
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:05:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3a7-00015Z-Tr
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:05:32 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:46005)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3a7-00015C-Mt
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:05:31 -0400
Received: by mail-pf0-x241.google.com with SMTP id a22-v6so485191pfo.12
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 23:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Qztzq3YItxiT/zYfhSYzektLqH5DRNCZEg8jWRsAufM=;
	b=AhSlW/ild4RkllgBvQL/ds0k0y8w5Th3RwwOINYvOmStZATYVLFSqAsSBNMUte6eFa
	06608LPloo0sAOdyaFun79Ic+bqEdS4tiy23fAhMs6hPj5/WdItFMhUDo+LFA7ymxIns
	M3SLTPG3bTVNVTAiLHUzl+WH7/Vn2yi/wYcAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Qztzq3YItxiT/zYfhSYzektLqH5DRNCZEg8jWRsAufM=;
	b=fehCaYz9PqBzLWspvPWTEdCfFSHQF69mGjapMDvtQ/xPh7ypSMsZNhJAbgdcok+vqn
	OG+pxBBEI6OP1SkJAng4x4bSBub6Mw7FYfIFA1328x347Da/8/dEl6qytibEW7R4MltW
	9XTIF/gEZmRQJn5dszw627HEpSklj0FdVBlmQNVwmEmZ+i91qABdxoocNkTWGEppX6us
	OHRcOfY9zfXqH3/CHm6d84imYFababKOh+38G++b3tyUT6ZeDXFOjFaasHyZzhoSnXE/
	tdrESQWTTh9gz5WrmZcHhl7ZxJ5Ce1KWDEOC7jErYznXRIotgPaah/xPiQq7ybPBlm2m
	BOMg==
X-Gm-Message-State: APt69E0eg9seHyBvDAJsGBWZFmxOVyEk0VW9I0CVhND4vT0st/CG39Z5
	VGizUgVjSkUsBHci+P5SOngE2w==
X-Google-Smtp-Source: AAOMgpdYmE9iU3Fcb8FyNX87t60Br4hnOTT8sq2lOmTC7ywFNmulN/1HT01wrE9VZExy5VBggHcDmw==
X-Received: by 2002:aa7:864d:: with SMTP id
	a13-v6mr4423504pfo.247.1530079530766; 
	Tue, 26 Jun 2018 23:05:30 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	y10-v6sm5078866pgr.44.2018.06.26.23.05.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 23:05:29 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5d5fa39d-1d3e-d8d0-9911-4440b29b5021@linaro.org>
Date: Tue, 26 Jun 2018 23:05:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 09/46] hw/scsi: Use the
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
X-List-Received-Date: Wed, 27 Jun 2018 06:05:33 -0000

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
>  hw/scsi/scsi-disk.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


