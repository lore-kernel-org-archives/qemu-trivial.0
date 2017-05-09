Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7xZ5-0000hG-1H
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 01:20:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1d7xZ2-0000fu-U7
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 01:20:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1d7xZ2-0004XF-2X
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 01:20:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41002)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1d7xYv-0004WM-S3; Tue, 09 May 2017 01:19:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C744C056793;
	Tue,  9 May 2017 05:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7C744C056793
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7C744C056793
Received: from [10.36.116.34] (ovpn-116-34.ams2.redhat.com [10.36.116.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A6B987442;
	Tue,  9 May 2017 05:19:47 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2cd1e7a1-7f92-88a2-cf98-0dcea0a2f9b1@redhat.com>
Date: Tue, 9 May 2017 07:19:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170508233918.9043-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 09 May 2017 05:19:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH 02/11] hw/pci: define
 msi_nonbroken in pci-stub
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 May 2017 05:20:01 -0000

On 09.05.2017 01:39, Philippe Mathieu-Daud=C3=A9 wrote:
> This field is accessed in hw/intc/arm_gicv[23*].c

default-configs/arm-softmmu.mak sets CONFIG_PCI, so this should not be
necessary, I think. Otherwise, you should extend your patch description,
to elaborate on what you're trying to do here.

 Thomas


