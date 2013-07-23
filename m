Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1jUT-0005fO-Uo
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jul 2013 16:47:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1V1jUR-0005ey-Sn
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 16:47:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1V1jUO-0003ET-EO
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 16:47:23 -0400
Received: from e38.co.us.ibm.com ([32.97.110.159]:60136)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1V1jUO-0003DK-8S
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 16:47:20 -0400
Received: from /spool/local
	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Tue, 23 Jul 2013 14:47:17 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
	by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 23 Jul 2013 14:47:15 -0600
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id B75913E4005B;
	Tue, 23 Jul 2013 14:46:52 -0600 (MDT)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r6NKlEuD164732; Tue, 23 Jul 2013 14:47:14 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r6NKlEhU021947; Tue, 23 Jul 2013 14:47:14 -0600
Received: from titi.na.relay.ibm.com (titi.austin.ibm.com [9.41.105.234])
	by d03av03.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r6NKlCoW021808; Tue, 23 Jul 2013 14:47:13 -0600
From: Anthony Liguori <aliguori@us.ibm.com>
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <51EEE3CB.5030300@weilnetz.de>
References: <1373057744-20278-1-git-send-email-sw@weilnetz.de>
	<51E4D733.6090908@weilnetz.de> <51E84766.20603@weilnetz.de>
	<51EEE3CB.5030300@weilnetz.de>
User-Agent: Notmuch/0.15.2+202~g0c4b8aa (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Tue, 23 Jul 2013 15:47:12 -0500
Message-ID: <874nbluhpr.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13072320-5518-0000-0000-000010932BB7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.159
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] po/Makefile: Fix
	regression and some minor issues
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
X-List-Received-Date: Tue, 23 Jul 2013 20:47:25 -0000

Stefan Weil <sw@weilnetz.de> writes:

> Am 18.07.2013 21:52, schrieb Stefan Weil:
>> Am 16.07.2013 07:16, schrieb Stefan Weil:
>>> Am 05.07.2013 22:55, schrieb Stefan Weil:
>>>> These patches are included:
>>>>
>>>> [PATCH 1/4] po/Makefile: Fix and improve help message
>>>> [PATCH 2/4] po/Makefile: Fix *.mo generation for out-of-tree builds
>>>> [PATCH 3/4] po/Makefile: Fix generation of messages.po
>>>> [PATCH 4/4] po/Makefile: Use macro quiet-command for nice looking
>>>>
>>>> Regards
>>>> Stefan W.
>>> Ping?
>> Ping^2
>>
>
> Ping^3
>
> Who is maintaining GTK? Anthony?
>
> Is there any chance to get some of the issues which
> are addressed by this series fixed in the next version of
> QEMU?
>
> Patch 1 certainly could also be applied via qemu-trivial,
> maybe some of the others, too. See
> http://patchwork.ozlabs.org/patch/257202/.

I really don't understand why, but patches completely ignored this
thread so I haven't seen it until this ping.  I can't see any reason off
hand but will investigate further.

Is it possible you sent this differently than you have sent series in
the past?

At any rate, it's enqueued now, will push shortly after testing
completes.  Sorry about that.

Regards,

Anthony Liguori

>
> Stefan


