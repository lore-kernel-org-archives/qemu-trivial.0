Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9lSz-0004Tw-DQ
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 03:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j9lSu-0004TK-UM
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 03:02:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j9lSu-0004xO-4P
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 03:02:44 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23763
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j9lSu-0004vt-1B
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 03:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583395363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDbNmzevc5jkzEX6aGlnOJAjzyZUx69rGl0/8eRLR1c=;
 b=NHf2/JkHvZ0DsomcRunyTeYXJeESpkG+tLIa3csUrcUFxFXsli6xUcfNtq4I6hFfgkpx6x
 xk0Brf7XDkzQYGKpAYNL5r01XUvrZF3vJAo2UnZ6XoEhC+qcTL1FnMF9YoCID69aKSzAql
 BW8ma+6NvKl8piDgTQ+Yen9teQqFxvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-TQ1kSj4pP7-6hsc_yRrcWA-1; Thu, 05 Mar 2020 03:02:39 -0500
X-MC-Unique: TQ1kSj4pP7-6hsc_yRrcWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C23211005512;
 Thu,  5 Mar 2020 08:02:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60ED87A411;
 Thu,  5 Mar 2020 08:02:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 89B1A17449; Thu,  5 Mar 2020 09:02:37 +0100 (CET)
Date: Thu, 5 Mar 2020 09:02:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH 3/6] hw/usb/quirks: Use smaller types to reduce .rodata
 by 10KiB
Message-ID: <20200305080237.j2a7waokxominirn@sirius.home.kraxel.org>
References: <20200304221807.25212-1-philmd@redhat.com>
 <20200304221807.25212-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200304221807.25212-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Thu, 05 Mar 2020 08:02:48 -0000

>  struct usb_device_id {
> -    int vendor_id;
> -    int product_id;
> -    int interface_class;
> -    int interface_subclass;
> -    int interface_protocol;
> +    int16_t vendor_id;
> +    int16_t product_id;
> +    int8_t interface_class;
> +    int8_t interface_subclass;
> +    int8_t interface_protocol;

I guess we should better use the uint variants here ...

cheers,
  Gerd


