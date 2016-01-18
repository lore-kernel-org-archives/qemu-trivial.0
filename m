Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aLDkx-0005Rx-NY
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jan 2016 12:38:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aLDku-0005O1-RW
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 12:38:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aLDku-0004cG-4r
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 12:38:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aLDko-0004a7-2Y; Mon, 18 Jan 2016 12:38:10 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E2F3340EF4;
	Mon, 18 Jan 2016 20:37:59 +0300 (MSK)
To: Greg Kurz <gkurz@linux.vnet.ibm.com>
References: <20160111173036.24764.59878.stgit@bahia.huguette.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <569D22F6.5070104@msgid.tls.msk.ru>
Date: Mon, 18 Jan 2016 20:37:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160111173036.24764.59878.stgit@bahia.huguette.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] trace: drop trailing empty strings
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
X-List-Received-Date: Mon, 18 Jan 2016 17:38:18 -0000

11.01.2016 20:30, Greg Kurz wrote:

> -virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s gpa: %"PRIx64""
> +virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s gpa: %"PRIx64
...

I'm not sure what's the value of this.  It's fine either way, no?
Do we have a rule for trailing empty strings in coding style? :)

Thanks,

/mjt


