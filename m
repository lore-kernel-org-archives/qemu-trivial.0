Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur2b8-0007pH-9W
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 04:58:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Ur2b4-0007jV-T5
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 04:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Ur2b3-0002dJ-KM
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 04:58:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45123)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Ur2b0-0002cU-UJ; Mon, 24 Jun 2013 04:57:59 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O8vvYu010819
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 04:57:58 -0400
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5O8vthv021972; Mon, 24 Jun 2013 04:57:55 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7CCF0200B4; Mon, 24 Jun 2013 10:57:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
	<51C7F2B9.6050707@msgid.tls.msk.ru>
	<87a9mgrkm9.fsf@blackfin.pond.sub.org>
	<51C80259.5020102@msgid.tls.msk.ru>
Date: Mon, 24 Jun 2013 10:57:54 +0200
In-Reply-To: <51C80259.5020102@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Mon, 24 Jun 2013 12:24:57 +0400")
Message-ID: <87fvw7nawd.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 00/13] A bunch of little
	socket + chardev fixes
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
X-List-Received-Date: Mon, 24 Jun 2013 08:58:04 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 24.06.2013 12:14, Markus Armbruster wrote:
>> Michael Tokarev <mjt@tls.msk.ru> writes:
> []
>>> Thank you Gerd, applied all series to the trivial-patches queue,
>>> with two edits:
>>>
>>>>   qemu-char: use ChardevBackendKind in in CharDriver
>>>>   qemu-char: report udb backend errors
>>>
>>> fxed these :)
>> 
>> My commit message nitpicks aren't worth a respin.  Perhaps you want to
>> fix them in your tree.
>
> I'm not sure I understand what you're saying.  I fixed them
> in my tree while applying, and that's exactly what I said --
> "applied all..fixed these".  What does not worth what?

I replied to 02/13 and 12/13, suggesting commit message fixes.  You may
have covered some of them already, I don't know.

The question I asked re 07/13 is outside the scope of this series, so
don't worry about that one.

