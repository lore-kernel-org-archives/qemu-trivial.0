Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sn3bX-0003MX-6W
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2012 04:09:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1Sn3bU-0003E6-FD
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2012 04:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1Sn3bP-00036f-RG
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2012 04:09:28 -0400
Received: from mx3-phx2.redhat.com ([209.132.183.24]:37344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1Sn3bD-00033m-Nq; Fri, 06 Jul 2012 04:09:11 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx3-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id q66899Or004977;
	Fri, 6 Jul 2012 04:09:09 -0400
Date: Fri, 06 Jul 2012 04:09:09 -0400 (EDT)
From: Amos Kong <akong@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <a151a8b1-4cf2-4c11-8ce5-a91ebc03415e@zmail13.collab.prod.int.phx2.redhat.com>
In-Reply-To: <m3txxlpcpq.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-Originating-IP: [10.66.115.138]
X-Mailer: Zimbra 7.1.2_GA_3268 (ZimbraWebClient - SAF3 (Linux)/7.1.2_GA_3268)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.24
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, pkrempa@redhat.com,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vnc: add a more
	descriptive error message
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
X-List-Received-Date: Fri, 06 Jul 2012 08:09:30 -0000

----- Original Message -----
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
> > On 06.07.2012 06:42, Amos Kong wrote:
> >> On 30/06/12 10:02, akong@redhat.com wrote:
> >>> From: Amos Kong <akong@redhat.com>
> >>>
> >>> Currently qemu outputs some low-level error in qemu-sockets.c
> >>> when failed to start vnc server.
> >>> eg. 'getaddrinfo(127.0.0.1,5902): Name or service not known'
> >>>
> >>> Some libvirt users could not know what's happened with this
> >>> unclear error message. This patch added a more descriptive
> >>> error message.
> 
> Only libvirt users?  Really?

Actually, it's not clear for all users.
 
> > Gyus, please, pretty PLEASE stop doing things like this.
> >
> > Amos, your patch does TWO things.  One is to clarify error
> > message as correctly stated in your description, and second
> > is to change the code to do exit(1) if this message is
> > generated.  So, please, a) add the second fact to the
> > description, and b) mention why it is needed.


'exit(1)' is the original code, my patch just add an error message.


> Seconded.


Thanks, Amos.


