Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXuwO-00013A-84
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 13:06:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YXuwJ-0000wv-6B
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 13:06:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YXuwI-0006Zf-3T
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 13:05:59 -0400
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:35789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1YXuwA-0006Ya-HC; Tue, 17 Mar 2015 13:05:50 -0400
Received: by wibdy8 with SMTP id dy8so68614674wib.0;
	Tue, 17 Mar 2015 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rurju8wZWAbyPTITZYw6WSaOW7k0p99Yjg3Ur7aUbPs=;
	b=UdLaE1duSldjzZuxwNfx7NjFZw2Vkythr+QkqTq/XkIBYHwdBKBxX66VAlOGlTkQPA
	X+iB8ZlFzy74aM6EgThj3eSCWKb2/vLqReqkZsMoR+AgoZDnWeIPNMOYyeKTfDyrEy4k
	Q304HxLemShutWeiWvW3S8KPB0iyH0OVlF+nxt1aFW6FD8SfzSiCXZj0erh4pwX1Q6zz
	CaQi5TrBDbVLTruDcQ9vB5HXdRl1oNJQMCCejrq2JGwdQHLbgUqKa/GNOMfjntP64+9B
	JUCsj4hYGZzCEENIiOvR2jSLHqGXq6/M/nl/Agylb0jj2qgmnUA2Xt0a/wbffPKh66W8
	lGMQ==
X-Received: by 10.194.19.197 with SMTP id h5mr131961892wje.109.1426611949907; 
	Tue, 17 Mar 2015 10:05:49 -0700 (PDT)
Received: from localhost (host109-148-191-84.range109-148.btcentralplus.com.
	[109.148.191.84])
	by mx.google.com with ESMTPSA id s19sm3429560wik.18.2015.03.17.10.05.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Mar 2015 10:05:47 -0700 (PDT)
Date: Tue, 17 Mar 2015 17:05:45 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20150317170545.GA13669@stefanha-thinkpad.redhat.com>
References: <1426224119-8352-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <1426224119-8352-1-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/net/e1000: fix integer
	endianness
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
X-List-Received-Date: Tue, 17 Mar 2015 17:06:03 -0000


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2015 at 01:21:59PM +0800, Shannon Zhao wrote:
> It's detected by coverity.In is_vlan_packet s->mac_reg[VET] is
> unsigned int but is dereferenced as a narrower unsigned short.
> This may lead to unexpected results depending on machine
> endianness.
>=20
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/net/e1000.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my net tree:
https://github.com/stefanha/qemu/commits/net

Stefan

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVCF7pAAoJEJykq7OBq3PIX9cIAJQ4KE9mq2Umbs/uYLiDMqb3
2RGvBCeZ4sMP1pkznlOtJnI+v6RM6GAXR9OtlMg1xUR9zmgIvSa/7tc6ipQpO9S9
dVWVUYJ0MF2Xwk6zEsYNsOyEln/wkUNk3u3V61jcN6Rg5I04tRSln8G/l0NJHZfq
nlLZu1hYoB0khBjWZPIqbUn34K/TbVMpp/ni7P2g/5I1f6IqyVxjfXGXYP1xJqwr
TnJUzSIt3cH9hltp3YO2tCkw9kBoMhLVr8TXt0DS3XFhRE07eS8SabWhCweDw1ba
v35Oaid9kP6XeXJJv7DN9/u1wmVfuYe/xYsGq2i4U4BzxLyLM8BgjjFXk+rqklw=
=K1vV
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

