Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZbsCl-0008WT-1X
	for mharc-qemu-trivial@gnu.org; Tue, 15 Sep 2015 11:31:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZbsCi-0008Sp-J1
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 11:31:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZbsCc-0003XN-Qu
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 11:31:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49323)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZbsCQ-00034q-Vd; Tue, 15 Sep 2015 11:31:15 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 129EA2ED154;
	Tue, 15 Sep 2015 15:31:14 +0000 (UTC)
Received: from [10.3.113.35] (ovpn-113-35.phx2.redhat.com [10.3.113.35])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8FFVDXU009564; Tue, 15 Sep 2015 11:31:13 -0400
To: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1433424607-3429-1-git-send-email-berrange@redhat.com>
	<CAFEAcA-HAZRJ8jBvWM8tnN-BkYuzBtToPFgzTNEU8oxtqmUtfQ@mail.gmail.com>
	<87twu5z7px.fsf@blackfin.pond.sub.org>
	<CAFEAcA8ukn66k8OaBFmn08kPRPa1q2HUrOwq9Uep1aMbuWePtw@mail.gmail.com>
	<87twu5nmbp.fsf@blackfin.pond.sub.org> <55DBB3B8.9080807@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <55F839BC.8060409@redhat.com>
Date: Tue, 15 Sep 2015 09:31:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55DBB3B8.9080807@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ce02KaRjQc30N9ik7efu0fHOsix6iEtbf"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Add .dir-locals.el file
 to configure emacs coding style
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
X-List-Received-Date: Tue, 15 Sep 2015 15:31:33 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ce02KaRjQc30N9ik7efu0fHOsix6iEtbf
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

ping

On 08/24/2015 06:15 PM, John Snow wrote:
>=20
>=20
> On 06/18/2015 10:05 AM, Markus Armbruster wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On 18 June 2015 at 10:28, Markus Armbruster <armbru@redhat.com> wrote=
:
>>>> However, I can't see how I could define a new C style there without
>>>> pushing the "local variables" feature well beyond its intended use, =
and
>>>> triggering the confirmation prompts.
>>>
>>> We wouldn't want to define a new C style, but in general the items
>>> I have in my config over the Stroustrup defaults are going to be ther=
e
>>> because I've noticed something where Stroustrup doesn't indent right.=
=2E.
>>
>> As far as I can see, the difference bwteen stroustrup style and yours =
is
>> a few tweaks to c-offsets-alist and c-hanging-braces-alist.  I'm not
>> sure how to do that from .dir-locals.el.
>>
>>>> If we take Dan's patch, every Emacs user who hasn't already configur=
ed a
>>>> suitable style profits.  Users who have may have to adjust their
>>>> configuration to work with or around Dan's patch.
>>>
>>> Is there some way to tell whether your emacs has picked up the local
>>> style info rather than the one you have in your .emacs ?
>>
>> The obvious way is to check the buffer-local variables.  Buffer-local
>> variable c-indentation-style is the name of the style in use.  Without=

>> anything in .emacs or local variables, it's "gnu".  With your
>> (c-add-style "qemu" qemu-c-style) in .emacs, it should be "qemu".  Wit=
h
>> Dan's .dir-locals.el, it should be "stroustrup".
>>
>> When you can't or don't want to create or modify a .dir-locals.el, you=

>> can do something like this instead:
>>
>>     (dir-locals-set-class-variables 'qemu '((c-mode . ((c-file-style .=
 "qemu")))))
>>     (dir-locals-set-directory-class "~/work/qemu" 'qemu)
>>
>> This *overrides* .dir-locals.el in my testing.
>>
>=20
> ping -- any love for this for 2.5?
>=20
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--ce02KaRjQc30N9ik7efu0fHOsix6iEtbf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJV+Dm8AAoJEKeha0olJ0NqZeIIAJ2xg53Kd2233CTuy7nnNAwK
xuudl43B+eaPuhyFu1mE01oZu1O88bNUOABGdV/9J1M+bkJdj4BoFXr22HpCAaV5
/I6gt8LLi4RPSVio4LGwmJbZYvJxPwcQOPnDE9LO6oacjvpVfm9/FEgXxE9fbEA9
3lfbzQ+dlvS1pmHriFX2SZ4RqBmN+izwBAVYBiGpy/EWraVfaS0EYoesX2qNW9W3
REjzFx1hDgGpFf4qk9V4oRKrztMH0WSpqObhVNItiR6tDfiRaNyRjO9Ka8Qpgr+y
X2id5wRkSlog6C/yZBlMVvoS2u1qPWG+d2IXYUCmRks0NT3wwaqXytAVf+47VOA=
=eD1C
-----END PGP SIGNATURE-----

--ce02KaRjQc30N9ik7efu0fHOsix6iEtbf--

