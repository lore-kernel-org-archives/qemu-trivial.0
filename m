Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCSV3-0004QE-9G
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 10:42:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eCSV0-0004NY-QE
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 10:42:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1eCSUw-0007Mc-SF
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 10:42:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36052)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1eCSUn-0007In-LM; Wed, 08 Nov 2017 10:42:29 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7731D7EAA9;
	Wed,  8 Nov 2017 15:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7731D7EAA9
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=stefanha@redhat.com
Received: from localhost (ovpn-116-145.ams2.redhat.com [10.36.116.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B9306292C;
	Wed,  8 Nov 2017 15:42:27 +0000 (UTC)
Date: Wed, 8 Nov 2017 15:42:26 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Kevin Wolf <kwolf@redhat.com>
Message-ID: <20171108154226.GC6118@stefanha-x1.localdomain>
References: <20171107223708.17935-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline
In-Reply-To: <20171107223708.17935-1-eblake@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 08 Nov 2017 15:42:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] coroutine: Fix documentation of
 co_aio_sleep_ns()
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
X-List-Received-Date: Wed, 08 Nov 2017 15:42:43 -0000


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2017 at 04:37:08PM -0600, Eric Blake wrote:
> co_sleep_ns() was removed in commit 0b9caf9b, leaving behind a
> stale comment.  Update the documentation to match the current
> usage of this function.
>=20
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  include/qemu/coroutine.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index 9aff9a735e..01ae415767 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -262,8 +262,11 @@ void qemu_co_rwlock_unlock(CoRwlock *lock);
>  /**
>   * Yield the coroutine for a given duration
>   *
> - * Behaves similarly to co_sleep_ns(), but the sleeping coroutine will be
> - * resumed when using aio_poll().
> + * This function uses timers and hence needs to know the event loop
> + * (#AioContext) to place the timer on.  In any case, co_aio_sleep_ns()
> + * does not affect the #AioContext where the current coroutine is runnin=
g,
> + * as the coroutine will restart on the same #AioContext that it is
> + * running on.

I cannot parse the second sentence.  What does "affecting" an AioContext
mean?  Does "where the current coroutine is running" simply mean "the
caller"?

What is it trying to say?  My guess is: the caller will be resumed in
the current AioContext, not the timer's AioContext.

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaAyXiAAoJEJykq7OBq3PIwh0IAL4pfFSf9PALYrgxxTriXh8S
HqzTBC7aPX441apOYEB9bD4sQ+jE+QlaaJqu4ecq3sZMCo9KvWWWvxcY9mML+mU/
8hgsZhil1PmEo6WweW90fxlXx6s3tCYQdClsjD3E4iSMIJ9wNa0oG5X7TnBYyb+5
RoxfAa8yR2GxD22k0ORmqk3RxIvr8nXXB/ZrfgF3LBJZ8tm1V7n+A2J2MQ+YsSaL
9IcQ9dPJYP5fnOrYtgf3HeW9QSS7MCFUKvamgkuwoFBfadTct4jgQyzao9+F2Bz2
UUxijz+6viQzjEzMYL3987OM+rPXF2Fa4q3hVOHpgtK5B4mJYiRLtzxYVyn6ClU=
=5FrG
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--

