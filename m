Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uolm4-0001E9-9O
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 22:36:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uolm1-00018V-27
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 22:35:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uolm0-0003bc-4w
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 22:35:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uollq-0003aA-HP; Mon, 17 Jun 2013 22:35:46 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8D96E419C2;
	Tue, 18 Jun 2013 06:35:45 +0400 (MSK)
Message-ID: <51BFC780.4090204@msgid.tls.msk.ru>
Date: Tue, 18 Jun 2013 06:35:44 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51B70F11.7090101@msgid.tls.msk.ru>
In-Reply-To: <51B70F11.7090101@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/5] vnc: pass bool pararmeter for
	vnc_connect
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
X-List-Received-Date: Tue, 18 Jun 2013 02:35:58 -0000

11.06.2013 15:50, Michael Tokarev wrote:
> 11.06.2013 09:15, liguang wrote:
>> type last parameter of vnc_connect if bool,
>> so pass 'false' instead of '0' for it.
> 
> There's another parameter in here, `skipauth', which should be
> bool in vnc_connect(), and should be bool in vnc_display_add_client()
> too.
> 
> Also, there's no big point in splitting 1/5 and 2/5 (vnc_listen_read),
> I think.
> 
> Does something like the below look ok? (not even compile-tested)
> (and I'd really rename `skipauth' to `doauth' everywhere, to mean
> exactly the opposite so that we don't have double negatives, but
> it is too late already)

Hello.

Do you want/plan to respin the series, addressing comments?
Are you okay with my version?

Thanks!

/mjt

