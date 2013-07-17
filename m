Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UzNVp-0001E0-PQ
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jul 2013 04:55:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UzNVn-000190-6L
	for qemu-trivial@nongnu.org; Wed, 17 Jul 2013 04:55:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UzNVl-0007eI-RA
	for qemu-trivial@nongnu.org; Wed, 17 Jul 2013 04:55:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UzNVi-0007Zv-Qm; Wed, 17 Jul 2013 04:54:58 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A0AC541A27;
	Wed, 17 Jul 2013 12:54:55 +0400 (MSK)
Message-ID: <51E65BDE.60402@msgid.tls.msk.ru>
Date: Wed, 17 Jul 2013 12:54:54 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <1373660992-92075-1-git-send-email-emaste@freebsd.org>
	<51E11A1B.2020503@msgid.tls.msk.ru>
	<CAPyFy2BW9+hLC=7+oxnyiA17Lm484VgaQRz8S-RaV_vv92LoHg@mail.gmail.com>
	<51E656B9.6090600@siemens.com>
In-Reply-To: <51E656B9.6090600@siemens.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: reorder include to
 fix FreeBSD build failure
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
X-List-Received-Date: Wed, 17 Jul 2013 08:55:04 -0000

17.07.2013 12:32, Jan Kiszka wrote:
> No problem, as Peter already said. Please provide an according patch.

http://thread.gmane.org/gmane.comp.emulators.qemu/221949/focus=221975
 (an attachtment there)
http://git.corpit.ru/?p=qemu.git;a=commitdiff;h=2915c3b20260b1a653fced3b584d0c2b012880dc

Thanks,

/mjt

