Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRdff-0000dw-6p
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:26:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRdfc-0000Yj-SZ
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:26:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRdfc-0003Mu-6k
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:26:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YRdfW-0003Kw-9w; Sat, 28 Feb 2015 04:26:42 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 92BFA43F2C;
	Sat, 28 Feb 2015 12:26:41 +0300 (MSK)
Message-ID: <54F189D1.10908@msgid.tls.msk.ru>
Date: Sat, 28 Feb 2015 12:26:41 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1424073025-13262-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20150219102500.GA2305@work-vm>
In-Reply-To: <20150219102500.GA2305@work-vm>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Amit Shah <amit.shah@redhat.com>,
	qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] migration/rdma: clean up
	qemu_rdma_dest_init a bit
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
X-List-Received-Date: Sat, 28 Feb 2015 09:26:49 -0000

19.02.2015 13:25, Dr. David Alan Gilbert wrote:
> * Michael Tokarev (mjt@tls.msk.ru) wrote:
>> Do not check for rdma->host being empty twice.  This removes a large
>> "if" block, so code indentation is changed.  While at it, remove an
>> ugly goto from the loop, replacing it with a cleaner if logic.  And
>> finally, there's no need to initialize `ret' variable since is always
>> has a value.
> 
> This looks OK; have you got RDMA hardware to test with, if not I can
> give it a go.

No, I don't have any RDMA hw, I only compile-tested this code, and
double-checked the changes does not change behavour.

Thanks,

/mjt

