Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aItEp-0001rh-7k
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2016 02:19:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aItEm-0001nt-KK
	for qemu-trivial@nongnu.org; Tue, 12 Jan 2016 02:19:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aItEl-0006Yv-Ji
	for qemu-trivial@nongnu.org; Tue, 12 Jan 2016 02:19:28 -0500
Received: from [59.151.112.132] (port=56794 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aItEg-0006WY-Ky; Tue, 12 Jan 2016 02:19:23 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2489453"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jan 2016 15:19:15 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 34CE0418910E;
	Tue, 12 Jan 2016 15:19:06 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 12 Jan 2016 15:19:05 +0800
To: Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	<qemu-devel@nongnu.org>
References: <1448091903-14460-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<5693688A.9030201@msgid.tls.msk.ru> <569373FB.7080505@redhat.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5694A9B1.4090707@cn.fujitsu.com>
Date: Tue, 12 Jan 2016 15:22:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <569373FB.7080505@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 34CE0418910E.A5A91
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
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
X-List-Received-Date: Tue, 12 Jan 2016 07:19:29 -0000

Thanks for your time. I almost forget this one...

On 01/11/2016 05:20 PM, Paolo Bonzini wrote:
>
>
> On 11/01/2016 09:32, Michael Tokarev wrote:
>>>>
>>>> +    assert(size > 0);
>>>> +    assert(offset >= PCI_CONFIG_HEADER_SIZE || !offset);
>>>> +
>> I'd like to see some ACKs/Reviews for this one, in particular why
>> size should be != 0.
>
> In fact it should be >= 2, because two bytes are always written below:
>
>      config = pdev->config + offset;
>      config[PCI_CAP_LIST_ID] = cap_id;
>      config[PCI_CAP_LIST_NEXT] = pdev->config[PCI_CAPABILITY_LIST];
>
>> Also either move offset assert to the below
>> "else" clause or rewrite it to be offset == 0 instead if !offset :)
>
> Good idea to move it below, or even to add
>
>      assert(offset >= PCI_CONFIG_HEADER_SIZE);
>
> after the "if", before the "config" assignment.
>
> Paolo
>
>

Seems I missed that offset == 0 will lead to find a suitable space in 
pci_find_space, and ensure offset >= PCI_CONFIG_HEADER_SIZE. sorry for 
the carelessness mistake.

According to the spec(PCI local spec, chapter 6.3), capability structure 
should be at DWORD boundary and DWORD aligned, so in both 
condition(if...else...), it should follow the spec

if offset == 0, with following line[*], seems it is ok with align issue.

[*] memset(pdev->used + offset, 0xFF, QEMU_ALIGN_UP(size, 4));

The else-branch should ensure these too.

Another little question, shouldn`t we check size at first by:

    assert((size % 4) && (size > 0))  ?

I think if caller ensure the effective param maybe it is easier to read, 
so how about following:

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 168b9cc..47cb509 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2144,6 +2144,8 @@ int pci_add_capability2(PCIDevice *pdev, uint8_t 
cap_id,
      uint8_t *config;
      int i, overlapping_cap;

+    assert(!(size % 4) && (size > 0));
+
      if (!offset) {
          offset = pci_find_space(pdev, size);
          if (!offset) {
@@ -2155,6 +2157,7 @@ int pci_add_capability2(PCIDevice *pdev, uint8_t 
cap_id,
           * depends on this check to verify that the device is not broken.
           * Should never trigger for emulated devices, but it's helpful
           * for debugging these. */
+        assert(!(offset % 4));
          for (i = offset; i < offset + size; i++) {
              overlapping_cap = pci_find_capability_at_offset(pdev, i);
              if (overlapping_cap) {
@@ -2174,7 +2177,7 @@ int pci_add_capability2(PCIDevice *pdev, uint8_t 
cap_id,
      config[PCI_CAP_LIST_NEXT] = pdev->config[PCI_CAPABILITY_LIST];
      pdev->config[PCI_CAPABILITY_LIST] = offset;
      pdev->config[PCI_STATUS] |= PCI_STATUS_CAP_LIST;
-    memset(pdev->used + offset, 0xFF, QEMU_ALIGN_UP(size, 4));
+    memset(pdev->used + offset, 0xFF, size);
      /* Make capability read-only by default */
      memset(pdev->wmask + offset, 0, size);
      /* Check capability by default */

-- 
Yours Sincerely,

Cao jin



