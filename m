Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YAaxz-0007Rr-M7
	for mharc-qemu-trivial@gnu.org; Mon, 12 Jan 2015 04:07:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YAaxx-0007Oc-1C
	for qemu-trivial@nongnu.org; Mon, 12 Jan 2015 04:07:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YAaxw-0003mv-04
	for qemu-trivial@nongnu.org; Mon, 12 Jan 2015 04:07:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YAaxp-0003kJ-Hz; Mon, 12 Jan 2015 04:07:09 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 64EF5406C6;
	Mon, 12 Jan 2015 12:07:08 +0300 (MSK)
Message-ID: <54B38EBC.3030509@msgid.tls.msk.ru>
Date: Mon, 12 Jan 2015 12:07:08 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Thomas Huth <thuth@linux.vnet.ibm.com>, qemu-trivial@nongnu.org, 
	qemu-devel@nongnu.org
References: <1418638786-29872-1-git-send-email-thuth@linux.vnet.ibm.com>
In-Reply-To: <1418638786-29872-1-git-send-email-thuth@linux.vnet.ibm.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] Makefile: Remove config.status and
 common.env during 'make distclean'
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
X-List-Received-Date: Mon, 12 Jan 2015 09:07:17 -0000

15.12.2014 13:19, Thomas Huth wrote:
> config.status and tests/qemu-iotests/common.env are generated files
> that should be deleted during 'make distclean'.

Somehow I missed this one previously.  Applied to -trivial now, thank you!
(I'm not sure why did you combine po/*.mo and .../common.env into one line
but that's not a problem really).

/mjt

