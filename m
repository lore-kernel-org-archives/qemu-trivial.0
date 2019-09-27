Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDq3Q-0003YQ-LL
	for mharc-qemu-trivial@gnu.org; Fri, 27 Sep 2019 09:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60375)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fziglio@redhat.com>) id 1iDq3L-0003VG-KD
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 09:12:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fziglio@redhat.com>) id 1iDq3K-0006Zd-KK
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 09:12:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48104)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fziglio@redhat.com>) id 1iDq3K-0006ZR-F3
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 09:12:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9C2AF89810D;
 Fri, 27 Sep 2019 11:57:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93C095C21A;
 Fri, 27 Sep 2019 11:57:05 +0000 (UTC)
Received: from zmail25.collab.prod.int.phx2.redhat.com
 (zmail25.collab.prod.int.phx2.redhat.com [10.5.83.31])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C9D91808878;
 Fri, 27 Sep 2019 11:57:05 +0000 (UTC)
Date: Fri, 27 Sep 2019 07:57:05 -0400 (EDT)
From: Frediano Ziglio <fziglio@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Message-ID: <478273945.3530478.1569585425201.JavaMail.zimbra@redhat.com>
In-Reply-To: <9ec0d128-86ec-542b-a1b6-5cba36b752ec@vivier.eu>
References: <20190927103233.20901-1-fziglio@redhat.com>
 <20190927103233.20901-3-fziglio@redhat.com>
 <9ec0d128-86ec-542b-a1b6-5cba36b752ec@vivier.eu>
Subject: Re: [PATCH 3/3] qemu-timer: reuse MIN macro in qemu_timeout_ns_to_ms
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.33.32.20, 10.4.195.18]
Thread-Topic: qemu-timer: reuse MIN macro in qemu_timeout_ns_to_ms
Thread-Index: UYDclp9vwOyDZhrk0RQaQ5C60xe9XQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 27 Sep 2019 11:57:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Sep 2019 13:12:58 -0000

>=20
> Le 27/09/2019 =C3=A0 12:32, Frediano Ziglio a =C3=A9crit=C2=A0:
> > Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
> > ---
> >  util/qemu-timer.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >=20
> > diff --git a/util/qemu-timer.c b/util/qemu-timer.c
> > index d428fec567..9bd173ecda 100644
> > --- a/util/qemu-timer.c
> > +++ b/util/qemu-timer.c
> > @@ -322,11 +322,7 @@ int qemu_timeout_ns_to_ms(int64_t ns)
> >      ms =3D DIV_ROUND_UP(ns, SCALE_MS);
> > =20
> >      /* To avoid overflow problems, limit this to 2^31, i.e. approx 25 =
days
> >      */
> > -    if (ms > (int64_t) INT32_MAX) {
> > -        ms =3D INT32_MAX;
> > -    }
> > -
> > -    return (int) ms;
> > +    return (int) MIN(ms, INT32_MAX);
> >  }
> > =20
>=20
> Perhaps it would be cleaner to have always the same return type for
> MIN() with:
>=20
>     MIN(ms, (int64_t) INT32_MAX)
>=20

The (int64_t) cast here is useless, ms is signed, C compilers knows how to
convert and compare properly.
The function returns int and it's used in some cases to fill 32bit integer,
changing the return type to int64_t is not trivial.
But I suppose that here you mean instead that the 2 sides of the ternary
operator used by MIN macro are int64_t and (probably) int32_t. In this case
feel free to add the cast with a=20

   return (int) MIN(ms, (int64_t) INT32_MAX);

> Anyway:
>=20
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>=20
> Thanks,
> Laurent
>=20

Frediano

