Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY3S9-0002gy-UZ
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 01:57:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3S7-0002fR-3L
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 01:57:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3S4-0000EZ-2C
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 01:57:15 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:45971)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3S3-0000E0-JA
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 01:57:11 -0400
Received: by mail-pf0-x244.google.com with SMTP id a22-v6so474798pfo.12
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 22:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=G4NKT3ovpH+epmvX0eaiuNUeK4j07hekX/wxaKqzNDw=;
	b=MOv3FMWScpXwvsys03NSrIbC2iMNi7YjT56qOTZpnHRoLwu7SEm7qht8lka5tQMdFs
	3a85CS4Nq1mHq6zxLgqmvl96YkBZ4DjrC9YnEOOITY0c0aDDM/lPntAy9cw6jfo3g/yO
	RQOBuEfYXG0BFgXinh5a4sDEuh2spLxSB9vh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=G4NKT3ovpH+epmvX0eaiuNUeK4j07hekX/wxaKqzNDw=;
	b=RHZtUc+DPsIW1Pgc3qeFeEtaoESijCO69SRvPpNgmZiBOc62OiRRZm8jFKtCqym2EL
	XZVtmDKWEFCURMbeQzJLCokiH9spDgUX0dnZJrV2Fn8dsfkIRz9Diq2KECsTlhNlHFDI
	oIj5T6rQ2U3R9AlltNrhEA/B8m4B4TvRUIOoteKRTDCX0u++LxU534MPW6T1dxNh7OFc
	UOKVilfoBo+d1jJ024GERwY97QLvtkE0becWfCPHdfVAiiiEEeLwwNM1ai9W0NkNQELV
	q22vhRGe+C/IKel6qAXOCdDiBz+ArKyVPekrLYz3NRAQN03ZOeEJXpJUXWZrMdThg6wk
	/cCg==
X-Gm-Message-State: APt69E18CY/HZd42gFLZ44E1iAPsePcA2AUf5vHngAT66VeAIZ+ewYwl
	mEDF8sX05T7l9Pu5x3lrWD2WcA==
X-Google-Smtp-Source: ADUXVKJ0h45qHkTLFPJ50KSQ3n/L9ykiyeZ73XwzJcGedJPSsneZWmNwjd12uDFtRZ5bBoxqmwQljQ==
X-Received: by 2002:a65:4841:: with SMTP id i1-v6mr3859536pgs.75.1530079030557;
	Tue, 26 Jun 2018 22:57:10 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b62-v6sm5279439pfj.123.2018.06.26.22.57.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 22:57:09 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>, 
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>, "open list:ARM" <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Richard Henderson <rth@twiddle.net>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5f396d83-59c4-01e0-3f90-ba68e8217c1e@linaro.org>
Date: Tue, 26 Jun 2018 22:57:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 05/46] hw: Use IEC binary
 prefix definitions from "qemu/units.h"
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
X-List-Received-Date: Wed, 27 Jun 2018 05:57:16 -0000

On 06/25/2018 05:41 AM, Philippe Mathieu-Daudé wrote:
> Code change produced with:
> 
>   $ git ls-files | egrep '\.[ch]$' | \
>     xargs sed -i -e 's/\(\W[KMGTPE]\)_BYTE/\1iB/g'
> 
> Suggested-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Acked-by: David Gibson <david@gibson.dropbear.id.au> (ppc parts)
> ---
>  include/qemu/cutils.h  |  8 +-------
>  hw/arm/msf2-soc.c      |  4 ++--
>  hw/arm/msf2-som.c      |  6 +++---
>  hw/core/loader-fit.c   |  3 ++-
>  hw/core/machine.c      |  2 +-
>  hw/display/sm501.c     | 14 +++++++-------
>  hw/hppa/machine.c      |  2 +-
>  hw/mips/boston.c       | 28 ++++++++++++++--------------
>  hw/ppc/pnv.c           |  4 ++--
>  hw/ppc/ppc440_uc.c     | 26 +++++++++++++-------------
>  hw/ppc/prep.c          |  2 +-
>  hw/ppc/sam460ex.c      |  2 +-
>  hw/ppc/spapr.c         | 10 +++++-----
>  hw/ppc/spapr_rtas.c    |  2 +-
>  hw/sd/sd.c             |  4 ++--
>  hw/sd/sdhci.c          |  2 +-
>  tests/test-cutils.c    | 18 +++++++++---------
>  tests/test-keyval.c    |  6 +++---
>  tests/test-qemu-opts.c |  7 +++----
>  19 files changed, 72 insertions(+), 78 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


