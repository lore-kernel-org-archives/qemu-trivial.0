Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dL0Jk-0001es-BJ
	for mharc-qemu-trivial@gnu.org; Wed, 14 Jun 2017 00:54:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dL0Ji-0001dH-EI
	for qemu-trivial@nongnu.org; Wed, 14 Jun 2017 00:54:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dL0Jh-0006FW-Ch
	for qemu-trivial@nongnu.org; Wed, 14 Jun 2017 00:54:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39214)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dL0JZ-00066j-IN; Wed, 14 Jun 2017 00:53:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FB1C20B1A;
	Wed, 14 Jun 2017 04:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2FB1C20B1A
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2FB1C20B1A
Received: from localhost (dhcp-14-238.nay.redhat.com [10.66.14.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 727498DDF4;
	Wed, 14 Jun 2017 04:53:50 +0000 (UTC)
Date: Wed, 14 Jun 2017 12:53:49 +0800
From: Fam Zheng <famz@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Cc: thuth@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-ppc@nongnu.org, marcel@redhat.com
Message-ID: <20170614045349.GA25748@lemon>
References: <1497383329-10393-1-git-send-email-thuth@redhat.com>
	<149738389265.243.11409224507286961666@4a9a010726c0>
	<20170614051851-mutt-send-email-mst@kernel.org>
	<20170614023017.GG13420@umbus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170614023017.GG13420@umbus>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 14 Jun 2017 04:53:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/pci-bridge/dec: Classify
 the DEC PCI bridge as bridge device
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
X-List-Received-Date: Wed, 14 Jun 2017 04:54:07 -0000

On Wed, 06/14 10:30, David Gibson wrote:
> On Wed, Jun 14, 2017 at 05:19:18AM +0300, Michael S. Tsirkin wrote:
> > On Tue, Jun 13, 2017 at 12:58:13PM -0700, no-reply@patchew.org wrote:
> > > In file included from /tmp/qemu-test/src/hw/net/vmxnet3.c:30:
> > > /tmp/qemu-test/src/include/migration/register.h:18: error: redefini=
tion of typedef =E2=80=98LoadStateHandler=E2=80=99
> > > /tmp/qemu-test/src/include/migration/vmstate.h:32: note: previous d=
eclaration of =E2=80=98LoadStateHandler=E2=80=99 was here
> > > make: *** [hw/net/vmxnet3.o] Error 1
> > > make: *** Waiting for unfinished jobs....
> > > tests/docker/Makefile.include:118: recipe for target 'docker-run' f=
ailed
> > > make[1]: *** [docker-run] Error 2
> > > make[1]: Leaving directory '/var/tmp/patchew-tester-tmp-dv2lv743/sr=
c'
> > > tests/docker/Makefile.include:149: recipe for target 'docker-run-te=
st-quick@centos6' failed
> > > make: *** [docker-run-test-quick@centos6] Error 2
> > > =3D=3D=3D OUTPUT END =3D=3D=3D
> > >=20
> > > Test command exited with code: 2
> >=20
> > Any idea what's going on here?

Unrelated to this patch. Every patch from today has it.

>=20
> I _think_ that's unrelated to the patch here.  Looks like the
> autobuilder is using a compiler version that doesn't like typedef
> redefinitions, even if they're identical.

RHEL 6 build was broken by commit f2a8f0a6314 (migration: Split registrat=
ion
functions from vmstate.h). The fix is

https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg03173.html

Fam

