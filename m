Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VsHL3-0005BX-7w
	for mharc-qemu-trivial@gnu.org; Sun, 15 Dec 2013 14:26:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <green@moxielogic.com>) id 1VsHKw-0005BD-Oa
	for qemu-trivial@nongnu.org; Sun, 15 Dec 2013 14:26:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <green@moxielogic.com>) id 1VsHKp-0006vM-2b
	for qemu-trivial@nongnu.org; Sun, 15 Dec 2013 14:26:46 -0500
Received: from mail-qc0-f181.google.com ([209.85.216.181]:36235)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <green@moxielogic.com>) id 1VsHKo-0006v5-Ul
	for qemu-trivial@nongnu.org; Sun, 15 Dec 2013 14:26:39 -0500
Received: by mail-qc0-f181.google.com with SMTP id e9so3027480qcy.26
	for <qemu-trivial@nongnu.org>; Sun, 15 Dec 2013 11:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:organization:references:date
	:in-reply-to:message-id:user-agent:mime-version:content-type
	:content-transfer-encoding;
	bh=N2h66zm/CAcBU9PBG1suEdx53l/079TN+WJkDFe89i0=;
	b=LFTuHPZa6AjJQQGMFnGa4wpBUmtQEBVF0fJ+IC8o5ewC0pWkXk3/ZmfQeoxHqZ7Vgl
	dVc/x7oWcBNi/sep24Gky6O5K8R+Y2//CCIy23GDjICzayurBITie1Q8sABIxu67Tcco
	c0LCz2tlu8sa49EFaH97oEn9ZLdHYQ9y+7JsIxXDbuMhn30u8aMSh+Tqut9UerYRW6mT
	2VPgm3Usbed2gallHI+amRi0NNUgy9CNK4d0IEHBjONtBvfe0FJDY/GG9jnZ7S3HZ6U5
	9USJd1abTdH4/KPl4+Kp29tylNYERDzGIlf7A3y3DEGbtmuH7UQjd6ZtkJwM0bYPook/
	vPtQ==
X-Gm-Message-State: ALoCoQnKU7ox3BjO4egGZTVFdfx1DSPzujEhvIyBaM/QhyoU6oSmUYkEaptk9vLrRpkwfZwaUnxN
X-Received: by 10.224.43.72 with SMTP id v8mr26660077qae.52.1387135598544;
	Sun, 15 Dec 2013 11:26:38 -0800 (PST)
Received: from localhost (dsl-173-206-82-201.tor.primus.ca. [173.206.82.201])
	by mx.google.com with ESMTPSA id
	g10sm35204759qaf.9.2013.12.15.11.26.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Dec 2013 11:26:37 -0800 (PST)
From: Anthony Green <green@moxielogic.com>
To: Peter Maydell <peter.maydell@linaro.org>
Organization: Moxie Logic
References: <1368475464-3116-1-git-send-email-green@moxielogic.com>
	<8761qqn496.fsf@moxielogic.com> <52ADFA17.2000109@suse.de>
	<CAFEAcA91BoCgAR5ahoFWWWEOzWjwzW0vmv2Ei9NprUwR6T4VKg@mail.gmail.com>
Date: Sun, 15 Dec 2013 14:26:35 -0500
In-Reply-To: <CAFEAcA91BoCgAR5ahoFWWWEOzWjwzW0vmv2Ei9NprUwR6T4VKg@mail.gmail.com>
	(Peter Maydell's message of "Sun, 15 Dec 2013 19:03:01 +0000")
Message-ID: <871u1dlxuc.fsf@moxielogic.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.181
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Anthony Liguori <aliguori@amazon.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] ping.. Re: [PATCH moxie] Fix bug in
	tlb_fill.
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
X-List-Received-Date: Sun, 15 Dec 2013 19:26:51 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 15 December 2013 18:51, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
>> And since this is purely in target-moxie I would suggest to simply send
>> a pull as target maintainer once you have someone trustworthy's
>> Reviewed-by and it doesn't break `make check`, similar to how it's done
>> for OpenRISC.
>
> Yes, this makes sense to me, especially since Anthony has a number
> of other moxie patches on list at this point.

According to this page...

http://wiki.qemu.org/Contribute/SubmitAPullRequest

...I need to get a key signed by a member of the QEMU community in
person.  Are there any QEMU hackers in the Toronto area?

AG

