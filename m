Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VRPOl-0005Lw-CW
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2013 12:35:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VRPOc-0005GO-9x
	for qemu-trivial@nongnu.org; Wed, 02 Oct 2013 12:35:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VRPOW-00006P-17
	for qemu-trivial@nongnu.org; Wed, 02 Oct 2013 12:35:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43642)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VRPOJ-0008QY-Hn; Wed, 02 Oct 2013 12:35:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C66D240587;
	Wed,  2 Oct 2013 20:35:10 +0400 (MSK)
Message-ID: <524C4B3E.3010409@msgid.tls.msk.ru>
Date: Wed, 02 Oct 2013 20:35:10 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: armbru@redhat.com
References: <1380628042-24309-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1380628042-24309-1-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, anthony@codemonkey.ws
Subject: Re: [Qemu-trivial] [PATCH] vl: Clean up unnecessary boot_order
	complications
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
X-List-Received-Date: Wed, 02 Oct 2013 16:35:36 -0000

01.10.2013 15:47, armbru@redhat.com =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> From: Markus Armbruster <armbru@redhat.com>
>
> Messed up in commit 8281abd.

Thanks, applied to the trivial patches queue.

/mjt

