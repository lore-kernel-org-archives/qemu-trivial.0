Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1zGe-0005SZ-HM
	for mharc-qemu-trivial@gnu.org; Sat, 22 Apr 2017 13:56:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d1zGc-0005Qu-A9
	for qemu-trivial@nongnu.org; Sat, 22 Apr 2017 13:56:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d1zGb-0000Dm-OX
	for qemu-trivial@nongnu.org; Sat, 22 Apr 2017 13:56:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d1zGX-0000Ci-GG; Sat, 22 Apr 2017 13:56:13 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 71AB941E95;
	Sat, 22 Apr 2017 20:56:12 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 601DE3F8;
	Sat, 22 Apr 2017 20:56:12 +0300 (MSK)
To: fred.konrad@greensocs.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1490360147-26450-1-git-send-email-fred.konrad@greensocs.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <8f9aadab-b728-e4ec-095d-5734a268c239@msgid.tls.msk.ru>
Date: Sat, 22 Apr 2017 20:56:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490360147-26450-1-git-send-email-fred.konrad@greensocs.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] ppc_booke: drop useless assignment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Apr 2017 17:56:19 -0000

24.03.2017 15:55, fred.konrad@greensocs.com wrote:
> From: KONRAD Frederic <fred.konrad@greensocs.com>
> 
> The tb_env variable is set two lines above. So just drop the double assignment.

Applied to -trivial, thanks!

/mjt

