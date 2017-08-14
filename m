Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhFA2-0008MF-QP
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 09:12:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dhFA0-0008JO-LI
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 09:12:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dhF9z-0002Ki-My
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 09:12:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46444)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dhF9v-0002ID-49; Mon, 14 Aug 2017 09:11:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 031A2554D5;
	Mon, 14 Aug 2017 13:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 031A2554D5
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=imammedo@redhat.com
Received: from nial.brq.redhat.com (ovpn-116-93.ams2.redhat.com [10.36.116.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 607FD61344;
	Mon, 14 Aug 2017 13:11:52 +0000 (UTC)
Date: Mon, 14 Aug 2017 15:11:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, QEMU Trivial
	<qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>, QEMU Developers
	<qemu-devel@nongnu.org>
Message-ID: <20170814151150.415977c9@nial.brq.redhat.com>
In-Reply-To: <CAFEAcA-Jac8wFzQ9vRyKjcEwDKYBdXysNyDP7ERFfXFhVcF56w@mail.gmail.com>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
	<a808c0865b720e22ca2929ec3d362d4610fbad51.1502708830.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA-Jac8wFzQ9vRyKjcEwDKYBdXysNyDP7ERFfXFhVcF56w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 14 Aug 2017 13:11:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 7/7] hw/misc/mmio_interface:
 Return after error_setg() to avoid crash
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
X-List-Received-Date: Mon, 14 Aug 2017 13:12:01 -0000

On Mon, 14 Aug 2017 12:45:16 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 14 August 2017 at 12:07, Michael Tokarev <mjt@tls.msk.ru> wrote:
> > From: Thomas Huth <thuth@redhat.com>
> >
> > QEMU currently abort()s if the user tries to specify the mmio_interface
> > device without parameters:
> >
> > x86_64-softmmu/qemu-system-x86_64 -nographic -device mmio_interface
> > qemu-system-x86_64: /home/thuth/devel/qemu/util/error.c:57: error_setv:
> >  Assertion `*errp == ((void *)0)' failed.
> > Aborted (core dumped)
> >
> > This happens because the realize function is trying to set the errp
> > twice in this case. After setting an error, the realize function
> > should immediately return instead.  
> 
> It seems like it should be an error to permit this to be
> created from the command line at all -- the device is intended
> only as an internal implementation detail of the memory system,
> and it has a PROP_PTR property which can't be sensibly set
> from the command line.
> 
> This patch is a correct fix for an immediate problem, but we should disable
> using this via -device somehow.

Setting DeviceClass::user_creatable to false should prevent creating device
with device_add interface. See: qdev_get_device_class()

> 
> thanks
> -- PMM
> 


