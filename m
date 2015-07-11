Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZDqYO-0000KE-LF
	for mharc-qemu-trivial@gnu.org; Sat, 11 Jul 2015 04:54:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1ZDqYL-0000II-I3
	for qemu-trivial@nongnu.org; Sat, 11 Jul 2015 04:54:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1ZDqYI-0008E1-Bx
	for qemu-trivial@nongnu.org; Sat, 11 Jul 2015 04:54:33 -0400
Received: from mail-yk0-f169.google.com ([209.85.160.169]:33366)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1ZDqYI-0008Ds-7E
	for qemu-trivial@nongnu.org; Sat, 11 Jul 2015 04:54:30 -0400
Received: by ykeo3 with SMTP id o3so160140513yke.0
	for <qemu-trivial@nongnu.org>; Sat, 11 Jul 2015 01:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=4gm60T2R5Me9NvewsqXw6CWHQwPFOa8/ok+BaDvIMps=;
	b=bb4Q7UDRTJmpqaeyltqM5upd1KkbOp2J4WH0Epz3594wcR7yOzGGvpgkpO4/vZiZ3j
	FHxJW1yFP3ok8Ckt32E55S9wzvXf3bdFzs9akNSG3EzZIRMBhcRVUWqwgKEiMnUVw0V0
	i1GyC1Km5s2mqgYkW7x5spdhd24NOFgwUk489u4BmKrw5xhjs13OYGZV23ENkbDL92Ym
	JBO5/p46YD81zN+TR9HgTDkotZBiKRK5Qc0rB1rINjki1YjuscWDkEMrU8DRAd0mtyxB
	/1WOtjkBwQl1DaOgvfIZ6Pg60K0ZSumXusGBD+WA0GBG/O0OlZScHvUqd3KruBEyIP3x
	7sqQ==
X-Gm-Message-State: ALoCoQnjFNsol2xOZpJ8rHHT+LQOKAE2BfZJ0VPhAJyM46j23IIhdZUj7+I5XCGai1UXBiuGHB64
MIME-Version: 1.0
X-Received: by 10.170.218.86 with SMTP id k83mr28011223ykf.6.1436604869496;
	Sat, 11 Jul 2015 01:54:29 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.37.42.88 with HTTP; Sat, 11 Jul 2015 01:54:29 -0700 (PDT)
In-Reply-To: <1436489490-236-4-git-send-email-arei.gonglei@huawei.com>
References: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
	<1436489490-236-4-git-send-email-arei.gonglei@huawei.com>
Date: Sat, 11 Jul 2015 01:54:29 -0700
X-Google-Sender-Auth: uSYMAyRFoYC6-5FxWn04xtlMzzo
Message-ID: <CAEgOgz7HNsZn24PB0X5SU56FMBJZ07bmvKWV69MpxCuSJqMYPA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: gonglei <arei.gonglei@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.169
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] arm/xlnx-zynqmp: fix
	memory leak
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
X-List-Received-Date: Sat, 11 Jul 2015 08:54:35 -0000

On Thu, Jul 9, 2015 at 5:51 PM,  <arei.gonglei@huawei.com> wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>
> fix CID 1311372.
>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/arm/xlnx-zynqmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 5e72078..00c5943 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -144,7 +144,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          } else {
>              s->boot_cpu_ptr = &s->apu_cpu[i];
>          }
> -

Thanks,

Please keep this blank line here and below. The g_gree should group
with the above code.

Otherwise,

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Regards,
Peter

> +        g_free(name);
>          object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
>                                  "reset-cbar", &err);
>          if (err) {
> @@ -181,7 +181,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          } else {
>              s->boot_cpu_ptr = &s->rpu_cpu[i];
>          }
> -
> +        g_free(name);
>          object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "reset-hivecs",
>                                   &err);
>          if (err != NULL) {
> --
> 1.7.12.4
>
>
>

