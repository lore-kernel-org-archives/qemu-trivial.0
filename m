Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b6w7a-0005Kd-Fe
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2016 04:30:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b6w7Y-0005J7-Bz
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 04:30:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b6w7W-0005Ke-F9
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 04:30:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39180)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b6w7S-0005Ij-2c; Sun, 29 May 2016 04:30:46 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3A8D842C33;
	Sun, 29 May 2016 11:30:42 +0300 (MSK)
To: Paolo Bonzini <pbonzini@redhat.com>, Cao jin <caoj.fnst@cn.fujitsu.com>,
	qemu-devel@nongnu.org
References: <1460879154-13258-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<5731D9A7.4030300@redhat.com>
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, armbru@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <574AA8B1.3080104@msgid.tls.msk.ru>
Date: Sun, 29 May 2016 11:30:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <5731D9A7.4030300@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] qdev: Clean up around properties
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2016 08:30:53 -0000

10.05.2016 15:52, Paolo Bonzini wrote:
> Just comments, so
> 
> Cc: qemu-trivial@nongnu.org
> 
> On 17/04/2016 09:45, Cao jin wrote:
>> include:
>> 1. remove unnecessary declaration of static function
>> 2. fix inconsistency between comment and function name, and typo OOM->QOM
>> 2. update comments of functions, use uniform format(GTK-Doc style)

Applied to -trivial, thanks!

/mjt

