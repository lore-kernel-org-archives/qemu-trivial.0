Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZIB3k-0007ft-0B
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jul 2015 03:36:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZIB3g-0007bi-SQ
	for qemu-trivial@nongnu.org; Thu, 23 Jul 2015 03:36:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZIB3f-0005P1-OZ
	for qemu-trivial@nongnu.org; Thu, 23 Jul 2015 03:36:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZIB3b-0005OL-DZ; Thu, 23 Jul 2015 03:36:43 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id DF674BBB39;
	Thu, 23 Jul 2015 07:36:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-26.ams2.redhat.com
	[10.36.116.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6N7adF3024603
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 23 Jul 2015 03:36:40 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8A79A303F90A; Thu, 23 Jul 2015 09:36:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
References: <1435775149-17285-1-git-send-email-jsnow@redhat.com>
	<20150702113102.39ab42a5@redhat.com> <559BFF5B.4050405@redhat.com>
Date: Thu, 23 Jul 2015 09:36:38 +0200
In-Reply-To: <559BFF5B.4050405@redhat.com> (John Snow's message of "Tue, 07
	Jul 2015 12:33:31 -0400")
Message-ID: <87615biaux.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
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
X-List-Received-Date: Thu, 23 Jul 2015 07:36:50 -0000

John Snow <jsnow@redhat.com> writes:

> On 07/02/2015 11:31 AM, Luiz Capitulino wrote:
>> On Wed,  1 Jul 2015 14:25:49 -0400
>> John Snow <jsnow@redhat.com> wrote:
>> 
>>> I should probably document the changes that were made.

John, what do you mean here?

>>> Signed-off-by: John Snow <jsnow@redhat.com>
>> 
>> Looks good to me, CC'ing maintainer.

Luiz, is this a R-by?

> Whoops, didn't realize Markus took this file over, too. Sorry Luiz.

Don't worry about our maintainer reshuffling.

> Markus, would you consider staging this? It's purely a documentation
> update for only a dev tool, so it doesn't really matter /when/ it lands
> either way, just shoring up some changes I made a while back to the
> interpreter here.
>
> tldr: "ping"

I'm happy to include this in the next pull after it got reviewed.  I'm
ignorant about qmp-shell, because I don't use it myself, so I'd have to
dig through it to verify your documentation is accurate and reasonably
complete.

Fishing for more qualified reviewers:

    $ scripts/get_maintainer.pl --git-blame -f scripts/qmp/qmp-shell 
    Markus Armbruster <armbru@redhat.com> (supporter:QMP)
    Luiz Capitulino <lcapitulino@redhat.com> (authored lines:230/390=59%,commits:10/10=100%)
    John Snow <jsnow@redhat.com> (authored lines:117/390=30%,commits:4/10=40%)
    "Daniel P. Berrange" <berrange@redhat.com> (authored lines:27/390=7%)
    Eric Blake <eblake@redhat.com> (commits:6/10=60%)
    Stefan Hajnoczi <stefanha@redhat.com> (commits:2/10=20%)
    Benoit Canet <benoit@irqsave.net> (commits:1/10=10%)

Luiz, can you review for accuracy and reasonable completeness?

Of course, I'm the reviewer of last resort for anything I maintain,
whether I understand it or not :)

