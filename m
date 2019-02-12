Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtYhS-0001hH-GW
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 09:06:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gtYhP-0001fj-Ch
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:06:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gtYhJ-0006I2-Ss
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:06:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50290)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gtYhB-000610-UW; Tue, 12 Feb 2019 09:05:58 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DC8A88E6B;
	Tue, 12 Feb 2019 14:05:50 +0000 (UTC)
Received: from redhat.com (ovpn-120-96.rdu2.redhat.com [10.10.120.96])
	by smtp.corp.redhat.com (Postfix) with SMTP id 9DB315D9D1;
	Tue, 12 Feb 2019 14:05:48 +0000 (UTC)
Date: Tue, 12 Feb 2019 09:05:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	qemu-trivial@nongnu.org
Message-ID: <20190212090538-mutt-send-email-mst@kernel.org>
References: <20190212134758.10514-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190212134758.10514-1-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 12 Feb 2019 14:05:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 0/4] a few trivials
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
X-List-Received-Date: Tue, 12 Feb 2019 14:06:13 -0000

On Tue, Feb 12, 2019 at 01:47:54PM +0000, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Just cleaning out my trivial pile; a few more traces and
> a couple of error reporting tweaks.
> 
> Dave

Looks sane

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> 
> Dr. David Alan Gilbert (4):
>   pckbd: Convert DPRINTF->trace
>   HMP: Prepend errors with 'Error:'
>   kvm: Add kvm_set_ioeventfd* traces
>   wavcapture: Convert to error_report
> 
>  accel/kvm/kvm-all.c    |  3 +++
>  accel/kvm/trace-events |  2 ++
>  audio/wavcapture.c     | 39 +++++++++++++++++----------------------
>  hmp.c                  |  2 +-
>  hw/input/pckbd.c       | 19 ++++++-------------
>  hw/input/trace-events  |  7 +++++++
>  6 files changed, 36 insertions(+), 36 deletions(-)
> 
> -- 
> 2.20.1

