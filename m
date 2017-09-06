Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpW57-0007kR-0n
	for mharc-qemu-trivial@gnu.org; Wed, 06 Sep 2017 04:53:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1dpW55-0007ht-D7
	for qemu-trivial@nongnu.org; Wed, 06 Sep 2017 04:53:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1dpW54-0005r4-FU
	for qemu-trivial@nongnu.org; Wed, 06 Sep 2017 04:53:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32820)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1dpW51-0005oO-4g; Wed, 06 Sep 2017 04:53:03 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1EC5D5F795;
	Wed,  6 Sep 2017 08:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1EC5D5F795
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=kwolf@redhat.com
Received: from dhcp-200-186.str.redhat.com (dhcp-200-186.str.redhat.com
	[10.33.200.186])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 342CB80F8E;
	Wed,  6 Sep 2017 08:53:00 +0000 (UTC)
Date: Wed, 6 Sep 2017 10:52:59 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
	qemu trival <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Message-ID: <20170906085259.GB3753@dhcp-200-186.str.redhat.com>
References: <CAJ+F1C+mPu9ftXwgs4UrGTQp4f65-thhvmWoB-kuRmu0=vnFFw@mail.gmail.com>
	<87zia9palk.fsf@dusky.pond.sub.org>
	<CAJ+F1CJaxdbHnLQy6H=5=Q3ZMw0w01xsvK3ybhj80=6F9dR6gQ@mail.gmail.com>
	<87fuc1ma7d.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87fuc1ma7d.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 06 Sep 2017 08:53:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] clang-tidy: use g_new() family of
 functions
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
X-List-Received-Date: Wed, 06 Sep 2017 08:53:08 -0000

Am 05.09.2017 um 17:33 hat Markus Armbruster geschrieben:
> Marc-Andr=E9 Lureau <marcandre.lureau@gmail.com> writes:
> > code base). I find it easier to write a tidy check, and more friendly
> > command line / output etc:
> >
> > /tmp/test.c:3:17: warning: use g_new() instead [qemu-use-gnew]
> >         int *f =3D (int*)malloc(sizeof(int) * 2);
> >                  ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> >                  g_new(int, 2)
> >
> > clang-tidy should also respect clang-format rules when modifying the =
code
> > (see also
> > https://lists.nongnu.org/archive/html/qemu-devel/2017-08/msg05762.htm=
l).
> >
> > I also imagine it should be possible to integrate to clang warnings i=
n the
> > future (similar to libreoffice clang plugins for ex). All in all,
> > coccinelle or clang-tidy are probably both capable of doing this job,=
 but
> > clang-tidy is snappier and has more potentials for toolchain integrat=
ion.
>=20
> Suggest you show us cool things you can do with clang-tidy that haven't
> been done with Coccinelle :)

Well, I don't really know clang-tidy, but if the above is what it does,
that _is_ cool. With Coccinelle scripts you run the script from time to
time and remove any new offenders. But if clang-tidy allows us to turn
any new offender into a build error so that they don't even make it into
master, then to me that's way superior.

Not all users are using clang, obviously, so even if we can
automatically enable this for clang, not everyone would see the
warnings. But if we can make some patchew hosts use it, that would
already be enough to catch those things.

Unless I'm misinterpreting what Marc-Andr=E9 is saying and running
clang-tidy actually requires more than is reasonable for patchew.

Kevin

