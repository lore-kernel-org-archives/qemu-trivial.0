Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YW3xt-0002N8-QM
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 10:19:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YW3xq-0002JL-UV
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 10:19:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YW3xm-0002wH-Lc
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 10:19:54 -0400
Received: from mail-we0-x22f.google.com ([2a00:1450:400c:c03::22f]:42231)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YW3xm-0002wC-CM; Thu, 12 Mar 2015 10:19:50 -0400
Received: by wesq59 with SMTP id q59so16688520wes.9;
	Thu, 12 Mar 2015 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=r+XPHsuXav0flSyA0ECxcwPuzvV+oyXRye2SJIerMlk=;
	b=UGzlK3Ofb8T9Ilcbu/gjSv/fQyqZeEO3dDhMPc0k5AB6CXD3/yL30tdNBgrwQIptAE
	dVPTv3Tp0+luMOX4hjkhKaZsOOLsEmR61bke8Qw6j3qVJvxyOZvGbTNN6/EcPFxKWxGE
	sOcQu01IhOlqEbDB8DrbT+1QZQUKJy1hkynxAMmNgrKDwens+f+cO/431tCjnD8opYmI
	ocTWT5LWglsttRTrQRDL2F5rBwJH+baNqWhChGO+D1ObTmZFgL/lEcX6F+Yb+k3wIgJ7
	EQCuFZvGrikaRgFcOas161IhM81WVUHo/ASnG0epxmEJV/G8OdVueBMBC7Kmb9pCxqWx
	yy/A==
X-Received: by 10.180.90.166 with SMTP id bx6mr87026322wib.65.1426169989809;
	Thu, 12 Mar 2015 07:19:49 -0700 (PDT)
Received: from [192.168.10.150] (net-188-216-23-124.cust.vodafonedsl.it.
	[188.216.23.124]) by mx.google.com with ESMTPSA id
	ge8sm10240211wjc.32.2015.03.12.07.19.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 07:19:48 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5501A080.6070306@redhat.com>
Date: Thu, 12 Mar 2015 15:19:44 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Gabriel L. Somlo" <gsomlo@gmail.com>, qemu-devel@nongnu.org
References: <5D7F9996EA547448BC6C54C8C5AAF4E5010291BAF1@CERNXCHG43.cern.ch>
	<1426096681-13442-1-git-send-email-somlo@cmu.edu>
In-Reply-To: <1426096681-13442-1-git-send-email-somlo@cmu.edu>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22f
Cc: qemu-trivial@nongnu.org, Tim.Bell@cern.ch, kvm@vger.kernel.org
Subject: Re: [Qemu-trivial] [PATCH] smbios: add max speed comdline option
 for type-17 (meory device) structure
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
X-List-Received-Date: Thu, 12 Mar 2015 14:19:56 -0000



On 11/03/2015 18:58, Gabriel L. Somlo wrote:
> Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> ---
>  hw/i386/smbios.c | 10 ++++++++--
>  qemu-options.hx  |  4 ++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i386/smbios.c b/hw/i386/smbios.c
> index f2e9ab6..1341e02 100644
> --- a/hw/i386/smbios.c
> +++ b/hw/i386/smbios.c
> @@ -91,6 +91,7 @@ static struct {
>  
>  static struct {
>      const char *loc_pfx, *bank, *manufacturer, *serial, *asset, *part;
> +    uint16_t speed;
>  } type17;
>  
>  static QemuOptsList qemu_smbios_opts = {
> @@ -304,6 +305,10 @@ static const QemuOptDesc qemu_smbios_type17_opts[] = {
>          .name = "part",
>          .type = QEMU_OPT_STRING,
>          .help = "part number",
> +    },{
> +        .name = "speed",
> +        .type = QEMU_OPT_NUMBER,
> +        .help = "maximum capable speed",
>      },
>      { /* end of list */ }
>  };
> @@ -697,13 +702,13 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
>      SMBIOS_TABLE_SET_STR(17, bank_locator_str, type17.bank);
>      t->memory_type = 0x07; /* RAM */
>      t->type_detail = cpu_to_le16(0x02); /* Other */
> -    t->speed = cpu_to_le16(0); /* Unknown */
> +    t->speed = cpu_to_le16(type17.speed);
>      SMBIOS_TABLE_SET_STR(17, manufacturer_str, type17.manufacturer);
>      SMBIOS_TABLE_SET_STR(17, serial_number_str, type17.serial);
>      SMBIOS_TABLE_SET_STR(17, asset_tag_number_str, type17.asset);
>      SMBIOS_TABLE_SET_STR(17, part_number_str, type17.part);
>      t->attributes = 0; /* Unknown */
> -    t->configured_clock_speed = cpu_to_le16(0); /* Unknown */
> +    t->configured_clock_speed = t->speed; /* reuse value for max speed */
>      t->minimum_voltage = cpu_to_le16(0); /* Unknown */
>      t->maximum_voltage = cpu_to_le16(0); /* Unknown */
>      t->configured_voltage = cpu_to_le16(0); /* Unknown */
> @@ -1083,6 +1088,7 @@ void smbios_entry_add(QemuOpts *opts)
>              save_opt(&type17.serial, opts, "serial");
>              save_opt(&type17.asset, opts, "asset");
>              save_opt(&type17.part, opts, "part");
> +            type17.speed = qemu_opt_get_number(opts, "speed", 0);
>              return;
>          default:
>              error_report("Don't know how to build fields for SMBIOS type %ld",
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 837624d..c4f7946 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1392,7 +1392,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "              [,asset=str][,part=str]\n"
>      "                specify SMBIOS type 4 fields\n"
>      "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
> -    "               [,asset=str][,part=str]\n"
> +    "               [,asset=str][,part=str][,speed=%d]\n"
>      "                specify SMBIOS type 17 fields\n",
>      QEMU_ARCH_I386)
>  STEXI
> @@ -1415,7 +1415,7 @@ Specify SMBIOS type 3 fields
>  @item -smbios type=4[,sock_pfx=@var{str}][,manufacturer=@var{str}][,version=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}]
>  Specify SMBIOS type 4 fields
>  
> -@item -smbios type=17[,loc_pfx=@var{str}][,bank=@var{str}][,manufacturer=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}]
> +@item -smbios type=17[,loc_pfx=@var{str}][,bank=@var{str}][,manufacturer=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}][,speed=@var{%d}]
>  Specify SMBIOS type 17 fields
>  ETEXI
>  
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

