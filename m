Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bYF4p-0003Xc-Vd
	for mharc-qemu-trivial@gnu.org; Fri, 12 Aug 2016 12:12:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bYF4n-0003TI-Tn
	for qemu-trivial@nongnu.org; Fri, 12 Aug 2016 12:12:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bYF4j-0001Qo-Q5
	for qemu-trivial@nongnu.org; Fri, 12 Aug 2016 12:12:53 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:33199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1bYF4j-0001Qh-JW; Fri, 12 Aug 2016 12:12:49 -0400
Received: by mail-wm0-x243.google.com with SMTP id o80so3740568wme.0;
	Fri, 12 Aug 2016 09:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TJNfIlvy7qk6wFRh36S2GNCzE4VFmTjT1hVbiMMNs4Q=;
	b=mXAIlvKfX8i3WoqCqJZDzjLjHz0u5fols5ynvri+A38kJUHmGsMAHNks6tsixyALKx
	Y5/AjpXiZvjgEZO2mgNXcjQt9YVJIhjRZ/X3RxRXyUmKvNBAtzoBrHBWk7pcKVYbS3gb
	8rFnSYwjtcZ/oITfkLWZrmiG3Y8JgDqg8gb4EkIpcjse6HHWNkWnuDfOSKWQRJvk+QI1
	Qi0C1kXiRKAPfTtvStiLTCxSD7EajEvikoUjBuqjnY/k7uleFaREy1LPOgV8b3PZlIFk
	zJbbZ36GLf1by4sUSTXDANxbsnL03qP8CyHU007tHUoido62iezHPqHq1ca9obZO7TEC
	uyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TJNfIlvy7qk6wFRh36S2GNCzE4VFmTjT1hVbiMMNs4Q=;
	b=UbBLpb9Bdx7P9OPT3IIIP2wioQwei9M8CBCq5DFwR9SjZ83Lxn7YJremf/4AELE9ja
	sDjIHuDec8mDWiA+c/eI5QjOMHFal+tosHFbZbavSOJcRwM1D62RG29KilB7i+wPAOOj
	BjeLM9NDDpVuq7YR00/YEGIEQX8GN6WrHV0TbJ/UZwxpEUwv6KYzWOX9JjNv9gIhf/z3
	ugAD0JQBt6PV5mbHiGYgkSFRmru4hlYUrvyjZY9+1Wjjd2VR6NElHeZ15K3ZbYHSSOlm
	1mhaDHGlSBMZbxgi0vs2nygW+5aOmTuJ76lfeT4iCjNT1N8J6UPT9tp7oKaSyle3GKFF
	EVDw==
X-Gm-Message-State: AEkoousb7VUU6mgigOfTKwqZWakfLqCMu2Z2ENuZ3gEUdAYxK6Yxp0vNB2mNqM4AxRVTig==
X-Received: by 10.28.145.20 with SMTP id t20mr1921914wmd.74.1470994589098;
	Fri, 12 Aug 2016 02:36:29 -0700 (PDT)
Received: from localhost (host109-156-67-165.range109-156.btcentralplus.com.
	[109.156.67.165])
	by smtp.gmail.com with ESMTPSA id g7sm6684346wjx.10.2016.08.12.02.36.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Aug 2016 02:36:28 -0700 (PDT)
Date: Fri, 12 Aug 2016 10:36:27 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, berrange@redhat.com
Message-ID: <20160812093627.GC10583@stefanha-x1.localdomain>
References: <1470669081-17860-1-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline
In-Reply-To: <1470669081-17860-1-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.6.2 (2016-07-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [PATCH] trace-events: fix first line comment in
 trace-events
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
X-List-Received-Date: Fri, 12 Aug 2016 16:12:55 -0000


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2016 at 05:11:21PM +0200, Laurent Vivier wrote:
> Documentation is docs/tracing.txt instead of docs/trace-events.txt.
>=20
> find . -name trace-events -exec \
>      sed -i "s?See docs/trace-events.txt for syntax documentation.?See do=
cs/tracing.txt for syntax documentation.?" \
>      {} \;
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  audio/trace-events        | 2 +-
>  block/trace-events        | 2 +-
>  crypto/trace-events       | 2 +-
>  hw/9pfs/trace-events      | 2 +-
>  hw/acpi/trace-events      | 2 +-
>  hw/alpha/trace-events     | 2 +-
>  hw/arm/trace-events       | 2 +-
>  hw/audio/trace-events     | 2 +-
>  hw/block/trace-events     | 2 +-
>  hw/char/trace-events      | 2 +-
>  hw/display/trace-events   | 2 +-
>  hw/dma/trace-events       | 2 +-
>  hw/i386/trace-events      | 2 +-
>  hw/input/trace-events     | 2 +-
>  hw/intc/trace-events      | 2 +-
>  hw/isa/trace-events       | 2 +-
>  hw/misc/trace-events      | 2 +-
>  hw/net/trace-events       | 2 +-
>  hw/nvram/trace-events     | 2 +-
>  hw/pci/trace-events       | 2 +-
>  hw/ppc/trace-events       | 2 +-
>  hw/s390x/trace-events     | 2 +-
>  hw/scsi/trace-events      | 2 +-
>  hw/sd/trace-events        | 2 +-
>  hw/sparc/trace-events     | 2 +-
>  hw/timer/trace-events     | 2 +-
>  hw/usb/trace-events       | 2 +-
>  hw/vfio/trace-events      | 2 +-
>  hw/virtio/trace-events    | 2 +-
>  io/trace-events           | 2 +-
>  linux-user/trace-events   | 2 +-
>  migration/trace-events    | 2 +-
>  net/trace-events          | 2 +-
>  qom/trace-events          | 2 +-
>  target-i386/trace-events  | 2 +-
>  target-ppc/trace-events   | 2 +-
>  target-s390x/trace-events | 2 +-
>  target-sparc/trace-events | 2 +-
>  ui/trace-events           | 2 +-
>  util/trace-events         | 2 +-
>  40 files changed, 40 insertions(+), 40 deletions(-)

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXrZibAAoJEJykq7OBq3PI71cH/jzGGBWZ/Vlz5uFfkDzyuBlW
/iyM89DjOex8npOsTqGa0AFhMkkMts8cl+wmtDPV6j7A1uij0aAbF0DBp1VhRDSD
PDrUklzsL4zb3KTNlLqBqewaoA3pM7j5tuPnuYk3K0/KAUbCWs5j5kC03uHrqdAP
hF54MYiGbWKOp2nyiE8AWOw0clFHNCLeLTQTQXug/MqwouLugnlMSRnZK/qrLSKV
/T4taI0XZayWiHj8vZQ1AzLoX4lOrG1Z2hKeMrPtlVWUHS9DYxz3qwNkSgqH53Jj
Ow1sUkVV6lWzZxgjmlwmGcvPtdR4Klmc0PjbLeOeUdsKBHkbl3Xf7pj8/uXt/GQ=
=5kv8
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--

