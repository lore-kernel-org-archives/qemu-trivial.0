Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk69Z-0000D7-Ef
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 04:02:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Ziy2E-0000pz-Ka
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 01:10:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Ziy2D-00033G-Pp
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 01:10:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40482)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Ziy27-0002vY-Ol; Mon, 05 Oct 2015 01:09:55 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 32C9BC0B1B26;
	Mon,  5 Oct 2015 05:09:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-24.ams2.redhat.com
	[10.36.116.24])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9559ph6000669
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 5 Oct 2015 01:09:52 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 68C8E300253F; Mon,  5 Oct 2015 07:09:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1443189844-20341-1-git-send-email-marcandre.lureau@redhat.com>
	<1443189844-20341-22-git-send-email-marcandre.lureau@redhat.com>
	<56057193.5060508@redhat.com> <56100875.3060408@msgid.tls.msk.ru>
Date: Mon, 05 Oct 2015 07:09:50 +0200
In-Reply-To: <56100875.3060408@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Sat, 03 Oct 2015 19:55:17 +0300")
Message-ID: <87h9m5aokh.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, marcandre.lureau@redhat.com,
	Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 21/36] misc: spelling
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
X-List-Received-Date: Mon, 05 Oct 2015 05:10:03 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 25.09.2015 19:08, Eric Blake wrote:
>> On 09/25/2015 08:03 AM, marcandre.lureau@redhat.com wrote:
>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>
>>> ---
>>>  monitor.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> Trivial, can be applied now without waiting for pending qapi patches.
>>=20
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> Note there's no S-o-b line in the original patch (whole series,
> looks like).  Hopefully it is okay for such a really trivial
> patch :)
>
> Applied, thanks!

It may be legally safe, but do we really want to engage in judging
whether patches are copyrightable or not?  Besides, it sets a bad
example.

Marc-Andr=C3=A9, please repost your patches ready for -trivial with your
S-o-B, cc: qemu-trivial.

