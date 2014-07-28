Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XBnXw-0003Xk-B2
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jul 2014 12:13:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XBnXp-0003Q9-5a
	for qemu-trivial@nongnu.org; Mon, 28 Jul 2014 12:13:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XBnXj-0005TN-Fg
	for qemu-trivial@nongnu.org; Mon, 28 Jul 2014 12:13:01 -0400
Received: from mail-we0-x22e.google.com ([2a00:1450:400c:c03::22e]:47422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1XBnXX-0005RX-Lc; Mon, 28 Jul 2014 12:12:43 -0400
Received: by mail-we0-f174.google.com with SMTP id x48so7571591wes.19
	for <multiple recipients>; Mon, 28 Jul 2014 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xgXoNMQ3T2bdQTVRe4aRHOF1pFzieAda5Bll872dwfA=;
	b=CyfCU+QaNaL0X78AI+ERhDOPi7JXvylDUvouQXNR8BU54qeVxQm0iBm7yags2wQLZm
	M46J5vVFMoFpZtj7TXU6uWZlXpquzguch+YsyfJcAMBtOO/9PcvnywLdPFXGCaV568k8
	ZXkFT/dWaM9Z1FTVN5IvJ0LjQ8yuS0HfKaZ6mD0XIHMHbt5oFp761B5y4kjoYobWXNEw
	nhmdkoM6yULUMXzVCCDsYWKyPHwvVoMwNdH3Bi4tQwHKB8ea6Fjenjes9xGi8HZECb6m
	r6A7WW4mVSRNVG99Amqfw7QclbMPoy1rjxDMJVvgy2YJohyZ/WTjr6HWwbOu22zirHuu
	sx5g==
X-Received: by 10.180.211.101 with SMTP id nb5mr32986432wic.53.1406563959064; 
	Mon, 28 Jul 2014 09:12:39 -0700 (PDT)
Received: from localhost ([87.114.35.83]) by mx.google.com with ESMTPSA id
	ey16sm32840965wid.14.2014.07.28.09.12.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jul 2014 09:12:37 -0700 (PDT)
Date: Mon, 28 Jul 2014 17:12:35 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140728161235.GM13872@stefanha-thinkpad.redhat.com>
References: <1406218286-19685-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HVCoas+krw6dou6l"
Content-Disposition: inline
In-Reply-To: <1406218286-19685-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22e
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.1] qemu-options: fix
 another allows-to for -net l2tpv3
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
X-List-Received-Date: Mon, 28 Jul 2014 16:13:06 -0000


--HVCoas+krw6dou6l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2014 at 08:11:26PM +0400, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  qemu-options.hx |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 9e54686..1549625 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1437,7 +1437,7 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
>      "-net l2tpv3[,vlan=3Dn][,name=3Dstr],src=3Dsrcaddr,dst=3Ddstaddr[,sr=
cport=3Dsrcport][,dstport=3Ddstport],txsession=3Dtxsession[,rxsession=3Drxs=
ession][,ipv6=3Don/off][,udp=3Don/off][,cookie64=3Don/off][,counter][,pinco=
unter][,txcookie=3Dtxcookie][,rxcookie=3Drxcookie][,offset=3Doffset]\n"
>      "                connect the VLAN to an Ethernet over L2TPv3 pseudow=
ire\n"
>      "                Linux kernel 3.3+ as well as most routers can talk\=
n"
> -    "                L2TPv3. This transport allows to connect a VM to a =
VM,\n"
> +    "                L2TPv3. This transport allows connecting a VM to a =
VM,\n"

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--HVCoas+krw6dou6l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJT1nZzAAoJEJykq7OBq3PIC4AIALr+X+2haA5rFv6qKWm3J93v
eQzkRVpiL5zw1ny7aktYyr2M2YkuVV4iQIDnvFjekSDqfpiR5l+LSevoMyvVKtor
YtP5J0YLy4hv6GAQ57fR9lZosiIOaXa5eLzYn7xt++G1GVyMlCvAxMWK0dPu8qSS
wf1GP4V6AJgyzuRHGpZ6CJx233VsfW7mLk3SqfZ39e6ln9Fg+Is94asIfUyEkouL
EKcSryclUCasfm7CX6/zyroNYVXxTRbIfX/bavzW8N/lYXOXig0JzYkU0goI41bD
ak1RT09hKQj+MFssSJKeXCbA6pOgaAguOPgRm8MgWb5qaeYQGh0LTxdpAAAU6V8=
=PclP
-----END PGP SIGNATURE-----

--HVCoas+krw6dou6l--

