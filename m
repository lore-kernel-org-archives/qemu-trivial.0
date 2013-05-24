Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UfrBf-0001tK-Eb
	for mharc-qemu-trivial@gnu.org; Fri, 24 May 2013 08:33:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1UfrBX-0001sM-IW
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 08:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1UfrBP-0002fZ-HX
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 08:33:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1UfrBP-0002fO-Aq; Fri, 24 May 2013 08:33:19 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4OCXFTt001829
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 24 May 2013 08:33:15 -0400
Received: from localhost (vpn1-6-157.ams2.redhat.com [10.36.6.157])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4OCXDYw014551; Fri, 24 May 2013 08:33:14 -0400
Date: Fri, 24 May 2013 13:33:10 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130524123310.GA20470@redhat.com>
References: <1369390765-32117-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1369390765-32117-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Voevodin <e.voevodin@samsung.com>,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, Paul Brook <paul@codesourcery.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove unnecessary break
	statements
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 24 May 2013 12:33:34 -0000


On Fri, May 24, 2013 at 12:19:25PM +0200, Stefan Weil wrote:
> Fix these warnings from cppcheck:
> 
> hw/display/cirrus_vga.c:2603:
> hw/sd/sd.c:348:
> hw/timer/exynos4210_mct.c:1033:
> target-arm/translate.c:9886:
> target-s390x/mem_helper.c:518:
> target-unicore32/translate.c:1936:
>  style: Consecutive return, break, continue, goto or throw statements are unnecessary.

I'm not sure what cppcheck does, but I spotted an unnecessary break
statement in the watchdog code a few days ago:

http://git.qemu.org/?p=qemu.git;a=blob;f=hw/watchdog/watchdog.c;h=cb4e1f9e479f934532fcd4d07528feccba812b79;hb=HEAD#l131
(line 131)

So it's obviously not finding them all :-(

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

