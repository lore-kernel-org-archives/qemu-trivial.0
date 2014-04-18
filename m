Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wb37I-0007t2-A0
	for mharc-qemu-trivial@gnu.org; Fri, 18 Apr 2014 03:21:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wb37B-0007lW-SN
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 03:21:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wb377-00047I-6S
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 03:21:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wb36x-0003zz-Fy; Fri, 18 Apr 2014 03:21:23 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4C9BA41D25;
	Fri, 18 Apr 2014 11:21:22 +0400 (MSK)
Message-ID: <5350D272.6040909@msgid.tls.msk.ru>
Date: Fri, 18 Apr 2014 11:21:22 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>
References: <1394098765-12727-1-git-send-email-imammedo@redhat.com>
	<532B157A.7000601@msgid.tls.msk.ru>
	<20140418091811.05685978@nial.usersys.redhat.com>
In-Reply-To: <20140418091811.05685978@nial.usersys.redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: kwolf@redhat.com, stefanha@redhat.com, qemu-trivial@nongnu.org,
	coreyb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
	mreitz@redhat.com, aliguori@amazon.com, pbonzini@redhat.com,
	lcapitulino@redhat.com, lersek@redhat.com, afaerber@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 0/2] convert -m to
	QemuOpts
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
X-List-Received-Date: Fri, 18 Apr 2014 07:21:42 -0000

18.04.2014 11:18, Igor Mammedov wrote:
> On Thu, 20 Mar 2014 20:21:14 +0400
> Michael Tokarev <mjt@tls.msk.ru> wrote:
> 
>> 06.03.2014 13:39, Igor Mammedov wrote:
>>> Igor Mammedov (1):
>>>   vl: convert -m to QemuOpts
>>
>> This patch (2/2) was mime-damaged, I had to edit it manually
>> in order for it to apply.  Please take a look at
>> http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches-next
>> to verify it's okay.
>>
>> Applied to -trivial.
> seeing your today's PULL trivial req,
> it looks like this patch was lost from your queue,
> could you reapply it please?

It isn't lost, it is waiting in a -next branch.
I just re-sent a previous pullreq which were targetted 2.0
but hasn't been applied for 2.0.

Other stuff (about 20 other patches) is waiting.

Thank you for the reminder.  Having in mind my previous
sloppery with this stuff it is good to be reminded again,
to not repeat past mistakes!

/mjt


