Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WkpNU-0003Cc-1i
	for mharc-qemu-trivial@gnu.org; Thu, 15 May 2014 02:42:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WkpNL-00031Q-81
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 02:42:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WkpNE-00069l-SV
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 02:42:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44323)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1WkpN2-000676-3I; Thu, 15 May 2014 02:42:24 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4F6gLgw025688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 15 May 2014 02:42:21 -0400
Received: from [10.36.116.41] (ovpn-116-41.ams2.redhat.com [10.36.116.41])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4F6gIsw008400; Thu, 15 May 2014 02:42:19 -0400
Message-ID: <1400136137.2922.16.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Date: Thu, 15 May 2014 08:42:17 +0200
In-Reply-To: <20140514200030.E7E842F456@mono.eik.bme.hu>
References: <20140514200030.E7E842F456@mono.eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, "Michael S.
	Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v3] serial-pci: Set prog interface field
 of pci config to 16550 compatible
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
X-List-Received-Date: Thu, 15 May 2014 06:42:50 -0000

On Do, 2014-02-27 at 02:05 +0100, BALATON Zoltan wrote:
       ^^^^^^^^^^
Looks like your clock is _way_ off.

> +    if (!pci->compat) {
> +        pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
> +    }

>  static Property serial_pci_properties[] = {
>      DEFINE_PROP_CHR("chardev",  PCISerialState, state.chr),
> +    DEFINE_PROP_UINT8("compat",  PCISerialState, compat, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };

> +        {\
> +            .driver   = "pci-serial",\
> +            .property = "compat",\
> +            .value    = stringify(1),\
> +        },\

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

mst, do you take that through the pci tree?

cheers,
  Gerd



