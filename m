Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d2L7P-000050-4G
	for mharc-qemu-trivial@gnu.org; Sun, 23 Apr 2017 13:16:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2L7N-0008Vb-Dr
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 13:16:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2L7M-0003Gn-GH
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 13:16:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40887)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d2L7I-0003DL-16; Sun, 23 Apr 2017 13:16:08 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AD18041F51;
	Sun, 23 Apr 2017 20:16:04 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 897363F8;
	Sun, 23 Apr 2017 20:16:04 +0300 (MSK)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170311132256.22951-1-marcandre.lureau@redhat.com>
	<20170311132256.22951-4-marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, anderson@redhat.com,
	pbonzini@redhat.com, lersek@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <db21dce3-9613-02eb-64f8-9ff888e5f03d@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2017 20:16:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170311132256.22951-4-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 03/21] object: fix potential leak in
 getters
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
X-List-Received-Date: Sun, 23 Apr 2017 17:16:14 -0000

11.03.2017 16:22, Marc-Andr=C3=A9 Lureau wrote:
> If the property is not of the requested type, the getters will leak a
> QObject.

I'm not really sure it's -trivial material.

Not applying 01/23 either.

Should whole series be applied to the same tree perhaps?

Thanks,

/mjt

