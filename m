Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJZ7U-0004w3-JO
	for mharc-qemu-trivial@gnu.org; Sun, 26 Jul 2015 23:30:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZJZ7Q-0004t0-Io
	for qemu-trivial@nongnu.org; Sun, 26 Jul 2015 23:30:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZJZ7P-0003Ev-CM
	for qemu-trivial@nongnu.org; Sun, 26 Jul 2015 23:30:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZJZ7J-0003A6-HP; Sun, 26 Jul 2015 23:30:17 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 5279991D00;
	Mon, 27 Jul 2015 03:30:16 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-56-220.rdu2.redhat.com
	[10.10.56.220])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6R3UCwV017542; Sun, 26 Jul 2015 23:30:13 -0400
Message-ID: <55B5A5C3.2070705@redhat.com>
Date: Sun, 26 Jul 2015 23:30:11 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1435775149-17285-1-git-send-email-jsnow@redhat.com>	<20150702113102.39ab42a5@redhat.com>
	<559BFF5B.4050405@redhat.com>
	<87615biaux.fsf@blackfin.pond.sub.org>
In-Reply-To: <87615biaux.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
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
X-List-Received-Date: Mon, 27 Jul 2015 03:30:26 -0000



On 07/23/2015 03:36 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 07/02/2015 11:31 AM, Luiz Capitulino wrote:
>>> On Wed,  1 Jul 2015 14:25:49 -0400
>>> John Snow <jsnow@redhat.com> wrote:
>>>
>>>> I should probably document the changes that were made.
> 
> John, what do you mean here?
> 

I'm sorry, Markus.

It's a giant circle of people just barely out of the loop. During the
2.4 window I augmented the QMP shell tool to be able to issue
transactional commands, and improved the json/python parsing for the
key=value pairs.

It was primarily motivated by wanting an easy way to issue and test
bitmap commands.

Eric Blake knows the most about the improvements, as he was the original
reviewer, but you know how this list likes to strip him out of the CC
fields.

>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>
>>> Looks good to me, CC'ing maintainer.
> 
> Luiz, is this a R-by?
> 
>> Whoops, didn't realize Markus took this file over, too. Sorry Luiz.
> 
> Don't worry about our maintainer reshuffling.
> 
>> Markus, would you consider staging this? It's purely a documentation
>> update for only a dev tool, so it doesn't really matter /when/ it lands
>> either way, just shoring up some changes I made a while back to the
>> interpreter here.
>>
>> tldr: "ping"
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

