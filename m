Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNIAY-00065T-Bo
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 04:40:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YNIAW-00063n-QY
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 04:40:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YNIAW-00061W-2Q
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 04:40:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39590)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YNIAR-0005zP-Jg; Mon, 16 Feb 2015 04:40:39 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4333A42598;
	Mon, 16 Feb 2015 12:40:38 +0300 (MSK)
Message-ID: <54E1BB16.4000809@msgid.tls.msk.ru>
Date: Mon, 16 Feb 2015 12:40:38 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <1423673041-13522-1-git-send-email-kraxel@redhat.com>
	<54E1AA98.4010203@msgid.tls.msk.ru>
In-Reply-To: <54E1AA98.4010203@msgid.tls.msk.ru>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] spice: fix memory leak
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
X-List-Received-Date: Mon, 16 Feb 2015 09:40:45 -0000

16.02.2015 11:30, Michael Tokarev wrote:
> Applied to -trivial, thanks!

Er, nope, the right fix comes from Gonglei.

/mjt

