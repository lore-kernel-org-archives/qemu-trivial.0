Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVKj5-000399-AY
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 10:01:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YVKj0-00031N-5q
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 10:01:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YVKip-0006h8-9n
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 10:01:34 -0400
Received: from mail-lb0-f177.google.com ([209.85.217.177]:35706)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YVKip-0006gg-2q
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 10:01:23 -0400
Received: by lbjf15 with SMTP id f15so1934994lbj.2
	for <qemu-trivial@nongnu.org>; Tue, 10 Mar 2015 07:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=g/rH5iuktETfqh6RCFzfyBBoMimkHxQdnQtC9KUxwF0=;
	b=cV047V6J/tgGHxcsuWdNppJtFvzHP+QcW5EJbvpzZ97+iOc6FhMjSsSd0oGbNZ/WyE
	Oj45DY5SM8BtM6ZHXdaSaHUxsJWSu7sxCLnAH92wqPRlq+L6gt1zoNfD1dtApWBFz7NJ
	ol/2LCUMxm9KDbZnGfFgscm/oaZ6kY+TKIY/dVQu8rKAXvMSUusKq8xVozp/csBQWFSe
	J2yPZA0aBdTwjg8l3MM6rrh1tD5xHA7bkSyQVXgpVvDFS/7+wf+H/z8Znpc0BIcU199V
	JuquwfKpcH1eWGFzTMcjAnqRjP0ri0Ul3zdkfqYqsWjA5I7m33I0A03ANXjlJV8Ap6Hy
	KKQQ==
X-Gm-Message-State: ALoCoQkktuud3/k5lPuDlp6D/mo5z3I3Bwst9fkyAUgyFUoYoUXD58hQxO3ae7YH0+8F8nQWkX+j
X-Received: by 10.112.50.38 with SMTP id z6mr8965064lbn.122.1425996081182;
	Tue, 10 Mar 2015 07:01:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.145.193 with HTTP; Tue, 10 Mar 2015 07:01:00 -0700 (PDT)
In-Reply-To: <cover.1425964622.git.mjt@msgid.tls.msk.ru>
References: <cover.1425964622.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Mar 2015 14:01:00 +0000
Message-ID: <CAFEAcA_W983x+wj+HLqxH413W4Fb5-5He_oVKfvT3EB_F8v0AQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.177
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL v4 00/44] Trivial patches for
	2015-03-04
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
X-List-Received-Date: Tue, 10 Mar 2015 14:01:38 -0000

On 10 March 2015 at 05:24, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is a v4 (!) pull request for trivial-patches tree which was initially sent
> Wed,  4 Mar 2015 20:06:17 +0300.  The following patches has been dropped:
>
>  - migration/rdma: clean up qemu_rdma_dest_init a bit --
>    will go to the migration tree
>
>  - microblaze: fix memory leak --
>    wrong change, causes compile failure, initially escaped my test coverage
>
>  - disas/cris: Fix warning caused by missing 'static' attribute --
>    this makes an unused static variable as static, causing compile warning.
>    To my shame, the same patch has been routed and dropped in trivial tree
>    before.  Now it is dropped again, I'll hopefully fix the damn thing for
>    good in the next pull request.
>
> Please consider pulling.  And please note I used the same tag name and
> pull request date as before.
>
> I'm sorry for the noize.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 277263e1b320d759a760ba6c5ea75ec268f929e5:
>
>   Merge remote-tracking branch 'remotes/agraf/tags/signed-ppc-for-upstream' into staging (2015-03-09 14:04:14 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-03-04
>
> for you to fetch changes up to 438940cbc2eabbe9e403e5249dfa0be6c792c93b:
>
>   9pfs: remove useless return (2015-03-10 08:15:34 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-03-04
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

