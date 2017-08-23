Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dkO7i-00087i-Uv
	for mharc-qemu-trivial@gnu.org; Wed, 23 Aug 2017 01:22:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkO7h-00085k-IH
	for qemu-trivial@nongnu.org; Wed, 23 Aug 2017 01:22:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkO7g-0005fq-Ln
	for qemu-trivial@nongnu.org; Wed, 23 Aug 2017 01:22:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40166)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dkO7Z-0005dv-RA; Wed, 23 Aug 2017 01:22:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F6A780B2A;
	Wed, 23 Aug 2017 05:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6F6A780B2A
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.93] (ovpn-116-93.ams2.redhat.com [10.36.116.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A59F0619A0;
	Wed, 23 Aug 2017 05:22:26 +0000 (UTC)
To: KONRAD Frederic <frederic.konrad@adacore.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Alistair Francis <alistair.francis@xilinx.com>, qemu-trivial@nongnu.org
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
	<27da1dae-1e2f-559a-d8f0-c7e15289363e@adacore.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d5be8092-dc56-14aa-b950-d82e7f959ec1@redhat.com>
Date: Wed, 23 Aug 2017 07:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <27da1dae-1e2f-559a-d8f0-c7e15289363e@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 23 Aug 2017 05:22:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw/misc/auxbus.c: Mark the
 aux-to-i2c-bridge device as non-hotpluggable
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
X-List-Received-Date: Wed, 23 Aug 2017 05:22:38 -0000

On 22.08.2017 20:15, KONRAD Frederic wrote:
> Hi Thomas,
> 
> Looking to this seems there is a second issue:
> The aux-to-i2c-bridge device should connect on a TYPE_AUX_BUS.
> 
> I don't think there isn't any on integratorcp..
> 
> Anyway the patch you sent fix this issue indirectly and as far as
> I remember I wasn't able to make this I2C bridge an
> TYPE_AUX_DEVICE as it's a special device and it is internal (only
> instantiated at the bus creation).

If it is intended to be completely internal only (i.e. also not for use
with the "-device" parameter), then it should even be marked with
"user_creatable = false"! ... if you got some spare minutes, could you
maybe sent a patch for that? I'm not familiar with that code, so I'm
always having trouble to give the reasoning for setting a
"user_creatable = false" somewhere...

 Thanks,
  Thomas

