Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKlzw-00046F-SK
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 05:18:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKlzp-00044p-3F
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:18:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKlfK-0002ER-J2
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 04:57:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKlfE-000263-8Z; Sat, 14 Sep 2013 04:57:12 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 871FA41074;
	Sat, 14 Sep 2013 12:57:11 +0400 (MSK)
Message-ID: <523424E7.1050903@msgid.tls.msk.ru>
Date: Sat, 14 Sep 2013 12:57:11 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1379009346-18130-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1379009346-18130-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] translate-all: Fix formatting of dump
 output
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
X-List-Received-Date: Sat, 14 Sep 2013 09:18:35 -0000

12.09.2013 22:09, Stefan Weil wrote:
> The page dump writes a table with 3 abi_ulong values in each row.
> These values take 8 or 16 characters (depending on sizeof abi_ulong).
>
> Fix the table headings to be aligned with the table columns.

Thanks, applied to the trivial-patches queue.

/mjt

