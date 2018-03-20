Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eyEdY-0008AU-Es
	for mharc-qemu-trivial@gnu.org; Tue, 20 Mar 2018 06:37:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1eyEdW-00089E-BX
	for qemu-trivial@nongnu.org; Tue, 20 Mar 2018 06:36:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1eyEdV-0005Hj-LK
	for qemu-trivial@nongnu.org; Tue, 20 Mar 2018 06:36:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48770 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1eyEdR-0005Dg-9C; Tue, 20 Mar 2018 06:36:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3B145AB2E;
	Tue, 20 Mar 2018 10:36:52 +0000 (UTC)
Received: from mapfelba-osx.local (unknown [10.35.7.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8AD010B0F33;
	Tue, 20 Mar 2018 10:36:46 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Yuval Shaia <yuval.shaia@oracle.com>
References: <20180319215335.1119213-1-eblake@redhat.com>
	<831cddaa-3803-10b1-8d6a-e878c97cca73@redhat.com>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <c2da3eac-9646-fd8e-87e7-59766d1eafab@redhat.com>
Date: Tue, 20 Mar 2018 12:36:44 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <831cddaa-3803-10b1-8d6a-e878c97cca73@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 20 Mar 2018 10:36:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 20 Mar 2018 10:36:52 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.12] rdma: Fix 32-bit
 compilation
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
X-List-Received-Date: Tue, 20 Mar 2018 10:36:59 -0000

On 20/03/2018 0:08, Eric Blake wrote:
> On 03/19/2018 04:53 PM, Eric Blake wrote:
>> Use the correct printf formats, so that a 32-bit compile doesn't
>> spit out lots of warnings about %lx being incompatible with uint64_t.
>> Broken since initial commit ef6d4ccd.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>
>> I don't know if 'make vm-build-ubuntu.i368' would catch this (it faile=
d
>> for me for other reasons); I found it via a 32-bit rawhide VM.
>=20
> That fixes most of the warnings,

Thanks!

> but not:
>=20
> /home/dummy/qemu/hw/rdma/rdma_backend.c: In function 'rdma_backend_crea=
te_mr':
> /home/dummy/qemu/hw/rdma/rdma_backend.c:409:37: error: cast to pointer =
from integer of different size
> [-Werror=3Dint-to-pointer-cast]
> =C2=A0=C2=A0=C2=A0=C2=A0 m4->ibmr =3D ibv_reg_m4(pd->ibpd, (void *)addr=
, length, access);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>=20

So the compilation actually brakes on 32bit machines?
I'll create a VM.

Thanks,
Marcel

