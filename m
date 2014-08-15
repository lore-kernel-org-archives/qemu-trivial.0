Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIIy6-0003QD-LW
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 10:59:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIIxz-0003HP-5T
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 10:59:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIIxt-00008Z-2I
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 10:58:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36824)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIIxg-00004w-IC; Fri, 15 Aug 2014 10:58:36 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 24BB043050;
	Fri, 15 Aug 2014 18:58:35 +0400 (MSK)
Message-ID: <53EE201A.6060203@msgid.tls.msk.ru>
Date: Fri, 15 Aug 2014 18:58:34 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-devel@nongnu.org
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-2-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1408001361-13580-2-git-send-email-zhang.zhanghailiang@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: kwolf@redhat.com, lkurusa@redhat.com, mst@redhat.com,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, luonengjun@huawei.com,
	peter.huangpeng@huawei.com, lcapitulino@redhat.com,
	stefanha@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
	rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 01/10] l2cap: fix access freed memory
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
X-List-Received-Date: Fri, 15 Aug 2014 14:59:01 -0000

Applied to -trivial, thanks!

/mjt

