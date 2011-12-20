Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rd7z8-0006i7-Jn
	for mharc-qemu-trivial@gnu.org; Tue, 20 Dec 2011 17:16:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Rd7z5-0006bS-UU
	for qemu-trivial@nongnu.org; Tue, 20 Dec 2011 17:16:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Rd7z5-0000Si-1B
	for qemu-trivial@nongnu.org; Tue, 20 Dec 2011 17:16:31 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:62533)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1Rd7z3-0000SP-5g; Tue, 20 Dec 2011 17:16:29 -0500
Received: by iagj37 with SMTP id j37so12235593iag.4
	for <multiple recipients>; Tue, 20 Dec 2011 14:16:28 -0800 (PST)
Received: by 10.42.161.10 with SMTP id r10mr4202958icx.22.1324419388312;
	Tue, 20 Dec 2011 14:16:28 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id l35sm9350763ibj.0.2011.12.20.14.16.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 14:16:27 -0800 (PST)
Message-ID: <4EF10939.7050805@codemonkey.ws>
Date: Tue, 20 Dec 2011 16:16:25 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1324386636-25248-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1324386636-25248-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] i440fx: remove piix3 field
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
X-List-Received-Date: Tue, 20 Dec 2011 22:16:32 -0000

On 12/20/2011 07:10 AM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   hw/piix_pci.c |    3 ---
>   1 files changed, 0 insertions(+), 3 deletions(-)
>
> diff --git a/hw/piix_pci.c b/hw/piix_pci.c
> index 43c85aa..e188c7a 100644
> --- a/hw/piix_pci.c
> +++ b/hw/piix_pci.c
> @@ -81,7 +81,6 @@ struct PCII440FXState {
>       PAMMemoryRegion pam_regions[13];
>       MemoryRegion smram_region;
>       uint8_t smm_enabled;
> -    PIIX3State *piix3;
>   };
>
>
> @@ -320,8 +319,6 @@ static PCIBus *i440fx_common_init(const char *device_name,
>       qdev_property_add_child(dev, "piix3",&piix3->dev.qdev, NULL);
>       piix3->pic = pic;
>
> -    (*pi440fx_state)->piix3 = piix3;
> -
>       *piix3_devfn = piix3->dev.devfn;
>
>       ram_size = ram_size / 8 / 1024 / 1024;


