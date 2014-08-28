Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XMxe9-0004b3-Gs
	for mharc-qemu-trivial@gnu.org; Thu, 28 Aug 2014 07:13:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XMxe1-0004Zt-CO
	for qemu-trivial@nongnu.org; Thu, 28 Aug 2014 07:13:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XMxdv-0005ug-A5
	for qemu-trivial@nongnu.org; Thu, 28 Aug 2014 07:13:33 -0400
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233]:58525)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1XMxdv-0005uW-2l; Thu, 28 Aug 2014 07:13:27 -0400
Received: by mail-wi0-f179.google.com with SMTP id q5so669660wiv.12
	for <multiple recipients>; Thu, 28 Aug 2014 04:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HqG8hrSRVjxp0Ln/jg6QznRjkGpLeNw4QBAti1siM7c=;
	b=ADZlondDETIgCjoT4vcacHuBdmJJWvl3s8UdHAEYYPCZONny0IJAQUH2Ion5z95WAS
	k2ghO0ZBPoKl7I7V9nJLZWqzgbnenj+TTuWtzzoJVLxFOUAInYGw+lirD6FezzcW2/V2
	fin/Iml5uD6WCOKdT38NDaIk7uBMZV8k6JvDrOqL8IOxl57hpaqki94LbsCNRNx+zTE2
	wb+AsUn1IqrRcwMs8kz/XQsyKpf0t2Yp+mJl5QvpZRtqUtkuSsbcvZEzUVUq0g3a4yVG
	BVVcXg9L/mrOEotcGt8SXWyherJKXXCGSMz3c3kaUw6l6KzfrCxqMnDatwQS23yh1HYf
	0T8g==
X-Received: by 10.180.109.169 with SMTP id ht9mr997760wib.1.1409224406182;
	Thu, 28 Aug 2014 04:13:26 -0700 (PDT)
Received: from localhost (44.175.90.146.dyn.plus.net. [146.90.175.44])
	by mx.google.com with ESMTPSA id
	fo19sm13734654wic.1.2014.08.28.04.13.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 04:13:25 -0700 (PDT)
Date: Thu, 28 Aug 2014 12:13:23 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140828111323.GI26741@stefanha-thinkpad.redhat.com>
References: <53F704BE.6000407@mrs.ro>
 <53F9AF4D.10300@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Li7ckgedzMh1NgdW"
Content-Disposition: inline
In-Reply-To: <53F9AF4D.10300@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::233
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	Valentin Manea <qemu@mrs.ro>, qemu-devel <qemu-devel@nongnu.org>,
	qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Wenchao Xia <xiawenc@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] IDE: MMIO IDE device
 control should be little endian
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
X-List-Received-Date: Thu, 28 Aug 2014 11:13:39 -0000


--Li7ckgedzMh1NgdW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2014 at 01:24:29PM +0400, Michael Tokarev wrote:
> 22.08.2014 12:52, Valentin Manea wrote:
> > Set the IDE MMIO memory type to little endian. The ATA specs identify
> > words part of the control commands encoded as little endian.
> > While this has no impact on little endian systems, it's required for big
> > endian systems(eg OpenRisc).
>=20
> While the patch itself is simple, I'm not sure it is "trivial enough".
> And you didn't Cc neither qemu-devel@ nor the IDE subsystem "odd fixer"
> maintainers (kwolf@ and stefanha@).  I'm not applying this for now to
> trivial tree.

Hi Valentin,
Please resend the patch to qemu-devel@nongnu.org and CC Kevin Wolf
<kwolf@redhat.com> and Stefan Hajnoczi <stefanha@redhat.com>.

All patches must go through the mailing list so the community has a
chance to review and comment before a committer applies them.

Thanks,
Stefan

--Li7ckgedzMh1NgdW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJT/w7TAAoJEJykq7OBq3PI7e8H/3xDbXqPgfLSqdIjwY62JZON
qphiLpnlNoxRky5+CgqdQSBq8YrgDWVzm2dhDPIOFazx/Gp5kF4IzPb/hASKemWD
t90dKl8dCpoRa/bQTGYv6bTJp7v9UDjC+iI4ggaWmAnoQp9FcwUlVXLMXseJu6mY
/iXphItLAdeb3LUKauLxbsr+nhfN/bmB5oo82lZ2h3foIYPSu+ek5IZS7/LKRx0c
PUpYoTh/b563zoM/MsJizG2rTQ9OaP2/Qo1gO0lUyUqajuaoCiZlBVNIvzjZxuwB
P3ZMdGvpLdcy6FVNCNhBPVMdeC3JFu0y2kv/9Gyk+hIRdapQijyWpgp/gUVOGDs=
=yE+2
-----END PGP SIGNATURE-----

--Li7ckgedzMh1NgdW--

