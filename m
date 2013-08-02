Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5Ms6-0001v7-8A
	for mharc-qemu-trivial@gnu.org; Fri, 02 Aug 2013 17:26:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5Mrz-0001u1-5B
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 17:26:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5G1h-0002Pz-6q
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:08:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V5G1Z-0002OH-JI; Fri, 02 Aug 2013 10:08:09 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 03AEF40414;
	Fri,  2 Aug 2013 18:08:09 +0400 (MSK)
Message-ID: <51FBBD48.4030309@msgid.tls.msk.ru>
Date: Fri, 02 Aug 2013 18:08:08 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20130801075529.GA3177@redhat.com>
	<1891063913.8014575.1375346398856.JavaMail.root@redhat.com>
In-Reply-To: <1891063913.8014575.1375346398856.JavaMail.root@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Anthony Liguori <aliguori@us.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Avi Kivity <avi.kivity@gmail.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] memory.c: drop kvm.h dependency
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
X-List-Received-Date: Fri, 02 Aug 2013 21:26:49 -0000

01.08.2013 12:39, Paolo Bonzini wrote:
>> memory.c does not use any kvm specific interfaces,
>> don't include kvm.h

Thanks, applied to the trivial patches queue.

/mjt


