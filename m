Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7dCo-0001r9-A9
	for mharc-qemu-trivial@gnu.org; Mon, 17 Aug 2020 07:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k7dCm-0001oo-Mf
 for qemu-trivial@nongnu.org; Mon, 17 Aug 2020 07:21:32 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57191
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k7dCl-0006sV-BC
 for qemu-trivial@nongnu.org; Mon, 17 Aug 2020 07:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597663290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsMS2gHXnFTg3Qx+vQVpbwwlaz2h6Crwmz0pNRDlvwE=;
 b=KhXPQSjAymBH7NPO0wRp/R1+FaVbkTI4sX2vIJKu4X45BZPwhksmF3T925CTCGQ0cyU5aP
 dTSqu3TnHJDJu0oqU6cZ6LyGDMeejp5/ZnH7zSReEWeufjapacuYPnB2aXE27k0E5IDZYx
 mcHkU5UlEcvJAjK+GBNRVQNDhFuc+n4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-SQBjsb5TOdS2yEPZiLDcMw-1; Mon, 17 Aug 2020 07:21:26 -0400
X-MC-Unique: SQBjsb5TOdS2yEPZiLDcMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2371E802B4A;
 Mon, 17 Aug 2020 11:21:25 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-160.ams2.redhat.com [10.36.112.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 394E07D676;
 Mon, 17 Aug 2020 11:21:23 +0000 (UTC)
Date: Mon, 17 Aug 2020 13:21:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Fam Zheng <fam@euphon.net>, Laurent Vivier <laurent@vivier.eu>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 7/7] hw/scsi/scsi-disk: Replace magic '512' value by
 BDRV_SECTOR_SIZE
Message-ID: <20200817112121.GH11402@linux.fritz.box>
References: <20200814082841.27000-1-f4bug@amsat.org>
 <20200814082841.27000-8-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200814082841.27000-8-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 05:03:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 17 Aug 2020 11:21:32 -0000

Am 14.08.2020 um 10:28 hat Philippe Mathieu-Daudé geschrieben:
> Use self-explicit definitions instead of magic '512' value.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

In this patch, BDRV_SECTOR_SIZE actually looks correct to me. The values
have already been converted from s->qdev.blocksize in these instances,
so it's not about the sector size of the virtual disk, but purely about
QEMU's internal handling.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


