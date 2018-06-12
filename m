Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSnIl-00056z-SL
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2018 13:41:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSnIk-00056e-8l
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 13:41:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSnIh-0006IJ-6d
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 13:41:50 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:41886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSnIg-0006IB-Vv; Tue, 12 Jun 2018 13:41:47 -0400
Received: by mail-qt0-x244.google.com with SMTP id y20-v6so24521385qto.8;
	Tue, 12 Jun 2018 10:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NaZq4bNA/ZHEoCDAU4dp4f3TvwSTLeII60hbp/ZeRZo=;
	b=rGQMyP7r+QK4/q9EArgsZQwIL9hMoVDSpdQION2m7eqRR8F0d8fOnASx8P14zV/Oyc
	3PYY5zvrdMF2xqtN6ReIBizIDcd+1quUqFzfkIPXwvf+QdRbf0q+HzK07W099UY5mkaS
	DhOmGXcinVbOW08CRRkaOECAGtsaT7ulRfgxjk3Lng2LWAwkyS0htS1JGRtlm+wT0Ayh
	Jf9llS/KWnvOyt5O6VYaZvZ3lIUaN1P99ju/eBXmGBC+0zZv56fEOS2s9sDy6ANt8oSd
	grEJ8CifqVgo6aI/jg4B2mqcqI7FL9oweg9wQxJdANH8rN6BTIL9WJ+HHqTYMZoqjBBt
	UTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=NaZq4bNA/ZHEoCDAU4dp4f3TvwSTLeII60hbp/ZeRZo=;
	b=T+hAfEO23IOeowEkfjTTl3NgZqzFjCSrEkxyidg2ic7JR3AxZxp2YTaV0BBJhwX4DW
	0d3mhIGgTZGrHVRxiKkkJSKTZ+fRQ9EMAe/Jvf+7mF+IBOmiQcYuW+muB73aMa8oDFpl
	BkKRC/1VUc06YYAwKFirUG60FsP6CuMglAbQzSpO02EcBaDSdQp8dQGEMzkr4kaawL6q
	pxbovqzQn7onEMvIAYmenKEeHYC6WpntoIMl12CGQtRuygEOZDuqwP1HvZFrKKANRKL8
	pk2MTuT25Jsnnurh/L3Ggj4T9Sk9J2P0rxOD2cHku0K+zPEB+Ya63+Qgf1nGNwCpAhkY
	mlnA==
X-Gm-Message-State: APt69E2kGcD/x0l7eL4imRpcDUb3Q/lorGizbFJcLQvhBA72Luhdxgd+
	mcpM+Tdopnm1MdlWm/hLUFE=
X-Google-Smtp-Source: ADUXVKKqrzk1qJSVyVYiEoQFGBswXGi0wzlUrVfMxI7FpxFMA7CbSoqepwOPv8xrzxO7ploKutPeIQ==
X-Received: by 2002:ac8:3805:: with SMTP id
	q5-v6mr1528564qtb.410.1528825306410; 
	Tue, 12 Jun 2018 10:41:46 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	m14-v6sm434753qkk.88.2018.06.12.10.41.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 10:41:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
	patches@linaro.org, Cornelia Huck <cohuck@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
	<650048df-f4b1-b351-f877-be8c84197ba2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ba3865c5-dd60-8da2-9f99-33723ae26c2b@amsat.org>
Date: Tue, 12 Jun 2018 14:41:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <650048df-f4b1-b351-f877-be8c84197ba2@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] CODING_STYLE: Define our
 preferred form for multiline comments
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
X-List-Received-Date: Tue, 12 Jun 2018 17:41:51 -0000

On 06/12/2018 02:30 PM, Richard Henderson wrote:
> On 06/11/2018 04:17 AM, Peter Maydell wrote:
>> The codebase has a bit of a mix of different multiline
>> comment styles. State a preference for the Linux kernel
>> style:
>>     /*
>>      * Star on the left for each line.
>>      * Leading slash-star and trailing star-slash
>>      * each go on a line of their own.
>>      */
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> This is not my personal favourite, but seemed to be the
>> closest we had to consensus in the mail thread for v1;
>> I can live with it in order to avoid getting patches which
>> use the styles I like even less :-)
> 
> Honestly, I don't like this except for "important" comments.
> 
> A "small" comment, e.g. one that doesn't quite fit on a single line, now takes
> 4 lines instead of 2.  Which is really annoying and IMO tends to break flow.
> 
> If you don't like
> 
>   /* gnu
>      style */
> 
> or
> 
>   /* whatever
>    * this is */
> 
> could you live with
> 
>   // c99/c++
>   // comments
> 
> (I know we currently deny those in checkpatch, but that's easy enough to remove
> if we're changing policy.  I have no idea why we don't like them in the first
> place.  Or other c99 features like mid-block or control declarations, for that
> matter.)

+1 for control declarations :) Code is easier to read and keep focus on.

3.0 release is a good opportunity to establish such disruptive changes.

