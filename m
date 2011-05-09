Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJOsM-0000td-0a
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2011 07:43:46 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1QJOsJ-0000ni-In
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 07:43:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1QJOsI-0002nc-R6
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 07:43:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27536)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1QJOsH-0002nM-2Y; Mon, 09 May 2011 07:43:41 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p49BhdmK011462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 9 May 2011 07:43:39 -0400
Received: from rincewind.home.kraxel.org (vpn2-10-11.ams2.redhat.com
	[10.36.10.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p49BhHRd005069; Mon, 9 May 2011 07:43:25 -0400
Message-ID: <4DC7D353.6020607@redhat.com>
Date: Mon, 09 May 2011 13:43:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110318 Red Hat/3.1.9-3.el6_0 Thunderbird/3.1.9
MIME-Version: 1.0
To: Jan Vesely <jano.vesely@gmail.com>
References: <BANLkTik3hmvH6_tUuEZjR8j0L04PdCk7mw@mail.gmail.com>	<4DC29287.5030106@redhat.com>	<BANLkTik=gr0K9-_fOTqPQORo37xs2D+9Yg@mail.gmail.com>	<4DC79DEC.50401@redhat.com>
	<BANLkTimMGis4pBnZvbP=KwKtaOp8rDCfBQ@mail.gmail.com>
In-Reply-To: <BANLkTimMGis4pBnZvbP=KwKtaOp8rDCfBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] Bug #757654: UHCI fails to signal
 stall response patch
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
X-List-Received-Date: Mon, 09 May 2011 11:43:44 -0000

On 05/09/11 12:16, Jan Vesely wrote:
> UHCI host controller status register indicates error and
> an interrupt is triggered on BABBLE and STALL errors.

Queued up.

thanks,
   Gerd


