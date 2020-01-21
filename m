Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1itrwm-0005bb-NT
	for mharc-qemu-trivial@gnu.org; Tue, 21 Jan 2020 06:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1itrwk-0005bF-HO
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 06:43:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1itrwj-0007Jk-IA
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 06:43:50 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36288
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1itrwj-0007JO-Ev
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 06:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579607028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=kUlAlkFfXTXA/zdAQQoTSG1yAqpKXPnVQtg8Nj79fAE=;
 b=BbJl5MIu+NWtr+6OGsYh8O2fCtihVzeG3qWP4ZO22ohlSuGj2k/07eecsT/zbAocquimUM
 bgAAbmzWh4yet7LJe99aiVvkfEJNtQTfcewn5KoLC+iaE4jFfLD+NZaGnpaKlfGOCR0OPo
 14xG6xbueV3gura+xHlsrfA5aIVsouc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-1gWNSLgaO7W1lqY-UWsGww-1; Tue, 21 Jan 2020 06:43:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 212E1190B2A0;
 Tue, 21 Jan 2020 11:43:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-121.ams2.redhat.com [10.36.116.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B27745C3FD;
 Tue, 21 Jan 2020 11:43:43 +0000 (UTC)
Subject: Re: [PATCH 2/2] aspeed/i2c: Prevent uninitialized warning
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, mrezanin@redhat.com,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-trivial@nongnu.org
References: <cover.1579598240.git.mrezanin@redhat.com>
 <07957dcab31f65de3dd30efa91e6b9152ac79879.1579598240.git.mrezanin@redhat.com>
 <c1b01c90-e42c-b65f-c7b8-2a589510a7d0@redhat.com>
 <fdc3e6c2-87e4-2e51-cbee-d9c7a008eec9@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <6696e7be-6db3-0fe8-d7b4-39c1bace8d38@redhat.com>
Date: Tue, 21 Jan 2020 12:43:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fdc3e6c2-87e4-2e51-cbee-d9c7a008eec9@kaod.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 1gWNSLgaO7W1lqY-UWsGww-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Tue, 21 Jan 2020 11:43:51 -0000

On 21/01/2020 11.44, C=C3=A9dric Le Goater wrote:
> On 1/21/20 11:02 AM, Thomas Huth wrote:
>> On 21/01/2020 10.28, mrezanin@redhat.com wrote:
>>> From: Miroslav Rezanina <mrezanin@redhat.com>
>>>
>>> Compiler reports uninitialized warning for cmd_flags variable.
>>>
>>> Adding NULL initialization to prevent this warning.
>>>
>>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>>> ---
>>>  hw/i2c/aspeed_i2c.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>>> index 2da04a4..445182a 100644
>>> --- a/hw/i2c/aspeed_i2c.c
>>> +++ b/hw/i2c/aspeed_i2c.c
>>> @@ -400,7 +400,7 @@ static bool aspeed_i2c_check_sram(AspeedI2CBus *bus=
)
>>> =20
>>>  static void aspeed_i2c_bus_cmd_dump(AspeedI2CBus *bus)
>>>  {
>>> -    g_autofree char *cmd_flags;
>>> +    g_autofree char *cmd_flags =3D NULL;
>>>      uint32_t count;
>>> =20
>>>      if (bus->cmd & (I2CD_RX_BUFF_ENABLE | I2CD_RX_BUFF_ENABLE)) {
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>> ... maybe someone with enough Perl-foo (i.e. not me ;-)) should add a
>> check to our check_patch.pl script so that it complains when new code is
>> introduced that uses g_autofree without initializing the variable...
>=20
> weird. The cmd_flags variable is assigned just after and used
> in a trace.=20

I don't know, but my guess is that you could compile with tracing
disabled - in that case gcc might maybe optimize the assignment away,
too... ?

 Thomas


