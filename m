Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zrhh3-0007Ho-DH
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 03:32:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhh1-0007H2-KN
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:32:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhh0-0002es-U4
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:32:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58715)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zrhgw-0002dY-OE; Thu, 29 Oct 2015 03:32:10 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0B6A942107;
	Thu, 29 Oct 2015 10:32:10 +0300 (MSK)
Message-ID: <5631CB79.2080109@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 10:32:09 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1444899255-16300-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1444899255-16300-1-git-send-email-thuth@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: blauwirbel@gmail.com, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] hw/display/tcx: Remove superfluous
	OBJECT() typecasts
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
X-List-Received-Date: Thu, 29 Oct 2015 07:32:16 -0000

15.10.2015 11:54, Thomas Huth wrote:
> The tcx_initfn() function is already supplied with an
> Object *obj pointer, so there is no need to cast the
> state pointer back to an Object pointer all over the
> place. And while we're at it, also remove the superfluous
> "return;" statement in this function.

Applied to -trivial, thank you!

/mjt

