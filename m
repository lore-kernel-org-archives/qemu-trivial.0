Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db47j-0006UH-8v
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:12:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db47e-0006Q8-3X
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:12:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db47b-0004D7-9Y
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:12:02 -0400
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:37926)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1db47b-0004CP-3v; Fri, 28 Jul 2017 08:11:59 -0400
Received: by mail-wm0-x234.google.com with SMTP id m85so115872405wma.1;
	Fri, 28 Jul 2017 05:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kgKgXvuFazMX4pp1AKPUQiEtO1vchTqUY5LfCCAlkgA=;
	b=dpaF6wq2r18Qj5vaxL2m54SF4mUvTLxYe40W4yNIum/47ZEKGuh98M4D94CNFmFeSD
	rPT7WqHStyL8UdKV2bmxDwYmPddxGGrpTXgAzenCDRoHdp0zxFaOK/hvMIj4Sp1qPwdl
	p0/cM/19mR9Ykj/LHx5b7FQK7nn0IbdnNKBVhZtOUJRw761NWlTeNQBF62TlkSUbC0gB
	/OI8xuDFW4xkbw1BOL9eTGiX7Z0cQpwHqaGAylc/or60DnxU21OS1CAwDc0GwauWzjX4
	S8hqKnULwVEyTfZeGbZcfzZeUQHLD/luAg73XifCP4CSbYA/8TSqteyzG+TT9QG6gJ0D
	MN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kgKgXvuFazMX4pp1AKPUQiEtO1vchTqUY5LfCCAlkgA=;
	b=IPhpWC0t/ZpaDYsNFppKXImAK1nRA6DwOu9yv6+CvEtAlfmQSiBWFN1CZd+oPsnzyh
	o17dXWoZCDIaVy36bBvuP1lxMhwJVod6nmir7hZIUDDzvpkZP7iJNtb4OEbUWCy/3XCT
	ek+7IbPZlZsUjjOx+qc/7vVSyNW4qSW1XP+PVVDPXgUC9LEuftZHrONjHM+oQLDFCsOJ
	q+FNOnDDIBZI4847qynJIS8vpTcMKe7QUX7tKBSM7FmnZ0t3CsrHZqz6TT0tD5TMug1P
	T3YN36Iqzfb16dsSeVzm7G8J3bwm1zoTPDXi71lszQmqaYcPwHhvEvgM+ujVto78PF5G
	lGVA==
X-Gm-Message-State: AIVw112nKgrLnHi3P2ZxX3pmztmmBUX5XuQkH6CGJl9RrxF62VfmmWpb
	JC8dcNK+R0la8g==
X-Received: by 10.80.157.136 with SMTP id w8mr6466209ede.224.1501243918072;
	Fri, 28 Jul 2017 05:11:58 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	c57sm3428644eda.46.2017.07.28.05.11.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 05:11:57 -0700 (PDT)
Date: Fri, 28 Jul 2017 13:11:56 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Message-ID: <20170728121156.GG12364@stefanha-x1.localdomain>
References: <20170728012542.29975-1-f4bug@amsat.org>
	<20170728012542.29975-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TmwHKJoIRFM7Mu/A"
Content-Disposition: inline
In-Reply-To: <20170728012542.29975-6-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 5/8] docs: fix
 broken paths to docs/devel/tracing.txt
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
X-List-Received-Date: Fri, 28 Jul 2017 12:12:06 -0000


--TmwHKJoIRFM7Mu/A
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 10:25:39PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  audio/trace-events              | 2 +-
>  block/trace-events              | 2 +-
>  chardev/trace-events            | 2 +-
>  crypto/trace-events             | 2 +-
>  hw/9pfs/trace-events            | 2 +-
>  hw/acpi/trace-events            | 2 +-
>  hw/alpha/trace-events           | 2 +-
>  hw/arm/trace-events             | 2 +-
>  hw/audio/trace-events           | 2 +-
>  hw/block/dataplane/trace-events | 2 +-
>  hw/block/trace-events           | 2 +-
>  hw/char/trace-events            | 2 +-
>  hw/display/trace-events         | 2 +-
>  hw/dma/trace-events             | 2 +-
>  hw/i386/trace-events            | 2 +-
>  hw/input/trace-events           | 2 +-
>  hw/intc/trace-events            | 2 +-
>  hw/isa/trace-events             | 2 +-
>  hw/mem/trace-events             | 2 +-
>  hw/misc/trace-events            | 2 +-
>  hw/net/trace-events             | 2 +-
>  hw/nvram/trace-events           | 2 +-
>  hw/pci/trace-events             | 2 +-
>  hw/ppc/trace-events             | 2 +-
>  hw/s390x/trace-events           | 2 +-
>  hw/scsi/trace-events            | 2 +-
>  hw/sd/trace-events              | 2 +-
>  hw/sparc/trace-events           | 2 +-
>  hw/timer/trace-events           | 2 +-
>  hw/usb/trace-events             | 2 +-
>  hw/vfio/trace-events            | 2 +-
>  hw/virtio/trace-events          | 2 +-
>  hw/xen/trace-events             | 2 +-
>  io/trace-events                 | 2 +-
>  linux-user/trace-events         | 2 +-
>  migration/trace-events          | 2 +-
>  net/trace-events                | 2 +-
>  qom/trace-events                | 2 +-
>  scripts/simpletrace.py          | 2 +-
>  target/arm/trace-events         | 2 +-
>  target/i386/trace-events        | 2 +-
>  target/mips/trace-events        | 2 +-
>  target/ppc/trace-events         | 2 +-
>  target/s390x/trace-events       | 2 +-
>  target/sparc/trace-events       | 2 +-
>  ui/trace-events                 | 2 +-
>  util/trace-events               | 2 +-
>  47 files changed, 47 insertions(+), 47 deletions(-)

Thank you!

301 Moved Permanently :)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--TmwHKJoIRFM7Mu/A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZeyoMAAoJEJykq7OBq3PIz84H/1T1TgPN2VmasG9mRekfOIVm
jIT6NyigfudjMtI2XTtx7PeIQqHej2xg0PiFzj+WWXzui2iBzD35US8C7o/QCIEz
7qYoZn9GfwSF4SdnBCmwXfpEChYrDb21fyfOeMQhwob4j1girzfaE2pmHnkBiP7X
5JGDf2JujoGVAL2du1BkRxILfPNjKzqERfZ0hfpn+yTg4GzY4hqSEeBKF0dbNmEe
zdp5oyLvc91iXVVyhj4Nn/5JjEfg9NJ8IdVUBxAxsxFFdpl3URVlhOcIWKFAFUhk
n/suCuNfSTutf+xYYfX/JQ/RcjSJT97G2R3hySgFnzVHnQyBLvCklr/lQ+i04/E=
=QPjd
-----END PGP SIGNATURE-----

--TmwHKJoIRFM7Mu/A--

