Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WjmPp-0000EH-Sq
	for mharc-qemu-trivial@gnu.org; Mon, 12 May 2014 05:20:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WjmPj-0008UK-Ue
	for qemu-trivial@nongnu.org; Mon, 12 May 2014 05:20:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WjmPf-00064S-1K
	for qemu-trivial@nongnu.org; Mon, 12 May 2014 05:20:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WjmPT-00063T-PK; Mon, 12 May 2014 05:20:35 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4C9KYjr030671
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 12 May 2014 05:20:35 -0400
Received: from blackfin.pond.sub.org (ovpn-116-46.ams2.redhat.com
	[10.36.116.46])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4C9KVFF010551
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 12 May 2014 05:20:33 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 30F92200D2; Mon, 12 May 2014 11:20:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1399569594-31678-1-git-send-email-mjt@msgid.tls.msk.ru>
	<536F2DC0.9080809@redhat.com> <536F6180.1010905@msgid.tls.msk.ru>
Date: Mon, 12 May 2014 11:20:31 +0200
In-Reply-To: <536F6180.1010905@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Sun, 11 May 2014 15:39:44 +0400")
Message-ID: <87mwenz734.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Alon Levy <alevy@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libcacard: remove useless
	initializers
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
X-List-Received-Date: Mon, 12 May 2014 09:20:57 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 11.05.2014 11:58, Alon Levy wrote:
>> On 05/08/2014 08:19 PM, Michael Tokarev wrote:
>>> libcacard has many functions which initializes local variables
>>> at declaration time, which are always assigned some values later
>>> (often right after declaration).  Clean up these initializers.
>> 
>> How is this an improvement? Doesn't the compiler ignore this anyhow?
>
> Just less code.
>
> To me, when I see something like
>
>   Type *var = NULL;
>
> in a function, it somehow "translates" to a construct like
>
>   Type *found = NULL;
>
> That is -- so this variable will be used either as an accumulator
> or a search result, so that initial value is really important.
>
> So when I see the same variable receives its initial value in
> the next line, I start wondering what's missed in the code which
> should be there.  Or why I don't read the code correctly.  Or
> something like this.
>
> So, basically, this is a cleanup patch just to avoid confusion,
> it most likely not needed for current compiler who can figure
> it out by its own.  And for consistency - why not initialize
> other variables too?

I hate redundant initializers for yet another reason: when I change the
code, and accidentally add a path bypassing the *real* initialization, I
don't get a "may be used uninitialized" warning, I get the stupid
redundant initialization and quite possibly a crash to debug some time
later.

> Maybe that's just my old-scool mind works this way.
>
> At any rate you can just ignore this patch.

Please consider it.

