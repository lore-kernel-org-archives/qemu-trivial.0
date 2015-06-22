Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z74BJ-00036M-JQ
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 12:02:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z74BG-00035l-DK
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 12:02:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z74BB-0002Ap-E6
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 12:02:42 -0400
Received: from mail-vn0-f51.google.com ([209.85.216.51]:38290)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z74BB-0002Ad-8o
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 12:02:37 -0400
Received: by vnbf1 with SMTP id f1so8133804vnb.5
	for <qemu-trivial@nongnu.org>; Mon, 22 Jun 2015 09:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=m2fcj1H+SkI4vPZfGlO9oHoEe7mdO0WMYTEH5tNswzc=;
	b=dpmQYkJTjTC1DV+xnwGcoVXLklAeEbxc4zcf0tl91AOzF4Cvcuo0hVkbHtGdpbD86i
	3QJuXmlDSjErVlF23HsItHHqgeSqmOREXZHN4k8wrtZXW+vRheCrTNjjOKZ6Sj9vDH3I
	Od+ZjDspv8ePZAuTtluxyZwmcqbNz/oZwSHXzlE/RAutuQlE2YJ4eKJRv7neqjU6VQjd
	scKNcgZzsC3/K0sF/8rBbaNLG6l2TRRCzjv43IwJzV4/Y9gs3ZtCAg/iIr03+IGOV09k
	OcWakXeI0ao5EMhoqMqIV5AnvRhvQOq5s720MFMvIdJLnBDWKhL7//ZWEvWTfbr2FfB4
	2m8A==
X-Gm-Message-State: ALoCoQkAci6FDkYdPowrRTZRCfs2cyw87lbOtPlGkwTMooRjzizczNQXsSYIPgu7fOmUdvXo+U3f
X-Received: by 10.52.26.5 with SMTP id h5mr1111663vdg.3.1434988956707; Mon, 22
	Jun 2015 09:02:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Mon, 22 Jun 2015 09:02:17 -0700 (PDT)
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jun 2015 17:02:17 +0100
Message-ID: <CAFEAcA9ru4tyzXNUW0USsN13wEP4v5hGOREbPZWVOkrLDS41=Q@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.51
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/21] Trivial patches for
	2015-06-22
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
X-List-Received-Date: Mon, 22 Jun 2015 16:02:43 -0000

On 22 June 2015 at 12:16, Michael Tokarev <mjt@tls.msk.ru> wrote:
> There are a few random thing here and there.  I especially
> want to note 2 of them:
>
>  - QOMification series by Gonglei
>  - rearrangement of ./configure --help output by me
>
> Other than that, the stuff is really trivial.
>
> Please consider applying/pulling.
>
> /mjt
>
> The following changes since commit ad7020a7e7b27d468ecc2aacb04ba4eb090170=
74:
>
>   target-microblaze: Remove dead code (2015-06-21 17:20:16 +1000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-06-22
>
> for you to fetch changes up to 43ce995c79c09595e6fbdcabecd1c8b43cf9e4a4:
>
>   util/qemu-sockets: improve ai_flag hints for ipv6 hosts (2015-06-22 14:=
08:25 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-06-22

Fails to build on Windows:

util/qemu-sockets.c: In function =E2=80=98inet_parse_connect_opts=E2=80=99:
util/qemu-sockets.c:338: error: =E2=80=98AI_V4MAPPED=E2=80=99 undeclared (f=
irst use in
this function)
util/qemu-sockets.c:338: error: (Each undeclared identifier is
reported only once
util/qemu-sockets.c:338: error: for each function it appears in.)
util/qemu-sockets.c: In function =E2=80=98inet_dgram_opts=E2=80=99:
util/qemu-sockets.c:438: error: =E2=80=98AI_V4MAPPED=E2=80=99 undeclared (f=
irst use in
this function)

(Also I had to resolve a conflict in configure, so if you rebase
on current master you'll save me having to do it twice...)

thanks
-- PMM

