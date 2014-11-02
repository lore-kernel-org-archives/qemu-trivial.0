Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XknMf-0000WS-Nh
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 01:06:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XknMe-0000VY-7O
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:06:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XknMd-0007h8-9s
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:06:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XknMX-0007gj-Ar; Sun, 02 Nov 2014 01:06:01 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8A0D740231;
	Sun,  2 Nov 2014 08:06:00 +0300 (MSK)
Message-ID: <5455BBB8.5040205@msgid.tls.msk.ru>
Date: Sun, 02 Nov 2014 08:06:00 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1414735861-1232-1-git-send-email-arei.gonglei@huawei.com>
	<1414735861-1232-2-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1414735861-1232-2-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] tap: remove close(fd)
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
X-List-Received-Date: Sun, 02 Nov 2014 05:06:09 -0000

31.10.2014 09:11, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> commit 5193e5fb (tap: factor out common tap initialization)
> introduce net_init_tap_one(). But it's inapposite that close
> fd in net_init_tap_one(), we should lay it in the caller,
> becuase some caller needn't to close it if we get the fd
> by monitor_handle_fd_param().
> 
> On the other hand, in other exceptional branch fd doesn't
> be closed, so that's incomplete.

Applied to -trivial, with grammar tweaking in commit message
and with slightly better (in my opinion) subject, like this:

    tap: do not close(fd) in net_init_tap_one()

    commit 5193e5fb (tap: factor out common tap initialization)
    introduce net_init_tap_one(). But it's inappropriate that
    we close fd in net_init_tap_one(), we should lay it in the
    caller, becuase some callers needn't to close it if we get
    the fd by monitor_handle_fd_param().

    On the other hand, in other exceptional branches fd isn't
    closed, so that's incomplete anyway.

Thanks,

/mjt

