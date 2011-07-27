Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qm4aI-0007ab-7d
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jul 2011 09:55:38 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1Qm4aB-0007FW-RX
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 09:55:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1Qm4a6-0006pE-B0
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 09:55:31 -0400
Received: from mail-yi0-f45.google.com ([209.85.218.45]:49431)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1Qm4a3-0006oc-SY; Wed, 27 Jul 2011 09:55:23 -0400
Received: by yia25 with SMTP id 25so1260015yia.4
	for <multiple recipients>; Wed, 27 Jul 2011 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=hpycuqY+Wuw0GJ3XAFBRmguZGRI77mNIDccSvMBlh+o=;
	b=JPR68BK4nLnY1m4dMud1A508xaJFeSxZR/m/s5EpSW8CzQz/shDBcEIEJuNZieCSOM
	GhV6pvLxEs50aaA6qUcOTurb66bCB2f5KooHb4kCuUEvCzddhHJ7Pq9kdIRTxfNjSmnG
	klPpbqJTKQyoRPXBv3UhQZs3y9VF0BZ9RqTVQ=
Received: by 10.68.28.195 with SMTP id d3mr92052pbh.449.1311774922077; Wed, 27
	Jul 2011 06:55:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.42.232 with HTTP; Wed, 27 Jul 2011 06:55:02 -0700 (PDT)
In-Reply-To: <m3k4b4z2nh.fsf@blackfin.pond.sub.org>
References: <1311652562-10794-1-git-send-email-cerbere@gmail.com>
	<1311652562-10794-2-git-send-email-cerbere@gmail.com>
	<m339htczcl.fsf@blackfin.pond.sub.org>
	<CAHWZs7UG9NrAQKAtJN2+eQtbOOGFZrotdfSg3PhQ+FD_mRX4-w@mail.gmail.com>
	<m3k4b4z2nh.fsf@blackfin.pond.sub.org>
From: Alexandre Raymond <cerbere@gmail.com>
Date: Wed, 27 Jul 2011 09:55:02 -0400
Message-ID: <CAHWZs7VbfrECzwb08-vjRJLcoGXo-OnmPJg0C436qa5FHzFeKA@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.218.45
Cc: qemu-trivial@nongnu.org, Qemu Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Makefile: distclean
 should clean all possible targets
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
X-List-Received-Date: Wed, 27 Jul 2011 13:55:36 -0000

> There are many more object files that are built conditionally. =C2=A0Why =
is
> it okay not to delete them?

Perhaps they should be deleted too...

The GNU Make manual says the following about "distclean":
http://www.gnu.org/s/hello/manual/make/Standard-Targets.html

"Delete all files in the current directory (or created by this
makefile) that are created by configuring or building the program. If
you have unpacked the source and built the program without creating
any other files, =E2=80=98make distclean=E2=80=99 should leave only the fil=
es that
were in the distribution. However, there is no need to delete parent
directories that were created with =E2=80=98mkdir -p=E2=80=99, since they c=
ould have
existed anyway. "

Now, if everyone agrees that "distclean" is fine as it is, I won't
insist on anything.


>
> If you unwisely messed up your source tree by building in it, a simple
> and reliable way out is to git-clone yourself a new one. =C2=A0Or if you
> insist on recovering in-place, remove files outside .git that aren't in
> git.
>

Indeed.

Alexandre

