Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQLv-0004fX-P6
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2018 17:43:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gNQLt-0004dR-UM
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 17:43:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gNQLt-0007RN-4w
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 17:43:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42522)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gNQLo-0007Pr-UH; Thu, 15 Nov 2018 17:43:05 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33EC7FECB;
	Thu, 15 Nov 2018 22:43:04 +0000 (UTC)
Received: from [10.10.123.32] (ovpn-123-32.rdu2.redhat.com [10.10.123.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCE0E5E7C6;
	Thu, 15 Nov 2018 22:43:02 +0000 (UTC)
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, xiezhide@huawei.com,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20181115215449.1300769-1-eblake@redhat.com>
	<b600b483-0e46-5c2e-f52b-2f330ebaa5a7@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e772baf5-80eb-3690-1782-cb2d69302fe3@redhat.com>
Date: Thu, 15 Nov 2018 16:43:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <b600b483-0e46-5c2e-f52b-2f330ebaa5a7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 15 Nov 2018 22:43:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi: Reduce Makefile
 boilerplate
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
X-List-Received-Date: Thu, 15 Nov 2018 22:43:10 -0000

On 11/15/18 4:37 PM, Eric Blake wrote:
> I'm trying to do the same thing to Makefile.objs, but when I use:
>=20
> common-obj-y +=3D $(QAPI_MODULES:%=3Dqapi/qapi-commands-%.o)
>=20
> or the longer $(patsubst %,qapi,qapi-commands-%.o,$(QAPI_MODULES))
>=20
> both before and after the change, 'make print-common-obj-y | grep qapi'=
=20
> returns identical content, but after the change, the linker fails with:
>=20

>=20
> So something about variable expansions is NOT playing nicely with our
>=20
> dummy :=3D $(call unnest-vars,, \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 stub-obj-y \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 chardev-obj-y \
> ...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 common-obj-y \

Aha - the problem is that $(QAPI_MODULES) is empty at the time=20
unnest-vars tries to slurp in Makefile.objs, while it was non-empty at=20
the time that Makefile directly includes it. Moving the definition of=20
QAPI_MODULES into Makefile.objs solves that. v2 coming up.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

