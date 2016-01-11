Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIXtm-0007K6-24
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:32:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXtg-0007AP-CL
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:32:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXtf-0006qd-J4
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:32:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIXtb-0006q4-Bn; Mon, 11 Jan 2016 03:32:11 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 31CCB40375;
	Mon, 11 Jan 2016 11:32:11 +0300 (MSK)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1448091903-14460-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5693688A.9030201@msgid.tls.msk.ru>
Date: Mon, 11 Jan 2016 11:32:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1448091903-14460-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] PCI: add param check for api
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
X-List-Received-Date: Mon, 11 Jan 2016 08:32:20 -0000

21.11.2015 10:45, Cao jin wrote:
> add param check for pci_add_capability2, as it is a public API.
> 
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/pci/pci.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 168b9cc..6938f64 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2144,6 +2144,9 @@ int pci_add_capability2(PCIDevice *pdev, uint8_t cap_id,
>      uint8_t *config;
>      int i, overlapping_cap;
>  
> +    assert(size > 0);
> +    assert(offset >= PCI_CONFIG_HEADER_SIZE || !offset);
> +

I'd like to see some ACKs/Reviews for this one, in particular why
size should be != 0.  Also either move offset assert to the below
"else" clause or rewrite it to be offset == 0 instead if !offset :)

Thanks,

/mjt

>      if (!offset) {
>          offset = pci_find_space(pdev, size);
>          if (!offset) {
> 


