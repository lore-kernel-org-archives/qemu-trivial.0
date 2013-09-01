Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG9N9-0001oQ-6d
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 11:15:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9N2-0001gT-9K
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:15:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9Mw-00052Q-9e
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:15:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41113)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VG9Mk-0004o6-1q; Sun, 01 Sep 2013 11:15:02 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 47776400BA;
	Sun,  1 Sep 2013 19:15:01 +0400 (MSK)
Message-ID: <522359F5.60202@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 19:15:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1377609161-25108-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1377609161-25108-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] configure: Don't write .pyc files by
 default (python -B)
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
X-List-Received-Date: Sun, 01 Sep 2013 15:15:26 -0000

27.08.2013 17:12, Stefan Weil wrote:
> When a Python script is run, Python normally writes bytecode into a .pyc file.
> QEMU's build process uses several Python scripts which are called from
> configure or make.
>
> The generated .pyc files take disk space without being of much use, because
> those scripts are short, not time critical and only called a few times.
>
> Python's option -B disables writing of .pyc files. QEMU now uses "python -B"
> as default, but it is still possible to choose a different call by passing
> --python=PYTHON to configure.

Yay, thank you for this!
Applied to the trivial-patches queue.

/mjt

