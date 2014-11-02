Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xknt1-0004GB-H0
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 01:39:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xknsu-000479-IO
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:39:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xknsp-0007v8-MD
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:39:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38480)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xknsf-0007to-PE; Sun, 02 Nov 2014 01:39:13 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D7FAF40231;
	Sun,  2 Nov 2014 08:39:12 +0300 (MSK)
Message-ID: <5455C380.7080506@msgid.tls.msk.ru>
Date: Sun, 02 Nov 2014 08:39:12 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1414906637-11048-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1414906637-11048-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] tap: fix possible fd leak in
	net_init_tap
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
X-List-Received-Date: Sun, 02 Nov 2014 05:39:33 -0000

02.11.2014 08:37, arei.gonglei@huawei.com wrote:
> 
> In hotplugging scenario, taking those true branch, the file
> handler do not be closed. Let's close them before return.

This looks much better now, and is shorter too :)
Applied to -trivial, thank you!

/mjt

