Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gOh0y-0005zR-KD
	for mharc-qemu-trivial@gnu.org; Mon, 19 Nov 2018 05:42:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gOh0v-0005x8-RU
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2018 05:42:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gOh0v-0008Fn-14
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2018 05:42:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55808)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gOh0p-00089W-Q0; Mon, 19 Nov 2018 05:42:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AAE9688306;
	Mon, 19 Nov 2018 10:42:38 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA3535C57B;
	Mon, 19 Nov 2018 10:42:37 +0000 (UTC)
Date: Mon, 19 Nov 2018 10:42:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, pbonzini@redhat.com,
	qemu-trivial@nongnu.org
Message-ID: <20181119104235.GL19532@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20181116200016.2080785-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181116200016.2080785-1-eblake@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 19 Nov 2018 10:42:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3] qapi: Reduce Makefile boilerplate
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
X-List-Received-Date: Mon, 19 Nov 2018 10:42:46 -0000

On Fri, Nov 16, 2018 at 02:00:16PM -0600, Eric Blake wrote:
> Adding a new qapi module had some rather tedious repetition to
> wire it into Makefile, Makefile.objs, and .gitignore (for example,
> see commit bf42508f and its followup b61acdec). For make, add some
> indirection by taking advantage of GNU Make string processing to
> expand a list of module names into all the required artifacts, so
> that future additions of a new module need only touch the list of
> module names.  And for gitignore, use globs to cover all generated
> file names.
>=20
> The list has to live in Makefile.objs, due to the way that
> our unnest-vars macro slirps in that file without remembering
> any definition of $(QAPI_MODULES) from Makefile.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
>=20
> ---
> v3: also tweak .gitignore [Dan]
> v2: also condense Makefile.objs, prefer $(FOO:%=3Da%b) over
> $(patsubst %,a%b,$(FOO))
> ---
>  Makefile      | 192 ++++++--------------------------------------------
>  Makefile.objs |  75 ++------------------
>  .gitignore    |  72 ++-----------------
>  3 files changed, 34 insertions(+), 305 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

