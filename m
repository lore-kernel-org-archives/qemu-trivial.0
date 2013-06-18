Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UovFE-0002pg-9R
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 08:42:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1UovF9-0002eN-TR
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 08:42:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>) id 1UovF5-0004V0-9m
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 08:42:39 -0400
Received: from smtp.citrix.com ([66.165.176.89]:57406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@citrix.com>)
	id 1UovF2-0004UQ-EJ; Tue, 18 Jun 2013 08:42:32 -0400
X-IronPort-AV: E=Sophos;i="4.87,888,1363132800"; d="scan'208";a="31829859"
Received: from accessns.citrite.net (HELO FTLPEX01CL01.citrite.net)
	([10.9.154.239]) by FTLPIPO01.CITRIX.COM with ESMTP/TLS/AES128-SHA;
	18 Jun 2013 12:42:31 +0000
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.78) with Microsoft SMTP Server id 14.2.342.4;
	Tue, 18 Jun 2013 08:42:31 -0400
Received: from [10.80.3.61]	by ukmail1.uk.xensource.com with esmtp (Exim 4.69)
	(envelope-from <anthony.perard@citrix.com>)	id 1UovF0-0002un-KS;
	Tue, 18 Jun 2013 13:42:30 +0100
Message-ID: <51C055B6.9070401@citrix.com>
Date: Tue, 18 Jun 2013 13:42:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1371487106-17194-1-git-send-email-anthony.perard@citrix.com>
	<51BFCDA1.8040507@msgid.tls.msk.ru> <51BFF21A.7050008@redhat.com>
In-Reply-To: <51BFF21A.7050008@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Cc: qemu-trivial@nongnu.org, Alon Levy <alevy@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU-devel <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] qxl: Fix QXLRam initialisation.
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
X-List-Received-Date: Tue, 18 Jun 2013 12:42:42 -0000

Hi,

On 18/06/13 06:37, Gerd Hoffmann wrote:
> IIRC xen has a debug mode where it fills memory with non-zero values
> instead, for debugging / testing purposes, and this is where things blow up.
>
> So while the fix is clearly correct, the patch isn't as critical as it
> initially looks like.

Indeed, it's not critical. There is other issue with Xen before to get
QXL running.

Regards,

-- 
Anthony PERARD

