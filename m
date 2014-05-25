Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoZXN-0006Lo-1m
	for mharc-qemu-trivial@gnu.org; Sun, 25 May 2014 10:36:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WoZXE-0006Bu-TZ
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 10:36:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WoZX8-0005oK-MW
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 10:36:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WoZWw-0005mh-3D; Sun, 25 May 2014 10:36:06 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5A9EA42E07;
	Sun, 25 May 2014 18:36:04 +0400 (MSK)
Message-ID: <5381FFD4.8080107@msgid.tls.msk.ru>
Date: Sun, 25 May 2014 18:36:04 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@web.de>, Le Tan <tamlokveer@gmail.com>, 
	qemu-devel@nongnu.org
References: <1400985853-25594-1-git-send-email-tamlokveer@gmail.com>
	<5381FE37.80904@web.de>
In-Reply-To: <5381FE37.80904@web.de>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, peter.crosthwaite@xilinx.com,
	afaerber@suse.de, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v3] block: replace fprintf(stderr,
 ...) with error_report()
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
X-List-Received-Date: Sun, 25 May 2014 14:36:31 -0000

25.05.2014 18:29, Jan Kiszka wrote:
> On 2014-05-25 10:44, Le Tan wrote:
>> Replace fprintf(stderr,...) with error_report() in files block/*, block.c,
>> block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argument
>> have been removed because @fmt of error_report() should not contain newline.
>> Also fix some coding style issues.
> 
> Let's do the "also" part in a separate patch. It's more than one or two
> trivial pass-by style fixes, and some people may like the fprintf
> conversion while having different views on the other changes.

I think he misunderstood.

I told him that his previous patch had its own whitespace issues,
ie, it _adds_ whitespace errors.

In another reply I told him it is usually a good idea to fix style
issues in the code the patch touches -- this means, close to, if a
line being changed for something else has an unrelated style issue,
it should be fixed too.  (An example was space between function name
and its arguments in fprintf argument list, while converting that
fprintf to error_report).

But it looks like he took this advise in much more broad way and
fixed _all_ whitespace/style issues in the files he touches.  Oh
well.. :)

And yes, definitely, please don't mix it like this.  Usually, these
code style issues should not be touched by its own, only if you
change nearby code.

Thanks,

/mjt

