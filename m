Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dkB4e-0004vC-DM
	for mharc-qemu-trivial@gnu.org; Tue, 22 Aug 2017 11:26:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkB4Y-0004ob-Sc
	for qemu-trivial@nongnu.org; Tue, 22 Aug 2017 11:26:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkB4U-00010M-S8
	for qemu-trivial@nongnu.org; Tue, 22 Aug 2017 11:26:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45374)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dkB4K-0000tl-0t; Tue, 22 Aug 2017 11:26:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE2697EA8D;
	Tue, 22 Aug 2017 15:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CE2697EA8D
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.21] (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBAF61715B;
	Tue, 22 Aug 2017 15:26:12 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Markus Armbruster
	<armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-92Jjz2uCC387oX2u0NWfijPwB_8zGaagC1m=sKD8zhQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <443135b4-4b36-bae6-b50a-12fb4a55a858@redhat.com>
Date: Tue, 22 Aug 2017 17:26:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-92Jjz2uCC387oX2u0NWfijPwB_8zGaagC1m=sKD8zhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 22 Aug 2017 15:26:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 22 Aug 2017 15:26:35 -0000

On 22.08.2017 17:12, Peter Maydell wrote:
> On 22 August 2017 at 16:06, Thomas Huth <thuth@redhat.com> wrote:
>> QEMU currently aborts if the user tries to do something like this:
>>
>> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
>> QEMU 2.9.93 monitor - type 'help' for more information
>> (qemu) device_add aux-to-i2c-bridge,id=3Dx
>> (qemu) device_del x
>> **
>> ERROR:qemu/qdev-monitor.c:872:qdev_unplug: assertion failed: (hotplug_=
ctrl)
>> Aborted (core dumped)
>>
>> Looks like the device is not hot-pluggable, so let's mark it
>> accordingly.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/misc/auxbus.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
>> index 8a90ddd..2c62515 100644
>> --- a/hw/misc/auxbus.c
>> +++ b/hw/misc/auxbus.c
>> @@ -222,9 +222,17 @@ static inline I2CBus *aux_bridge_get_i2c_bus(AUXT=
OI2CState *bridge)
>>      return bridge->i2c_bus;
>>  }
>>
>> +static void aux_bridge_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
>> +
>> +    dc->hotpluggable =3D false;
>> +}
>=20
> Why is our default "hotpluggable" rather than "not hotpluggable" ?
> We must have way more non-hotpluggable devices than hotpluggable
> ones, and it takes active effort to make a hotpluggable device
> model, so it seems like it would be much less bug-prone to
> require hotpluggable devices to set dc->hotpluggable true
> rather than all the non-hotpluggable ones to set it false...

I think most devices are already non-hotpluggable automatically because
they sit on a bus that is not hot-pluggable (e.g. sysbus devices). The
problematic ones are the devices with .parent =3D TYPE_DEVICE. And for
these, I think it is quite hard to say whether they should be
hot-pluggable by default or not?
Anyway, according to my tests (I'm currently working on a test that
automatically does device_add + device_del for all devices, as you might
have guessed already), there are not that many devices that cause
problems here, so I guess marking some few with hotpluggable =3D false
should be OK?

 Thomas

