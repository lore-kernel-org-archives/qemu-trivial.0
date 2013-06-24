Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur12l-0006K1-VL
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 03:18:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ur12j-0006E0-2T
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 03:18:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ur12i-00033h-5W
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 03:18:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ur12g-0002w3-6o; Mon, 24 Jun 2013 03:18:26 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3DD0C42664;
	Mon, 24 Jun 2013 11:18:18 +0400 (MSK)
Message-ID: <51C7F2B9.6050707@msgid.tls.msk.ru>
Date: Mon, 24 Jun 2013 11:18:17 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130529 Icedove/17.0.5
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
In-Reply-To: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 00/13] A bunch of little socket +
 chardev fixes
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
X-List-Received-Date: Mon, 24 Jun 2013 07:18:30 -0000

24.06.2013 10:39, Gerd Hoffmann wrote:
>   Hi,
> 
> Here is v2 of the series, addressing Michaels review comments.

Thank you Gerd, applied all series to the trivial-patches queue,
with two edits:

>   qemu-char: use ChardevBackendKind in in CharDriver
>   qemu-char: report udb backend errors

fxed these :)

/mjt

