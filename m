Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wo6Dl-0002zB-Ah
	for mharc-qemu-trivial@gnu.org; Sat, 24 May 2014 03:18:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wo6De-0002qh-G7
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 03:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wo6DY-0004PC-Az
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 03:18:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60766)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wo6DL-0004MY-OS; Sat, 24 May 2014 03:17:55 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5FFFA42B94;
	Sat, 24 May 2014 11:17:52 +0400 (MSK)
Message-ID: <538047A0.2090704@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 11:17:52 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-trivial <qemu-trivial@nongnu.org>
References: <cover.1399449874.git.peter.crosthwaite@xilinx.com>	<CAEgOgz4GgkEWpLpa8SKPsZGZnRcqE5CifqJ+UiiA4Lm8dOnLMA@mail.gmail.com>
	<CAEgOgz46UcJiGC6H==O1XZFkvZh4Wa+2kBy8DDwAfKG6SUmp+g@mail.gmail.com>
In-Reply-To: <CAEgOgz46UcJiGC6H==O1XZFkvZh4Wa+2kBy8DDwAfKG6SUmp+g@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH net v1 0/4] Cadence GEM patches
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
X-List-Received-Date: Sat, 24 May 2014 07:18:20 -0000

24.05.2014 03:06, Peter Crosthwaite wrote:
> Ping^2!
> 
> I'll try trivial queue too :)

Actually this looks like trivial material.

I'll comment in one place, for all.


>>> Peter Crosthwaite (4):
>>>   net: cadence_gem: Fix Tx descriptor update

This appears to be a bugfix, but with an interesting "incomplete"
update:

...
+            unsigned    desc_first[2];
...
             cpu_physical_memory_read(s->tx_desc_addr,
-                                     (uint8_t *)&desc[0], sizeof(desc));
+                                     (uint8_t *)&desc_first[0], sizeof(desc));

sizeof(desc_first), not sizeof(desc).  Also can drop extra
"readdressing".

>>>   net: cadence_gem: Add Tx descriptor fetch printf

+    DB_PRINT("read descriptor 0x%x\n", (unsigned)packet_desc_addr);

packet_desc_addr is hwaddr, which is uint64_t, here it is being cast
to unsigned,  Is it right?  Other code in this file does the same,
but it still does not mean it's right.  Maybe it is because it uses
only the lower 32 bits of it, or that the high bits just aren't
useful for debugging?

>>>   net: cadence_gem: Fix top comment

I applied this one.

>>>   net: cadence_gem: Comment spelling sweep

This look okay, except that it clashes a bit with the first.

/mjt

