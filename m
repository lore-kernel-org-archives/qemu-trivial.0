Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WyMs8-0008Ta-P2
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jun 2014 11:06:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyMs0-0008Jq-O6
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 11:06:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyMru-0006vd-GR
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 11:06:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WyMrh-0006u1-V0; Sat, 21 Jun 2014 11:06:02 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EF60141E41;
	Sat, 21 Jun 2014 19:06:00 +0400 (MSK)
Message-ID: <53A59F58.70104@msgid.tls.msk.ru>
Date: Sat, 21 Jun 2014 19:06:00 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>
References: <1401480140-18653-1-git-send-email-ehabkost@redhat.com>	<1401480140-18653-2-git-send-email-ehabkost@redhat.com>
	<20140609160426.63250974@redhat.com>
In-Reply-To: <20140609160426.63250974@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	qemu-devel@nongnu.org, Anthony Liguori <aliguori@amazon.com>,
	Marcel Apfelbaum <marcel.a@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 1/3] rng-random: NULL check not needed
 before g_free()
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
X-List-Received-Date: Sat, 21 Jun 2014 15:06:27 -0000

10.06.2014 00:04, Luiz Capitulino wrote:
> On Fri, 30 May 2014 17:02:18 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
>> g_free() is NULL-safe.

Applied to -trivial, thank you!

/mjt

