Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdX7m-0007Jz-J7
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2020 06:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdX7l-0007GS-BL
 for qemu-trivial@nongnu.org; Tue, 26 May 2020 06:47:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51508
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdX7k-0002Co-Jn
 for qemu-trivial@nongnu.org; Tue, 26 May 2020 06:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590490075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ElR8/TiWTLU4MenHCo/KuQT+CrmA8r6BBjyiu48rJs=;
 b=SCFN2GvzDjhCH9VDdhJNDAr1DC+7g/EYd1mE/+ZTZmAt9+/xhl7QXHrmY+h31EUcmR0o8T
 0DdTmgJydI5UT6kpVG9xKrdEvdZkY7OSvgxcZX2/PwBq8oXuKfcWXN0TDJPmZruO/7FWjP
 MIWdUkwt22ykaDQvyNIu8M0mp+Zd5gQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-isFpXgsrP2287zNLfysvtg-1; Tue, 26 May 2020 06:47:52 -0400
X-MC-Unique: isFpXgsrP2287zNLfysvtg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 986AF19057A6;
 Tue, 26 May 2020 10:47:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2376B60C47;
 Tue, 26 May 2020 10:47:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3810F16E2C; Tue, 26 May 2020 12:47:48 +0200 (CEST)
Date: Tue, 26 May 2020 12:47:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>
Subject: Re: [PATCH 11/14] hw/display/vmware_vga: Let the PCI device own its
 I/O MemoryRegion
Message-ID: <20200526104748.wayie5aovk5omz3t@sirius.home.kraxel.org>
References: <20200526062252.19852-1-f4bug@amsat.org>
 <20200526062252.19852-12-f4bug@amsat.org>
 <20200526080123.ul5r4abphqfi7lkq@sirius.home.kraxel.org>
 <4a6478f2-6b70-40df-093f-e81d2437bfa7@amsat.org>
MIME-Version: 1.0
In-Reply-To: <4a6478f2-6b70-40df-093f-e81d2437bfa7@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 01:19:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 26 May 2020 10:47:57 -0000

On Tue, May 26, 2020 at 10:16:19AM +0200, Philippe Mathieu-Daudé wrote:
> On 5/26/20 10:01 AM, Gerd Hoffmann wrote:
> > On Tue, May 26, 2020 at 08:22:49AM +0200, Philippe Mathieu-DaudÃƒÆ’Ã‚Â© wrote:
> >> To avoid the orphan I/O memory region being added in the /unattached
> >> QOM container, register the PCI device as its owner.
> >>
> >> Signed-off-by: Philippe Mathieu-DaudÃƒÆ’Ã‚Â© <f4bug@amsat.org>
> >> ---
> >> RFC: This might break migration
> > 
> > --verbose please.  This doesn't touch the live migration data stream?
> 
> Oops, this is an I/O region... I was confused by this warning form Peter:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg681970.html
> 
> But it is restricted to RAM regions, so this patch is harmless.

Yes, for ram regions this is a problem, this is why vga has
global_vmstate.  No problem for io.  Series looks fine then.

take care,
  Gerd


