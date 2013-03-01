Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UBV9i-0003jN-TM
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2013 13:58:06 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UBV9c-0003QV-Jz
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 13:58:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UBV9a-0002x4-GO
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 13:58:00 -0500
Received: from cantor2.suse.de ([195.135.220.15]:51497 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UBV9X-0002vq-LW; Fri, 01 Mar 2013 13:57:55 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1B34AA4EB7;
	Fri,  1 Mar 2013 19:57:55 +0100 (CET)
Message-ID: <5130FA32.1070107@suse.de>
Date: Fri, 01 Mar 2013 19:57:54 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130215 Thunderbird/17.0.3
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1362157061-438-1-git-send-email-peter.maydell@linaro.org>
	<5130F483.3090003@suse.de>
	<CAFEAcA8x0K5s5FVqaLg-kaoSvZoHQK08OANj7Ax4FcQksLHWVw@mail.gmail.com>
In-Reply-To: <CAFEAcA8x0K5s5FVqaLg-kaoSvZoHQK08OANj7Ax4FcQksLHWVw@mail.gmail.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] pci_host: Drop write-only address_space
	field
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
X-List-Received-Date: Fri, 01 Mar 2013 18:58:05 -0000

Am 01.03.2013 19:50, schrieb Peter Maydell:
> On 1 March 2013 18:33, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
>> Am 01.03.2013 17:57, schrieb Peter Maydell:
>>> The address_space field of PCIHostState was only ever written, never =
used.
>>> Drop it completely.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>=20
> Incidentally I suspect you could if you liked get rid of all
> the uses of PCIHostState in prep.c (and the #include of pci_host.h),
> since it's now only using &pcihost->busdev as an opaque way of
> saying SYS_BUS_DEVICE(dev)).

I believe I do have PCI_DEVICE() and ISA_BUS() changes in my tree. :)

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

