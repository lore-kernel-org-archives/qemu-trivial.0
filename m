Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmhcE-0006ZQ-HO
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 05:45:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmhW2-0003PJ-PB
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 05:38:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmhW1-0005W7-Pw
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 05:38:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50657)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmhVz-0005Uf-9l; Wed, 12 Jun 2013 05:38:51 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9EC1441368;
	Wed, 12 Jun 2013 13:38:49 +0400 (MSK)
Message-ID: <51B841A8.3030007@msgid.tls.msk.ru>
Date: Wed, 12 Jun 2013 13:38:48 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Alon Levy <alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
In-Reply-To: <1370377419-31788-1-git-send-email-alevy@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/5] oslib-posix: add qemu_pipe_non_block
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
X-List-Received-Date: Wed, 12 Jun 2013 09:38:55 -0000

05.06.2013 00:23, Alon Levy wrote:

 [PATCH 1/5] oslib-posix: add qemu_pipe_non_block
 [PATCH 2/5] use qemu_pipe_non_block
 [PATCH 3/5] libcacard/vscclient: fix leakage of socket on error paths
 [PATCH 4/5] libcacard/vreader.c: fix possible NULL dereference
 [PATCH 5/5] libcacard/vscclient.c: fix use of uninitialized variable

So, what happened with this series?

From the above 5 patches, only 3/5 (leakage of socket on error paths)
is ready to be applied.  Should I apply it now, or wait for the
respin of whole series?  (Or both?)

Thanks,

/mjt

