Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dlD70-0005ns-Ef
	for mharc-qemu-trivial@gnu.org; Fri, 25 Aug 2017 07:49:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dlD6y-0005mn-Dx
	for qemu-trivial@nongnu.org; Fri, 25 Aug 2017 07:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dlD6u-0002SC-0C
	for qemu-trivial@nongnu.org; Fri, 25 Aug 2017 07:49:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dlD6j-0002Mr-Fm; Fri, 25 Aug 2017 07:49:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 382B05F739;
	Fri, 25 Aug 2017 11:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 382B05F739
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.64] (ovpn-116-64.ams2.redhat.com [10.36.116.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58A5F7F7FB;
	Fri, 25 Aug 2017 11:48:59 +0000 (UTC)
To: KONRAD Frederic <frederic.konrad@adacore.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1503661569-11408-1-git-send-email-frederic.konrad@adacore.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <658d99c8-47ce-9aeb-4187-3b1e3fccffc4@redhat.com>
Date: Fri, 25 Aug 2017 13:48:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1503661569-11408-1-git-send-email-frederic.konrad@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 25 Aug 2017 11:49:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.11] aux-to-i2c-bridge: don't allow
 user to create one
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
X-List-Received-Date: Fri, 25 Aug 2017 11:49:17 -0000

On 25.08.2017 13:46, KONRAD Frederic wrote:
> This device is private and is created once per aux-bus.
> So don't allow the user to create one from command-line.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
> ---
>  hw/misc/auxbus.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index 8a90ddd..1182745 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -210,6 +210,16 @@ struct AUXTOI2CState {
>      I2CBus *i2c_bus;
>  };
>  
> +static void aux_bridge_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    /* This device is private and is created only once for each
> +     * aux-bus in aux_init_bus(..). So don't allow the user to add one.
> +     */
> +    dc->user_creatable = false;
> +}
> +
>  static void aux_bridge_init(Object *obj)
>  {
>      AUXTOI2CState *s = AUXTOI2C(obj);
> @@ -225,6 +235,7 @@ static inline I2CBus *aux_bridge_get_i2c_bus(AUXTOI2CState *bridge)
>  static const TypeInfo aux_to_i2c_type_info = {
>      .name = TYPE_AUXTOI2C,
>      .parent = TYPE_DEVICE,
> +    .class_init = aux_bridge_class_init,
>      .instance_size = sizeof(AUXTOI2CState),
>      .instance_init = aux_bridge_init
>  };
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


