Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d2DP0-0007YY-R6
	for mharc-qemu-trivial@gnu.org; Sun, 23 Apr 2017 05:01:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2DOu-0007Xs-QJ
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 05:01:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2DOu-0001Lu-5d
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 05:01:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d2DOp-0001Kv-2Z; Sun, 23 Apr 2017 05:01:43 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2795141F10;
	Sun, 23 Apr 2017 12:01:40 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 0AE913F8;
	Sun, 23 Apr 2017 12:01:40 +0300 (MSK)
To: Saurav Sachidanand <sauravsachidanand@gmail.com>, qemu-devel@nongnu.org
References: <20170320173828.3874-1-sauravsachidanand@gmail.com>
Cc: qemu-trivial@nongnu.org, stefanha@gmail.com, laurent@vivier.eu
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <45ac325f-0496-b63a-b8a3-af1a2f8bdb8e@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2017 12:01:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170320173828.3874-1-sauravsachidanand@gmail.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v5] util: Use g_malloc/g_free in envlist.c
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
X-List-Received-Date: Sun, 23 Apr 2017 09:01:54 -0000

20.03.2017 20:38, Saurav Sachidanand wrote:
> Change malloc/strdup/free to g_malloc/g_strdup/g_free in
> util/envlist.c.
> 
> Remove NULL checks for pointers returned from g_malloc and g_strdup
> as they exit in case of failure. Also, update calls to envlist_create
> to reflect this.
> 
> Free array and array contents returned by envlist_to_environ using
> g_free in bsd-user/main.c and linux-user/main.c.

Applied to -trivial, as-is, with the tabs instead of spaces.

Thanks,

/mjt

