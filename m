Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzNcm-00076P-Vl
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2015 07:11:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YzNck-00073Y-DC
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 07:11:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YzNcj-0006A1-Bq
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 07:11:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55055)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YzNce-00067i-Ho; Mon, 01 Jun 2015 07:11:12 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id BCC7C3989FF;
	Mon,  1 Jun 2015 11:11:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t51BB8nu005026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 1 Jun 2015 07:11:09 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id ABC5B30408A8; Mon,  1 Jun 2015 13:11:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1432925572-487-1-git-send-email-dgilbert@redhat.com>
	<5569C5F9.3080608@msgid.tls.msk.ru>
	<87pp5flvka.fsf@blackfin.pond.sub.org> <20150601092931.GE2314@work-vm>
Date: Mon, 01 Jun 2015 13:11:07 +0200
In-Reply-To: <20150601092931.GE2314@work-vm> (David Alan Gilbert's message of
	"Mon, 1 Jun 2015 10:29:32 +0100")
Message-ID: <87bngzel9w.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, quintela@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] Add -incoming help text
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
X-List-Received-Date: Mon, 01 Jun 2015 11:11:19 -0000

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> Michael Tokarev <mjt@tls.msk.ru> writes:
>> 
>> > 29.05.2015 21:52, Dr. David Alan Gilbert (git) wrote:
>> >> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> >> 
>> >> The help/man text for
>> >> 
>> >> -incoming defer
>> >> 
>> >> didn't make it through the merge of the code that implemented it.
>> >> 
>> >> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> >> ---
>> >>  qemu-options.hx | 6 +++++-
>> >>  1 file changed, 5 insertions(+), 1 deletion(-)
>> >> 
>> >> diff --git a/qemu-options.hx b/qemu-options.hx
>> >> index dad49cf..3085412 100644
>> >> --- a/qemu-options.hx
>> >> +++ b/qemu-options.hx
>> >> @@ -3238,7 +3238,9 @@ DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
>> >>      "-incoming fd:fd\n" \
>> >>      "-incoming exec:cmdline\n" \
>> >>      "                accept incoming migration on given file descriptor\n" \
>> >> -    "                or from given external command\n",
>> >> +    "                or from given external command\n" \
>> >> +    "-incoming defer\n" \
>> >> +    "                wait for the URI to be specified via migrate_incoming\n",
>> >>      QEMU_ARCH_ALL)
>> >>  STEXI
>> >>  @item -incoming tcp:[@var{host}]:@var{port}[,to=@var{maxport}][,ipv4][,ipv6]
>> >> @@ -3254,6 +3256,8 @@ Accept incoming migration from a given filedescriptor.
>> >>  
>> >>  @item -incoming exec:@var{cmdline}
>> >>  Accept incoming migration as an output from specified external command.
>> >> +@item -incoming defer
>> >> +Wait for the URI to be specified via migrate_incoming.
>> >
>> > I wonder what's the reason of mentioning it twice with
>> > such a short and _identical_ text each time...
>> 
>> Because that's the way our documentation works.
>> 
>> The first hunk patches the fourth argument of DEF(), which goes into
>> -help.
>> 
>> The second hunk patches STEXI..ETEXI, which goes via qemu-options.texi
>> into qemu.1 and qemu-doc.{dvi,info,html,pdf}.
>> 
>> >                                                 Maybe
>> > it's a good idea to reword the second message a bit.
>> > Because actually it is not clear what does the whole
>> > thing mean, what qemu will do when starting? Will it
>> > accept other commands?
>> 
>> You're right in that .texi allows more verbose explanations than -help.
>> 
>> David's text looks okay to me as is.  Perhaps your questions inspire
>> further improvements.
>
> How about changing the second part to.
>
> +@item -incoming defer
> +Wait for the URI to be specified via migrate_incoming.  The monitor can
> +be used to change settings (such as migration parameters) prior to issuing
> +the migrate_incoming to allow the migration to begin.

I like it.

Preferably with this improvement:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

