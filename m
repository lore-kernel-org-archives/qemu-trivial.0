Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL52e-0001gr-5O
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:15:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YL52W-0001TZ-P0
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:15:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YL52S-00012N-PK
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:15:20 -0500
Received: from mail-lb0-f172.google.com ([209.85.217.172]:47800)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YL52S-000125-J1
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:15:16 -0500
Received: by mail-lb0-f172.google.com with SMTP id l4so34453734lbv.3
	for <qemu-trivial@nongnu.org>; Mon, 09 Feb 2015 23:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jEvUQgwwyUXy6Fa2BvTjnsLU1jOA65+zvbXm0clAIxU=;
	b=kaZjr6eaxYac2EW6OCSC2nqW0GHkWqVlBF5NI43+aodjV+H+pYLX2p9vEBnJJJpZPm
	iigC8xIRzehLy82pMOj4eTLjKpdCq47GaAz2PbUbpW5bijfORpiXCU8frl2D05+2yU4J
	mGbc+SNwaU4eL/gx7VOKEuoHOCq94XJnnU0gu7ivAhj8L4IJQf8O+F7vp7xw3WQpFwuU
	zp5mojKDuxC4PnAwZGMvFEqa74OuXDrZTmapndkh9CeDIUSh7KAzUteSg5wr3fd2t6so
	fsaydeSsWPh4q2qaw/HO8SCxbwv8076DsZ6a1mDMVNqkfViw1Oe6lo0O4JZtumuXZ7dp
	JH9Q==
X-Gm-Message-State: ALoCoQktRL2t0Vj9Pp9dMlCEJ4sa/vuQfBbk0DRk4giLjZJKJyjblG4Id/XGctT62a+ONbsfmAPJ
X-Received: by 10.112.213.38 with SMTP id np6mr21436060lbc.36.1423552515900;
	Mon, 09 Feb 2015 23:15:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.141.97 with HTTP; Mon, 9 Feb 2015 23:14:55 -0800 (PST)
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Feb 2015 07:14:55 +0000
Message-ID: <CAFEAcA-nR3zspLZ42W7Ey4EV1UM-RgiXkggmgfBWWDwRqYFqHA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.172
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/46] Trivial patches for
	2015-02-10
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
X-List-Received-Date: Tue, 10 Feb 2015 07:15:26 -0000

On 10 February 2015 at 06:33, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is another pull request for trivial-patches tree.
> This time it is sort of huge, consisting of 46 patches in total.
> There are several patches and series which aren't applied to
> -trivial but should -- I decided I'll send a pull request first
> and apply the leftovers later, because there are important
> changes in the tree and amount of leftovers is somewhat large.
> This is a 3-week collection.
>
> This request consists of a large number of trivial fixes from
> the usual heros, Marcus and Stefen, who found several new ways
> to find various small defects in the code.  There are several
> linux-user fixes from Chen Gang, with some grammar fixes from
> me -- not all of his changes has been applied so far.  There
> are several bugfixes, -- eg, the libcacard linking fix, a buffer
> overflow fix in inet_parse (which does not warrant a CVE# :);
> and also there are some other stuff from here and there.
>
> Please consider applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 89db21771782fd6050335e73542064f1187c9ced:
>
>   qmp: unbreak build for non-vnc configuration (2015-02-09 22:36:04 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-02-10
>
> for you to fetch changes up to 3ff64f1f9391a9b71d4dd58c6c4bbaa1db3dd430:
>
>   virtio: Fix warning caused by missing 'static' attribute (2015-02-10 09:27:21 +0300)
>

Hi. I'm afraid this introduces a new compiler warning under clang:

disas/cris.c:1218:33: warning: unused variable 'cris_cond15s'
[-Wunused-const-variable]
static const struct cris_cond15 cris_cond15s[] =

-- PMM

