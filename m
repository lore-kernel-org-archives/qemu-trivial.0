Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY3gc-0007WJ-4d
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 02:12:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3gZ-0007VB-Ja
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:12:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3gW-0007SM-EG
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:12:11 -0400
Received: from mail-pg0-x234.google.com ([2607:f8b0:400e:c05::234]:44613)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3gW-0007Qm-8C
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:12:08 -0400
Received: by mail-pg0-x234.google.com with SMTP id b10-v6so463634pgq.11
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 23:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lNPk+sXf4MbvpLiCAVDsCkuaCF4/Y73Ac4NTQsqhOFk=;
	b=XvHrwj9JfVhE0J8zM8z53KY90uXv21B8po3+xK0Ra4NRIbYkrx6q8gAmspX9pZ4jzk
	i6oeF8Oo/dGhaRW6DsZBL/MUS9bytQJtpMQLZs5Fpzf5I+NwWHa1CpEgHzZLhd6NPAxt
	QDqsS8yARjhPxw5lVX2cxl0M6KDov2+4TlUjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lNPk+sXf4MbvpLiCAVDsCkuaCF4/Y73Ac4NTQsqhOFk=;
	b=MN75ouAeF7sfeMV+avMRR7T/bxycReaJ6CV2hzoTj7C+bHIYF6EVvN+dXxMUpZppeO
	/efjY32EBoh5RcfJA0HLH26BYt7H9rYmKAvjiOt3YZJ97HIQoaDlIKIrBAXsPxw6dXjv
	qJef3bMaLZC5vNUbZGd93bCCgnL0BOC8U5rNK0kY+CoVDQpU/CKQ54Ww2fQJ7Xn8LuKe
	v8IEODnjn45iPEi299lvb4SHlqgMxmcUl3yNC8gAgve7TTiZ45yzPG9sAFnk2V7p6MO/
	29hLsW0GdGzHvdoUaNclZIgORctoRHJP3YIN3/BWH+GdR/2IeUsMq380UOPmsxd3RBx7
	cBWQ==
X-Gm-Message-State: APt69E3SEQM4I0XNpNS8up6qDX4+quYgV08R44/kqRKW72jOxaGXoZT7
	L5KfhhfHCZwpYhp9ozN+05puhA==
X-Google-Smtp-Source: ADUXVKI+krx11RyD0ox9dSSkSb8yqb91OGD9BWG4foOOdhURJpTDy+zHBTIfUAkVw4Tr5expThVLgw==
X-Received: by 2002:a63:ae43:: with SMTP id
	e3-v6mr3836589pgp.181.1530079927369; 
	Tue, 26 Jun 2018 23:12:07 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p88-v6sm5578483pfj.140.2018.06.26.23.12.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 23:12:06 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: Kevin Wolf <kwolf@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-trivial@nongnu.org,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Keith Busch <keith.busch@intel.com>, Max Reitz <mreitz@redhat.com>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b6becd9c-60f5-e9e7-0bd5-95fdcc1a1716@linaro.org>
Date: Tue, 26 Jun 2018 23:12:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::234
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 13/46] hw/block: Use the
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
X-List-Received-Date: Wed, 27 Jun 2018 06:12:12 -0000

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
>  hw/block/m25p80.c  | 5 +++--
>  hw/block/nvme.c    | 3 ++-
>  hw/block/tc58128.c | 3 ++-
>  3 files changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


