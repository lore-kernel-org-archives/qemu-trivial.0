Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyhEy-0001ef-Hx
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 09:55:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YyhEv-0001cE-RL
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 09:55:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YyhEu-00071H-Ui
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 09:55:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YyhEq-0006vl-KY; Sat, 30 May 2015 09:55:48 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DE8B242A03;
	Sat, 30 May 2015 16:55:47 +0300 (MSK)
Message-ID: <5569C163.10500@msgid.tls.msk.ru>
Date: Sat, 30 May 2015 16:55:47 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432877914-13552-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432877914-13552-1-git-send-email-zhaoshenglong@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] hw/arm/omap_sx1.c: Fix memory leak
	spotted by valgrind
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
X-List-Received-Date: Sat, 30 May 2015 13:55:54 -0000

applied to -trivial, thanks!

/mjt

