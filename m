Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kG2kc-0000Tx-KJ
	for mharc-qemu-trivial@gnu.org; Wed, 09 Sep 2020 12:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kG2ka-0000S6-8b
 for qemu-trivial@nongnu.org; Wed, 09 Sep 2020 12:15:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20447
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kG2kY-0006Xn-IR
 for qemu-trivial@nongnu.org; Wed, 09 Sep 2020 12:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599668109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q5IWGhETzZVHVSgwIxyid7VdYTOVwN6kPJowq0maYDU=;
 b=f3CufvOudrRBjPNjoSHy9+Upfp+qf2+AyMxNDwhzVFKyb4U64i8lHxDcnz5RHoR4XBMM9B
 1AL2BGNlnBepEGq2WZ+UlENsnsfibp/TLY+mYZGhkkT3GxmHU7OHYkNyqXJspMrafHbiA/
 QYpCZHgfhSxrCupjQPoqJqZEzmbsRaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-6P0vwicyMkSfEk6X3vzVwQ-1; Wed, 09 Sep 2020 12:15:02 -0400
X-MC-Unique: 6P0vwicyMkSfEk6X3vzVwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBA421084C81;
 Wed,  9 Sep 2020 16:15:00 +0000 (UTC)
Received: from localhost (ovpn-112-103.ams2.redhat.com [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71B2D83562;
 Wed,  9 Sep 2020 16:15:00 +0000 (UTC)
Date: Wed, 9 Sep 2020 17:14:44 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?utf-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Cc: qemu-level <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Daniel Brodsky <dnbrdsky@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v4 2/2] rcu: add uninit destructor for rcu
Message-ID: <20200909161444.GC61449@stefanha-x1.localdomain>
References: <20200908151052.713-1-luoyonggang@gmail.com>
 <20200908151052.713-3-luoyonggang@gmail.com>
 <20200909084107.GE12090@stefanha-x1.localdomain>
 <CAE2XoE_+z5g=iO25qq=qsHp_m=p_dcte4taHDd8y3VirjR-pAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE2XoE_+z5g=iO25qq=qsHp_m=p_dcte4taHDd8y3VirjR-pAg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:13:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 09 Sep 2020 16:15:12 -0000

--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 05:05:16PM +0800, =E7=BD=97=E5=8B=87=E5=88=9A(Yongg=
ang Luo) wrote:
> On Wed, Sep 9, 2020 at 4:41 PM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
>=20
> > On Tue, Sep 08, 2020 at 11:10:52PM +0800, Yonggang Luo wrote:
> > > This is necessary if the pending  rcu calls are closing and removing
> > > temp files. This also provide a function
> > > void rcu_wait_finished(void);
> > > to fixes test-logging.c test failure on msys2/mingw.
> > > On windows if the file doesn't closed, you can not remove it.
> > >
> > > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > > ---
> > >  include/qemu/rcu.h   |  5 +++++
> > >  tests/test-logging.c |  2 ++
> > >  util/rcu.c           | 37 ++++++++++++++++++++++++++++++++++++-
> > >  3 files changed, 43 insertions(+), 1 deletion(-)
> >
> > Can the new drain_call_rcu() function be used? Maxim recently posted th=
e
> > following patch:
> >
> > https://patchew.org/QEMU/20200831150124.206267-1-mlevitsk@redhat.com/20=
200831150124.206267-3-mlevitsk@redhat.com/
> >
> > Whether drain_call_rcu() or rcu_wait_finished() is used, please include
> > a comment in the code that documents why the wait is necessary. For
> > example, "qemu_log_close() uses RCU for its FILE pointer but Windows
> > cannot remove open files, so we need to wait for RCU here".
> >
> > Another option is to wait for RCU inside qemu_log_close() so that
> > callers don't need to worry about this implementation detail:
> >
> >   #ifdef _WIN32
> >   /* Windows cannot remove open files so we need to wait for RCU here *=
/
> >   drain_call_rcu();
> >   #endif
> >
> How about not gurad with   #ifdef _WIN32?
> So we don't got silent differencies between posix and win32?
> and qemu_log_close  only called in function cpu_abort()
>       if (qemu_log_separate()) {
>         FILE *logfile =3D qemu_log_lock();
>         qemu_log("qemu: fatal: ");
>         qemu_log_vprintf(fmt, ap2);
>         qemu_log("\n");
>         log_cpu_state(cpu, CPU_DUMP_FPU | CPU_DUMP_CCOP);
>         qemu_log_flush();
>         qemu_log_unlock(logfile);
>         qemu_log_close();
>     }
>=20
> So that on't affect the performance

Yes, that sounds good.

Stefan

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9Y/3QACgkQnKSrs4Gr
c8jnHAgAiYoy2tJhEkVAhaiZ6fnqJvupxMP9+gO0vD5DS7mw1jZwFDO5tUChVXa5
XMhD4KD7WoY16aK9qw2E+PrNSgAHejBf0f1vV7NU4jI/8aay2jJxc2r1LcZXHbIS
Vcs0zY1R4I8WDM0/j+A+WhcJ344vpEg+YYQPxTLb1Rey3Y6smCZp1prEs0MXV0G/
t+VZTRSNjiEBgztuOF92lDpL93S/m9JL0/c3oMzhBjxyMVI0eH6GBMG7yHxI4Pv+
QOHIPhAPR/qIkazPX5Oxvv03D5Leecly06I2fWgvQZZphHIvPa+OuMoiFiqpmxZY
X0B0cvmC4s5+/jBxEYJDoF98QZHhew==
=sTW7
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--


