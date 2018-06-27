Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY4Qv-00069i-17
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 03:00:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY4Qt-00068k-KO
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:00:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY4Qq-0006Co-Jp
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:00:03 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:38232)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY4Qq-0006CY-Cm
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:00:00 -0400
Received: by mail-pg0-x243.google.com with SMTP id c9-v6so527746pgf.5
	for <qemu-trivial@nongnu.org>; Wed, 27 Jun 2018 00:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wRjCpMGBJPDZcgoJYjiuH3viz5V/y+wq1yyNzec5rNg=;
	b=NAfOgjJlopd0RzK2ZIdzndxVXqX/YUxg7jFY0AIO60+EdQeVrqv+Cghk+gmHAbyamr
	Z6JVdpjTw/exYC4SMY5RhP90jlJVLcgLz+8OIA4n/UCPLkW1pFU1toMCHTokNmt/GMXp
	IvZsVGTPRZUhCS7mDyJkLqgS8SYVPNsmnbhVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wRjCpMGBJPDZcgoJYjiuH3viz5V/y+wq1yyNzec5rNg=;
	b=gSNCmZzBErc8R6Smul63aZXmPmjWVX90mFBxCAdKpMX+6IZsh7dYT99iyrn5mUE/bq
	ISfSJHWDLSzCtacMwfGY6GjdaMycjHpjcqkHpcjFsq9qEvWPWsdSGZgT2AELrCFJI9sk
	IJIt+nI/0JZsxzJdW/taeb/w88pQ4ioD9D4Fk2+y3CnCJxCQeZN6qfJVIH6EWK5l+BYt
	9EVTij/gzMnmM5qrwoNYx0nV/q9OoS/T7SNFij/S5QH0s8t02DQMYwWHhbrzook3tVB7
	hAxg2TnZ0eS4QNHu71WRDOXavY0ArW3xA9Aw8gEb+xoyjkc+h6WRLHgOf1T8WldzcxuL
	GnEg==
X-Gm-Message-State: APt69E2cPTKRFr2dqjTdTuVHnvYSwAooW0xRRd77AwiWn8WgzP/a5PDI
	0OnpIWPAe1JB2/x6B+Uisz84MQ==
X-Google-Smtp-Source: ADUXVKKaKMFYn3LGwocW0o1xetuhiCsYxHYrDm2szAOXYMIkV2t99ZwaTS4uokcTR/L1oLTLCKPSeQ==
X-Received: by 2002:a63:4346:: with SMTP id
	q67-v6mr4068625pga.328.1530082799395; 
	Tue, 26 Jun 2018 23:59:59 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	g12-v6sm5271454pfh.164.2018.06.26.23.59.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 23:59:58 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-27-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4e8ad6aa-f320-499e-bf0d-352f3fcfbbdb@linaro.org>
Date: Tue, 26 Jun 2018 23:59:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-27-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 26/46] hw/cris: Use the
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
X-List-Received-Date: Wed, 27 Jun 2018 07:00:04 -0000

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
>  hw/cris/axis_dev88.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


