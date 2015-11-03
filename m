Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtaP8-00055b-Ue
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 07:09:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZtaP4-0004ws-LM
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:09:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZtaP3-0004tU-Iq
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:09:30 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZtaOy-0004ng-Dv; Tue, 03 Nov 2015 07:09:24 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5A037407DB;
	Tue,  3 Nov 2015 15:09:23 +0300 (MSK)
Message-ID: <5638A3F3.5060206@msgid.tls.msk.ru>
Date: Tue, 03 Nov 2015 15:09:23 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1446134122-32292-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1446134122-32292-1-git-send-email-armbru@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2 0/4] ui audio qxl usb: Use g_new() &
 friends where that makes obvious sense
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
X-List-Received-Date: Tue, 03 Nov 2015 12:09:31 -0000

29.10.2015 18:55, Markus Armbruster wrote:
> v2:
> * Trivially rebased
> 
> Markus Armbruster (4):
>   ui: Use g_new() & friends where that makes obvious sense
>   audio: Use g_new() & friends where that makes obvious sense
>   qxl: Use g_new() & friends where that makes obvious sense
>   usb: Use g_new() & friends where that makes obvious sense

Applied to -trivial except the audio bits and ui/vnc.c bits.

Thanks,

/mjt

