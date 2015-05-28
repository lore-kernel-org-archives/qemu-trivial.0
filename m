Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxvwz-0002Eh-Ts
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:26:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yxvwu-00027i-ER
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:26:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yxvwq-00046f-Mw
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:26:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55349)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yxvwk-00045e-62; Thu, 28 May 2015 07:25:58 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8E17742715;
	Thu, 28 May 2015 14:25:57 +0300 (MSK)
Message-ID: <5566FB45.1090502@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 14:25:57 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, Peter Krempa <pkrempa@redhat.com>
References: <4d325283e37f8f4ebf42b2e3ca41985f2e69e26c.1431682266.git.pkrempa@redhat.com>
	<874mneghae.fsf@blackfin.pond.sub.org>
In-Reply-To: <874mneghae.fsf@blackfin.pond.sub.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] util: socket: Add missing localaddr
 and localport option for DGRAM socket
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
X-List-Received-Date: Thu, 28 May 2015 11:26:12 -0000

15.05.2015 15:24, Markus Armbruster wrote:
> Peter Krempa <pkrempa@redhat.com> writes:
> 
>> The 'socket_optslist' structure does not contain the 'localaddr' and
>> 'localport' options that are parsed in case you are creating a
>> 'connect' type UDP character device.
..

Applied to -trivial, with commit message fixup suggested by Markus.
Thanks!

/mjt

