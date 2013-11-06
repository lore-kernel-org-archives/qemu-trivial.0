Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ve2NG-0000Dj-F1
	for mharc-qemu-trivial@gnu.org; Wed, 06 Nov 2013 07:38:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ve2NA-0008WV-Ck
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 07:38:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ve2N5-0003le-SQ
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 07:38:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ve2Mx-0003l1-EC; Wed, 06 Nov 2013 07:37:59 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 56A8D40A76;
	Wed,  6 Nov 2013 16:37:58 +0400 (MSK)
Message-ID: <527A3826.1000501@msgid.tls.msk.ru>
Date: Wed, 06 Nov 2013 16:37:58 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: alex.bennee@linaro.org
References: <1383734617-10516-1-git-send-email-alex.bennee@linaro.org>
	<1383734617-10516-2-git-send-email-alex.bennee@linaro.org>
In-Reply-To: <1383734617-10516-2-git-send-email-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v6] .travis.yml: basic compile and check
 recipes
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
X-List-Received-Date: Wed, 06 Nov 2013 12:38:16 -0000

06.11.2013 14:43, alex.bennee@linaro.org wrote:
> From: Alex Benn=C3=A9e <alex@bennee.com>
>
> This adds a build matrix definition for travis-ci.org []

Thanks, applied to the trivial-patches queue.  With one tiny fix --
removed trailing whitespace in the line

  "  - TARGETS=3Dm68k-softmmu "

/mjt

