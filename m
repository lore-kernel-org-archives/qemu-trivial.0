Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kjfKl-0000Pk-Qg
	for mharc-qemu-trivial@gnu.org; Mon, 30 Nov 2020 04:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kjfKk-0000PU-SH
 for qemu-trivial@nongnu.org; Mon, 30 Nov 2020 04:18:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kjfKj-0005xH-E5
 for qemu-trivial@nongnu.org; Mon, 30 Nov 2020 04:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606727936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U08jMYLmHIHDtNg+YDOX18otqk+jPv6EFMEEuUBWOKY=;
 b=eLYx1JTUU79des/WNAdJo/adykeBRmldNl6XLufrrKmd00Z8hXApsgJYYLQwGmCGvu2nJy
 ELS/x7BEyUYkBlFO9K+/+dBsEJldju7iPuV/zM2lKCGssjVKEbjNSoWOdhZSZpzFXk0vqy
 X0tkLGG8C/iEHWZliHC29GHekPzi6pg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-5AtBbtzCOi-jK7YaSYfG5w-1; Mon, 30 Nov 2020 04:18:54 -0500
X-MC-Unique: 5AtBbtzCOi-jK7YaSYfG5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E4F11005E42;
 Mon, 30 Nov 2020 09:18:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CD2B19C45;
 Mon, 30 Nov 2020 09:18:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D312AA1E2; Mon, 30 Nov 2020 10:18:51 +0100 (CET)
Date: Mon, 30 Nov 2020 10:18:51 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gan Qixin <ganqixin@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, thuth@redhat.com,
 kuhn.chenqun@huawei.com, zhang.zhanghailiang@huawei.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 09/12] u2f-passthru: put it into the 'misc' category
Message-ID: <20201130091851.kd2e7yln5tkvfynm@sirius.home.kraxel.org>
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-10-ganqixin@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201130083630.2520597-10-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 30 Nov 2020 09:18:59 -0000

On Mon, Nov 30, 2020 at 04:36:27PM +0800, Gan Qixin wrote:
> The category of the u2f-passthru device is not set, put it into the 'misc'
> category.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>


