Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ayl6b-0003zY-NY
	for mharc-qemu-trivial@gnu.org; Fri, 06 May 2016 15:08:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ayl6T-0003gi-Ps
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 15:08:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ayl6I-0002Xb-85
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 15:07:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46622)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ayl60-0002LB-BV; Fri, 06 May 2016 15:07:28 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CFD8840619;
	Fri,  6 May 2016 22:07:12 +0300 (MSK)
To: Christopher Friedt <chrisfriedt@gmail.com>, famz@redhat.com, mst@redhat.com
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
	<1462236478-61645-2-git-send-email-chrisfriedt@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <572CEB5F.2020605@msgid.tls.msk.ru>
Date: Fri, 6 May 2016 22:07:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <1462236478-61645-2-git-send-email-chrisfriedt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 1/2] Use libtool instead of ar to create
 static libraries on Darwin.
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
X-List-Received-Date: Fri, 06 May 2016 19:08:04 -0000

Hmm.  We removed libtool support just two moths ago... :)

/mjt

