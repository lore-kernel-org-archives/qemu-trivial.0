Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aOPyz-00030M-16
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jan 2016 08:18:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aOPyu-0002xu-O2
	for qemu-trivial@nongnu.org; Wed, 27 Jan 2016 08:17:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aOPyq-0002pb-On
	for qemu-trivial@nongnu.org; Wed, 27 Jan 2016 08:17:56 -0500
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:45528)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aOPyq-0002pQ-Eu
	for qemu-trivial@nongnu.org; Wed, 27 Jan 2016 08:17:52 -0500
Received: from localhost
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Wed, 27 Jan 2016 13:17:49 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 27 Jan 2016 13:17:48 -0000
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 43A8717D805D; 
	Wed, 27 Jan 2016 13:17:56 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u0RDHl0b46792926; Wed, 27 Jan 2016 13:17:47 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u0RDHlu7004936; Wed, 27 Jan 2016 06:17:47 -0700
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u0RDHjeY004840; Wed, 27 Jan 2016 06:17:46 -0700
Received: from bahia.huguette.org (icon-9-164-176-80.megacenter.de.ibm.com
	[9.164.176.80])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 4127F220439;
	Wed, 27 Jan 2016 14:17:45 +0100 (CET)
Date: Wed, 27 Jan 2016 14:17:43 +0100
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20160127141743.00eebb81@bahia.huguette.org>
In-Reply-To: <56A8B9D6.4020304@msgid.tls.msk.ru>
References: <1453894822-4172-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20160127131531.2c5f75e8@bahia.huguette.org>
	<56A8B9D6.4020304@msgid.tls.msk.ru>
Organization: IBM
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16012713-0013-0000-0000-0000086D5EF3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.109
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] remove libtool support
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
X-List-Received-Date: Wed, 27 Jan 2016 13:17:58 -0000

On Wed, 27 Jan 2016 15:36:38 +0300
Michael Tokarev <mjt@tls.msk.ru> wrote:

> 27.01.2016 15:15, Greg Kurz wrote:
> []
> > Just a few remarks:
> > 
> > [greg@palmb qemu-master]$ grep -r libtool
> > qemu-doc.texi:@item libtool: @uref{http://www.gnu.org/software/libtool/}
> > 
> > Maybe we should drop that line as well ?  
> 
> Hm, it looks like I forgot to commit that change,
> qemu-doc.texi is left locally modified but not comitted.
> Yes, definitely we should do that.
> 
> btw, there's a handy tool `git grep' for that.
> 

Heh thanks :)

> > Also, when reading http://wiki.qemu.org/Contribute/TrivialPatches, I
> > wonder if this can be considered a trivial patch... Can you clarify ?  
> 
> well, I dunno.  To me it is trivial, removing a bunch of unused code
> without touching the rest.  Dunno.
> 

Ok.

> Thanks,
> 
> /mjt
> 


