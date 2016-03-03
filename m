Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abRHr-0003hH-Nu
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 06:19:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abRHp-0003ci-8o
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 06:19:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abRHn-0005tN-S0
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 06:19:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1abRHh-0005ob-W2; Thu, 03 Mar 2016 06:19:10 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id A7F5964D0B;
	Thu,  3 Mar 2016 11:19:09 +0000 (UTC)
Received: from [10.36.112.61] (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23BJ6D4007878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Mar 2016 06:19:08 -0500
To: Gonglei <arei.gonglei@huawei.com>, qemu-devel@nongnu.org
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<1456998223-12356-7-git-send-email-arei.gonglei@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56D81DAA.3040201@redhat.com>
Date: Thu, 3 Mar 2016 12:19:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456998223-12356-7-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 03 Mar 2016 11:19:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 6/6] smbus: fix memory leak
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2016 11:19:18 -0000



On 03/03/2016 10:43, Gonglei wrote:
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/i2c/smbus_eeprom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
> index 5b7bd89..83c6b27 100644
> --- a/hw/i2c/smbus_eeprom.c
> +++ b/hw/i2c/smbus_eeprom.c
> @@ -156,4 +156,6 @@ void smbus_eeprom_init(I2CBus *smbus, int nb_eeprom,
>          qdev_prop_set_ptr(eeprom, "data", eeprom_buf + (i * 256));
>          qdev_init_nofail(eeprom);
>      }
> +
> +    g_free(eeprom_buf);
>  }
> 

This is wrong, eeprom_buf is passed to the device through qdev_prop_set_ptr.

Paolo

