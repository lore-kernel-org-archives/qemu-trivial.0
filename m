Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1doldY-0003p4-6r
	for mharc-qemu-trivial@gnu.org; Mon, 04 Sep 2017 03:17:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1doldW-0003nt-B4
	for qemu-trivial@nongnu.org; Mon, 04 Sep 2017 03:17:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1doldV-0001fv-C1
	for qemu-trivial@nongnu.org; Mon, 04 Sep 2017 03:17:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55526)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1doldQ-0001ak-Qj; Mon, 04 Sep 2017 03:17:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE735806A1;
	Mon,  4 Sep 2017 07:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CE735806A1
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 047A417136;
	Mon,  4 Sep 2017 07:17:22 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <1504030416-18618-1-git-send-email-thuth@redhat.com>
	<eb148e1c-6cfa-b871-c201-de3f3565e4c8@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b60993f4-a20e-fdca-283d-089f272bb4cd@redhat.com>
Date: Mon, 4 Sep 2017 09:17:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <eb148e1c-6cfa-b871-c201-de3f3565e4c8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 04 Sep 2017 07:17:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.11] tests: Fix broken
 ivshmem-server-msi/-irq tests
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2017 07:17:35 -0000

On 04.09.2017 08:53, Laurent Vivier wrote:
> On 29/08/2017 20:13, Thomas Huth wrote:
>> Broken with commit b4ba67d9a7025 ("libqos: Change PCI accessors to take
>> opaque BAR handle") a while ago, but nobody noticed since the tests are
>> only run in SPEED=slow mode: The msix_pba_bar is not correctly initialized
> 
> you mean "SPEED=quick"?

Ah, well, that sentence was ambiguous - I meant "nobody noticed since
the *ivshmem* tests are only run in SPEED=slow mode *and we are running
the tests in quick mode only by default*".
Maybe this could be fixed up when the patch is picked up...

>> anymore if bir_pba has the same value as bir_table. With this fix,
>> "make check SPEED=slow" should work fine again.
>>
>> Fixes: b4ba67d9a702507793c2724e56f98e9b0f7be02b
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  tests/libqos/pci.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/libqos/pci.c b/tests/libqos/pci.c
>> index 2dcdead..28d576c 100644
>> --- a/tests/libqos/pci.c
>> +++ b/tests/libqos/pci.c
>> @@ -120,6 +120,8 @@ void qpci_msix_enable(QPCIDevice *dev)
>>      bir_pba = table & PCI_MSIX_FLAGS_BIRMASK;
>>      if (bir_pba != bir_table) {
>>          dev->msix_pba_bar = qpci_iomap(dev, bir_pba, NULL);
>> +    } else {
>> +        dev->msix_pba_bar = dev->msix_table_bar;
>>      }
>>      dev->msix_pba_off = table & ~PCI_MSIX_FLAGS_BIRMASK;
>>  
>> @@ -138,8 +140,11 @@ void qpci_msix_disable(QPCIDevice *dev)
>>      qpci_config_writew(dev, addr + PCI_MSIX_FLAGS,
>>                                                  val & ~PCI_MSIX_FLAGS_ENABLE);
>>  
>> +    if (dev->msix_pba_bar.addr != dev->msix_table_bar.addr) {
>> +        qpci_iounmap(dev, dev->msix_pba_bar);
>> +    }
>>      qpci_iounmap(dev, dev->msix_table_bar);
>> -    qpci_iounmap(dev, dev->msix_pba_bar);
>> +
>>      dev->msix_enabled = 0;
>>      dev->msix_table_off = 0;
>>      dev->msix_pba_off = 0;
>>
> 
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>

Thanks!
 Thomas

