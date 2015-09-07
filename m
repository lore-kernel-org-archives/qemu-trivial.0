Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYqD7-0000ZW-Hm
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2015 02:47:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZYqD5-0000Wt-Jt
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 02:47:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZYqD4-0005qK-RG
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 02:47:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZYqD0-0005pb-A7; Mon, 07 Sep 2015 02:47:18 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id B78AEC0798E0;
	Mon,  7 Sep 2015 06:47:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-17.ams2.redhat.com
	[10.36.116.17])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t876lGfi028390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 7 Sep 2015 02:47:17 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 978D8303F90E; Mon,  7 Sep 2015 08:47:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <alpine.DEB.2.02.1508092307540.14941@citymarket.hu>
	<alpine.DEB.2.02.1508102239060.14941@citymarket.hu>
	<55EC183F.3090107@msgid.tls.msk.ru>
Date: Mon, 07 Sep 2015 08:47:15 +0200
In-Reply-To: <55EC183F.3090107@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Sun, 06 Sep 2015 13:41:03 +0300")
Message-ID: <87twr6vi8c.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Veres Lajos <vlajos@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] typofixes
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
X-List-Received-Date: Mon, 07 Sep 2015 06:47:24 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 11.08.2015 00:42, Veres Lajos wrote:
>> On Sun, 9 Aug 2015, Veres Lajos wrote:
>> 
>>> Hi,
>>>
>>> Please find attached a couple of typo fixes, mostly in comments/docs.
>>> I hope it meets the trivial criteria...
>
> Now that's a bunch of typos ;)
>
> Applied everything to -trivial. Thank you!
>
> Please the next time send it to qemu-devel too,
> so that people will be able to review.

Yes.  Has a copy been sent to qemu-devel meanwhile?

