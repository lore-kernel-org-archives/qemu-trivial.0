Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGmOO-0000fv-9j
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 12:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kGmON-0000eZ-3n
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 12:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kGmOL-0004hm-C6
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 12:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599843556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LhUWn9hN3MHbx5J7tQlgPPjkakMshYBVM21mpAbaCtI=;
 b=OnP0/FFME/qRy6Pelan+8hO2RYElCyRTYyQ66ZvZWv7khR6ryOfL1PF9uyjJ8ep8wcUDkv
 q6cQTuN4caYyaX9iLLC2Jk/A/xApZw/ViaHosMZzXrCjIwVsw52qcua0lCBZbSzIGo0Sof
 FM5PK8bIrXwAAJ7FHaQ4xYWUKFbcPOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-9JN1AT6dNgOVke_uk2JhAQ-1; Fri, 11 Sep 2020 12:59:11 -0400
X-MC-Unique: 9JN1AT6dNgOVke_uk2JhAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 900BA18B9EDC;
 Fri, 11 Sep 2020 16:59:10 +0000 (UTC)
Received: from work-vm (ovpn-113-52.ams2.redhat.com [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64D997B7A5;
 Fri, 11 Sep 2020 16:59:05 +0000 (UTC)
Date: Fri, 11 Sep 2020 17:59:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: "McMillan, Erich" <erich.mcmillan@hp.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: PATCH: Increase System Firmware Max Size
Message-ID: <20200911165902.GB3311@work-vm>
References: <CS1PR8401MB0327EF9D532330BA44257AFCF3240@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
 <20c5210f-8199-a9e7-9297-0bea06c4d9ae@redhat.com>
 <20200911083408.GA3310@work-vm>
 <ae2d820e-78c6-da92-2fa6-73c1a7d10333@redhat.com>
 <20200911150602.GH3310@work-vm>
 <8e2d0bf7-a206-124c-15b0-0f0071ef5a11@redhat.com>
 <20200911162251.GA3311@work-vm>
 <171b8941-abb6-bb21-4080-c5c3eb0e59ae@redhat.com>
MIME-Version: 1.0
In-Reply-To: <171b8941-abb6-bb21-4080-c5c3eb0e59ae@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 23:26:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 11 Sep 2020 16:59:19 -0000

* Laszlo Ersek (lersek@redhat.com) wrote:
> On 09/11/20 18:22, Dr. David Alan Gilbert wrote:
> 
> > We have lots of complex hideous changes that I'm never going to use but
> > seem reasonable;  this is a tiny change that seems perfectly reasonable
> > both for open and closed firmware.
> > I realise herding OVMF developers is tricky, but that's not a reason
> > to nack a reasonable almost trivial change in QEMU.
> 
> OK.

I'm OK with pushing it towards being a property though; that's much
prettier; so:

Erich: Can you redo this as a property as suggested in another part
of this thread, making it default to the current value?

Dave

> Laszlo
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


