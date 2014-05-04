Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgrfF-0007LK-9I
	for mharc-qemu-trivial@gnu.org; Sun, 04 May 2014 04:20:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wgrf7-0007E3-RT
	for qemu-trivial@nongnu.org; Sun, 04 May 2014 04:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wgrf1-0002Co-Eq
	for qemu-trivial@nongnu.org; Sun, 04 May 2014 04:20:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39769)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wgreo-0002A2-LP; Sun, 04 May 2014 04:20:22 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5900A4048E;
	Sun,  4 May 2014 12:20:12 +0400 (MSK)
Message-ID: <5365F83C.1020707@msgid.tls.msk.ru>
Date: Sun, 04 May 2014 12:20:12 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>
References: <1399030854-23359-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20140504014539.GD1124@T430.nay.redhat.com>
In-Reply-To: <20140504014539.GD1124@T430.nay.redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Makefiles: convert some obj-specific
 CFLAGS to use new foo.o-cflags syntax
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
X-List-Received-Date: Sun, 04 May 2014 08:20:48 -0000

04.05.2014 05:45, Fam Zheng wrote:
> On Fri, 05/02 15:40, Michael Tokarev wrote:
>> Current Makefile system allows using foo.o-cflags variables to store
>> object-specific CFLAGS.  Convert some usages of old syntax
>> (using QEMU_CFLAGS += construct) to the new syntax.
> 
> Thanks for doing this! Two minor comments below, but not showstopper,

Thank you for the review.  I've updated both this patch (to remove extra
space chars) and the bashism one (to fix spelling error in the description).

/mjt


