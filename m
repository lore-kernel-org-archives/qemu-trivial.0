Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMWpH-0002tS-Rw
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 03:39:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMWpF-0002tJ-Ro
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 03:39:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMWpA-00005o-Sc
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 03:39:53 -0400
Received: from mail-wi0-f172.google.com ([209.85.212.172]:35107)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMWpA-00005R-Lz
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 03:39:48 -0400
Received: by wibxm9 with SMTP id xm9so153339293wib.0
	for <qemu-trivial@nongnu.org>; Tue, 04 Aug 2015 00:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=AW5KKGfLlK3G1j4RlJRhY2TjMbDURL9CYwnmFLRe6xw=;
	b=LUgiBXByjT2d1+rKCT/cQx71EDrmqpoq+6A1GSnhyAdP7lnznZ8EUOLdEvozFjskpd
	+QqqQiK+e75wm6XL6hLgJ+pD/+GXKvLF+H5ji7cLcUiX3LS26YSki864+FsArxTNedgq
	FnPhzNs0UDXi2utYeCGwqIJEtI17RL4GMK9arffqycpoSfdkRMYtFSzproQYtrWo1n3G
	mCgTQbafjRgOHISNk0ZjYU23PIdDvCbUN2UpW7SnVh29PC0YGnRNVXcq8W0R0kxY6wP5
	g36Y8+nsdcgg2bWSDd0oGdPzN3teaZB3Ihja97SQAX6IoZmYDOeumF4cybxyiEbz6nQp
	ws5Q==
X-Gm-Message-State: ALoCoQlqRCVcWcZihhLjmnDvWD/79HEWJAGPzCh1Mx0jeT8ftuImKXGMcDrVx8pBia0qho7I2O4h
X-Received: by 10.195.11.74 with SMTP id eg10mr4889726wjd.33.1438673987922;
	Tue, 04 Aug 2015 00:39:47 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id y13sm328194wjq.26.2015.08.04.00.39.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 00:39:47 -0700 (PDT)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id E065F3E030B;
	Tue,  4 Aug 2015 08:39:45 +0100 (BST)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-2-git-send-email-alex.bennee@linaro.org>
	<55BF6F68.1090103@redhat.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
In-reply-to: <55BF6F68.1090103@redhat.com>
Date: Tue, 04 Aug 2015 08:39:45 +0100
Message-ID: <87k2tblcxq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.172
Cc: qemu-trivial@nongnu.org, crosthwaitepeter@gmail.com, qemu-devel@nongnu.org,
	rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 01/11] tcg: add ability to dump
	/tmp/perf-<pid>.map files
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Aug 2015 07:39:54 -0000


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 03/08/2015 11:14, Alex Bennée wrote:
>> This allows the perf tool to map samples to each individual translation
>> block. This could be expanded for user space but currently it gives
>> enough information to find any hotblocks by other means.
>> 
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>
> What happens if you encounter a tb_flush?

At the point of a tb_flush all bets are off as we will re-generate all
the blocks at potentially different locations in the translation buffer.
However for most analysis cases you are unlikely to cause the code
buffer to overflow. Most other uses of tb_flush are the result
debugging.

I could add a printf when --perfmap is enabled to flag when a flush
happens to signal to the user? I guess some more caveats in the flag
description wouldn't hurt.

We could consider truncating and re-starting the JIT dump at each flush?


>
> Paolo

-- 
Alex Bennée

