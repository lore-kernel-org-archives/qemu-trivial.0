Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqPeV-0005a1-8Q
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 11:59:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XqPeT-0005WX-0E
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 11:59:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XqPeN-0002fr-NU
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 11:59:44 -0500
Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d]:64820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1XqPeN-0002fZ-Gc; Mon, 17 Nov 2014 11:59:39 -0500
Received: by mail-wg0-f45.google.com with SMTP id x12so25701323wgg.18
	for <multiple recipients>; Mon, 17 Nov 2014 08:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MiN4jhSzDjFbj1kMH8UtGKxV7MbYJx2SrGkbL1EgJXU=;
	b=DG0dNwRWUZ9MSaU/6B+pq3FgzTpObnUNCHHTe6ZowxMXE1CqECpqw8dxVBA49lXnF8
	ZT+Y0hWUtP+hyWDYybW09KX+FNiC1JcBIR2dx2KStvGlTkLTao6ChEgWfrgTyqqIvcd3
	hSPHN6G2DAuoK2/mLqr/NWAQJoMb522Klfh+zI76z4U5qffOq4yaXeJGM1tkBQ3KVdiX
	1eBImJKAJjaeBWoUxB4k8hTxuh1mVS6h7IPVrb1IkoifMMWoafvf0/HcnkLOuz4051Sx
	zLarnedmCT15oWE8yYH4hucADdk05qf3OOZ6JeGOZjnRriThE9CGJ+Hm940JKde4IvD/
	qimQ==
X-Received: by 10.180.73.101 with SMTP id k5mr32091933wiv.31.1416243578581;
	Mon, 17 Nov 2014 08:59:38 -0800 (PST)
Received: from localhost ([212.159.126.148])
	by mx.google.com with ESMTPSA id w4sm23174989wjw.39.2014.11.17.08.59.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Nov 2014 08:59:37 -0800 (PST)
Date: Mon, 17 Nov 2014 16:59:36 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20141117165936.GO16192@stefanha-thinkpad.redhat.com>
References: <1416203645-2584-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYjWXklH5JTzT8n9"
Content-Disposition: inline
In-Reply-To: <1416203645-2584-1-git-send-email-zhang.zhanghailiang@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22d
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
	stefanha@redhat.com, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: The third parameter of
 getsockname should be initialized
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
X-List-Received-Date: Mon, 17 Nov 2014 16:59:46 -0000


--TYjWXklH5JTzT8n9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 17, 2014 at 01:54:05PM +0800, zhanghailiang wrote:
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  net/socket.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my net tree:
https://github.com/stefanha/qemu/commits/net

Stefan

--TYjWXklH5JTzT8n9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUail4AAoJEJykq7OBq3PI2YcIAInhK5eAFAuOLfXkcHgOMeSy
v+50Xm+KpbqAIYSozawHAR5RADRHv3t63NMZ/3opzYCp/XoFMJb7g1HDBZugBfWB
EZwV9wwPAH0hUwz4qvkuPauq9Y/WefHuLSyv/MCs0Z/Zqt8PQRYDqzu6X8MqbAx0
WO0/AXy73a+MzFUZQTvNuihbk1aiGnSWTh/ORRq6O9DaESBHS3RqOkUiaDLflKzS
7Xs5Gd2adFEHa+kTlhXZ467uTbUkAzie++0ltfCXAwrUM4g/CM8uuATR1YXS1ap4
AbgJK2N3e9ztPzbu5jLfvvfOsQf1pJmjPV4pcg/5FcGWmOm78ZP1q1GEuvHCeBo=
=uGry
-----END PGP SIGNATURE-----

--TYjWXklH5JTzT8n9--

