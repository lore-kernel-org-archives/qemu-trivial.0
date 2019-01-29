Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goToB-0007pT-2M
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 08:52:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1goTo8-0007nH-Im
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 08:52:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1goTo7-0003x2-Qz
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 08:52:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38338)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1goTo0-0003th-RH; Tue, 29 Jan 2019 08:52:00 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D16B806B5;
	Tue, 29 Jan 2019 13:52:00 +0000 (UTC)
Received: from gondolin (dhcp-192-213.str.redhat.com [10.33.192.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BA1A6E712;
	Tue, 29 Jan 2019 13:51:59 +0000 (UTC)
Date: Tue, 29 Jan 2019 14:51:56 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-s390x@nongnu.org
Message-ID: <20190129145156.6719b8a4.cohuck@redhat.com>
In-Reply-To: <1548769067-20792-1-git-send-email-thuth@redhat.com>
References: <1548769067-20792-1-git-send-email-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 29 Jan 2019 13:52:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] target/s390x: Fix LGPL version in the
 file header comments
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
X-List-Received-Date: Tue, 29 Jan 2019 13:52:09 -0000

On Tue, 29 Jan 2019 14:37:47 +0100
Thomas Huth <thuth@redhat.com> wrote:

> It's either "GNU *Library* General Public License version 2" or
> "GNU Lesser General Public License version *2.1*", but there was
> no "version 2.0" of the "Lesser" license. So assume that version
> 2.1 is meant here.

I think we can assume that.

Given that there have been several of these cases (and that there's a
lot of boilerplate in general): Should we adopt SPDX license
identifiers for QEMU, as the Linux kernel did? They also discovered and
fixed some problems/oddities while at it.

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/s390x/cc_helper.c   | 2 +-
>  target/s390x/excp_helper.c | 2 +-
>  target/s390x/fpu_helper.c  | 2 +-
>  target/s390x/gdbstub.c     | 2 +-
>  target/s390x/helper.c      | 2 +-
>  target/s390x/int_helper.c  | 2 +-
>  target/s390x/mem_helper.c  | 2 +-
>  target/s390x/misc_helper.c | 2 +-
>  target/s390x/translate.c   | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)

Is this going through the trivial tree? If so,

Acked-by: Cornelia Huck <cohuck@redhat.com>

I can also take this through the s390x tree.

