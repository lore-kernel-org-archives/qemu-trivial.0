Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdUY2-0005fj-Qu
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2020 04:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdUY1-0005dz-De
 for qemu-trivial@nongnu.org; Tue, 26 May 2020 04:02:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48638
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdUY0-00043r-Jc
 for qemu-trivial@nongnu.org; Tue, 26 May 2020 04:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590480171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRKd3HVkwMFDo9h1+ozzoJxrtyzcJF6y9QBACpjVzYk=;
 b=berQ5q3LZeNkoe67yOnJijuq0MUz17wPWds7DjTPPauVm6Uq30nvoNylqbbqOLIxKmgmhj
 X1iwfXj/oQQ6uIFBQYOJ0l1UAR5EfIFi7w3gzteNnVeUFc1hsMAYzWEQ6jjEPT08ARK1fz
 NRX6W9bKFhxHA21SazMSKqbCQwX1+ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-4gsj2E1NPTOxfS86RZNLSA-1; Tue, 26 May 2020 04:02:47 -0400
X-MC-Unique: 4gsj2E1NPTOxfS86RZNLSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAAE9107ACCD;
 Tue, 26 May 2020 08:02:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F72B610AB;
 Tue, 26 May 2020 08:02:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 80EF217444; Tue, 26 May 2020 10:02:44 +0200 (CEST)
Date: Tue, 26 May 2020 10:02:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-trivial@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 00/14] hw/display: Omnibus cleanups
Message-ID: <20200526080244.cq7gqhriyr6aeke2@sirius.home.kraxel.org>
References: <20200526062252.19852-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200526062252.19852-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
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
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 26 May 2020 08:02:54 -0000

On Tue, May 26, 2020 at 08:22:38AM +0200, Philippe Mathieu-Daudé wrote:
> Hi Gerd, for your convenience I joined all the hw/display/
> patches I sent recently altogether in a series.

Nice service.  I was about to collect them from my inbox after sending
out the audio pull req ...

thanks,
  Gerd


