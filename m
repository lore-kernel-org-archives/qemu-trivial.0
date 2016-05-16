Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2IEU-0007bu-P7
	for mharc-qemu-trivial@gnu.org; Mon, 16 May 2016 09:06:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b2IES-0007Uw-61
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 09:06:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b2IEM-0000OJ-4q
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 09:06:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b2IE0-0000Ld-9U; Mon, 16 May 2016 09:06:20 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1651C05B1F1;
	Mon, 16 May 2016 13:06:18 +0000 (UTC)
Received: from [10.36.112.38] (ovpn-112-38.ams2.redhat.com [10.36.112.38])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4GD6D9e031577
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 16 May 2016 09:06:16 -0400
To: Stefan Weil <sw@weilnetz.de>
References: <1461879221-13338-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA_AGhFyNdXZkMzs2P4XzgEgPGyHhjr+vp78DBD3NnJaZA@mail.gmail.com>
	<5739AE8A.9080604@weilnetz.de> <5739BB81.8080307@redhat.com>
	<5739BDE3.5030301@weilnetz.de>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>, qemu-stable@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5739C5C1.20201@redhat.com>
Date: Mon, 16 May 2016 15:06:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <5739BDE3.5030301@weilnetz.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="DBiBAFqa3wVMECN3lIH8oKAgkrgr1Nl9O"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 16 May 2016 13:06:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.6] configure: Allow builds
 -Weverything
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
X-List-Received-Date: Mon, 16 May 2016 13:06:49 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DBiBAFqa3wVMECN3lIH8oKAgkrgr1Nl9O
Content-Type: multipart/mixed; boundary="MgDcKqG5Fgwd9ILFWjhJjjKT2lFO89ul1"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developer <qemu-devel@nongnu.org>, qemu-stable@nongnu.org
Message-ID: <5739C5C1.20201@redhat.com>
Subject: Re: [PATCH for 2.6] configure: Allow builds -Weverything
References: <1461879221-13338-1-git-send-email-sw@weilnetz.de>
 <CAFEAcA_AGhFyNdXZkMzs2P4XzgEgPGyHhjr+vp78DBD3NnJaZA@mail.gmail.com>
 <5739AE8A.9080604@weilnetz.de> <5739BB81.8080307@redhat.com>
 <5739BDE3.5030301@weilnetz.de>
In-Reply-To: <5739BDE3.5030301@weilnetz.de>

--MgDcKqG5Fgwd9ILFWjhJjjKT2lFO89ul1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 16/05/2016 14:32, Stefan Weil wrote:
> Am 16.05.2016 um 14:22 schrieb Paolo Bonzini:
>>
>>
>> On 16/05/2016 13:27, Stefan Weil wrote:
>>> I think this patch which was too late for 2.6.0 is a candidate for
>>> qemu-trivial, maybe also for qemu-stable. CC both mailing lists.
>>
>> Yes, it is confusing to have --disable-werror compilations break becau=
se
>> of warnings becoming errors.  However, the subject is imprecise, what =
about:
>>
>> ----
>> configure: Allow builds with extra warnings
>>
>> The clang compiler supports a useful compiler option -Weverything,
>> and GCC also has other warnings not enabled by -Wall.
>>
>> If glib header files trigger a warning, however, testing glib with
>> -Werror will always fail. A size mismatch is also detected without
>> -Werror, so simply remove it.
>> ----
>>
>> Thanks,
>>
>> Paolo
>=20
>=20
> Yes, that's a better description. Maybe Michael can use it when
> applying the patch.

I'm sending a pull request with all sort of patches in a couple days, I
can include this one too.

Paolo


--MgDcKqG5Fgwd9ILFWjhJjjKT2lFO89ul1--

--DBiBAFqa3wVMECN3lIH8oKAgkrgr1Nl9O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXOcXBAAoJEL/70l94x66DQUMIAJ62kcW38KeESLf7phhf0+M8
hiXO889Jd6STQRkuoRfndVZKNUPJKd097j8oMMEyMo5RusKWkqsAuomJl7SKW9mO
xo8fietJ2RNFhmHc6KfuOLbNQr4P8Sey7YxI1SAi1259MiTv9j9CjFnXYa/HczYH
kyNgkptdONaGW8g/uXihflwO9nv8BLHsqRClPC9z/2zijsJGEyV2BeNQEuxdSEa2
QxwZq3M9TvbgMe8fzSTtkZ5+i2wyoAtJ4oIHBAIhikZvu2fBL408ptkFbUZJHF4v
96B4xzK0G1ygdZlhQJe3r+HM/g5iIMFC1MiPU1G34QuWGW61YzRE3aVxxuv6brA=
=ppe1
-----END PGP SIGNATURE-----

--DBiBAFqa3wVMECN3lIH8oKAgkrgr1Nl9O--

