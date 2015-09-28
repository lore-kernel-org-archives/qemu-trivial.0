Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZgvMe-0000in-3X
	for mharc-qemu-trivial@gnu.org; Tue, 29 Sep 2015 09:54:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZgeWK-0008MN-Sk
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 15:55:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZgeWK-0005tO-2A
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 15:55:32 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:56778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZgeWD-0005op-5K; Mon, 28 Sep 2015 15:55:25 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	343A611810A8; Mon, 28 Sep 2015 21:55:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id VcsIfn7SJRZY; Mon, 28 Sep 2015 21:55:22 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54AC9B7A.dip0.t-ipconnect.de
	[84.172.155.122])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	1525511810A6; Mon, 28 Sep 2015 21:55:22 +0200 (CEST)
Message-ID: <56099B1D.2060806@weilnetz.de>
Date: Mon, 28 Sep 2015 21:55:09 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <1443211950-8207-1-git-send-email-sw@weilnetz.de>
	<871tdjni3w.fsf@blackfin.pond.sub.org>
	<5608F9BC.603@weilnetz.de> <5609576F.2060407@redhat.com>
	<56095A66.8050003@weilnetz.de> <560961C7.7090209@redhat.com>
In-Reply-To: <560961C7.7090209@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="12rbqXf8fOCGCmGO7nSLLoXDGUmTwqu8T"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace/simple: Fix warning
 and wrong trace file name for MinGW
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
X-List-Received-Date: Mon, 28 Sep 2015 19:55:33 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--12rbqXf8fOCGCmGO7nSLLoXDGUmTwqu8T
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 28.09.2015 um 17:50 schrieb Eric Blake:
> On 09/28/2015 09:19 AM, Stefan Weil wrote:
>> Am 28.09.2015 um 17:06 schrieb Eric Blake:
>>> On 09/28/2015 02:26 AM, Stefan Weil wrote:
>>>
>>>>> Can you explain why osdep.h's
>>>>>
>>>>>     #define FMT_pid "%" PRId64
>>>>>
>>>>> is appropriate for Windows?
>>>> Don't blame me for any strangeness which you might find in Windows. =
:-)
>>>>
>>>> Mingw-w64 sys/types.h defines pid_t to be either an int or an __int6=
4.
>>>> FMT_pid must match these definitions.
>>>>
>>>> But getpid returns an int, not a pid_t...
>>> Can we 1) file a bug against mingw for their buggy getpid(), and 2)
>>> write a wrapper that makes getpid() always return pid_t in the meanti=
me?
>>
>> 1) No, because MinGW and Mingw-w64 use the same declaration as MS.
>> They cannot change that, of course. Nor will MS correct this after man=
y
>> years, for obvious reasons.
>=20
> If getpid() always returns int, then defining pid_t to __int64 feels
> wrong.  I still claim its a mingw bug to have a mismatch in types.
>=20

I have sent this question to mingw-w64-public@lists.sourceforge.net.

Stefan



--12rbqXf8fOCGCmGO7nSLLoXDGUmTwqu8T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJWCZspAAoJEOCMIdVndFCtsQsP/A4Hy2Kl5lgxv/p/wS176AZ+
9zukXqVraQJVp2j7CK+Qj1ef9yO73JAnJLJsgEp+brk5LAbwBhIvFYB8HnBaQ+CZ
1OyK8FlkRdvWh97JiPcKV9jGqU8rMThWqZ5pajguluFucmbpT/4qfSgZQVUKd5fV
v8DgUoKU+idcLvPjcAIe4XtZPL2djsarofqy0koj7Uihr3gRIITlvJEzFywkWZ0u
QLN/JcMAN1PzGbkoogFNS4HX1YkuWXSl0NUe6C77q8xoncKAGl44jSGlPUSYpqO9
wuhAj+5Ox+UFALPeSxEdxcyY+ZjWzVAt2K94q5lFEN+M2KBR1mVEen22hVzfgzsB
J6t3wYb8K5tiGy1L795Ftf3NJubuDHjMpSt5BU20wVfQDxo0hlCj2I5xdoFVSRBv
RQ64VKgYHD4JSeAHAK9apoEc97vRAjOAf+WlYVT3PRDErOCfcnzVwMhoMV2a2Wc8
LoApxepebsabaPcxXXV5Hwh2zt6mwfeSYG6O2ixWCoSHtJKXRdmTCWx+hJpACA+I
ZzgEtjQT9OCQOCkc4J0ujqDMQwhagfdVPQQsp6K+hvR0wImoZkuIMSXv9jRpFqvB
HeCmXujdvZwyZOV8Lb4MQY2Dg1xba8nB5QgtT3MYmhinlHLC9jssIc/UqCBJsFB4
TCyv41pdHBhdhD/N0elA
=oIrO
-----END PGP SIGNATURE-----

--12rbqXf8fOCGCmGO7nSLLoXDGUmTwqu8T--

