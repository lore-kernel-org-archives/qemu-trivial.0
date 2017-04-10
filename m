Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cxYnQ-0000eK-3g
	for mharc-qemu-trivial@gnu.org; Mon, 10 Apr 2017 08:51:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cxYnN-0000c4-61
	for qemu-trivial@nongnu.org; Mon, 10 Apr 2017 08:51:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cxYnM-0001ll-5f
	for qemu-trivial@nongnu.org; Mon, 10 Apr 2017 08:51:49 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:36697)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cxYnL-0001lX-Uu
	for qemu-trivial@nongnu.org; Mon, 10 Apr 2017 08:51:48 -0400
Received: by mail-wr0-x22d.google.com with SMTP id c55so74573407wrc.3
	for <qemu-trivial@nongnu.org>; Mon, 10 Apr 2017 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yqzRyhqqHb54M9z7GCfr5czcQMwk2ndGRFH8MuCZ+rI=;
	b=JdcDpkZYo7yV5Y6emCQwFBxKS7/eHb4gTPufLmqU55CJT1jgNNsGr1/CoSx8zfZG0w
	dVd2O1dRGXrq8KC9h+T0jPkJfs3mi2H5djmlyViyTzOdGPqCjoWS3ROYe7NN0L7Rzind
	SwIOwGvPIcnpmjdSLp5VjmuFMZExLQTf7Qy4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yqzRyhqqHb54M9z7GCfr5czcQMwk2ndGRFH8MuCZ+rI=;
	b=GmOeq8OuwJkNBiy2eAHysk2kPmmly4BYCIaYfo6LdPiuQNPoU32pKUlVzozVVBQxbp
	4UQC3CMXFbfKokQJBzlp5zUnk7yNBQW4WF6Ra1XGbaGoMp0Loz6s4KUdbNzKwmDRmOxH
	alCfaj9tRkxI6xhNbXS3i3r+KNbZoziNK3lpzjPpPibT3DfZdUmGPm8NrIojzCHfLZO4
	wIDWoB8ZtYzTkgN8btPmGyfivtNJxS3gEgOcyGlz5pZ0Qf6AR0Ub5y/SuvVlWsmra3ox
	TvV07xFQalmnr3gIUOif3i6c0GZoXnkCsspGWPxkJCQgNp1lC9j+mFZFRLPqHmn+sOZt
	26IQ==
X-Gm-Message-State: AFeK/H2IKbnxHrkcaXnquSM5gbfv6lq6AjxOb/dQ17pQvmSQznleHtkCezhLYtnV8LRdobI4mlfK9KKnZGqLRisu
X-Received: by 10.223.150.149 with SMTP id u21mr27759791wrb.195.1491828706749; 
	Mon, 10 Apr 2017 05:51:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Mon, 10 Apr 2017 05:51:26 -0700 (PDT)
In-Reply-To: <20170410102254.GA20072@stefanha-x1.localdomain>
References: <1491629987-6826-1-git-send-email-chugh.ishani@research.iiit.ac.in>
	<20170410102254.GA20072@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Apr 2017 13:51:26 +0100
Message-ID: <CAFEAcA8DjtpNiuiEvZ7=rX6cTq0Dn6wj=ud8Bkted+W5+COc1w@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Ishani Chugh <chugh.ishani@research.iiit.ac.in>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Removed trailing newline
 from error_report()
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
X-List-Received-Date: Mon, 10 Apr 2017 12:51:50 -0000

On 10 April 2017 at 11:22, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Sat, Apr 08, 2017 at 11:09:47AM +0530, Ishani Chugh wrote:
>> Signed-off-by: Ishani Chugh <chugh.ishani@research.iiit.ac.in>
>> ---
>>  target/arm/kvm64.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Thanks for the patch!
>
> I have CCed Peter Maydell who maintains this source file.  I also added
> the trivial patches mailing list - a patch queue for small patches.

I've applied this patch to my target-arm queue (with commit message
tweak as Stefan suggests) -- thanks!

-- PMM

