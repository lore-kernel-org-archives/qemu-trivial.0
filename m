Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJL4k-0003il-1y
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 07:26:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJL4b-0003TW-Nz
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:26:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJL4V-00037F-KP
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:26:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55211)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XJL4G-0002mx-Ob; Mon, 18 Aug 2014 07:25:40 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3E43A437EC;
	Mon, 18 Aug 2014 15:25:32 +0400 (MSK)
Message-ID: <53F1E2AC.7000303@msgid.tls.msk.ru>
Date: Mon, 18 Aug 2014 15:25:32 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-devel@nongnu.org
References: <1408348162-10020-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1408348162-10020-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, peter.huangpeng@huawei.com,
	mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v7] util/path: Use the GLib memory
 allocation routines
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
X-List-Received-Date: Mon, 18 Aug 2014 11:26:08 -0000

18.08.2014 11:49, zhanghailiang wrote:
> In this file, we don't check the return value of malloc/strdup/realloc which may fail.
> Instead of using these routines, we use the GLib memory APIs g_malloc/g_strdup/g_realloc.
> They will exit on allocation failure, so there is no need to test for failure,
> which would be fine for setup.

Applied to -trivial, thank you!

/mjt

