Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpGe3-0001hh-Qw
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2017 12:24:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dpGdx-0001eR-Nc
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 12:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dpGds-0002vp-SH
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 12:24:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dpGdi-0002lD-Os; Tue, 05 Sep 2017 12:23:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 884697538F;
	Tue,  5 Sep 2017 16:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 884697538F
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=armbru@redhat.com
Received: from blackfin.pond.sub.org (ovpn-116-75.ams2.redhat.com
	[10.36.116.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5579486B00;
	Tue,  5 Sep 2017 16:23:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D0C471138645; Tue,  5 Sep 2017 18:23:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: qemu trival <qemu-trivial@nongnu.org>,  QEMU <qemu-devel@nongnu.org>
References: <CAJ+F1C+mPu9ftXwgs4UrGTQp4f65-thhvmWoB-kuRmu0=vnFFw@mail.gmail.com>
	<87zia9palk.fsf@dusky.pond.sub.org>
	<CAJ+F1CJaxdbHnLQy6H=5=Q3ZMw0w01xsvK3ybhj80=6F9dR6gQ@mail.gmail.com>
	<87fuc1ma7d.fsf@dusky.pond.sub.org>
	<CAJ+F1CLAFEHjWpZpJQ_QS2VV=sjYqYpydjSe2ZEdRN-N-bhHzQ@mail.gmail.com>
Date: Tue, 05 Sep 2017 18:23:47 +0200
In-Reply-To: <CAJ+F1CLAFEHjWpZpJQ_QS2VV=sjYqYpydjSe2ZEdRN-N-bhHzQ@mail.gmail.com>
	(=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Tue, 05 Sep 2017
	15:55:28 +0000")
Message-ID: <8760cxktbg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 05 Sep 2017 16:23:49 +0000 (UTC)
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
X-List-Received-Date: Tue, 05 Sep 2017 16:24:10 -0000

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
>
>> Suggest you show us cool things you can do with clang-tidy that haven't
>> been done with Coccinelle :)
>>
> Well to do that I would have to have a transformations to do & know the
> limits/strength of coccinelle & clang-tidy, I am not there yet... Today, I
> prefer invest in clang-tidy for what I need to do.

With any luck, you'll soon enough run into something that hasn't been
done with Coccinelle.

> We already discussed some of the pros/cons of coccinelle vs tidy her and =
in
> the previous round-up series. For ex, clang-tidy is able to evaluate
> constant expressions, so you can write generic rules that you can't captu=
re
> with coccinelle yet (A + B-1) / B * B:
> https://github.com/elmarco/clang-tools-extra/blob/master/clang-tidy/qemu/=
RoundCheck.cpp
> .
>
> However, I think it is more difficult to write clang-tidy transformation
> that spans accross various code paths (like adding errors/free/locks etc).
> Coccinelle makes that fairly easily apparently.

Fortunately, we can use both.

I'm not so fond of doing the same things with both, though :)

