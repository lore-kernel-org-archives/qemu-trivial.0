Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XFqWe-0004E1-8T
	for mharc-qemu-trivial@gnu.org; Fri, 08 Aug 2014 16:12:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqWV-00041D-On
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:12:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqWP-0008Fb-Me
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:12:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51832)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XFqWC-00088c-OW; Fri, 08 Aug 2014 16:12:04 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 283DE419FE;
	Sat,  9 Aug 2014 00:12:04 +0400 (MSK)
Message-ID: <53E52F14.3030806@msgid.tls.msk.ru>
Date: Sat, 09 Aug 2014 00:12:04 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1407378881-22590-1-git-send-email-famz@redhat.com>
In-Reply-To: <1407378881-22590-1-git-send-email-famz@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] build-sys: Move qapi-{types, visit,
 event}.o into util-obj-y
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
X-List-Received-Date: Fri, 08 Aug 2014 20:12:30 -0000

07.08.2014 06:34, Fam Zheng wrote:
> These three objects are repeated in multiple times in Makefiles. Let's
> just add them to libqemuutil.a, and don't list explicitly elsewhere.

I think it is a good idea.  I wondered about these too when come across
them in makefiles several times.  I'm applying this to -trivial, will
verify how it works ;)

Thanks,

/mjt

