Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZpjaZ-00017r-5H
	for mharc-qemu-trivial@gnu.org; Fri, 23 Oct 2015 17:09:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=731ed1d6e=roger.pau@citrix.com>)
	id 1Zpech-0005eb-8C
	for qemu-trivial@nongnu.org; Fri, 23 Oct 2015 11:51:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=731ed1d6e=roger.pau@citrix.com>)
	id 1Zpecd-0008Sj-3h
	for qemu-trivial@nongnu.org; Fri, 23 Oct 2015 11:51:19 -0400
Received: from smtp02.citrix.com ([66.165.176.63]:3690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=731ed1d6e=roger.pau@citrix.com>)
	id 1Zpecc-0008RX-V6; Fri, 23 Oct 2015 11:51:15 -0400
X-IronPort-AV: E=Sophos;i="5.20,187,1444694400"; d="scan'208";a="312622476"
To: Ed Maste <emaste@freebsd.org>, <qemu-devel@nongnu.org>
References: <1445611173-57034-1-git-send-email-emaste@freebsd.org>
From: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <562A56ED.2030908@citrix.com>
Date: Fri, 23 Oct 2015 17:49:01 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1445611173-57034-1-git-send-email-emaste@freebsd.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
X-DLP: MIA2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.63
X-Mailman-Approved-At: Fri, 23 Oct 2015 17:09:26 -0400
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tap-bsd: use user-specified
 tap device if it already exists
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
X-List-Received-Date: Fri, 23 Oct 2015 15:51:20 -0000

El 23/10/15 a les 16.39, Ed Maste ha escrit:
> ---
> As an aside this was reviewed on FreeBSD's Phabricator here:
> https://reviews.freebsd.org/D3969

This is missing the SoB, but provided that's added:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.


