Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YK5TX-0006oB-5Z
	for mharc-qemu-trivial@gnu.org; Sat, 07 Feb 2015 08:31:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YK5TR-0006e1-EQ
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 08:31:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YK5TM-0000b9-Pg
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 08:31:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YK5TG-0000aF-TT; Sat, 07 Feb 2015 08:30:51 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 279754140A;
	Sat,  7 Feb 2015 16:30:48 +0300 (MSK)
Message-ID: <54D61388.5000507@msgid.tls.msk.ru>
Date: Sat, 07 Feb 2015 16:30:48 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1422456844-13043-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1422456844-13043-1-git-send-email-armbru@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/4] Pair g_malloc() with g_free(),
	not free()
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
X-List-Received-Date: Sat, 07 Feb 2015 13:31:05 -0000

28.01.2015 17:54, Markus Armbruster wrote:

> Markus Armbruster (4):
>   qemu-option: Replace pointless use of g_malloc0() by g_malloc()
>   qemu-option: Pair g_malloc() with g_free(), not free()
>   spapr_vio: Pair g_malloc() with g_free(), not free()
>   usb: Pair g_malloc() with g_free(), not free()

Applied to -trivial, thank you!

/mjt

