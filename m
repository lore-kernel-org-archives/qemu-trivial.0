Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzjF4-0007G4-0t
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 06:16:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YzjF1-0007CI-Ry
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 06:16:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YzjF1-0000Qn-5u
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 06:16:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56719)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YzjEu-0000IV-7j; Tue, 02 Jun 2015 06:16:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EEECB4047C;
	Tue,  2 Jun 2015 13:16:06 +0300 (MSK)
Message-ID: <556D8266.8060004@msgid.tls.msk.ru>
Date: Tue, 02 Jun 2015 13:16:06 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1433237561-10846-1-git-send-email-famz@redhat.com>
In-Reply-To: <1433237561-10846-1-git-send-email-famz@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Jeff Cody <jcody@redhat.com>, qemu-block@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] sheepdog: Fix error message if failed to
	load vmstate
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
X-List-Received-Date: Tue, 02 Jun 2015 10:16:16 -0000

02.06.2015 12:32, Fam Zheng wrote:
>          if (ret < 0) {
> -            error_report("failed to save vmstate %s", strerror(errno));
> +            if (load) {
> +                error_report("failed to load vmstate %s", strerror(errno));
> +            } else {
> +                error_report("failed to save vmstate %s", strerror(errno));
> +            }

 +            error_report("failed to %s vmstate: %s", load ? "load" : "save", strerror(errno));

(note also the addition of ":")
(besides what Kevin said).

Thanks,

/mjt

