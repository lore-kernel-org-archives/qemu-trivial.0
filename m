Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axCeN-0001td-OX
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2016 08:08:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axCe4-0001MU-TI
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 08:08:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axCdt-0002qp-Cp
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 08:08:07 -0400
Received: from mail-yw0-x236.google.com ([2607:f8b0:4002:c05::236]:35875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axCds-0002lX-6f
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 08:08:01 -0400
Received: by mail-yw0-x236.google.com with SMTP id o66so281051670ywc.3
	for <qemu-trivial@nongnu.org>; Mon, 02 May 2016 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gWaALtker6Pbr0gYntevz4yeJsbhQ2Ez4FXXRih0KYA=;
	b=ApCjEtaa2f2iZ5JnV6axv8gTcPtGuBgwg9+BiehGh8YxXXHGzD5Frt0corIQFfRvRg
	i7Nun/2oXS2JD8r28SCrXG+Kugjm9TcreeP0Crb0hyE+zr/K7+v72zQecvlnlbb833FX
	/ed84tcTHeBWj6Iq7365yHOmnQPQ79WR6zhow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gWaALtker6Pbr0gYntevz4yeJsbhQ2Ez4FXXRih0KYA=;
	b=gO2CrjSKDDq4AT7ztoqQn5yKBQJwnEKmwThvcmqKLoJv7v/P8igxxyykXWY4KKUYFf
	xEmwY812NT7hFuLuJBcG0D9EmISP2Zpc+Qkfwd6nfeqB6Hnq9GCRPmyhJsETOY4douzz
	R1XSG2dNiuzwiSEpVQfJxduJtegIJHdIRdyFs/L8jw7ujWbMghKbc4+n6XWAk2m/LC4L
	Qti69JhHeSmwo1WKsbLrUhlS1adQg1w40ZjTky7wU/ff8KolGqBiDKaYxNTcYYaWNo0a
	4+BsNgiehSJJaRPxYbgywfKf9mA296ny9mnLBKy1P2Au1l66pDDDMuWERdHzFMP9ilr7
	Eglw==
X-Gm-Message-State: AOPr4FVIRQWhniZUti2GgMnu+ExsKGGnuTrBZFKCv4CKiVh3tHdp5DjL2hzcTF0McimuB2Mc/m57JusGUT7JtxSy
X-Received: by 10.159.54.232 with SMTP id p95mr10645406uap.107.1462190854997; 
	Mon, 02 May 2016 05:07:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 2 May 2016 05:07:15 -0700 (PDT)
In-Reply-To: <1461950123-5498-1-git-send-email-jano.vesely@gmail.com>
References: <CAFEAcA-gYp9TS=JrEGgnP8uwXGuhcUzq5+wgdTDhigTyDNND9w@mail.gmail.com>
	<1461950123-5498-1-git-send-email-jano.vesely@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 May 2016 13:07:15 +0100
Message-ID: <CAFEAcA9PnU3r2gJs5WeEC1ZjSYqviLmd2VPGQ-SM+8NVkqqptg@mail.gmail.com>
To: Jan Vesely <jano.vesely@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::236
Subject: Re: [Qemu-trivial] [PATCH v2] configure: Check if struct fsxattr is
 available from linux header
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
X-List-Received-Date: Mon, 02 May 2016 12:08:29 -0000

On 29 April 2016 at 18:15, Jan Vesely <jano.vesely@gmail.com> wrote:
> Fixes build failure with --enable-xfsctl and
> new linux headers (>=3D4.5) and older xfsprogs(<4.5):
> In file included from /usr/include/xfs/xfs.h:38:0,
>                  from /var/tmp/portage/app-emulation/qemu-2.5.0-r1/work/q=
emu-2.5.0/block/raw-posix.c:97:
> /usr/include/xfs/xfs_fs.h:42:8: error: redefinition of =E2=80=98struct fs=
xattr=E2=80=99
>  struct fsxattr {
>         ^
> In file included from /var/tmp/portage/app-emulation/qemu-2.5.0-r1/work/q=
emu-2.5.0/block/raw-posix.c:60:0:
> /usr/include/linux/fs.h:155:8: note: originally defined here
>  struct fsxattr {
>
> v2: Add explanatory comment
>
> CC: qemu-trivial@nongnu.org
> CC: Markus Armbruster <armbru@redhat.com>
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Jan Vesely <jano.vesely@gmail.com>

Thanks for this patch. I have applied it to master
(I tweaked the comment/commit message a little in the
process, and added Stefan's tested-by tag.)

-- PMM

