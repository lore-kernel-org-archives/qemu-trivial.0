Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBFPl-0003av-2v
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 06:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jBFPi-0003Zv-Sz
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 06:13:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jBFPi-00032i-1b
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 06:13:34 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36427
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jBFPh-00032Q-Uh
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 06:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583748813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAKOGH/KUbB4026TG+is9BMIjscEbXjSnMP3ULLdV2c=;
 b=VucVpPdGnk7GMmOOj8BcPG/8SKGACciHNLuxHPGSLeX8BeGo4ZBFzEh0KyKIVXrVx9qhFj
 QdJ2ZXRhuNRng1hec5a7p+a6Qwmys3NsbZaFJ/ECq2NWx3GY15/FuJkB8t0hoGPRJIopfE
 dQ1BZwxRg/i9ixqj9f00U881RMH2pdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-xs3-jlGQP_6xIl7j5gC71Q-1; Mon, 09 Mar 2020 06:13:31 -0400
X-MC-Unique: xs3-jlGQP_6xIl7j5gC71Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E6E91137843;
 Mon,  9 Mar 2020 10:13:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DDF85D9CA;
 Mon,  9 Mar 2020 10:13:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 334F39D43; Mon,  9 Mar 2020 11:13:29 +0100 (CET)
Date: Mon, 9 Mar 2020 11:13:29 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: kuhn.chenqun@huawei.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Euler Robot <euler.robot@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 12/13] usb/hcd-ehci: Remove redundant statements
Message-ID: <20200309101329.bwdkyqa6z4lazlkn@sirius.home.kraxel.org>
References: <20200226084647.20636-1-kuhn.chenqun@huawei.com>
 <20200226084647.20636-13-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200226084647.20636-13-kuhn.chenqun@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Mon, 09 Mar 2020 10:13:35 -0000

On Wed, Feb 26, 2020 at 04:46:46PM +0800, kuhn.chenqun@huawei.com wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
>=20
> The "again" assignment is meaningless before g_assert_not_reached.
> In addition, the break statements no longer needs to be after
> g_assert_not_reached.
>=20
> Clang static code analyzer show warning:
> hw/usb/hcd-ehci.c:2108:13: warning: Value stored to 'again' is never read
>             again =3D -1;
>             ^       ~~
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Patch added to usb queue.

thanks,
  Gerd


