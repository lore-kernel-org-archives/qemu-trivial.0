Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Upv1N-00047J-2V
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 02:40:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Upv1J-00040N-Tw
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 02:40:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Upv1H-00058j-SM
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 02:40:29 -0400
Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234]:43071)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Upv1H-00058W-OQ
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 02:40:27 -0400
Received: by mail-ie0-f180.google.com with SMTP id f4so17770518iea.25
	for <qemu-trivial@nongnu.org>; Thu, 20 Jun 2013 23:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=5MhvMe5N8cf10FVPKDnc4B/5u1036dafCHeIat8beNE=;
	b=kFEzx3r4n3dxQHlN9y221ft4H3Hkrl1xqJA745bnnORcdTFOuLLcjHwxtdWRrvuL3y
	aSW3MoTX+5X1KZMXJMdu2RB/l+m1Zi7+uIfZ5tzg2j/kOgzFBK4BFdKkBiKvSeUsvv0c
	GsBHPysy0liHqBEwWVpJUQrMmmEnWa8aCiYgTOTCppd8g257DtLr5c1We1c9JuY25L1+
	4FzIZG9BmQ/+T0G8p0dKfmscV0TbB/CNdw8IMmJYQLccOHP0uqU+dWdgyhSCcAHQebhq
	/1PcbCA0RWsuYW0+af+UwMedcbcA2w2s1ulxShnGel39paom6ODqbnizvw91XABFVLP0
	lrJA==
X-Received: by 10.43.141.206 with SMTP id jf14mr5298491icc.8.1371796826321;
	Thu, 20 Jun 2013 23:40:26 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	fu2sm4063932igb.3.2013.06.20.23.40.20 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 23:40:25 -0700 (PDT)
Message-ID: <51C3F552.6050609@ozlabs.ru>
Date: Fri, 21 Jun 2013 16:40:18 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<1371747090.32709.61.camel@ul30vt.home>
	<51C3B2E4.7000807@ozlabs.ru>
	<1371782063.30572.74.camel@ul30vt.home> <51C3BF3E.20901@ozlabs.ru>
	<1371789981.30572.114.camel@ul30vt.home>
	<1371791533.3944.50.camel@pasglop>
	<1371794598.30572.122.camel@ul30vt.home>
	<1371795171.3944.52.camel@pasglop>
In-Reply-To: <1371795171.3944.52.camel@pasglop>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQn7wwVPHryREqgrWNiRVbzLzQQN/Wt0z0LiMDEzchfN+TlzHDO8vJFgO571XZMHugG2NhbK
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c03::234
Cc: Anthony Liguori <aliguori@us.ibm.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Paul Mackerras <paulus@samba.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH] RFC kvm irqfd: add directly mapped MSI
	IRQ support
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
X-List-Received-Date: Fri, 21 Jun 2013 06:40:31 -0000

On 06/21/2013 04:12 PM, Benjamin Herrenschmidt wrote:
> On Fri, 2013-06-21 at 00:03 -0600, Alex Williamson wrote:
>> On Fri, 2013-06-21 at 15:12 +1000, Benjamin Herrenschmidt wrote:
>>> On Thu, 2013-06-20 at 22:46 -0600, Alex Williamson wrote:
>>>> Maybe you could add a device parameter to kvm_irqchip_add_msi_route so
>>>> that it can be implemented on POWER without this pci_bus_map_msi
>>>> interface that seems very unique to POWER.  Thanks,
>>>
>>> You mean unique to all non-x86 ? :-)
>>>
>>> I believe almost everybody eventually turn MSIs into "normal"
>>> interrupts...
>>>
>>> Most often than not, the logic to do so is in the PCI Host Bridge.
>>>
>>> The whole concept of passing the message address/data accross the
>>> user/kernel interface is an x86 crackpotery but as is the entire
>>> remapping/routing layer so ... :-)
>>
>> Regardless, this is exactly what kvm_irqchip_add_msi_route does.  It
>> says, here's an MSIMessage, give me an IRQ that sends that. 
> 
> Yes, and in our case, what happens is that the guest said to use "I want
> an MSI", we picked up an IRQ, and made up a message for it :-) The
> actual message address/data we use is a complete invention that only
> exists within qemu. So here we need to basically turn it back into an
> IRQ, which we might be able to do by ... just making the message (or
> part of the address) be the IRQ number or something like that.
> 
>>  In the x86
>> case, that means pick a free IRQ and program it to send that MSIMessage
>> when we hit the irqfd.  In the case of POWER it means lookup which IRQ
>> gets fired by that MSIMessage and return it.  In a non-accelerated QEMU
>> case I'd think msi_notify() would write the MSIMessage to this IRQ
>> remapper device and let it toggle the next qemu_irq down the line.  If
>> we ever add an IOMMU based IRQ remapper to the x86 model, we'd need
>> something similar.  Thanks,


Yes, I am changing IRQ to MSI message conversion (and some other things as
replacing per PHB MSI windows to one for a whole system) and I am going to
post something tonight.



-- 
Alexey

