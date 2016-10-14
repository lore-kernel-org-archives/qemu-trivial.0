Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1busab-0002L8-Kd
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2016 22:51:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1busaZ-0002Iu-Ku
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 22:51:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1busaX-000837-NB
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 22:51:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58670)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1busaP-000818-ID; Thu, 13 Oct 2016 22:51:05 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 00DDA4E33E;
	Fri, 14 Oct 2016 02:51:03 +0000 (UTC)
Received: from localhost (vpn1-7-155.pek2.redhat.com [10.72.7.155])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9E2oxBG020489; Thu, 13 Oct 2016 22:51:00 -0400
Date: Fri, 14 Oct 2016 10:50:58 +0800
From: Fam Zheng <famz@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Victor Kaplansky <victork@redhat.com>,
	Michael Tsirkin <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Sascha Silbe <x-qemu@se-silbe.de>,
	David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20161014025058.GA14830@lemon>
References: <1476199177-32411-1-git-send-email-thuth@redhat.com>
	<1476199177-32411-3-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476199177-32411-3-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 14 Oct 2016 02:51:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] tests/boot-sector: Use
 mkstemp() to create a unique file name
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
X-List-Received-Date: Fri, 14 Oct 2016 02:51:16 -0000

On Tue, 10/11 17:19, Thomas Huth wrote:
> The pxe-test is run for three different targets now (x86_64, i386
> and ppc64), and the bios-tables-test is run for two targets (x86_64
> and i386). But each of the tests is using an invariant name for the
> disk image with the boot sector code - so if the tests are running in
> parallel, there is a race condition that they destroy the disk image
> of a parallel test program. Let's use mkstemp() to create unique
> temporary files here instead - and since mkstemp() is returning an
> integer file descriptor instead of a FILE pointer, we also switch
> the fwrite() and fclose() to write() and close() instead.
> 
> Reported-by: Sascha Silbe <x-qemu@se-silbe.de>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Tested-by: Fam Zheng <famz@redhat.com>

