Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZKp8W-00060s-8x
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jul 2015 10:48:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1ZKp8Q-0005qE-SZ
	for qemu-trivial@nongnu.org; Thu, 30 Jul 2015 10:48:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1ZKp8O-0006TB-Kt
	for qemu-trivial@nongnu.org; Thu, 30 Jul 2015 10:48:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1ZKp8G-0006O2-Kx; Thu, 30 Jul 2015 10:48:28 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 41AA92B648A;
	Thu, 30 Jul 2015 14:48:27 +0000 (UTC)
Received: from localhost (ovpn-113-87.phx2.redhat.com [10.3.113.87])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6UEmOXD031722; Thu, 30 Jul 2015 10:48:25 -0400
Date: Thu, 30 Jul 2015 10:48:24 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20150730104824.1e87989d@redhat.com>
In-Reply-To: <87615biaux.fsf@blackfin.pond.sub.org>
References: <1435775149-17285-1-git-send-email-jsnow@redhat.com>
	<20150702113102.39ab42a5@redhat.com> <559BFF5B.4050405@redhat.com>
	<87615biaux.fsf@blackfin.pond.sub.org>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-shell: add documentation
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
X-List-Received-Date: Thu, 30 Jul 2015 14:48:42 -0000

On Thu, 23 Jul 2015 09:36:38 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
> 
> > On 07/02/2015 11:31 AM, Luiz Capitulino wrote:
> >> On Wed,  1 Jul 2015 14:25:49 -0400
> >> John Snow <jsnow@redhat.com> wrote:
> >> 
> >>> I should probably document the changes that were made.
> 
> John, what do you mean here?
> 
> >>> Signed-off-by: John Snow <jsnow@redhat.com>
> >> 
> >> Looks good to me, CC'ing maintainer.
> 
> Luiz, is this a R-by?

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

This one is :)

> 
> > Whoops, didn't realize Markus took this file over, too. Sorry Luiz.
> 
> Don't worry about our maintainer reshuffling.
> 
> > Markus, would you consider staging this? It's purely a documentation
> > update for only a dev tool, so it doesn't really matter /when/ it lands
> > either way, just shoring up some changes I made a while back to the
> > interpreter here.
> >
> > tldr: "ping"
> 
> I'm happy to include this in the next pull after it got reviewed.  I'm
> ignorant about qmp-shell, because I don't use it myself, so I'd have to
> dig through it to verify your documentation is accurate and reasonably
> complete.
> 
> Fishing for more qualified reviewers:
> 
>     $ scripts/get_maintainer.pl --git-blame -f scripts/qmp/qmp-shell 
>     Markus Armbruster <armbru@redhat.com> (supporter:QMP)
>     Luiz Capitulino <lcapitulino@redhat.com> (authored lines:230/390=59%,commits:10/10=100%)
>     John Snow <jsnow@redhat.com> (authored lines:117/390=30%,commits:4/10=40%)
>     "Daniel P. Berrange" <berrange@redhat.com> (authored lines:27/390=7%)
>     Eric Blake <eblake@redhat.com> (commits:6/10=60%)
>     Stefan Hajnoczi <stefanha@redhat.com> (commits:2/10=20%)
>     Benoit Canet <benoit@irqsave.net> (commits:1/10=10%)
> 
> Luiz, can you review for accuracy and reasonable completeness?
> 
> Of course, I'm the reviewer of last resort for anything I maintain,
> whether I understand it or not :)
> 


