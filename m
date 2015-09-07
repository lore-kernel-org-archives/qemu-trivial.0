Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYt3S-00068c-6R
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2015 05:49:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYt3P-000667-UX
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 05:49:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYt3P-0004i3-6D
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 05:49:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46361)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZYt3K-0004eI-S5; Mon, 07 Sep 2015 05:49:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6309340B17;
	Mon,  7 Sep 2015 12:49:27 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 4DA2FA76;
	Mon,  7 Sep 2015 12:49:27 +0300 (MSK)
Message-ID: <55ED5DA7.2050506@msgid.tls.msk.ru>
Date: Mon, 07 Sep 2015 12:49:27 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1438235203-31311-1-git-send-email-sw@weilnetz.de>	<55EC14A1.4030600@msgid.tls.msk.ru>
	<87y4givitu.fsf@blackfin.pond.sub.org>
In-Reply-To: <87y4givitu.fsf@blackfin.pond.sub.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?B?w4Frb3MgS292w6Fjcw==?= <akoskovacs@gmx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developer <qemu-devel@nongnu.org>,
	=?UTF-8?B?T3phbiDDh2HEn2xheWFu?= <ozancag@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH for-2.4] Update language files for QEMU
	2.4.0
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
X-List-Received-Date: Mon, 07 Sep 2015 09:49:36 -0000

07.09.2015 09:34, Markus Armbruster wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> Applied to -trivial-patches, unfortunately not for 2.4 but at least for 2.5 :)
> 
> Should we add "Cc: qemu-stable@nongnu.org" to the commit message?

I don't think it is worth applying to stable.  YMMV ofcourse :)

/mjt


