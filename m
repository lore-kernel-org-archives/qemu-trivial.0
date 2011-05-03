Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QHMAW-00083a-Kh
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2011 16:26:04 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QHMAV-00083I-AI
	for qemu-trivial@nongnu.org; Tue, 03 May 2011 16:26:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QHMAU-0006P0-Bq
	for qemu-trivial@nongnu.org; Tue, 03 May 2011 16:26:03 -0400
Received: from moutng.kundenserver.de ([212.227.17.9]:64061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QHMAT-0006Or-U5; Tue, 03 May 2011 16:26:02 -0400
Received: from flocke.fritz.box (p54AD9E86.dip.t-dialin.net [84.173.158.134])
	by mrelayeu.kundenserver.de (node=mreu2) with ESMTP (Nemesis)
	id 0MCuUJ-1QQwxJ3f6Z-009j5t; Tue, 03 May 2011 22:25:59 +0200
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.fritz.box with esmtp (Exim 4.72)
	(envelope-from <weil@mail.berlios.de>)
	id 1QHMAP-0002Vp-S6; Tue, 03 May 2011 22:25:57 +0200
Message-ID: <4DC064D5.7000800@mail.berlios.de>
Date: Tue, 03 May 2011 22:25:57 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110307 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V02:K0:fhlFjEUdIixNd6D/afDUnbtISpzgirBMWn8qIRFjP1K
	U3oK0kyXkLe95YPNVmNLdg7OCEIwPTD0mm9azHyvGeq99tzDDj
	lE9Imru/9nOvGuaRWClGszhzmEjIvTdnOVZy2kohIoYjozCOaC
	yPL+yGblynFxxuQIxkDGf2JS4tpCjycJKNKfdOuLm24Cw4e2uQ
	0SsBEr1k/Ad869P7ShXZcvGdzM/f4VqAmFZJq/djD/1NYoEEkF qW5YIO5/dm5TC
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.9
Cc: QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 01/18] Fix typos in comments (dependancy
	-> dependency)
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
X-List-Received-Date: Tue, 03 May 2011 20:26:04 -0000

Am 28.04.2011 17:20, schrieb Stefan Weil:
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
> Changelog | 2 +-
> Makefile.objs | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>

There were no replies to the patch series up to now.

Should I have added a remark that all 18 patches are independent,
so they are trivial even if the series contains more than 4 patches?

Or would it be better to combine all patches in one large patch?
I did not do this because review is a little easier with small
patches, and it also reduces the risk of merge conflicts.

Best regards,

Stefan W.


