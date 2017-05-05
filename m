Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d6WfT-0005hV-Fe
	for mharc-qemu-trivial@gnu.org; Fri, 05 May 2017 02:24:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d6WfR-0005gQ-Bs
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 02:24:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d6WfQ-0002ox-KJ
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 02:24:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46063)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d6WfM-0002oL-8r; Fri, 05 May 2017 02:24:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8A80540384;
	Fri,  5 May 2017 09:24:33 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 602093BB;
	Fri,  5 May 2017 09:24:33 +0300 (MSK)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20170503104441.1349-1-pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, leon.alrae@imgtec.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <3a1419bd-710a-61f5-bfee-0eb5895a022c@msgid.tls.msk.ru>
Date: Fri, 5 May 2017 09:24:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170503104441.1349-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] jazz_led: fix bad snprintf
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
X-List-Received-Date: Fri, 05 May 2017 06:24:42 -0000

03.05.2017 13:44, Paolo Bonzini wrote:
> Detected by GCC 7's -Wformat-truncation.  snprintf writes at most
> 2 bytes here including the terminating NUL, so the result is
> truncated.  In addition, the newline at the end is pointless.
> Fix the buffer size and the format string.

Polo, that's quite a bit too bureaucratic,
but where's your s-o-b for this patch? :)

Thanks,

/mjt

