Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hB6fQ-0003dc-1l
	for mharc-qemu-trivial@gnu.org; Mon, 01 Apr 2019 19:48:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hB6fN-0003cH-Mi
	for qemu-trivial@nongnu.org; Mon, 01 Apr 2019 19:48:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hB6fL-0002cG-Rg
	for qemu-trivial@nongnu.org; Mon, 01 Apr 2019 19:48:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43020)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hB6fG-0002VF-W2; Mon, 01 Apr 2019 19:48:31 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79889308626F;
	Mon,  1 Apr 2019 23:38:24 +0000 (UTC)
Received: from localhost (ovpn-116-20.gru2.redhat.com [10.97.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCFFE1001DE1;
	Mon,  1 Apr 2019 23:38:23 +0000 (UTC)
Date: Mon, 1 Apr 2019 20:38:18 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, like.xu@intel.com,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190401233818.GA22884@habkost.net>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-5-git-send-email-like.xu@linux.intel.com>
	<87h8bmuj2d.fsf@zen.linaroharston>
	<2546bf3e-2009-5a76-bc63-0ad73d333a78@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <2546bf3e-2009-5a76-bc63-0ad73d333a78@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 01 Apr 2019 23:38:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/9] cpu/topology: add ARM
 support for smp machine properties
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
X-List-Received-Date: Mon, 01 Apr 2019 23:48:38 -0000

On Mon, Apr 01, 2019 at 10:56:30AM +0800, Like Xu wrote:
> On 2019/3/29 17:27, Alex Benn=E9e wrote:
[...]
> > > @@ -1713,6 +1717,9 @@ static void cortex_a9_initfn(Object *obj)
> > >   #ifndef CONFIG_USER_ONLY
> > >   static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegI=
nfo *ri)
> > >   {
> > > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> >=20
> > How expensive is qdev_get_machine? This could potentially be a
> > performance issue if this register is read a lot.
>=20
> It may not bother us cause the MachineState object would be feteched fr=
om
> qemu QOM at its first requested time and save it as static variable for
> incoming requests.

We already have a current_machine variable declared in
include/hw/boards.h.  We normally avoid using it and use
MACHINE(qdev_get_machine()) instead, but I never understood why.

--=20
Eduardo

