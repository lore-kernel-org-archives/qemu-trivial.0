Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpdk1-0005VZ-RJ
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 11:59:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpdjz-0005Sa-JZ
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 11:59:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpdjx-0005OO-Uo
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 11:59:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bpdjt-0005La-Tl; Thu, 29 Sep 2016 11:59:14 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 91E864325E;
	Thu, 29 Sep 2016 18:59:10 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 5ADAFB0F;
	Thu, 29 Sep 2016 18:59:09 +0300 (MSK)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20160923123508.27000-1-marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <d4671d1d-9e2f-9b9c-13ab-9f6f400ec07a@msgid.tls.msk.ru>
Date: Thu, 29 Sep 2016 18:59:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160923123508.27000-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] build-sys: fix find-in-path
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
X-List-Received-Date: Thu, 29 Sep 2016 15:59:20 -0000

Applied to trivial, with additional commit comment
suggested by Marcus, thanks!

/mjt

