Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ag9ce-0001MZ-Rr
	for mharc-qemu-trivial@gnu.org; Wed, 16 Mar 2016 07:28:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ag9cc-0001IW-Lm
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 07:28:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ag9cb-0007Ir-Gz
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 07:28:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ag9cV-0007Ej-F1; Wed, 16 Mar 2016 07:28:07 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CBDC840EBF;
	Wed, 16 Mar 2016 14:27:57 +0300 (MSK)
To: Wei Yang <richard.weiyang@gmail.com>, alex.williamson@redhat.com
References: <1455152067-19900-1-git-send-email-richard.weiyang@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56E9433C.1040503@msgid.tls.msk.ru>
Date: Wed, 16 Mar 2016 14:27:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <1455152067-19900-1-git-send-email-richard.weiyang@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vfio/pci: replace 1 with
 PCI_CAP_LIST_NEXT to make code self-explain
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
X-List-Received-Date: Wed, 16 Mar 2016 11:28:15 -0000

11.02.2016 03:54, Wei Yang wrote:
> Use the macro PCI_CAP_LIST_NEXT instead of 1, so that the code would be
> more self-explain.
> 
> This patch makes this change and also fixs one typo in comment.
> 

>      for (tmp = pdev->config[PCI_CAPABILITY_LIST]; tmp;
> -         tmp = pdev->config[tmp + 1]) {
> +         tmp = pdev->config[tmp + PCI_CAP_LIST_NEXT]) {

> -    next = pdev->config[pos + 1];
> +    next = pdev->config[pos + PCI_CAP_LIST_NEXT];

Hmm. I'm not sure the new version is better, to me "+1" reads
easier than the new symbolic constant variant.

If it were something like pdev->config[PCI_CAP_LIST_NEXT], that'd be
nice, but not "pos + PCI_CAP_LIST_NEXT".

But again, I'm not pci config space expert and don't understand
the basics :)

Thanks,

/mjt

