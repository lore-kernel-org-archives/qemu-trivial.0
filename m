Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkiOK-0005Az-DI
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 20:52:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEKk-000212-Lu
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 12:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEKZ-0004IP-Km
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 12:46:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEK1-0003ql-3O; Thu, 08 Oct 2015 12:45:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7871240A55;
	Thu,  8 Oct 2015 19:45:31 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 61B2AA83;
	Thu,  8 Oct 2015 19:45:31 +0300 (MSK)
Message-ID: <56169DAB.4080109@msgid.tls.msk.ru>
Date: Thu, 08 Oct 2015 19:45:31 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, Shraddha Barke <shraddha.6596@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org
References: <1443191763-3445-1-git-send-email-shraddha.6596@gmail.com>	<1443191763-3445-2-git-send-email-shraddha.6596@gmail.com>	<5610097E.5090306@msgid.tls.msk.ru>
	<5612976B.3060809@redhat.com>
In-Reply-To: <5612976B.3060809@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 2/2] Hw: timer: Remove unnecessary
	variable
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
X-List-Received-Date: Thu, 08 Oct 2015 16:46:47 -0000

05.10.2015 18:29, Eric Blake wrote:
> On 10/03/2015 10:59 AM, Michael Tokarev wrote:
>> 25.09.2015 17:36, Shraddha Barke wrote:
>>> Compress lines and remove the variable.
>>
>> Applied to -trivial, removing the Coccinelle script
>> from the commit message.
> 
> Why cripple the commit message? The coccinelle recipe is useful for
> someone trying to backport the script to a different branch where a
> straight backport doesn't quite work, but rerunning the coccinelle
> recipe does.

I already answered to this one.  Becuase git commit messages
are not a good place to store various good scripts and recipes
like this, and these scripts wont be found there anyway.  On
the other hand, cluttering commit messages with such info makes
is significantly more difficult to find changes when you look for
breakage or actual changes somewhere.

Additionally, your point about backporting is kind of moot, there's
very very little reason to backport these changes (especially using
the supplied script), and if the backporting is really necessary
and the patch does not apply (which is twice unlikely) it is much
easier to do the patching manually based on the very smal difference
here.

Thanks,

/mjt

