Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSqYj-0006jf-Mg
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2018 17:10:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fSqYi-0006iJ-5I
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 17:10:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fSqYc-0007g4-DJ
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 17:10:32 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:37400)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fSqYb-0007ez-UQ
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 17:10:26 -0400
Received: by mail-pl0-x241.google.com with SMTP id 31-v6so194212plc.4
	for <qemu-trivial@nongnu.org>; Tue, 12 Jun 2018 14:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YYJ4+8fD7boEKf75OokWXxmzy2a5WNtZAvVbHrm/VxI=;
	b=fLvklqZV/vYOcAUE7WoAFYBsy8pBdaciB4j7KLwR0kbTF3j40WS96purYD3sDDj2fc
	u0bAUy4SEgxPy5QaOr6Hha3FUkZPeJUixmLeU/ZhaAaR4qZenoF/fh3hRsaVcdoqN8Aq
	Cf7JLMkgN3V3qzf74ym7azl0CF0AlH9KsBHZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YYJ4+8fD7boEKf75OokWXxmzy2a5WNtZAvVbHrm/VxI=;
	b=flVQRmKPwDY10tfaLUCEa+Grn11E6uE2X/kpuaNbN2XWHqwEML/hed0HshIzeibSbw
	xLEj/jJj+EePxnN07pdu9O5YEi/8NHqWrCAEcP2t+K0hsop3Gu5xyGCju4XMuUzlE3sN
	EjAYqc7RRCyiX4mcj140lT8JkoymUJSlzskehn+rd/s/HJKVtPJqLNNip1ja6cmE4mKJ
	rGwsaPGQW4SabyUbGyDEpyKqNTXzUa70wuJNjKXvbsSB0jmgggvaL7gdWyfzIBOuUdWs
	jxMgVsnbSqxdNPs7EGGWuzmhdmgP7v79eAoorm4L1eWSguoFrC6BNj/Y2eaTCXtMXVWX
	CdPg==
X-Gm-Message-State: APt69E3SNS3Lo31HQI7/++KmM2GnKRCxu1mb0IZMgl/N0G3fiywX3D7b
	AJequEGeFC5s3xLfnIdUp8p5OA==
X-Google-Smtp-Source: ADUXVKJveNkL2Adw42v+VNEFTbktYQhvISyi6+VxRigWtOJ4bNEiB93SdwAJakK+5/dtNqQ7Kaq1ng==
X-Received: by 2002:a17:902:728a:: with SMTP id
	d10-v6mr2131277pll.192.1528837824819; 
	Tue, 12 Jun 2018 14:10:24 -0700 (PDT)
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com.
	[173.198.77.219]) by smtp.gmail.com with ESMTPSA id
	t10-v6sm945530pgn.20.2018.06.12.14.10.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 14:10:23 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Richard Henderson <rth@twiddle.net>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-12-f4bug@amsat.org>
	<15d222dd-d2e9-4855-62c6-f89f2ee59c52@linaro.org>
	<76aa5170-1d18-8799-6ff1-a7c0dba0b489@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8537ca07-2645-6c2c-5945-a91da035b474@linaro.org>
Date: Tue, 12 Jun 2018 11:10:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <76aa5170-1d18-8799-6ff1-a7c0dba0b489@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 11/40] hw/xen: Use the
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
X-List-Received-Date: Tue, 12 Jun 2018 21:10:33 -0000

On 06/12/2018 11:04 AM, Eric Blake wrote:
> On 06/12/2018 03:51 PM, Richard Henderson wrote:
>> On 06/10/2018 03:14 PM, Philippe Mathieu-Daudé wrote:
>>>       xen_pv_printf(xendev, 1, "type \"%s\", fileproto \"%s\", filename
>>> \"%s\","
>>> -                  " size %" PRId64 " (%" PRId64 " MB)\n",
>>> +                  " size %" PRId64 " (%llu MB)\n",
>>>                     blkdev->type, blkdev->fileproto, blkdev->filename,
>>> -                  blkdev->file_size, blkdev->file_size >> 20);
>>> +                  blkdev->file_size, blkdev->file_size / MiB);
>>
>> Having to change printf markup is exactly why you shouldn't use ULL in MiB.
> 
> Conversely, M_BYTE was already ULL, so if you don't use it in MiB, you'll have
> to change other printf markup where you were changing those uses.
> 
> One benefit of using the widest possible type: we avoid risk of silent
> truncation.  Potential downsides: wasted processing time (when 32 bits was
> sufficient), and compilers might start warning when we narrow a 64-bit value
> into a 32-bit variable (but I think we already ignore that).
> 
> One benefit of using the natural type that holds the value: use of 64-bit math
> is explicit based on the type of what else is being multiplied by the macro. 
> Potential downside: 32*32 assigned to a 64-bit result may be botched (but
> hopefully Coverity will flag it).
> 
> So there's tradeoffs either way, and you at least need to document in your
> commit messages what auditing you have done that any type changes introduced by
> your changes are safe.

I'm more concerned about unnecessary or unintended signed vs unsigned changes
than I am about width.  But if we're going to force a 64-bit type, use
(int64_t)1 not 1LL.  That way the type will match the existing PRId64 printf
markup.


r~

