Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aLEXz-0000d3-5R
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jan 2016 13:28:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aLEXu-0000Xm-SP
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 13:28:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aLEXs-000864-BB
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 13:28:54 -0500
Received: from e06smtp09.uk.ibm.com ([195.75.94.105]:59851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aLEXs-00085l-1T
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 13:28:52 -0500
Received: from localhost
	by e06smtp09.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Mon, 18 Jan 2016 18:28:49 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp09.uk.ibm.com (192.168.101.139) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 18 Jan 2016 18:28:47 -0000
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2BC552190023; 
	Mon, 18 Jan 2016 18:28:35 +0000 (GMT)
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u0IISkEf8257894; Mon, 18 Jan 2016 18:28:46 GMT
Received: from d06av01.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u0IISk7f003651; Mon, 18 Jan 2016 11:28:46 -0700
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u0IISkr9003648; Mon, 18 Jan 2016 11:28:46 -0700
Received: from bahia.huguette.org (icon-9-167-239-192.megacenter.de.ibm.com
	[9.167.239.192])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 07833220465;
	Mon, 18 Jan 2016 19:28:45 +0100 (CET)
Date: Mon, 18 Jan 2016 19:28:43 +0100
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20160118192843.55ef9d93@bahia.huguette.org>
In-Reply-To: <569D22F6.5070104@msgid.tls.msk.ru>
References: <20160111173036.24764.59878.stgit@bahia.huguette.org>
	<569D22F6.5070104@msgid.tls.msk.ru>
Organization: IBM
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16011818-0037-0000-0000-0000054CCC5F
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.105
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] trace: drop trailing empty strings
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
X-List-Received-Date: Mon, 18 Jan 2016 18:28:56 -0000

On Mon, 18 Jan 2016 20:37:58 +0300
Michael Tokarev <mjt@tls.msk.ru> wrote:

> 11.01.2016 20:30, Greg Kurz wrote:
> 
> > -virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s gpa: %"PRIx64""
> > +virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s gpa: %"PRIx64  
> ...
> 
> I'm not sure what's the value of this.  It's fine either way, no?

The only value is to drop unneeded stuff... and maybe some consistency
with the traces that don't have these trailing empty strings.

> Do we have a rule for trailing empty strings in coding style? :)
> 

Nor we have against parenthesitis, which brings a lot more unneeded
characters into the code :P

More seriously, I posted this because it was discussed earlier this month.

But honestly, I don't care if you don't want to push it. :)

> Thanks,
> 
> /mjt
> 

Cheers.

--
Greg


