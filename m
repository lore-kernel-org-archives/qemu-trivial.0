Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VheKF-0002ki-2J
	for mharc-qemu-trivial@gnu.org; Sat, 16 Nov 2013 06:46:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VheK9-0002eT-Kz
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 06:46:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VheK4-0001v8-Pk
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 06:46:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57956)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VheJu-0001tB-CK; Sat, 16 Nov 2013 06:45:46 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7EDC441D0D;
	Sat, 16 Nov 2013 15:45:42 +0400 (MSK)
Message-ID: <52875AE6.5070506@msgid.tls.msk.ru>
Date: Sat, 16 Nov 2013 15:45:42 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
	<528743FA.50508@msgid.tls.msk.ru>
	<CAFEAcA83Q1nQtHWB+BRByfw+FzP-O7j9h5Dgch9Oya1nbOQf1g@mail.gmail.com>
In-Reply-To: <CAFEAcA83Q1nQtHWB+BRByfw+FzP-O7j9h5Dgch9Oya1nbOQf1g@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH (1.7?)] configure: Use -B
 switch only for Python versions which support it
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
X-List-Received-Date: Sat, 16 Nov 2013 11:46:06 -0000

16.11.2013 15:10, Peter Maydell wrote:

> Just a question since we were discussing this on IRC -- are you going
> to remove the non-buildfix/bugfix patches from the trivial queue so
> the buildfixes go into 1.7?

Yes, please see http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches ,
since 1.7.0-rc0.  I can remove a few more patches from there, but I don't see why.

/mjt

