Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jh6c8-0000fB-UZ
	for mharc-qemu-trivial@gnu.org; Fri, 05 Jun 2020 03:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jh6c7-0000cl-6d
 for qemu-trivial@nongnu.org; Fri, 05 Jun 2020 03:18:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23448
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jh6c6-0000I3-Hd
 for qemu-trivial@nongnu.org; Fri, 05 Jun 2020 03:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591341482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ny1a98ypNOoO1UJ+bgWbjA2Qh33VKFLeXe0DNQcea/k=;
 b=Z5LsAOGemDIEitk7QeWwNkVKCI+DooW2qTcQGaPUhnbLYJKzT/BBCFLSk2FSYwen7fxRuF
 gBQ/3pByrPK39eT7EAy7JCFJ633BOJyZFRuVS2dq6kWt2NfCPZuDfYMvwOg7cGSxMV5hsK
 jqrgxspOx3ZBDZTno8FbZjIsulCja24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-N6z06qYGNJ6nwcCr7S4Z9w-1; Fri, 05 Jun 2020 03:17:57 -0400
X-MC-Unique: N6z06qYGNJ6nwcCr7S4Z9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2629A1005510;
 Fri,  5 Jun 2020 07:17:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C31A7600F7;
 Fri,  5 Jun 2020 07:17:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B117A1747D; Fri,  5 Jun 2020 09:17:54 +0200 (CEST)
Date: Fri, 5 Jun 2020 09:17:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/display/cirrus_vga: Fix code mis-indentation
Message-ID: <20200605071754.37w6h677srlk7mcj@sirius.home.kraxel.org>
References: <20200529165436.23573-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200529165436.23573-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 05 Jun 2020 07:18:03 -0000

On Fri, May 29, 2020 at 06:54:36PM +0200, Philippe Mathieu-Daudé wrote:
> While replacing fprintf() by qemu_log_mask() in commit
> 2b55f4d3504, we incorrectly used a 'tab = 4 spaces'
> alignment, leading to misindented new code. Fix now.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Added to vga queue.

thanks,
  Gerd


