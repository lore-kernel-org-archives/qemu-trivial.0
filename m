Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDpte-00065Z-Jt
	for mharc-qemu-trivial@gnu.org; Wed, 21 Jan 2015 02:40:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YDptc-00064N-MQ
	for qemu-trivial@nongnu.org; Wed, 21 Jan 2015 02:40:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YDptb-0006hK-UA
	for qemu-trivial@nongnu.org; Wed, 21 Jan 2015 02:40:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57675)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YDptX-0006MH-Og; Wed, 21 Jan 2015 02:40:07 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0F9E542199;
	Wed, 21 Jan 2015 10:39:58 +0300 (MSK)
Message-ID: <54BF57CE.6040800@msgid.tls.msk.ru>
Date: Wed, 21 Jan 2015 10:39:58 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1421747963-2860-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1421747963-2860-1-git-send-email-armbru@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, leon.alrae@imgtec.com
Subject: Re: [Qemu-trivial] [PATCH] target-mips: Clean up switch fall
 through after commit fecd264
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
X-List-Received-Date: Wed, 21 Jan 2015 07:40:13 -0000

20.01.2015 12:59, Markus Armbruster wrote:
> Commit fecd264 added a number of fall-throughs, but neglected to
> properly document them as intentional.  Commit d922445 cleaned that up
> for many, but not all cases.  Take care of the remaining ones.

Applied to -trivial fixing one extra space on the way.

Thanks,

/mjt

