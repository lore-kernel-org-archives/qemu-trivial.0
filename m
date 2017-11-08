Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCUHC-000170-5c
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 12:36:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1eCUH8-00016H-FS
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 12:36:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1eCUH5-0001Hs-Nt
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 12:36:30 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:54467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1eCUH5-0001HS-Fm; Wed, 08 Nov 2017 12:36:27 -0500
Received: by mail-wm0-x242.google.com with SMTP id r68so12484327wmr.3;
	Wed, 08 Nov 2017 09:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eaYEOTpep5R3x/VdGFHR4c/KSyx2EKhRy3xng5juXKU=;
	b=iC3rmIlSxUmxcGX6toGGO0ccoEGjSkOwBXfFq1/Jbn60K2yEVXLMMQ0/FxTRMkrDA1
	LIJGpDLTX1uTqhD3ghc5Tjq8+WUbl/cnIrEYGXCFI0rL7ax+P7kwJ05eAqzU8niqdo3q
	QqYtiHjYCdCq1SFYaDde3BzLkMxN+Mowo3YStKU8z13jSLFUicOa5wE7zpK2A+XI1upk
	J245SVyG6tMwb5SOW6hgu9jg+D/CY7ozTcm1Efje2n4GRZKzTUW0q73CPK85QefwU7g/
	LqKe2eOPnwQ3edrmFtqL+REZGpZA7knx+hfLJBsDCZ00lw0GlVB9FJ6sQfK6gqeRJ0np
	ElJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eaYEOTpep5R3x/VdGFHR4c/KSyx2EKhRy3xng5juXKU=;
	b=XJFrRmJ53knpU+MyZiNJbKrB0MRU0PYvGC08SPesQI0MRRjcUjyJenLztDQkSwgxfF
	2iQTTVCbMLbdloN3BtKkNT+LFme1N9859rzmdfeGVQiW0igDLnhT4rakZ4pBCVsPO4eO
	PsgIeRsQ9P7pHSMOGI1HbxUnEhKwKpiSGUvOuoZ2dZ4Ah0YnPXA/XpkKvihnke1iEziW
	M4lVkAl69nskKodf6QBi2m12kuvSLFk08b3p/+gcIqhkRUo5cnVj+M5ZNhl3K3FnYHX4
	HXqZEvq96DnnR+AYew27Lfyj8KMKHdJFwJ/Wn3oWe6Rikr0UVl3amzAsgAr+E1Xv/m6e
	jbPw==
X-Gm-Message-State: AJaThX4AeFbwi3CbBWboYkDxcJ14eaYo92n/d8bVOQ7lKWm+ay4wAons
	oFrXjDu/lvcSQiQxXKcc2p0=
X-Google-Smtp-Source: ABhQp+SkxRMG94lCWI3LoJpIqW2NZcR0M/Qm3OhQIQX7M0aFJtSFnQ34htv9POt462kekF22nxzRQQ==
X-Received: by 10.28.57.4 with SMTP id g4mr934381wma.92.1510162586351;
	Wed, 08 Nov 2017 09:36:26 -0800 (PST)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	x65sm3333603wmg.11.2017.11.08.09.36.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Nov 2017 09:36:25 -0800 (PST)
Date: Wed, 8 Nov 2017 17:36:21 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Message-ID: <20171108173621.GB8403@stefanha-x1.localdomain>
References: <20171107223708.17935-1-eblake@redhat.com>
	<20171108154226.GC6118@stefanha-x1.localdomain>
	<462c8b69-9665-1342-fd01-5ba57049a39c@redhat.com>
	<061e94f4-602e-3ff3-0f20-d3915e7a5550@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline
In-Reply-To: <061e94f4-602e-3ff3-0f20-d3915e7a5550@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] coroutine: Fix
 documentation of co_aio_sleep_ns()
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
X-List-Received-Date: Wed, 08 Nov 2017 17:36:31 -0000


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2017 at 09:57:47AM -0600, Eric Blake wrote:
> On 11/08/2017 09:47 AM, Paolo Bonzini wrote:
> > On 08/11/2017 16:42, Stefan Hajnoczi wrote:
> >>> In any case, co_aio_sleep_ns()
> >>> + * does not affect the #AioContext where the current coroutine is ru=
nning,
> >>> + * as the coroutine will restart on the same #AioContext that it is
> >>> + * running on.
> >> I cannot parse the second sentence.  What does "affecting" an AioConte=
xt
> >> mean?  Does "where the current coroutine is running" simply mean "the
> >> caller"?
> >>
> >> What is it trying to say?  My guess is: the caller will be resumed in
> >> the current AioContext, not the timer's AioContext.
> >=20
> > Yes, that is the intended meaning.  Perhaps just s/current//.
>=20
> How about:
>=20
> This function uses timers and hence needs to know the event loop
> (#AioContext) to place the timer on.  After the time elapses, the
> current coroutine will restart with the same #AioContext it is currently
> running in, even if that is different than the timer context passed to
> co_aio_sleep_ns().

These complicated semantics are a clue that the API should be
simplified.  QEMU has changed since this function was first introduced.
Now we can do the following:

  void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
  {
      AioContext *ctx =3D qemu_get_current_aio_context();
      CoSleepCB sleep_cb =3D {
          .co =3D qemu_coroutine_self(),
      };
      sleep_cb.ts =3D aio_timer_new(ctx, type, SCALE_NS, co_sleep_cb, &slee=
p_cb);
      timer_mod(sleep_cb.ts, qemu_clock_get_ns(type) + ns);
      qemu_coroutine_yield();
      timer_del(sleep_cb.ts);
      timer_free(sleep_cb.ts);
  }

I don't see a reason for the caller to pass in an AioContext.

Any objections?  Will send a patch if this is okay.

Stefan

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaA0CVAAoJEJykq7OBq3PIi14H+gK3EFo9UR9K8fnE9xmRo94R
nkSd1xQMcyI497zNjIlALIbyKszPJLeBkwEf7q6KuZQG2KYB0FoS3hFBGTWNuBgc
RUDvfuwPnK3CbbYtZlboUa9S5e5WVXNBTKB+UDyVlBU0yFD32sLahrnJy5bUhzx4
AHQ/S09t7Kpoi+5MASepPeTkFt/z2DM/cxIcLNkak0jIn59vmzO0marHXecGOMHM
ojCq/nfXi3Z1RhER43kLWCHlwWXXSaJuEbnofyT1QYjswVfBcvvdTUaTKzVNv/jt
r/oDPIr3ZLRtGS8FBpgKp5s+4djR7RDfZs0/ZguHst6TdKj/UQhE19IF3CZmIGE=
=jJ6y
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--

