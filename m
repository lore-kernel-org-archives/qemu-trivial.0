Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYLNd-0007MR-NM
	for mharc-qemu-trivial@gnu.org; Tue, 23 Feb 2016 17:24:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aYLNb-0007Hv-1J
	for qemu-trivial@nongnu.org; Tue, 23 Feb 2016 17:24:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aYLNZ-0002sD-MM
	for qemu-trivial@nongnu.org; Tue, 23 Feb 2016 17:24:26 -0500
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:33542)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1aYLNT-0002q5-5G; Tue, 23 Feb 2016 17:24:19 -0500
Received: by mail-pa0-x242.google.com with SMTP id y7so10334paa.0;
	Tue, 23 Feb 2016 14:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=JWZdmBxNoDdGFRtFxXH9DLAK+EXdi/TFN/cAt4F/Mjg=;
	b=UfxR817FkVm9Kic92AhfN88L4moVqMISUPPZ+bNGkBPsdrKEgxxRqQJf7TiG/4Ks3Z
	s64z0ZNvXX3/alSIHljuiH71hjRY6eR3A2rjY149fuEiE9XsJE4ZcL7e1BvAfB6LUbsG
	UH8ji/9kkfQLjDLeTDhqhvaLOy6NXYJlGfq2PA4tBAlVlCUoYoruJzuc1u+nMS9kz0Lc
	BKNPREv7m0+fDIW6RENXnbRG7os7pnJgaH4mXZ6W/Pk0sX63X/Dz1fCUW07LdFB0P9LG
	9qHbm+ip/i1I9BzcxnjDhwtNvBXYZgw79+lZnknHFX+qlcN8abkH7YILGusTvNKVOARJ
	rugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=JWZdmBxNoDdGFRtFxXH9DLAK+EXdi/TFN/cAt4F/Mjg=;
	b=mx5bR6nf1zH8ZPcHgjSFZaJdoDvWRtJ95AmgO5thEi//t0tzYjM3j67+hiyZw45bFP
	F2i8IUToNQva9CYyOvRxS7AoiYpDQz2Flr3wSzRL9/riUD38WoGLawNL4Sj6ovwFdZE1
	IOCp00qb932nYYlECLUmDBq7L6IoFVPnp+Wxy0QSVLgYyLM8V31tY/mH+OqnHw/KdwLR
	2jkLmBz00cD2iJ6/XZSvbmBCNsmog4T+kfzp6a98X56g0bgNlx4xLNX+kK5d6nwzuP76
	DiLsivgcnc9dwWLVYu9/N/RhvPqa3BktH+VZXSX1EHeFphmT7/TtOGUM9tLucO/ZiEp6
	OSCg==
X-Gm-Message-State: AG10YOT+ErTjVytfFF469+mOoOLP6hF0TpD54s6+pzKpCRfBdNl209zdIzO5B4SayT/QpQ==
X-Received: by 10.66.62.162 with SMTP id z2mr49456503par.39.1456266258292;
	Tue, 23 Feb 2016 14:24:18 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	27sm46360371pfh.48.2016.02.23.14.24.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Feb 2016 14:24:17 -0800 (PST)
Date: Tue, 23 Feb 2016 22:24:15 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Yi Min Zhao <zyimin@linux.vnet.ibm.com>
Message-ID: <20160223222415.GA11962@vultr.guest>
References: <1455895091-7589-1-git-send-email-richard.weiyang@gmail.com>
	<1455895091-7589-3-git-send-email-richard.weiyang@gmail.com>
	<56CB09DB.7070604@de.ibm.com>
	<20160223141711.277bfb16@oc0525210443>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160223141711.277bfb16@oc0525210443>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Cc: qemu-trivial@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cornelia.huck@de.ibm.com>, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH 2/2] s390x/pci: use PCI_MSIX_FLAGS on
 retrieving the MSIX entries
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Wei Yang <richard.weiyang@gmail.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Feb 2016 22:24:28 -0000

On Tue, Feb 23, 2016 at 02:17:11PM +0800, Yi Min Zhao wrote:
>于 Mon, 22 Feb 2016 14:15:07 +0100
>Christian Borntraeger <borntraeger@de.ibm.com> 写道:
>
>> On 02/19/2016 04:18 PM, Wei Yang wrote:
>> > Even PCI_CAP_FLAGS has the same value as PCI_MSIX_FLAGS, the later one is
>> > the more proper on retrieving MSIX entries.
>> > 
>> > This patch uses PCI_MSIX_FLAGS to retrieve the MSIX entries.
>> > 
>> > Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> > CC: Cornelia Huck <cornelia.huck@de.ibm.com>
>> > CC: Christian Borntraeger <borntraeger@de.ibm.com>
>> > ---
>> >  hw/s390x/s390-pci-bus.c |    2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > 
>> > diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
>> > index 132588b..9d40039 100644
>> > --- a/hw/s390x/s390-pci-bus.c
>> > +++ b/hw/s390x/s390-pci-bus.c
>> > @@ -523,7 +523,7 @@ static int s390_pcihost_setup_msix(S390PCIBusDevice *pbdev)
>> >          return 0;
>> >      }
>> > 
>> > -    ctrl = pci_host_config_read_common(pbdev->pdev, pos + PCI_CAP_FLAGS,
>> > +    ctrl = pci_host_config_read_common(pbdev->pdev, pos + PCI_MSIX_FLAGS,
>> >               pci_config_size(pbdev->pdev), sizeof(ctrl));
>> >      table = pci_host_config_read_common(pbdev->pdev, pos + PCI_MSIX_TABLE,
>> >               pci_config_size(pbdev->pdev), sizeof(table));
>> > 
>> 
>> looks sane.
>> Yi Min, can you ack/nack?
>> 
>> 
>
>It looks sane to me. A little change.

Thanks Yi Min and Christian.

So someone would pick it up?

-- 
Wei Yang
Help you, Help me

