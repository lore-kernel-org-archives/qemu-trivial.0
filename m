Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1alZ7L-0001Y6-Ck
	for mharc-qemu-trivial@gnu.org; Thu, 31 Mar 2016 05:42:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1alZ7I-0001V9-OB
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 05:42:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1alZ7H-0001Qk-UW
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 05:42:16 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:35246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1alZ7D-0001PA-Fm; Thu, 31 Mar 2016 05:42:11 -0400
Received: by mail-wm0-x22b.google.com with SMTP id 191so119609373wmq.0;
	Thu, 31 Mar 2016 02:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/bXJ+ct2hQ+qMw8yVlJdlvCs4AY2WL9Ak5AzCdrMTMY=;
	b=sP9co9hUTrWV7ZQVf/a6T1MlK2ZYPY8Hgo9AAOn+JD6QCpBc7DlLZjco/fP8t++8gG
	HYG+0y4x/jZTJan5lDRFwEAuMvMixBvFJe6zV/ixvemde9BdGPO8XK5GOOX3+cPMBpz5
	XtVpY9p0CllFO/mwOA73Kqiu15EG5Uj/vTHl7iNHOTGEyYFwP5bW7EJwQvuDvpB9QviS
	ESLXkHk5f+PhWtcNurFLcaDaqtfumyxYtO9Jmm1cdJd4271UPgzd++TdhVaactBKAE2y
	bDIwKdNUpGpFwRkSfAthpCZMo4QdnOr1kxI+67Tv49jfIu3qtBj/3XAWwL9wO1T9P6OP
	KiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/bXJ+ct2hQ+qMw8yVlJdlvCs4AY2WL9Ak5AzCdrMTMY=;
	b=gtmG+58KzJ3etItAS0TwOJev2yDb7FlkQEqsRGlKjMHxwrDbIumKfQJzjHfMlSAfhf
	kvMPGuMLkBJMozrryC27fJwjyPpKsXNILNIlrKr5M+9TZT1p+pHaQuNXZDXIeVtQcY1B
	RDPB5j6v2xJFvQqFjcypb6Y+NPkW0Nkzrq67VvAyqiGAenSv1wbFAnF53oteMxpZhgmk
	3pQBvHz39fiyaMlijxPzd/Nj43sYCUzK+TIPmZjzmLBZfmW1mJpPg6Ch9LfoO43xz9oy
	eJ9d4LfL0owfWTN8SK/gD661YKHYThlTA7BMbkSsbMf113HHpYkrCwrjx3Ab+EFN5i+t
	+NVw==
X-Gm-Message-State: AD7BkJLBIEjBLICoY2CJ4zqLEEv+9KH9eKgwuTnRNmTjc+VYl2YU3SBohxj17M5MVgLKiQ==
X-Received: by 10.28.61.8 with SMTP id k8mr6770759wma.7.1459417330825;
	Thu, 31 Mar 2016 02:42:10 -0700 (PDT)
Received: from localhost (host109-156-68-66.range109-156.btcentralplus.com.
	[109.156.68.66]) by smtp.gmail.com with ESMTPSA id
	gb9sm8114501wjb.26.2016.03.31.02.42.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Mar 2016 02:42:09 -0700 (PDT)
Date: Thu, 31 Mar 2016 10:42:09 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: haris iqbal <haris.phnx@gmail.com>
Message-ID: <20160331094209.GK32185@stefanha-x1.localdomain>
References: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
	<20160330140955.GA2557@stefanha-x1.localdomain>
	<CAE_WKMz4K1hSqwrLzgAPP2BMjokY_E6-R61R2RyRS06Pteb80w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uuKVzAmB+c+zQlhu"
Content-Disposition: inline
In-Reply-To: <CAE_WKMz4K1hSqwrLzgAPP2BMjokY_E6-R61R2RyRS06Pteb80w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-Devel] [PATCH] Changed malloc
 to g_malloc, free to g_free in linux-user/qemu.h
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
X-List-Received-Date: Thu, 31 Mar 2016 09:42:17 -0000


--uuKVzAmB+c+zQlhu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 09:58:41PM +0530, haris iqbal wrote:
> On Wed, Mar 30, 2016 at 7:39 PM, Stefan Hajnoczi <stefanha@gmail.com> wro=
te:
> > On Thu, Mar 24, 2016 at 12:02:03AM +0530, Md Haris Iqbal wrote:
> >> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
> >> ---
> >>  linux-user/qemu.h | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> >> index 26b0ba2..3c3fd15 100644
> >> --- a/linux-user/qemu.h
> >> +++ b/linux-user/qemu.h
> >> @@ -381,7 +381,7 @@ static inline void *lock_user(int type, abi_ulong =
guest_addr, long len, int copy
> >>  #ifdef DEBUG_REMAP
> >>      {
> >>          void *addr;
> >> -        addr =3D malloc(len);
> >> +        addr =3D g_malloc(len);
> >>          if (copy)
> >>              memcpy(addr, g2h(guest_addr), len);
> >>          else
> >> @@ -407,7 +407,7 @@ static inline void unlock_user(void *host_ptr, abi=
_ulong guest_addr,
> >>          return;
> >>      if (len > 0)
> >>          memcpy(g2h(guest_addr), host_ptr, len);
> >> -    free(host_ptr);
> >> +    g_free(host_ptr);
> >>  #endif
> >>  }
> >
> > If I understand correctly either lock_user() or lock_user_string() may
> > be followed by unlock_user().  If you change unlock_user() to g_free()
> > then you also need to change lock_user_string() to g_malloc() to avoid a
> > malloc()/g_free() mismatch.
>=20
> lock_user_string() does not use malloc itself, but calls lock_user()
> from itself.

You are right.  The reason I got confused is because there are 3
versions of lock_user(): linux-user, bsd-user, and
include/exec/softmmu-semi.h.

Please send equivalent patches for the other 2 versions as well.  This
way they stay consistent.

Thanks,
Stefan

--uuKVzAmB+c+zQlhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJW/PDxAAoJEJykq7OBq3PIIaoH/jhL8lK/HsdfkRRHoOVp2TFn
J982MnxHqqwtLzwN4RV47JFxHHkrMYSqK5D0Dpnzs21xVAu+VBlaTaC2cx4wUdVY
rhMTK1YWtXjmDVk7GKsk7NfpnbVkLcthVIRlFIluwLM7scSsmHcXPD4VtV5U3Snx
+RAcg5iB2FI5lx56ckuwAssaJbLn7rtZVlxp/nk+3lfo8JFAuog5wVSW3wnugeU0
IQpZCMKVn700kNMvTF61hvRFuqa80gcQdhEPHq6zgPGBuCr9PZfpRCH+XJSMTK3e
8qNNRzZ/JLM5FC1EEqVKeCueI4R4LhMRIDq4Bk534r6FoAbS6YT660qB1cNIEDg=
=bxTd
-----END PGP SIGNATURE-----

--uuKVzAmB+c+zQlhu--

