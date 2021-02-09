Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9WCy-00077y-UM
	for mharc-qemu-trivial@gnu.org; Tue, 09 Feb 2021 11:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9WCw-000753-2Q
 for qemu-trivial@nongnu.org; Tue, 09 Feb 2021 11:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9WCt-0006gL-Cf
 for qemu-trivial@nongnu.org; Tue, 09 Feb 2021 11:49:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612889381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LMmnewQpMVdWjlDEp2/5HN5pnSMBTGG3Ilq4UwOr+Zo=;
 b=NOsrZztD+Orr9zQzH4YwjA3jOMKTlMagXnkqpUuZP+k/wN6/Suu4k3DqmNTvi9Eu67rpDW
 vvjsbKPuXTKfFt57Z1KCkVYhy99E+CD98jaZjVsz1/JTbtLDYyY5mLevGNmFT8F7UFOjqN
 oE+bscW9+wYVNM5Tjh/r2VZUmgkydnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-RiIGOEf7O2a3iMQsyOYxmg-1; Tue, 09 Feb 2021 11:49:39 -0500
X-MC-Unique: RiIGOEf7O2a3iMQsyOYxmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DDA6801978;
 Tue,  9 Feb 2021 16:49:38 +0000 (UTC)
Received: from [10.36.112.23] (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BE6619C59;
 Tue,  9 Feb 2021 16:49:28 +0000 (UTC)
Subject: Re: [PATCH 1/2] pci: cleanup failover sanity check
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, jfreimann@redhat.com,
 Laurent Vivier <laurent@vivier.eu>, quintela@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210206123955.2196514-1-lvivier@redhat.com>
 <20210206123955.2196514-2-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <680bbc2a-bff4-8b89-39df-93671871036a@redhat.com>
Date: Tue, 9 Feb 2021 17:49:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210206123955.2196514-2-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Feb 2021 16:49:47 -0000

CC: Michael

On 06/02/2021 13:39, Laurent Vivier wrote:
> Commit a1190ab628 has added a "allow_unplug_during_migration = true" at
> the end of the main "if" block, so it is not needed to set it anymore
> in the previous checking.
> 
> Remove it, to have only sub-ifs that check for needed conditions and exit
> if one fails.
> 
> Fixes: 4f5b6a05a4e7 ("pci: add option for net failover")
> Fixes: a1190ab628c0 ("migration: allow unplug during migration for failover devices")
> Cc: jfreimann@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@virtlab415.virt.lab.eng.bos.redhat.com>
> ---
>  hw/pci/pci.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 512e9042ffae..ecb7aa31fabd 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2120,10 +2120,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>              pci_qdev_unrealize(DEVICE(pci_dev));
>              return;
>          }
> -        if (!(pci_dev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)
> -            && (PCI_FUNC(pci_dev->devfn) == 0)) {
> -            qdev->allow_unplug_during_migration = true;
> -        } else {
> +        if ((pci_dev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)
> +            || (PCI_FUNC(pci_dev->devfn) != 0)) {
>              error_setg(errp, "failover: primary device must be in its own "
>                                "PCI slot");
>              pci_qdev_unrealize(DEVICE(pci_dev));
> 


