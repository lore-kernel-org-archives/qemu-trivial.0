Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRuhO-0007ng-Al
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 06:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kRuhM-0007kG-TU
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 06:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kRuhK-0003Ta-Py
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 06:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602497093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26bYJ3kV9qOG6sJymY48BBmaYoGlXnd4Mlrzdww9JZo=;
 b=ZV0Gpd1DrZRShImC9H6oOAsRRBSWS0OYU1AQCWxPvX9oGt9M55y3kQwmf2HUO3Xm/s/Lrb
 /IqBdPHWzACCEhZzJ3H6mBTihUNl4EPZl1ShaLWQwVWnwIVAL7FL3QqUol17jshIVTZH0v
 9e2RwC8rPaDmPBP9AmaoGC2owPPAov8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-rNjWWOEBPnKoQzfTLLzoeg-1; Mon, 12 Oct 2020 06:04:51 -0400
X-MC-Unique: rNjWWOEBPnKoQzfTLLzoeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72A151018F60;
 Mon, 12 Oct 2020 10:04:49 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-24.ams2.redhat.com [10.36.114.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E71576666;
 Mon, 12 Oct 2020 10:04:45 +0000 (UTC)
Date: Mon, 12 Oct 2020 12:04:44 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] hw/ssi/aspeed_smc: Rename max_slaves as max_devices
Message-ID: <20201012100444.GB7777@merkur.fritz.box>
References: <20201011210513.3253905-1-f4bug@amsat.org>
 <20201011210513.3253905-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20201011210513.3253905-2-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 12 Oct 2020 10:04:57 -0000

Am 11.10.2020 um 23:05 hat Philippe Mathieu-Daudé geschrieben:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> In order to use inclusive terminology, rename max_slaves
> as max_peripherals.

This is inconsistent with the subject line which talks about
"max_devices".

Kevin


