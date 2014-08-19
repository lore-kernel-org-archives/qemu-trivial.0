Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJi7w-0007uT-32
	for mharc-qemu-trivial@gnu.org; Tue, 19 Aug 2014 08:03:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJi7n-0007qE-On
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 08:02:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJi7h-0007Kv-KS
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 08:02:51 -0400
Received: from mail-lb0-f180.google.com ([209.85.217.180]:48888)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJi7h-0007Kr-Dm
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 08:02:45 -0400
Received: by mail-lb0-f180.google.com with SMTP id v6so5305872lbi.39
	for <qemu-trivial@nongnu.org>; Tue, 19 Aug 2014 05:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2AYYnXy1auY+sa5JDa+R/+dOSl6uwN+mdtFAmUwX9Hs=;
	b=cMPso6EF12ajfBBvnEGf6H5PLq22yGzbFfNnS/YVXMpt+poXHD9rAyPfnIYuQbNa4q
	AtVtNW/Wm7xPkS+PrHDQfE3xxdBj+8Hr3TkwBIRu2TvPx+d62UT4gDOWTsJEdy8ORODY
	hA3H22hOkOKio53QdSGkoU76Ew37aik6w6+oLIOkxDsZ1ZlXDhRg86wmj9qgp+tk0IUr
	s5bltSva1XX1Bdqi3nL9SA8YxUdi0U9ogHQiW6vfbG6gW5GV2Ko0YnKsJaak2/Jsf3es
	dDYqSuodJrAiyEiOrxc3TrJJXqtSEK/2cVdu/LeSJQtppCHt6+KYlBHq8Yd/XNQLHfZc
	w5Bg==
X-Gm-Message-State: ALoCoQkq7/zoxJlt5f2vYEUttxzxiWOKmfkUunqd32V6WtNXVI34if/ZpyuEVYfX5WRQX3HqC2Te
X-Received: by 10.112.43.8 with SMTP id s8mr3763022lbl.47.1408449762786; Tue,
	19 Aug 2014 05:02:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Tue, 19 Aug 2014 05:02:22 -0700 (PDT)
In-Reply-To: <20140819115823.GD4638@noname.redhat.com>
References: <1408362096-10482-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20140819115823.GD4638@noname.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Aug 2014 13:02:22 +0100
Message-ID: <CAFEAcA9_k+c_ktCH2oXJxwNR_rjv1ZKJkv_tazqSJeFbY4vNbQ@mail.gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.180
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Li Liu <john.liuli@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/vvfat.c: remove
 debugging code to reinit stderr if NULL
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
X-List-Received-Date: Tue, 19 Aug 2014 12:02:58 -0000

On 19 August 2014 12:58, Kevin Wolf <kwolf@redhat.com> wrote:
> This specific patch isn't as trivial as it might look at the first
> sight (in other words: it's wrong). The part that you probably missed is
> that stderr isn't the real one when DEBUG is set:
>
>     #undef stderr
>     #define stderr STDERR
>     FILE* stderr = NULL;

Yikes. Can we rip that out as well, then?

-- PMM

