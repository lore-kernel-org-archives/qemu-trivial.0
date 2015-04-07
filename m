Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YfUSh-0006D1-9u
	for mharc-qemu-trivial@gnu.org; Tue, 07 Apr 2015 10:26:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YfUSe-0006Co-AZ
	for qemu-trivial@nongnu.org; Tue, 07 Apr 2015 10:26:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YfUSW-0004aL-Cc
	for qemu-trivial@nongnu.org; Tue, 07 Apr 2015 10:26:40 -0400
Received: from mail-ig0-f174.google.com ([209.85.213.174]:34997)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YfUSW-0004aB-81
	for qemu-trivial@nongnu.org; Tue, 07 Apr 2015 10:26:32 -0400
Received: by iggg4 with SMTP id g4so13320880igg.0
	for <qemu-trivial@nongnu.org>; Tue, 07 Apr 2015 07:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/56ech3mFypKfjig5Og8mzX/wsyo01Di9AbbKjvSyuA=;
	b=XxXysmhTK2pFAadfdHYYSoGntnSytZSkw+EpL5HJopQTkV4p3NDHdp5Q7DWukTN3e/
	/AiB3fnpB5n63MJx6L3+yyFW8oDzj81kwlJbOaFm5UHOSvLhro8yqZUo/FHblD9W8dsL
	2ZpepydQTae7vRmnJTF7vWoegnpasBZfDovncaQ3YHXCvatSrrp2Jpv2jPiwf+gR/8UD
	ZdPuUFi+4bRXQIfR9mmu29+8J9d/Q3pmhm6ZWxjAtoLquX7TtU81/cKckIsiWaoVq6Nk
	P4OhX+ca1GQnHW6aIw8tgU/Ss5lmevZSgombEZYh3pZMzimnY/bW8tRLqdUEQX6D6ymF
	zBgw==
X-Gm-Message-State: ALoCoQlSq8jrgmDdmyLo0eoEPJD1oHaau3a2RHjokVTSLuritKxqUTGLOnXsmHAg3ww4GQLCrzun
X-Received: by 10.50.43.231 with SMTP id z7mr4120787igl.22.1428416791638; Tue,
	07 Apr 2015 07:26:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.51.201 with HTTP; Tue, 7 Apr 2015 07:26:11 -0700 (PDT)
In-Reply-To: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
References: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Apr 2015 15:26:11 +0100
Message-ID: <CAFEAcA9tZE9h+dK0WK65fNUEf_HYYWNicVn82ZeuBtjz4HD2Pw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.174
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/5 for-2.3] Trivial patches
	for 2015-04-04
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
X-List-Received-Date: Tue, 07 Apr 2015 14:26:42 -0000

On 4 April 2015 at 08:10, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's a very small trivial-patches pull request for the upcoming 2.3
> release.  There's nothing urgent here, so things can wait past 2.3,
> but these things are also safe.  Only one "questionable" code change
> is the removal of TARGET_HAS_SMC macro, but it was applied long ago
> (to -trivial) and it looks safe too.
>
> Please consider pulling/applying.

I looked at the diffs here and agree that they're safe, so
I've applied this to master.

thanks
-- PMM

