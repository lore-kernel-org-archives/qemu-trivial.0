Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2vbQ-00011F-Bo
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2017 04:45:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e2vbN-0000zD-P0
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:45:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e2vbM-0000XU-4f
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:45:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36496)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1e2vbF-0000SU-Ne; Fri, 13 Oct 2017 04:45:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B46FCCCB88;
	Fri, 13 Oct 2017 08:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B46FCCCB88
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-113.pek2.redhat.com [10.72.12.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B85A19E91;
	Fri, 13 Oct 2017 08:45:43 +0000 (UTC)
Date: Fri, 13 Oct 2017 16:45:42 +0800
From: Fam Zheng <famz@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Message-ID: <20171013084542.GB2756@lemon>
References: <20171013012455.10737-1-famz@redhat.com>
	<20171013012455.10737-2-famz@redhat.com>
	<2d524426-1467-8d9b-f216-1014d5b18f00@redhat.com>
	<20171013082046.GA2756@lemon>
	<048daae2-370a-e8cf-ef75-aee2e7a6508a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <048daae2-370a-e8cf-ef75-aee2e7a6508a@redhat.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 13 Oct 2017 08:45:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] MAINTAINERS: Fix scsi
 path
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
X-List-Received-Date: Fri, 13 Oct 2017 08:45:54 -0000

On Fri, 10/13 10:30, Thomas Huth wrote:
> On 13.10.2017 10:20, Fam Zheng wrote:
> > On Fri, 10/13 10:04, Thomas Huth wrote:
> >> On 13.10.2017 03:24, Fam Zheng wrote:
> >>> Signed-off-by: Fam Zheng <famz@redhat.com>
> >>> ---
> >>>  MAINTAINERS | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 772ac209e1..da3c78df47 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -982,7 +982,7 @@ S: Supported
> >>>  F: include/hw/scsi/*
> >>>  F: include/scsi/*
> >>>  F: hw/scsi/*
> >>> -F: util/scsi*
> >>> +F: scsi/*
> >>
> >> scsi/* is already covered by the new "Block SCSI subsystem" section, so
> >> I think you can also simply remove that line instead.
> > 
> > I didn't notice that section existing, should the two be merged into one?
> 
> I don't think so. One section is about the emulated SCSI devices, and
> the other one about the SCSI block backend code, so that's two different
> parts.
> 
> Some other ideas though:
> 
> 1) I think "include/scsi/*" should be removed from the SCSI devices
> section, it is already handled in the "Block SCSI subsystem" - and
> headers that are related to devices should go into include/hw/scsi/
> anyway instead.
> 
> 2) The orphan LSI53C895A section could maybe be removed from the
> MAINTAINERS file? It's of no use in its current "Orphan" state, and the
> file is already covered by the generic SCSI devices section.

OK, that sounds good to me.

Fam

