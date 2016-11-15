Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c6ZLv-0001aJ-S7
	for mharc-qemu-trivial@gnu.org; Tue, 15 Nov 2016 03:44:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1c6ZLt-0001Zv-Is
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2016 03:44:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1c6ZLo-0005iI-N9
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2016 03:44:25 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:56391)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1c6ZLo-0005hV-E8; Tue, 15 Nov 2016 03:44:20 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0LdVQI-1cWJOP2Rww-00imrM; Tue, 15 Nov 2016 09:44:07 +0100
To: Stefan Hajnoczi <stefanha@gmail.com>,
	Hailiang Zhang <zhang.zhanghailiang@huawei.com>
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
	<5829233D.8080709@huawei.com>
	<20161114135451.GB26198@stefanha-x1.localdomain>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, armbru@redhat.com,
	dgilbert@redhat.com, Amit Shah <amit.shah@redhat.com>,
	Eric Blake <eblake@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0ea043b8-532f-04a6-c4f8-b5a9ce6c16ef@vivier.eu>
Date: Tue, 15 Nov 2016 09:44:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161114135451.GB26198@stefanha-x1.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="pXst91JCoGV4oOjODcPbUdxNXt1q6TwIl"
X-Provags-ID: V03:K0:5e6Ef0LotKJ4r1rYoy2eQL1GIaOpi3slXxUauhlmL21InAt090I
	kP3boWDcwJ/0HJ6Wu9b/d7Caayk1OlhYIwLPmlu5xQuv+Z7B4QtMEpXTRNAj7wXawx68Jw5
	1qmEARCnZzrLjHfSFmV9HgMP2FK/FoYeg7K09ptfJ6r7qVlhgfsphPIGCRSI0xfJ6D39UwV
	9OJZElFyoDhSf8Rc1Lz9g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Ba8I46378LM=:sTOSTyuJOod7aLc8PmEXS6
	/fOC4X+rlK8xfdmSAq6CtkisApHupOMWiq5u1rGPwsDLkcTXxFfyCkMdv7jKcAlbWxd1Rbagj
	/FJSihMEukXWqkbme0nBBp1t32K9xrG+XSIoarK5+D7jlmD/Xd/5CX5EXx0tJPFrxNndnwfZY
	fKVChjtb89BTYxO4C2zw+6sdkbi/Z84+ATFyasBRMDKVqqklUDMpxmJ8U+g6/K7vCKv8sA2yt
	hm31/UWPcpRxqStFedSkvQJq6IfFu/qZWikttXXZlsMOwgiF6zpPBEob2IfAwYalZ9Oz+Jgh0
	sQX17lo6Atw7j6ZSG4NDtjS2sus3s5bwJjxxumlICx0JgBvAZVU/YSk9DMkEfhyJrHu27kmS4
	beXdMVnM6u0QAb8SpZ3mAj7qQinpq7u3rDT+cppUv447cmjYbX/iyyPfO3ELwNXV8BJwnkyVH
	NxeWHDnc/Uoyatj+S+GkZ38MtMYCZ3BLyTivZjr1Q4mDIL0EtZJU6aoHWmDaEZYDTek1JEA00
	TI+ZT/+9T0o9W+BeNoiufXVK3zoYV+7wZnjvAZtl8jd00SR51Raxpe+MTY+M0jNhsXBeN9ANQ
	+wb/bKt0C/TemPcRYqLoCjQuqR33kRu5vOATwgpa7p7MQnJHuprCN8Hex8heN1WF9DhC6D93G
	COq9pas+QTQXwBRnHb9xsv+TVsFfClVz7kcSOSvHF7RDH+hYmoqtM+4aIy2Q6wQOPxes=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qapi-schema: clarify
 'colo' state for MigrationStatus
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
X-List-Received-Date: Tue, 15 Nov 2016 08:44:26 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pXst91JCoGV4oOjODcPbUdxNXt1q6TwIl
Content-Type: multipart/mixed; boundary="CLCOlPDQlKC1DU8NXeNbi1PrcQJKtnbFe";
 protected-headers="v1"
From: Laurent Vivier <laurent@vivier.eu>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, armbru@redhat.com,
 dgilbert@redhat.com, Amit Shah <amit.shah@redhat.com>,
 Eric Blake <eblake@redhat.com>
Message-ID: <0ea043b8-532f-04a6-c4f8-b5a9ce6c16ef@vivier.eu>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qapi-schema: clarify
 'colo' state for MigrationStatus
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
 <f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
 <5829233D.8080709@huawei.com>
 <20161114135451.GB26198@stefanha-x1.localdomain>
In-Reply-To: <20161114135451.GB26198@stefanha-x1.localdomain>

--CLCOlPDQlKC1DU8NXeNbi1PrcQJKtnbFe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 14/11/2016 =C3=A0 14:54, Stefan Hajnoczi a =C3=A9crit :
> On Mon, Nov 14, 2016 at 10:36:45AM +0800, Hailiang Zhang wrote:
>> ping ?
>>
>> Anyone pick this up?
>=20
> The original patch that added these lines went through Amit Shah and
> David Gilbert.  I have CCed them.

If it is needed, I can also send a pull request through my
trivial-patches branch.

Laurent


--CLCOlPDQlKC1DU8NXeNbi1PrcQJKtnbFe--

--pXst91JCoGV4oOjODcPbUdxNXt1q6TwIl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYKsrVAAoJEPMMOL0/L748cuUP/jRsnFFqy0ASNKIBQUiwuMqP
S355bPBlR1hKUQEagBd25UcQKaSfHO362C5fUtBXluWat18DiZNXWwLCA9cjUTpu
o84Rd4aInBReVlAHQeMcFysUGogl+k3IzDrf6IxZ6jTZ8mJ3o4xk2j2YtN92TW2K
oBwAUOg0x6/LYFX8It5HyMbkbKeun6vd2ABmxZZHob3eUVEJzhQpHlTNTZzWPWz2
kR7+4q2Qn3MhaQltUp20ZyFXKrW06XO1KCL2WdcoFqmkfZnExpYoYFrbETIhheqa
YNPMyP1FUiFo6KNyT+lqkic/jwKL3PovYFqGI3CrvcIgE0rPvHHoE/HbhmvBJg1B
yOx8uqShNwVPYJGUhl4IDABmFkF7KJO0WLtVNlwToi31lOuOay1HI1XSbNOMKn2k
Wph/P0YFCmK2gQ23YIzN7FTChyGlX+gnInzBULi6seqBSizPOycFRtXYYZqfeHnJ
ZIwSFWs5ceZLr+O5Bhk+esUHo7nMf8Cysa1ehH93SYrnzHjZQ8LWHWvj4oJaEjs4
LEol3QBmNYIQCPSShCnS08Qk8SbX01bjR/mXbqc33EqPFQvPV4mtexa8JtOB30E1
Y1QuTqONFVdsczScSkrOkvq6Vh0fJI2yXhZf2cpF6WaFLQDizkcU5z6VFTQmhxNf
O5iP1YPrEMDJKsjUdWUK
=ti6S
-----END PGP SIGNATURE-----

--pXst91JCoGV4oOjODcPbUdxNXt1q6TwIl--

