Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WjS73-0000MV-UD
	for mharc-qemu-trivial@gnu.org; Sun, 11 May 2014 07:40:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WjS6w-00009U-Er
	for qemu-trivial@nongnu.org; Sun, 11 May 2014 07:40:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WjS6q-0002wW-BA
	for qemu-trivial@nongnu.org; Sun, 11 May 2014 07:40:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WjS6c-0002sn-SL; Sun, 11 May 2014 07:39:47 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 48B8240DC0;
	Sun, 11 May 2014 15:39:44 +0400 (MSK)
Message-ID: <536F6180.1010905@msgid.tls.msk.ru>
Date: Sun, 11 May 2014 15:39:44 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Alon Levy <alevy@redhat.com>, qemu-devel@nongnu.org
References: <1399569594-31678-1-git-send-email-mjt@msgid.tls.msk.ru>
	<536F2DC0.9080809@redhat.com>
In-Reply-To: <536F2DC0.9080809@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libcacard: remove useless
	initializers
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
X-List-Received-Date: Sun, 11 May 2014 11:40:12 -0000

11.05.2014 11:58, Alon Levy wrote:
> On 05/08/2014 08:19 PM, Michael Tokarev wrote:
>> libcacard has many functions which initializes local variables
>> at declaration time, which are always assigned some values later
>> (often right after declaration).  Clean up these initializers.
> 
> How is this an improvement? Doesn't the compiler ignore this anyhow?

Just less code.

To me, when I see something like

  Type *var = NULL;

in a function, it somehow "translates" to a construct like

  Type *found = NULL;

That is -- so this variable will be used either as an accumulator
or a search result, so that initial value is really important.

So when I see the same variable receives its initial value in
the next line, I start wondering what's missed in the code which
should be there.  Or why I don't read the code correctly.  Or
something like this.

So, basically, this is a cleanup patch just to avoid confusion,
it most likely not needed for current compiler who can figure
it out by its own.  And for consistency - why not initialize
other variables too?

Maybe that's just my old-scool mind works this way.

At any rate you can just ignore this patch.

Thanks,

/mjt

