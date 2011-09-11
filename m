Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R2t5A-0005fF-BN
	for mharc-qemu-trivial@gnu.org; Sun, 11 Sep 2011 19:05:00 -0400
Received: from eggs.gnu.org ([140.186.70.92]:40316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1R2t57-0005WD-9v
	for qemu-trivial@nongnu.org; Sun, 11 Sep 2011 19:04:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1R2t56-0002BF-C6
	for qemu-trivial@nongnu.org; Sun, 11 Sep 2011 19:04:57 -0400
Received: from fmmailgate01.web.de ([217.72.192.221]:50952)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1R2t53-0002AQ-IF; Sun, 11 Sep 2011 19:04:53 -0400
Received: from smtp05.web.de  ( [172.20.4.166])
	by fmmailgate01.web.de (Postfix) with ESMTP id 925DA196EFF81;
	Mon, 12 Sep 2011 01:04:51 +0200 (CEST)
Received: from [84.148.48.106] (helo=[10.0.1.1])
	by smtp05.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1R2t51-0001oA-00; Mon, 12 Sep 2011 01:04:51 +0200
Message-Id: <9A366686-E936-42A4-BC3C-AC80D7CE0D52@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Alexander Graf <agraf@suse.de>,
 Blue Swirl <blauwirbel@gmail.com>
In-Reply-To: <68748506-3E70-4AF2-AA49-5A23141725DA@suse.de>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Mon, 12 Sep 2011 01:04:50 +0200
References: <1315688954-14621-1-git-send-email-weil@mail.berlios.de>
	<68748506-3E70-4AF2-AA49-5A23141725DA@suse.de>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX19rwvueiasxQVJz723r6aCxSCHHM1As9YBjRhq4
	R/JDDWByOuOtWc3mPXNE+t0VveewA42ih4Cy51SOx2KfKhcgfQ
	Is6OUAXrx/0AYxClsAVg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Stefan Weil <weil@mail.berlios.de>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc: Remove URL which
	is no longer available
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
X-List-Received-Date: Sun, 11 Sep 2011 23:04:58 -0000

Am 11.09.2011 um 22:39 schrieb Alexander Graf:

> Am 10.09.2011 um 23:09 schrieb Stefan Weil <weil@mail.berlios.de>:
>
>> http://perso.magic.fr/l_indien/ was removed several years ago.
>> There is obviously no mirror or any other replacement for it.
>
> I would prefer to see the sources in a public git repo and to have  
> ppc_rom.bin rebuilt from that. IIUC Andreas is already working on  
> this.

Yes, I set up http://repo.or.cz/w/openhackware.git today.

We'll look into the build and the patches referenced by Blue over the  
next days.

@Stefan H.: Please disregard this patch, I intend to supply an  
alternative one. If we urgently need to apply a change, we should at  
least keep the URL where it was formerly accessible, so that the  
interested reader has a chance to look it up in the Internet Archive.

Andreas

