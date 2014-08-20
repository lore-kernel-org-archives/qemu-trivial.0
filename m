Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XK7R4-0001mc-L6
	for mharc-qemu-trivial@gnu.org; Wed, 20 Aug 2014 11:04:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XK7Qv-0001Vz-L0
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 11:04:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XK7Qp-0007lA-HJ
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 11:04:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XK7Qc-0007ix-UN; Wed, 20 Aug 2014 11:03:59 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 43C8143FCF;
	Wed, 20 Aug 2014 19:03:58 +0400 (MSK)
Message-ID: <53F4B8DE.4050508@msgid.tls.msk.ru>
Date: Wed, 20 Aug 2014 19:03:58 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-devel@nongnu.org
References: <1408437017-15648-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<53F4B776.9040508@msgid.tls.msk.ru>
In-Reply-To: <53F4B776.9040508@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v8] slirp/misc: Use the GLib memory
	allocation APIs
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
X-List-Received-Date: Wed, 20 Aug 2014 15:04:25 -0000

20.08.2014 18:57, Michael Tokarev =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> 19.08.2014 12:30, zhanghailiang wrote:
>> Here we don't check the return value of malloc() which may fail.
>> Use the g_new() instead, which will abort the program when
>> there is not enough memory.
>>
>> Also, use g_strdup instead of strdup and remove the unnecessary
>> strdup function.
>=20
> I also will remove the HAVE_STRDUP define from slirp_config.h --
> it is no longer needed there.
>=20
> Applied to -trivial (with the above addition), thank you!

..And with removal of the corresponding #ifdef HAVE_STRDUP from slirp/mis=
c.h.

/mjt


