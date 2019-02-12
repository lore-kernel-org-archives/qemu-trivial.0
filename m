Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtQio-00055c-5B
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 00:35:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gtQil-00052i-35
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 00:35:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gtQij-0001vB-2w
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 00:35:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50296)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gtQiT-0000gU-Qa; Tue, 12 Feb 2019 00:34:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76E0B87623;
	Tue, 12 Feb 2019 05:34:35 +0000 (UTC)
Received: from redhat.com (ovpn-120-96.rdu2.redhat.com [10.10.120.96])
	by smtp.corp.redhat.com (Postfix) with SMTP id BACF562662;
	Tue, 12 Feb 2019 05:34:31 +0000 (UTC)
Date: Tue, 12 Feb 2019 00:34:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, laurent@vivier.eu,
	imammedo@redhat.com, philmd@redhat.com
Message-ID: <20190212003414-mutt-send-email-mst@kernel.org>
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
	<20190212052224.GA4839@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190212052224.GA4839@richard>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 12 Feb 2019 05:34:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3 0/3] Trivial cleanup in hw/acpi
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
X-List-Received-Date: Tue, 12 Feb 2019 05:35:04 -0000

On Tue, Feb 12, 2019 at 01:22:24PM +0800, Wei Yang wrote:
> On Wed, Jan 30, 2019 at 08:06:50AM +0800, Wei Yang wrote:
> >There are several functions/variable which are not used anymore.
> >
> >This serials just remove those without functional change.
> >
> >v3: add ack and repost in a new thread
> >v2: change commit log from "is now used in no place" to "in not used anymore"
> 
> Michael,
> 
> Looks this serials is not merged yet.
> 
> Is there any problem I need to fix?

Yes pls repost with fixed reviewed-by tags.


> >
> >Wei Yang (3):
> >  hw/i386/pc.c: remove unused function pc_acpi_init()
> >  hw/acpi: remove unused function acpi_table_add_builtin()
> >  hw/acpi: remove unnecessary variable acpi_table_builtin
> >
> > hw/acpi/core.c         | 10 +---------
> > hw/i386/pc.c           | 27 ---------------------------
> > include/hw/acpi/acpi.h |  1 -
> > include/hw/i386/pc.h   |  1 -
> > 4 files changed, 1 insertion(+), 38 deletions(-)
> >
> >-- 
> >2.19.1
> 
> -- 
> Wei Yang
> Help you, Help me

