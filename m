Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eH5D9-0007Cz-Q5
	for mharc-qemu-trivial@gnu.org; Tue, 21 Nov 2017 04:51:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eH5D4-00079Q-3R
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 04:51:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eH5D3-0005AF-Di
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 04:51:18 -0500
Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236]:45047)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eH5Cz-00058F-7U; Tue, 21 Nov 2017 04:51:13 -0500
Received: by mail-qk0-x236.google.com with SMTP id n3so11172629qkn.11;
	Tue, 21 Nov 2017 01:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=e5v6DNUMJzVYrIicHhMZu5RWaXyUSXsgUU4WMcAoTjQ=;
	b=LrsYO9PCzmWRAdYfL4AkUSjU2mgoI80pAvY4VJAoNt/O/a0ZbRAjrWSHVyALlkZyw8
	7bUoXuH904dvlxcsUOqIlwi7QC+clPOJEZKkvPtnwvbSLQD5+eJPzcAJywKb8eBHtdeR
	pi1kyF1QNtGuo0hGMnft+itq5C4T5qQPYApIAvlG1e7MzlutRUN4NBAQ0wOxtfsoGork
	RA+HKNoTFCbatFlR8gdc+oV2AL4ZQhrVNQoOQiF4K5WKzjljpy1tiMgl0Ia/o8HFUZjK
	3dDqRPtMaSwN9vsXkNRm32ArUQBHSV/zNyGBEUEpSpDBqgqNCb6fWZi70fYU7MtmkZLi
	A0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=e5v6DNUMJzVYrIicHhMZu5RWaXyUSXsgUU4WMcAoTjQ=;
	b=cp6BDJJ9jAKDcxSVWFDBvoG6pYG1RQGlrLqRgnuulnl/HH8a3+MBPKroVTxTovm3C9
	8ciyk2YnmO6chQjQP+Lrk3R0Z9rT6SFtfrkxnq2CMZp5ERIspM2btFE4ysOnwrl6KJDq
	s/1T287VDESWpM8oFjUskDExZsaF6nqRBcRUCkgEUxEhtH2ved1t95YDg+WMGOGjvWLo
	ayMXAXui/BgP7kTTZQUHb6hl0cCTBGo1i8EHR+hYK4aIzbD5hLXDfxxwF2iJfhM9tgry
	GCYsI8yzEMJmh6HTGM5d8qx4LCZAAM6Kino+9NgXlNcJD61D/a5fchqWvRMd8xVdT+sq
	nmpQ==
X-Gm-Message-State: AJaThX4xBnj1I6dvKoV9WIK6dtvfamU/Lri62F2s3c3KZRkthUCYq+iF
	Xlis1xz1GpMDAQZSupR30/RrQ232
X-Google-Smtp-Source: AGs4zMY/nW1VJwPtTaLNJLM+0ZFdjROLtP9AAXpjRSiD/E3kYHvM3aU8mkAGvjOMIJo2DsI8em4aEw==
X-Received: by 10.55.120.7 with SMTP id t7mr7982512qkc.283.1511257872355;
	Tue, 21 Nov 2017 01:51:12 -0800 (PST)
Received: from [192.168.1.240] (host99.190-139-18.telecom.net.ar.
	[190.139.18.99])
	by smtp.gmail.com with ESMTPSA id y58sm8699705qtb.9.2017.11.21.01.51.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Nov 2017 01:51:11 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Fam Zheng <famz@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>, 
	qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20171121032119.14442-1-f4bug@amsat.org>
	<20171121060102.GB28270@lemon>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9fe7a88d-29ec-f268-9e6d-9ba7583e9fea@amsat.org>
Date: Tue, 21 Nov 2017 06:51:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171121060102.GB28270@lemon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::236
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.11] Makefile: use
 $(MAKE) variable
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
X-List-Received-Date: Tue, 21 Nov 2017 09:51:22 -0000

On 11/21/2017 03:01 AM, Fam Zheng wrote:
> On Tue, 11/21 00:21, Philippe Mathieu-Daudé wrote:
>> @@ -904,7 +904,7 @@ $(patsubst %, check-%, $(check-qapi-schema-y)): check-%.json: $(SRC_PATH)/%.json
>>  		echo $$? >$*.test.exit, \
>>  		"TEST","$*.out")
>>  	@diff -q $(SRC_PATH)/$*.out $*.test.out
>> -	@# Sanitize error messages (make them independent of build directory)
>> +	@# Sanitize error messages ($(MAKE) them independent of build directory)
> 
> This doesn't look like a good candidate, does it?

Oops...

