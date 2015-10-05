Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk5C2-0001Ym-0g
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 03:00:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zj9L3-0006xi-TC
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 13:14:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zj9L2-0003lS-UJ
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 13:14:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35898)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Zj9Kx-0003fW-Is; Mon, 05 Oct 2015 13:14:07 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 5619B80092;
	Mon,  5 Oct 2015 17:05:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-24.ams2.redhat.com
	[10.36.116.24])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t95H5NFj001616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 5 Oct 2015 13:05:24 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BC1FB3006B14; Mon,  5 Oct 2015 19:05:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1443189844-20341-1-git-send-email-marcandre.lureau@redhat.com>
	<1443189844-20341-22-git-send-email-marcandre.lureau@redhat.com>
	<56057193.5060508@redhat.com> <56100875.3060408@msgid.tls.msk.ru>
	<87h9m5aokh.fsf@blackfin.pond.sub.org>
	<561227AA.9030705@msgid.tls.msk.ru>
Date: Mon, 05 Oct 2015 19:05:22 +0200
In-Reply-To: <561227AA.9030705@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Mon, 05 Oct 2015 10:32:58 +0300")
Message-ID: <878u7h5jql.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, marcandre.lureau@redhat.com,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Mon, 05 Oct 2015 17:14:14 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 05.10.2015 08:09, Markus Armbruster =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Michael Tokarev <mjt@tls.msk.ru> writes:
>>=20
>>> 25.09.2015 19:08, Eric Blake wrote:
>>>> On 09/25/2015 08:03 AM, marcandre.lureau@redhat.com wrote:
>>>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> []
>>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>>
>>> Note there's no S-o-b line in the original patch (whole series,
>>> looks like).  Hopefully it is okay for such a really trivial
>>> patch :)
>>>
>>> Applied, thanks!
>>=20
>> It may be legally safe, but do we really want to engage in judging
>> whether patches are copyrightable or not?  Besides, it sets a bad
>> example.
>
> Sometimes I question our own sanity.  Even for a trivial spelling fix
> we require significantly more beaurocracy(sp) than the fix is worth,
> and want formal rules instead of using common sense. This is a common
> trend in the world, to formalize everything instead of thinking, the
> world is becoming "candy".  This reminded me an old movie, "Demolition
> Man", -- the cops in the future reads instructions about what to do
> in each situation they happened to come.  But oh well, no one want to
> take responsibility, that's okay ;)
>
> Sorry for somewhat non-technical answer, I'll revert this patch,
> waiting for more beaurocracy.

Well, it could be worse, it could be CLA and copyright assignment.
S-o-B is probably the most lightweight thing we can do to stay on
relatively solid legal ground.

In my opinion, applying the "must have S-o-B" rule unthinkingly is less
effort than trying to identify cases where we can do without.

>> Marc-Andr=C3=A9, please repost your patches ready for -trivial with your
>> S-o-B, cc: qemu-trivial.
>
> Mind you, it was a large series, with wasn't intended for -trivial
> at all.  That's more rules and more beaurocracy.  And many other
> patches in that series didn't have s-o-b line too.

Chances are these patches really need it, so Marc-Andr=C3=A9 has to repost
his series anyway.

