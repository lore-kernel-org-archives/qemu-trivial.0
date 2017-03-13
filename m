Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cnUNo-0005cD-44
	for mharc-qemu-trivial@gnu.org; Mon, 13 Mar 2017 14:07:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cnUNl-0005aM-Nx
	for qemu-trivial@nongnu.org; Mon, 13 Mar 2017 14:07:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cnUNk-0003F2-Mu
	for qemu-trivial@nongnu.org; Mon, 13 Mar 2017 14:07:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cnUNg-0003DW-39; Mon, 13 Mar 2017 14:07:40 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F284C1FA04C;
	Mon, 13 Mar 2017 18:07:39 +0000 (UTC)
Received: from localhost (ovpn-116-55.gru2.redhat.com [10.97.116.55])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v2DI7cgq003139; Mon, 13 Mar 2017 14:07:38 -0400
Date: Mon, 13 Mar 2017 15:07:36 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org
Message-ID: <20170313180736.GJ4694@thinpad.lan.raisama.net>
References: <20170310200550.13313-1-krzk@kernel.org>
	<20170310200550.13313-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170310200550.13313-2-krzk@kernel.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 13 Mar 2017 18:07:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 1/2] qdev: Constify value passed to
 qdev_prop_set_macaddr
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
X-List-Received-Date: Mon, 13 Mar 2017 18:07:46 -0000

On Fri, Mar 10, 2017 at 10:05:49PM +0200, Krzysztof Kozlowski wrote:
> The 'value' argument is not modified so this can be made const for code
> safeness.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Unless another maintainer wants to take this, I am queueing it
for 2.10 on my machine-next branch.

> ---
>  hw/core/qdev-properties.c    | 3 ++-
>  include/hw/qdev-properties.h | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 6ab4265eb478..fa3617db2df1 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -1010,7 +1010,8 @@ void qdev_prop_set_string(DeviceState *dev, const char *name, const char *value)
>      object_property_set_str(OBJECT(dev), value, name, &error_abort);
>  }
>  
> -void qdev_prop_set_macaddr(DeviceState *dev, const char *name, uint8_t *value)
> +void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
> +                           const uint8_t *value)
>  {
>      char str[2 * 6 + 5 + 1];
>      snprintf(str, sizeof(str), "%02x:%02x:%02x:%02x:%02x:%02x",
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 7ac315331aa0..1d69fa7a8f04 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -188,7 +188,8 @@ void qdev_prop_set_chr(DeviceState *dev, const char *name, Chardev *value);
>  void qdev_prop_set_netdev(DeviceState *dev, const char *name, NetClientState *value);
>  void qdev_prop_set_drive(DeviceState *dev, const char *name,
>                           BlockBackend *value, Error **errp);
> -void qdev_prop_set_macaddr(DeviceState *dev, const char *name, uint8_t *value);
> +void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
> +                           const uint8_t *value);
>  void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
>  /* FIXME: Remove opaque pointer properties.  */
>  void qdev_prop_set_ptr(DeviceState *dev, const char *name, void *value);
> -- 
> 2.9.3
> 

-- 
Eduardo

