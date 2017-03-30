Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ctgFE-0000gt-0D
	for mharc-qemu-trivial@gnu.org; Thu, 30 Mar 2017 16:00:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ctgFB-0000fU-UN
	for qemu-trivial@nongnu.org; Thu, 30 Mar 2017 16:00:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ctgFA-0001Cr-Qt
	for qemu-trivial@nongnu.org; Thu, 30 Mar 2017 16:00:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46854)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ctgF4-00019V-6z; Thu, 30 Mar 2017 16:00:22 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 299E264D90;
	Thu, 30 Mar 2017 20:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 299E264D90
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 299E264D90
Received: from [10.10.122.200] (ovpn-122-200.rdu2.redhat.com [10.10.122.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3839C60A9D;
	Thu, 30 Mar 2017 20:00:19 +0000 (UTC)
To: minyard@acm.org, qemu-devel@nongnu.org
References: <1490894892-8055-1-git-send-email-minyard@acm.org>
	<0715ab2d-f367-03ef-1674-4c1e67756f85@redhat.com>
	<71b59e1b-caf0-d7b0-0648-b98d62e66c6b@acm.org>
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>,
	Corey Minyard <cminyard@mvista.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <f99214c2-6a18-5ab0-c6af-75590cc8d5fd@redhat.com>
Date: Thu, 30 Mar 2017 15:00:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <71b59e1b-caf0-d7b0-0648-b98d62e66c6b@acm.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="uhFfLPoIsWWwRTW5gFaKc8MwAucgN42cd"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 30 Mar 2017 20:00:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.9? v2 resend] ipmi: Fix macro issues
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
X-List-Received-Date: Thu, 30 Mar 2017 20:00:31 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uhFfLPoIsWWwRTW5gFaKc8MwAucgN42cd
Content-Type: multipart/mixed; boundary="phuMaoEjNumUfnncgproEd33U5Sp64x7a";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: minyard@acm.org, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>,
 Corey Minyard <cminyard@mvista.com>
Message-ID: <f99214c2-6a18-5ab0-c6af-75590cc8d5fd@redhat.com>
Subject: Re: [PATCH for-2.9? v2 resend] ipmi: Fix macro issues
References: <1490894892-8055-1-git-send-email-minyard@acm.org>
 <0715ab2d-f367-03ef-1674-4c1e67756f85@redhat.com>
 <71b59e1b-caf0-d7b0-0648-b98d62e66c6b@acm.org>
In-Reply-To: <71b59e1b-caf0-d7b0-0648-b98d62e66c6b@acm.org>

--phuMaoEjNumUfnncgproEd33U5Sp64x7a
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/30/2017 02:10 PM, Corey Minyard wrote:

>> Already reviewed by me, so now I'm just adding commentary: Is this sti=
ll
>> 2.9 material?  It silences a build warning under clang, although I
>> didn't analyze whether the unpatched code actually caused an observabl=
e
>> behavior bug or just compiler noise.
>>
> I don't believe the code has a bug, going through all the uses there is=

> no expression used as a parameter or set used in an expression.

Actually, let's re-read the clang warning, posted by Ed - we DO have an
expression used as a parameter:

> Found via Clang warning: logical not is only applied to the left hand
> side of this bitwise operator [-Wlogical-not-parentheses]
>=20
>                               !IPMI_BT_GET_HBUSY(ib->control_reg));
>                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> expanded from macro 'IPMI_BT_SET_HBUSY'
>                                        (((v & 1) << IPMI_BT_HBUSY_BIT))=
)
>                                           ^ ~

But we STILL have to audit to see if that expression used as a parameter
causes a bug:

        if (IPMI_BT_GET_HBUSY(val)) {
            /* Toggle */
            IPMI_BT_SET_HBUSY(ib->control_reg,
                              !IPMI_BT_GET_HBUSY(ib->control_reg));
        }

with the expectation that it will toggle the bit.  But does it really?

Unpatched, it expands to this:

(ib->control_reg) =3D (((ib->control_reg) & ~IPMI_BT_HBUSY_MASK) |
  (((!IPMI_BT_GET_HBUSY(ib->control_reg) & 1) << IPMI_BT_HBUSY_BIT)))

Everything left of the | is okay, but to the right, this further expands =
to:

(((!(((ib->control_reg) >> IPMI_BT_HBUSY_BIT) & 0x1) & 1) <<
IPMI_BT_HBUSY_BIT))

Since the inner expression of IPMI_BT_GET_HBUSY(ib->control_reg) is
properly parenthesized and always 0 or 1, it boils down to either:

(!0 & 1) << shift // 1 & 1, results in changing the HBUSY from 0 to 1
(!1 & 1) << shift // 0 & 1, results in changing the HBUSY from 1 to 0

so we actually achieve the toggle we wanted.  If I'm reading it
correctly, the clang warning is asking if we instead meant:

(!(0 & 1)) << shift // !0, results in changing the HBUSY from 0 to 1
(!(1 & 1)) << shift // !1, results in changing the HBUSY from 1 to 0

which, perhaps surprisingly, would have the same end results for all our
inputs (but ONLY because the value we are passing to ! is already
limited to the range of 0 and 1).

Post-patch, we are changing to an expansion of:

((ib->control_reg) =3D (((ib->control_reg) & ~IPMI_BT_HBUSY_MASK) |
  (((!IPMI_BT_GET_HBUSY(ib->control_reg)) & 1) << IPMI_BT_HBUSY_BIT)))

Again, everything to the left of | is okay, to the right further expands =
to:

(((!(((ib->control_reg) >> IPMI_BT_HBUSY_BIT) & 0x1)) & 1) <<
IPMI_BT_HBUSY_BIT)

which now boils down to either:

(!(0) & 1) << shift
(!(1) & 1) << shift

where we are now being explicit that we want the ! bound only to the
left argument, and not to the overall (a&b) expression.  But we are not
changing semantics, and therefore not fixing an observable bug.

Note, on the other hand, that a call such as
IPMI_BT_SET_HBUSY(ib->control_reg, 2) would result in writing 0 to the
HBUSY bit. In other words, the IPMI_BT_SET_HBUSY() macro is rather weird
in that it sets or clears the HBUSY bit based solely on whether its v
parameter is even or odd, rather than the more usual semantics of
whether the v parameter is 0 or non-zero.  We could change that if we
wanted - by having the macro expand to "(left | (!!(v) << shift))"
instead of our current expansion of "(left | (((v) & 1) << shift))" -
but I still don't think it would change the semantics of any existing
caller.

>=20
> That said, it's also not going to hurt anything and it's nice to silenc=
e
> the
> warnings.

I don't know if there were other warnings or just the one on the use of
IPMI_BT_SET_BUSY(); it may well be that auditing one of the other
warnings may turn up an actual behavioral change, but at this point, I'm
doubting that we are doing any more than shutting up the compiler, and
working around compiler noise is not the same level of bug fix as an
actual behavior change.  I'm not opposed to this patch going into 2.9,
but I don't see any problem if it slips to 2.10.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--phuMaoEjNumUfnncgproEd33U5Sp64x7a--

--uhFfLPoIsWWwRTW5gFaKc8MwAucgN42cd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY3WPSAAoJEKeha0olJ0NqVS8IAIkpAXVKjmvTbYzcv57dOabf
mbNDc1Vl0eU8V+OPPoJZzGSa28NZDH99VJ7G7SfESb9s3VEZd1GWo5yrY3TogHqb
XGgCx6rohEOSq0QMKpqn4/VfyJTzqs2jHvUaAJUGIpBHbes5O7/4R1Hv1BHEN6tW
syJCD6KNqTVAR4DrNf+Gxn4XRQ/jUmTENlFa9yVnlhEkW4FEpFseN/8ytJ/eUYKc
j/mALpzRGpaWlyHGxcF7aVjOn3Qb/VdnyJ+q459z3Im7SfulZlPnULAyH4OFqPMS
DYi7129HgBd5vBoZQVB+lB2oUJojSLTrLEVZ519QR76da19wXMG+2TZYPG539lk=
=qbvS
-----END PGP SIGNATURE-----

--uhFfLPoIsWWwRTW5gFaKc8MwAucgN42cd--

