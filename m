Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1zBk-0000qJ-3n
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jul 2013 09:33:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1V1zBh-0000q8-IT
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 09:33:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1V1zBf-0007or-P2
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 09:33:05 -0400
Received: from e9.ny.us.ibm.com ([32.97.182.139]:38332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1V1zBf-0007oe-Lu
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 09:33:03 -0400
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Wed, 24 Jul 2013 09:33:02 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e9.ny.us.ibm.com (192.168.1.109) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 24 Jul 2013 09:33:00 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id A23E6C9003E;
	Wed, 24 Jul 2013 09:32:58 -0400 (EDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r6ODWwPS092806; Wed, 24 Jul 2013 09:32:59 -0400
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r6ODWv0T015602; Wed, 24 Jul 2013 07:32:57 -0600
Received: from titi.na.relay.ibm.com (sig-9-48-108-169.mts.ibm.com
	[9.48.108.169])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r6ODWqZ3015280; Wed, 24 Jul 2013 07:32:54 -0600
From: Anthony Liguori <aliguori@us.ibm.com>
To: Ed Maste <emaste@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CAPyFy2BLhkY6hRhadiwP8xeqAyTBLNuG2rT+GuT+bNUQj5EZ5g@mail.gmail.com>
References: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAPyFy2BLhkY6hRhadiwP8xeqAyTBLNuG2rT+GuT+bNUQj5EZ5g@mail.gmail.com>
User-Agent: Notmuch/0.15.2+202~g0c4b8aa (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Wed, 24 Jul 2013 08:32:52 -0500
Message-ID: <87ob9sjd6j.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13072413-7182-0000-0000-000007D69B42
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.139
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL trivial 0/5] trivial patches
	for 2013-07-19
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
X-List-Received-Date: Wed, 24 Jul 2013 13:33:07 -0000

Ed Maste <emaste@freebsd.org> writes:

> On 19 July 2013 05:11, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> This is another trivial-patches pull request.  This time
>> we have just 5 patches accumulated in two (!) weeks period.
>> Please consider apply.
> ...
>> Michael Tokarev (2):
>>       slirp: remove mbuf(m_hdr,m_dat) indirection
>
> Any idea when this might get pulled?  The FreeBSD build is broken
> until this slirp fix makes it in.

Two days ago.

Regards,

Anthony Liguori


