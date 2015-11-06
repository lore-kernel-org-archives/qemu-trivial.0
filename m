Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zuc71-0000oG-W2
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 03:11:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zuc70-0000o2-Iy
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 03:11:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zuc6x-00021G-Cj
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 03:11:06 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53801)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zuc6x-00020t-3q
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 03:11:03 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DAD7A40B3A;
	Fri,  6 Nov 2015 11:11:01 +0300 (MSK)
Message-ID: <563C6095.5000503@msgid.tls.msk.ru>
Date: Fri, 06 Nov 2015 11:11:01 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Cao jin <caoj.fnst@cn.fujitsu.com>, =qemu-devel@nongnu.org
References: <1446700614-16138-1-git-send-email-caoj.fnst@cn.fujitsu.com>
In-Reply-To: <1446700614-16138-1-git-send-email-caoj.fnst@cn.fujitsu.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH] object_new_with_type: remove redundant
	code
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
X-List-Received-Date: Fri, 06 Nov 2015 08:11:07 -0000

05.11.2015 08:16, Cao jin wrote:
> g_assert & type_initialize are called in object_initialize_with_type

object_new_with_type() is a separate QOM API function.  If we're
to rely on other functions calling it to check for parameters,
we should probably remove it from public API and make it static.

And yes, I'm aware of the fact that currently object_new_with_type()
is only called from object_initialize_with_type().  This is not a
good reason to drop the check/init, since object_new_with_type()
remains a published API and might be used in other places in the
future.

Thanks,

/mjt

