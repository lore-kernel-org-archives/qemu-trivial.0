Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJLJW-0002Uo-DM
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2011 03:55:34 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1QJLJU-0002QU-4R
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 03:55:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1QJLJT-0004DS-A5
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 03:55:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:6024)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1QJLJR-0004Cu-7e; Mon, 09 May 2011 03:55:29 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p497tQfC005268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 9 May 2011 03:55:26 -0400
Received: from rincewind.home.kraxel.org (vpn2-10-11.ams2.redhat.com
	[10.36.10.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p497tOoW007636; Mon, 9 May 2011 03:55:25 -0400
Message-ID: <4DC79DEC.50401@redhat.com>
Date: Mon, 09 May 2011 09:55:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110318 Red Hat/3.1.9-3.el6_0 Thunderbird/3.1.9
MIME-Version: 1.0
To: Jan Vesely <jano.vesely@gmail.com>
References: <BANLkTik3hmvH6_tUuEZjR8j0L04PdCk7mw@mail.gmail.com>	<4DC29287.5030106@redhat.com>
	<BANLkTik=gr0K9-_fOTqPQORo37xs2D+9Yg@mail.gmail.com>
In-Reply-To: <BANLkTik=gr0K9-_fOTqPQORo37xs2D+9Yg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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
X-List-Received-Date: Mon, 09 May 2011 07:55:33 -0000

On 05/06/11 10:07, Jan Vesely wrote:
> hi,
> using the modified (single line) patch only works half-way, it sets
> the value in status register (guess that's what that line does :))
> but hw interrupt is not generated.
>
> I tried adding uhci_update_irq and this patch:

> +        s->status |= UHCI_STS_USBERR;
> +        uhci_update_irq(s);

> works.

Good.  Can you create a patch with a changelog entry & signed-off 
please?  I'll go queue it up then.

thanks,
   Gerd


