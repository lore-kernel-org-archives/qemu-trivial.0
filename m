Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJywr-0003L3-Bk
	for mharc-qemu-trivial@gnu.org; Wed, 10 Mar 2021 08:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJywo-0003Jn-4R
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 08:32:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJywk-0000EF-BD
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 08:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615383136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ocmHiTpd7ZxVFzkeWP6xVUsSh6ypMBqESpsQ3i7TJfw=;
 b=goI3VBF4pIrQfGRTA8sNIq+zks//QYfaSYCr/91WiJJQiTmdX25qAAWljhdvbXA/S55GUP
 fnUBLPbSN7MvjBc4HvvDDxY9ct5bh99UMcFva4hye5TievJ/8q2hLR+B3JpDOgYX4nw26w
 r44YN9qrlITd79HbB2rAJpBKfWnY/6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-4NIA19YxM76G5k6Yv2xEwg-1; Wed, 10 Mar 2021 08:32:15 -0500
X-MC-Unique: 4NIA19YxM76G5k6Yv2xEwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70EA9881D6E;
 Wed, 10 Mar 2021 13:32:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B8B262953;
 Wed, 10 Mar 2021 13:32:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AFAEF18000AC; Wed, 10 Mar 2021 14:32:12 +0100 (CET)
Date: Wed, 10 Mar 2021 14:32:12 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH v2] hw/usb/bus: Remove the "full-path" property
Message-ID: <20210310133212.q4cxqk442rtuavmc@sirius.home.kraxel.org>
References: <20210302120152.118042-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210302120152.118042-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Mar 2021 13:32:24 -0000

On Tue, Mar 02, 2021 at 01:01:52PM +0100, Thomas Huth wrote:
> This property was only required for the pc-1.0 and earlier machine
> types. Since these have been removed now, we can delete the property
> as well.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Remove the USB_DEV_FLAG_FULL_PATH constant completely

Added to usb queue.

thanks,
  Gerd


