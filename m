Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XosZF-00035a-0a
	for mharc-qemu-trivial@gnu.org; Thu, 13 Nov 2014 06:28:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XosZ8-0002sr-7u
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 06:27:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XosZ2-0001k5-I3
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 06:27:53 -0500
Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230]:64166)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1XosYr-0001he-DE; Thu, 13 Nov 2014 06:27:37 -0500
Received: by mail-wg0-f48.google.com with SMTP id y19so5819245wgg.7
	for <multiple recipients>; Thu, 13 Nov 2014 03:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rdsNWIyYrxhH3H1JAw27M0MC3gWQOiTFudbgodWM3Y0=;
	b=OB5A11zjV8ZRBo1wb0wygQwC2qw6KC3Jz18LfIYNwe43G0pG6hvm4FdQ3lg4uDe1vn
	r2efz5XFM0fOjW8XjrlgK/Zpt7I96deRYGaKGGJHt0x394Y5XsdClAMKHupxKc3mZsX3
	Ws+Q1usaDA45DQuBzPRIfmAFZPpxhKiKHsZXV6pv9Av6SbVDrZhvTuwyK8BHDxhxRXtG
	jy6g/AOUfPyZ2//cWrljeamEi6VfGlEBADkTc4Uej5BMHoQ9jyg4xgsW+hfKpA4mAtLW
	pjZlVie90JWZdLu4ZrIraI8jKSIErlKGpRTHWNjx6wzF7i2HGwvAuDMBiqpZQ2fmf+xH
	0DVQ==
X-Received: by 10.194.52.3 with SMTP id p3mr2906994wjo.93.1415878056736;
	Thu, 13 Nov 2014 03:27:36 -0800 (PST)
Received: from localhost ([212.159.126.148]) by mx.google.com with ESMTPSA id
	gs9sm35130493wjc.47.2014.11.13.03.27.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Nov 2014 03:27:35 -0800 (PST)
Date: Thu, 13 Nov 2014 11:27:34 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: arei.gonglei@huawei.com
Message-ID: <20141113112734.GN7462@stefanha-thinkpad.redhat.com>
References: <1415846372-12756-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sy9WyBOsCRoUO165"
Content-Disposition: inline
In-Reply-To: <1415846372-12756-1-git-send-email-arei.gonglei@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::230
Cc: qemu-trivial@nongnu.org, mst@redhat.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-bus: avoid breaking
 build when open DEBUG switch
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
X-List-Received-Date: Thu, 13 Nov 2014 11:27:59 -0000


--sy9WyBOsCRoUO165
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2014 at 10:39:32AM +0800, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/virtio/virtio-bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index eb77019..dfd2d8c 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -58,7 +58,7 @@ void virtio_bus_reset(VirtioBusState *bus)
>  {
>      VirtIODevice *vdev =3D virtio_bus_get_device(bus);
> =20
> -    DPRINTF("%s: reset device.\n", qbus->name);
> +    DPRINTF("%s: reset device.\n", BUS(bus)->name);

In general the problem with existing DPRINTF() macros is that they use
#ifdef.  This leads to bitrot, such as this instance.

A better approach is:

#define DEBUG_FOO 0
#define DPRINTF(...) \
do { \
    if (DEBUG_FOO) { \
        fprintf(stderr, ...); \
    } \
} while (0)

Now the compiler always checks the DPRINTF() code.

Trace events can be a good solution too.  If you like stderr output,
build QEMU with ./configure --enable-trace-backend=3Dstderr and all
trace_*() calls are turned into fprintf(stderr).

The cool thing about trace events is that they are available in
production too.

Stefan

--sy9WyBOsCRoUO165
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUZJWmAAoJEJykq7OBq3PI2N8IAKnlYY5x3/WY0aTWW+s05gHr
J7Hcngo2YfRWvZK2mmqfEY80gF11GSqLTRAkU87RXWk4pD9FQ4Y9VZs6hGYMAPnZ
HXoANH+UPO/U9v6KRcDK36OjZN0UwZmhivvsICEhxANq+8SkbuhOUlZll5AQfllp
o/QWowhfCpP4Vsz7QX0XhIPXF9+lGo9WvITlEaT8vHrgFNhxDwhUmwqFtH8OIEMy
Vyk7rmGx+4UyGo7Lif1iPmnVt6rGsCEI5hsKzrTHVVKabjVdTChl0UWMnnKRuGpS
gZdaQpKhI78oprzFGLLPnJiIDVtaZ2USiEMh1/4Bd445hECT65pa6Mx7MbT9J+8=
=oOyx
-----END PGP SIGNATURE-----

--sy9WyBOsCRoUO165--

