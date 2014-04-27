Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeLBt-0002GX-T9
	for mharc-qemu-trivial@gnu.org; Sun, 27 Apr 2014 05:16:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeLBn-000245-28
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 05:16:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeLBg-0004fL-Pg
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 05:15:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47649)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WeLBU-0004ds-6F; Sun, 27 Apr 2014 05:15:40 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 738F242F31;
	Sun, 27 Apr 2014 13:15:39 +0400 (MSK)
Message-ID: <535CCABB.1060500@msgid.tls.msk.ru>
Date: Sun, 27 Apr 2014 13:15:39 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Kirill Batuzov <batuzovk@ispras.ru>, qemu-devel@nongnu.org
References: <1397138878-11770-1-git-send-email-batuzovk@ispras.ru>
In-Reply-To: <1397138878-11770-1-git-send-email-batuzovk@ispras.ru>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH trivial] init_paths: fix minor memory leak
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
X-List-Received-Date: Sun, 27 Apr 2014 09:16:05 -0000

10.04.2014 18:07, Kirill Batuzov wrote:
> Fields "name" (created with strdup in new_entry) and "pathname"
> (created with g_strdup_printf in new_entry) of pathelem struct should
> be freed before the whole struct is.

Applied to -trivial, thanks!

The fun thing here is that the code _looks_ correct.  I think
it might be better to create proper API for destroying path
elements - new_entry() and its destroying counterpart, free_entry().

/mjt

