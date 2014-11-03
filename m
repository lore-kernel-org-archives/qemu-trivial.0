Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlITg-0004HC-CZ
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 09:19:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlITY-00048C-Vq
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 09:19:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlITS-0003WZ-R3
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 09:19:20 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XlITG-0003Qr-3j; Mon, 03 Nov 2014 09:19:02 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 78E9640583;
	Mon,  3 Nov 2014 17:19:01 +0300 (MSK)
Message-ID: <54578ED5.2090703@msgid.tls.msk.ru>
Date: Mon, 03 Nov 2014 17:19:01 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Peter Wu <peter@lekensteyn.nl>, qemu-devel@nongnu.org
References: <1415011930-1964-1-git-send-email-peter@lekensteyn.nl>
	<54578DFC.3070807@msgid.tls.msk.ru>
In-Reply-To: <54578DFC.3070807@msgid.tls.msk.ru>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [Qemu-trivial] [PATCH] slirp/smbd: disable printer in smb config
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
X-List-Received-Date: Mon, 03 Nov 2014 14:19:27 -0000

03.11.2014 17:15, Michael Tokarev wrote:

> I picked it up for -trivial, and also Cc'ing Jan.

And also changed subject to

  slirp/smbd: modify/set several parameters in generated smbd.conf

-- a bit too generic, but at least it does not hide that many other
parameters are being changed.

Thanks,

/mjt

