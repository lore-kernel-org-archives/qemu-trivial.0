Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGmIX-00058o-15
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 12:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kGmIV-00057K-K0
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 12:53:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34440
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kGmIU-0003zX-7j
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 12:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599843193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cojfHuAN6eq83UXIvxRiKWfl98snYvoCazGL6PGzvAU=;
 b=eVmDP0++j1c9Hq4yYYOggcbVtaNrGx4Erk5jdNJQcJg+fHzXG96dRSUkjV0tUw/vADS/Pe
 oI4FDFvC9ScNWEcqIGlviSlV7k2fkh+zK0esi/awDw1QeEphwg8YOArrV1DLh3DoXrE6xx
 8s/24ExpvrIi6pgTUAQCbJ8xPjIQMak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-JWwDSXdrOJ6Ld-8ljFACAQ-1; Fri, 11 Sep 2020 12:53:08 -0400
X-MC-Unique: JWwDSXdrOJ6Ld-8ljFACAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEF318030DD;
 Fri, 11 Sep 2020 16:53:07 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-62.ams2.redhat.com
 [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C1457B7A3;
 Fri, 11 Sep 2020 16:53:02 +0000 (UTC)
Subject: Re: PATCH: Increase System Firmware Max Size
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "McMillan, Erich" <erich.mcmillan@hp.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <CS1PR8401MB0327EF9D532330BA44257AFCF3240@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
 <20c5210f-8199-a9e7-9297-0bea06c4d9ae@redhat.com>
 <20200911083408.GA3310@work-vm>
 <ae2d820e-78c6-da92-2fa6-73c1a7d10333@redhat.com>
 <20200911150602.GH3310@work-vm>
 <8e2d0bf7-a206-124c-15b0-0f0071ef5a11@redhat.com>
 <20200911162251.GA3311@work-vm>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <171b8941-abb6-bb21-4080-c5c3eb0e59ae@redhat.com>
Date: Fri, 11 Sep 2020 18:53:02 +0200
MIME-Version: 1.0
In-Reply-To: <20200911162251.GA3311@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 00:33:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 11 Sep 2020 16:53:15 -0000

On 09/11/20 18:22, Dr. David Alan Gilbert wrote:

> We have lots of complex hideous changes that I'm never going to use but
> seem reasonable;  this is a tiny change that seems perfectly reasonable
> both for open and closed firmware.
> I realise herding OVMF developers is tricky, but that's not a reason
> to nack a reasonable almost trivial change in QEMU.

OK.

Laszlo


