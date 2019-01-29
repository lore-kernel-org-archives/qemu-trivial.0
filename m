Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goVmv-00045E-8P
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 10:59:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1goVmt-00042F-09
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 10:58:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1goVms-0000Um-9B
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 10:58:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45268)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1goVmq-0000U9-Ez; Tue, 29 Jan 2019 10:58:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C76E8666F;
	Tue, 29 Jan 2019 15:58:55 +0000 (UTC)
Received: from redhat.com (ovpn-123-79.rdu2.redhat.com [10.10.123.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E14196BC2F;
	Tue, 29 Jan 2019 15:58:50 +0000 (UTC)
Date: Tue, 29 Jan 2019 10:58:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Laurent Vivier <laurent@vivier.eu>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	imammedo@redhat.com, qemu-devel@nongnu.org
Message-ID: <20190129105828-mutt-send-email-mst@kernel.org>
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-1-richardw.yang@linux.intel.com>
	<feb8687e-0d0c-a20a-9b37-c8284aaae9f5@redhat.com>
	<20190129080455.GA10084@richard>
	<91c53c72-8e9c-f68d-1dc8-f6320ed3dfc0@redhat.com>
	<f6f1703e-1c77-055e-1906-300df3c79479@vivier.eu>
	<20190129153254.r7y2vto4ltxsivpj@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190129153254.r7y2vto4ltxsivpj@master>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 29 Jan 2019 15:58:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/3] Trivial cleanup in
 hw/acpi
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
X-List-Received-Date: Tue, 29 Jan 2019 15:59:00 -0000

On Tue, Jan 29, 2019 at 03:32:54PM +0000, Wei Yang wrote:
> On Tue, Jan 29, 2019 at 09:43:20AM +0100, Laurent Vivier wrote:
> >On 29/01/2019 09:23, Philippe Mathieu-Daud=E9 wrote:
> >> On 1/29/19 9:04 AM, Wei Yang wrote:
> >>> On Tue, Jan 29, 2019 at 07:56:54AM +0100, Philippe Mathieu-Daud=E9 =
wrote:
> >>>> Hi Wei,
> >>>>
> >>>> On 1/29/19 1:08 AM, Wei Yang wrote:
> >>>>> There are several functions/variable which are not used anymore.
> >>>>>
> >>>>> This serials just remove those without functional change.
> >>>>>
> >>>>> Wei Yang (3):
> >>>>>   hw/i386/pc.c: remove unused function pc_acpi_init()
> >>>>>   hw/acpi: remove unused function acpi_table_add_builtin()
> >>>>>   hw/acpi: remove unnecessary variable acpi_table_builtin
> >>>>>
> >>>>>  hw/acpi/core.c         | 10 +---------
> >>>>>  hw/i386/pc.c           | 27 ---------------------------
> >>>>>  include/hw/acpi/acpi.h |  1 -
> >>>>>  include/hw/i386/pc.h   |  1 -
> >>>>>  4 files changed, 1 insertion(+), 38 deletions(-)
> >>>>>
> >>>>
> >>>> Please do not post iterated series in reply to previous version, b=
ut as
> >>>> new thread:
> >>>> - patches are parsed by scripts
> >>>> - some email clients can tag a thread as "reviewed, skip" and repl=
ies to
> >>>> this thread will be masked.
> >>>>
> >>>
> >>> Well, do I need to repost it in a new thread?
> >>=20
> >> It depends who will take this patchset and his mood :)
> >> Let's wait and see.
> >>=20
> >
> >No need to repost if they go through the trivial branch.
>=20
> Thanks :-)
>=20
> >
> >Thanks,
> >Laurent

Pls repost with all acks etc and I'll pick it up.

> --=20
> Wei Yang
> Help you, Help me

