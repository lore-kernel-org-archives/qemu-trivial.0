Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2zSy-0003qU-14
	for mharc-qemu-trivial@gnu.org; Sun, 29 Nov 2015 05:44:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zSv-0003mz-OL
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:44:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zSv-00019n-0K
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:44:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38745)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a2zSq-00019D-2V; Sun, 29 Nov 2015 05:44:16 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 826E643237;
	Sun, 29 Nov 2015 13:44:15 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 68183A68;
	Sun, 29 Nov 2015 13:44:15 +0300 (MSK)
Message-ID: <565AD6FF.6060105@msgid.tls.msk.ru>
Date: Sun, 29 Nov 2015 13:44:15 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Rodrigo Rebello <rprebello@gmail.com>, qemu-devel@nongnu.org
References: <1447337068-2448-1-git-send-email-rprebello@gmail.com>
In-Reply-To: <1447337068-2448-1-git-send-email-rprebello@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2 1/1] configure: use appropriate code
 fragment for -fstack-protector checks
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
X-List-Received-Date: Sun, 29 Nov 2015 10:44:22 -0000

12.11.2015 17:04, Rodrigo Rebello wrote:
> The check for stack-protector support consisted in compiling and linking
> the test program below (output by function write_c_skeleton()) with the
> compiler flag -fstack-protector-strong first and then with
> -fstack-protector-all if the first one failed to work:
...

Applied to -trivial, thank you!

/mjt

