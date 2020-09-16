Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIVrG-0003FB-Fa
	for mharc-qemu-trivial@gnu.org; Wed, 16 Sep 2020 07:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kIVrC-0003Am-9P
 for qemu-trivial@nongnu.org; Wed, 16 Sep 2020 07:44:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56062
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kIVr8-0007RR-F9
 for qemu-trivial@nongnu.org; Wed, 16 Sep 2020 07:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600256649;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RG27yyuiYjRfXtUywL7hT4Z1JRI0U3K4s7qn31lOFok=;
 b=NDjIqvDBMnZwUminL0SdgP9oHCVzJHWIiOe/KwOolt+AjuQRNqEYSjDt2UQJrFaaYPHvRN
 pL2ro6tZ4XeiwA1KrSPYbkgbVYby4X5E6GIkTFwRH+SRG6PfGyS6yz5x2311mIvudebXil
 NuZkPeVZmWL/gGnhVdD+ouTbJpm0l4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-oflZelVWNoeNYiPjf7xDRA-1; Wed, 16 Sep 2020 07:43:55 -0400
X-MC-Unique: oflZelVWNoeNYiPjf7xDRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B411C1074664;
 Wed, 16 Sep 2020 11:43:54 +0000 (UTC)
Received: from redhat.com (ovpn-113-248.ams2.redhat.com [10.36.113.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB75F75123;
 Wed, 16 Sep 2020 11:43:49 +0000 (UTC)
Date: Wed, 16 Sep 2020 12:43:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: "McMillan, Erich" <erich.mcmillan@hp.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: PATCH: Increase System Firmware Max Size
Message-ID: <20200916114346.GK1535709@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <CS1PR8401MB0327EF9D532330BA44257AFCF3240@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
 <CS1PR8401MB0327959D96C84FB32E071E49F3200@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
 <CS1PR8401MB03279AC1D869BBBA8D810A19F3200@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
 <eaa64c6a-18cb-69df-3154-614744e1bfa9@redhat.com>
 <20200916095633.GJ1535709@redhat.com>
 <712696ed-8f23-d8e6-f765-df7aa68f1013@redhat.com>
MIME-Version: 1.0
In-Reply-To: <712696ed-8f23-d8e6-f765-df7aa68f1013@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 03:05:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
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
X-List-Received-Date: Wed, 16 Sep 2020 11:44:14 -0000

On Wed, Sep 16, 2020 at 01:31:05PM +0200, Laszlo Ersek wrote:
> On 09/16/20 11:56, Daniel P. Berrangé wrote:
> > On Wed, Sep 16, 2020 at 11:52:41AM +0200, Laszlo Ersek wrote:
> >> (5) In my opinion (which could be wrong of course), we shouldn't
> >> introduce a new command line option for this, but a new PC machine type
> >> property called "x-firmware-max-size".
> > 
> > Yeah, we definitely do not want a new top level CLI arg, just a
> > machine type property.  We don't need any "x-" prefix on it
> > though, just a plain "firmware-max-size" prop is fine.
> 
> According to the previous discussion, I'd like to request that we add
> the x- prefix (showing that either the property is experimental, or that
> it is intended in support of experimental use cases).
> 
> If you disagree, I'll accept that though.

I don't see a reason to call the property itself experimental unless
someone is proposing that there's likely to be a better way to enlarge
the max firmware size that will replace it later.

The use case is definitely not something I'd call experimental either.
The user providing their own arbirary firmware is not going to be common,
but when they do I'd consider it a valid supported use case. QEMU is
agnostic about what firmware impl is used, as long as the firmware can
support the expected services/interfaces.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


