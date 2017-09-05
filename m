Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpDPw-00078v-Mi
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2017 08:57:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dpDPq-00075A-89
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 08:57:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dpDPl-0004nB-Ch
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 08:57:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36182)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dpDPV-0004WH-UQ; Tue, 05 Sep 2017 08:56:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3CBC67730;
	Tue,  5 Sep 2017 12:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E3CBC67730
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=armbru@redhat.com
Received: from blackfin.pond.sub.org (ovpn-116-75.ams2.redhat.com
	[10.36.116.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87FC56BE7D;
	Tue,  5 Sep 2017 12:56:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 100561138645; Tue,  5 Sep 2017 14:56:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>,  qemu trival <qemu-trivial@nongnu.org>
References: <CAJ+F1C+mPu9ftXwgs4UrGTQp4f65-thhvmWoB-kuRmu0=vnFFw@mail.gmail.com>
Date: Tue, 05 Sep 2017 14:56:55 +0200
In-Reply-To: <CAJ+F1C+mPu9ftXwgs4UrGTQp4f65-thhvmWoB-kuRmu0=vnFFw@mail.gmail.com>
	(=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Tue, 5 Sep 2017
	14:14:42 +0200")
Message-ID: <87zia9palk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 05 Sep 2017 12:56:57 +0000 (UTC)
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
X-List-Received-Date: Tue, 05 Sep 2017 12:57:23 -0000

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi,
>
> I have a series of changes generated with clang-tidy qemu [1] pending
> for review [2].
>
> It translates calloc/*malloc*/*realloc() calls to
> g_new/g_newa/g_new0/g_renew() where the argument is a sizeof(T) [* N].

Only for *type* T, or for arbitrary T?

For type T, we've done the transformation repeatedly with Coccinelle,
first in commit b45c03f (commit message appended).  Repeatedly, because
they creep back in.

How does your technique compare to this prior one?

> This is the first commit to give you an idea:
>
> diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
> index 98fddd7ac1..75affcb8a6 100644
> --- a/hw/timer/arm_timer.c
> +++ b/hw/timer/arm_timer.c
> @@ -166,7 +166,7 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
>      arm_timer_state *s;
>      QEMUBH *bh;
>
> -    s =3D (arm_timer_state *)g_malloc0(sizeof(arm_timer_state));
> +    s =3D g_new0(arm_timer_state, 1);
>      s->freq =3D freq;
>      s->control =3D TIMER_CTRL_IE;
>
> g_new() advantages (from glib doc):
> - the returned pointer is cast to a pointer to the given type.
> - care is taken to avoid overflow when calculating the size of the
> allocated block.
>
> But it is also shorter&nicer :)
>
> I have not included in the first batch the opportunity to also
> translate: alloc(sizeof(*p) * x) to g_new(typeof(*p), x), since it is
> arguably not much nicer. But for consistency, I think it would be good
> to use g_new(). What do you think?

p =3D g_malloc(sizeof(*p)) is idiomatic, and not obviously inferior to
p =3D g_new(T, 1), where T is the type of *p.  Use whatever is easier to
read, I guess.

But once you add multiplication, g_new() adds something useful: overflow
protection.  Conversion to g_new() might make sense then.

> I splitted the changes amont the various MAINTAINERS entries, but it
> is still about 70 patches (without the typeof() changes).
>
>
> [1] https://github.com/elmarco/clang-tools-extra/
> [2] https://github.com/elmarco/qemu/commits/gnew


commit b45c03f585ea9bb1af76c73e82195418c294919d
Author: Markus Armbruster <armbru@redhat.com>
Date:   Mon Sep 7 10:39:27 2015 +0100

    arm: Use g_new() & friends where that makes obvious sense
=20=20=20=20
    g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
    for two reasons.  One, it catches multiplication overflowing size_t.
    Two, it returns T * rather than void *, which lets the compiler catch
    more type errors.
=20=20=20=20
    This commit only touches allocations with size arguments of the form
    sizeof(T).
=20=20=20=20
    Coccinelle semantic patch:
=20=20=20=20
        @@
        type T;
        @@
        -g_malloc(sizeof(T))
        +g_new(T, 1)
        @@
        type T;
        @@
        -g_try_malloc(sizeof(T))
        +g_try_new(T, 1)
        @@
        type T;
        @@
        -g_malloc0(sizeof(T))
        +g_new0(T, 1)
        @@
        type T;
        @@
        -g_try_malloc0(sizeof(T))
        +g_try_new0(T, 1)
        @@
        type T;
        expression n;
        @@
        -g_malloc(sizeof(T) * (n))
        +g_new(T, n)
        @@
        type T;
        expression n;
        @@
        -g_try_malloc(sizeof(T) * (n))
        +g_try_new(T, n)
        @@
        type T;
        expression n;
        @@
        -g_malloc0(sizeof(T) * (n))
        +g_new0(T, n)
        @@
        type T;
        expression n;
        @@
        -g_try_malloc0(sizeof(T) * (n))
        +g_try_new0(T, n)
        @@
        type T;
        expression p, n;
        @@
        -g_realloc(p, sizeof(T) * (n))
        +g_renew(T, p, n)
        @@
        type T;
        expression p, n;
        @@
        -g_try_realloc(p, sizeof(T) * (n))
        +g_try_renew(T, p, n)
        @@
        type T;
        expression n;
        @@
        -(T *)g_new(T, n)
        +g_new(T, n)
        @@
        type T;
        expression n;
        @@
        -(T *)g_new0(T, n)
        +g_new0(T, n)
        @@
        type T;
        expression p, n;
        @@
        -(T *)g_renew(T, p, n)
        +g_renew(T, p, n)
=20=20=20=20
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Message-id: 1440524394-15640-1-git-send-email-armbru@redhat.com
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

