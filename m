Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVDX7-0007b4-3X
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 02:20:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVDX5-0007Y0-7A
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVDX4-0001Ik-Am
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:20:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35065)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVDX0-0001Gu-0t; Tue, 10 Mar 2015 02:20:42 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 59CCD41302;
	Tue, 10 Mar 2015 09:20:41 +0300 (MSK)
Message-ID: <54FE8D39.5030600@msgid.tls.msk.ru>
Date: Tue, 10 Mar 2015 09:20:41 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1425464754-8364-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1425464754-8364-1-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel@nongnu.org, eblake@redhat.com, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] error: Replace error_report() &
 error_free() with error_report_err()
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
X-List-Received-Date: Tue, 10 Mar 2015 06:20:48 -0000

04.03.2015 13:25, zhanghailiang wrote:
> This is a continuation of the work started in commit 565f65d27:
> "error: Use error_report_err() where appropriate"

Applied to -trivial, thank you!

/mjt

